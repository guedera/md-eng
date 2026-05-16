# Resumo — ACID

ACID é um conjunto de propriedades das transações que garantem a **validade dos dados** mesmo com falhas de sistema, acessos concorrentes ou erros de acesso.

---

## A — Atomicidade

Um conjunto de operações SQL (uma transação) é **executado ou rejeitado como uma única unidade**. Não existe meio-termo.

- `COMMIT` → confirma tudo
- `ROLLBACK` → cancela tudo

**Exemplo:** transferência bancária — débito na conta 1 e crédito na conta 2 devem ocorrer juntos ou nenhum dos dois:

```sql
START TRANSACTION;
UPDATE contas SET saldo = saldo - 500 WHERE id = 1;
UPDATE contas SET saldo = saldo + 500 WHERE id = 2;
COMMIT;  -- ambos gravados
-- ou ROLLBACK; para cancelar tudo
```

---

## C — Consistência

O banco passa de um **estado válido para outro estado válido** a cada transação. É garantida por:

- **Constraints de foreign key** — a chave estrangeira aponta para uma linha válida e única de outra tabela
- **Triggers ON DELETE / ON UPDATE** — definem o que fazer quando essas operações ocorrem para manter a base consistente

**Exemplo:** ao deletar um cliente, o trigger `ON DELETE` pode cascatear a exclusão de seus pedidos, mantendo a base sem referências inválidas.

---

## I — Isolamento

Transações concorrentes não interferem diretamente umas nas outras. O usuário tem a percepção de que foram executadas **sequencialmente**.

O padrão ANSI/ISO define 4 níveis:

| Nível | Dirty read | Non-repeatable read | Phantom read |
|---|---|---|---|
| **SERIALIZABLE** | Não | Não | Não |
| **REPEATABLE READ** | Não | Não | Pode ocorrer |
| **READ COMMITTED** | Não | Pode ocorrer | Pode ocorrer |
| **READ UNCOMMITTED** | Pode ocorrer | Pode ocorrer | Pode ocorrer |

**Definições dos fenômenos:**
- **Dirty read** — lê dados de uma transação que ainda não fez COMMIT (pode ser descartada com ROLLBACK)
- **Non-repeatable read** — a mesma linha lida duas vezes retorna valores diferentes porque outra transação fez COMMIT entre as leituras
- **Phantom read** — novas linhas inseridas por outra transação aparecem numa segunda leitura

### Exemplo REPEATABLE READ (default MySQL/InnoDB)

| Transação 1 | Transação 2 |
|---|---|
| `SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;` | |
| `SELECT * FROM contas WHERE id = 55;` → retorna saldo 100 | |
| | `UPDATE contas SET saldo = 200 WHERE id = 55;` |
| | `COMMIT;` |
| `SELECT * FROM contas WHERE id = 55;` → ainda retorna 100 | |

A transação 2 fica **bloqueada** até a transação 1 terminar. Linhas já lidas não mudam — mas novas linhas inseridas por outra transação **aparecem** (phantom read).

### Exemplo READ COMMITTED

| Transação 1 | Transação 2 |
|---|---|
| `SET TRANSACTION ISOLATION LEVEL READ COMMITTED;` | |
| `SELECT * FROM contas WHERE id = 55;` → retorna 100 | |
| | `UPDATE contas SET saldo = 200 WHERE id = 55;` |
| | `COMMIT;` |
| `SELECT * FROM contas WHERE id = 55;` → retorna **200** | |

O terceiro SELECT lê um valor diferente do primeiro (non-repeatable read), pois a transação 2 já fez COMMIT.

### Exemplo READ UNCOMMITTED

| Transação 1 | Transação 2 |
|---|---|
| `SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;` | |
| `SELECT * FROM contas WHERE id = 55;` → retorna 100 | |
| | `UPDATE contas SET saldo = 200 WHERE id = 55;` *(sem COMMIT ainda)* |
| `SELECT * FROM contas WHERE id = 55;` → retorna **200** | |
| | `ROLLBACK;` |

A transação 1 leu um valor que nunca foi gravado de verdade (dirty read).

**Notas importantes:**
- `SERIALIZABLE` é o padrão sugerido pelo ANSI/ISO, mas o MySQL **não** o adota por default (impacto no desempenho)
- `REPEATABLE READ` é o **default do MySQL** (engine InnoDB)
- `READ UNCOMMITTED` é o nível mais perigoso e raramente utilizado

---

## D — Durabilidade

Quando uma transação é confirmada com `COMMIT`, ela **permanece gravada** mesmo que a energia acabe ou o sistema trave.
