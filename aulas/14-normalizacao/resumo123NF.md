# Normalização de Dados: 1NF, 2NF e 3NF

O objetivo da normalização é organizar as tabelas para reduzir a redundância e evitar anomalias de inserção, atualização e eliminação.

---

## 1ª Forma Normal (1NF): Atomicidade

**Regra:** Cada campo deve conter apenas valores atômicos (indivisíveis). Não podem existir grupos repetidos ou listas dentro de uma única célula.

**Problema:** Uma coluna `Hobby` com múltiplos valores em uma célula.

| ID_User | Nome      | Hobby        |
| :------ | :-------- | :----------- |
| 1       | Guilherme | Guitarra, F1 |

**Correção (1NF):** Separar cada valor em sua própria linha.

| ID_User | Nome      | Hobby    |
| :------ | :-------- | :------- |
| 1       | Guilherme | Guitarra |
| 1       | Guilherme | F1       |

> **Consequência de não normalizar:** É necessário usar funções de string complexas para extrair dados, o que prejudica a performance e a legibilidade.

### Exemplo de workaround sem 1NF — `SUBSTRING_INDEX`

A função `SUBSTRING_INDEX(string, delimitador, contador)` fatia textos:
- Contador **positivo** → retorna tudo à **esquerda** do delimitador na ocorrência N.
- Contador **negativo** → retorna tudo à **direita** do delimitador na ocorrência N (contando de trás para frente).

Para isolar `"São Paulo"` de `"Rua X, 123, CEP, São Paulo, SP"`:

```sql
-- Passo 1: -2 pega os dois últimos tokens: "São Paulo, SP"
-- Passo 2:  1 pega o primeiro token do resultado: "São Paulo"
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(endereco1, ', ', -2), ', ', 1) AS cidade
FROM alunos;
```

---

## 2ª Forma Normal (2NF): Dependência Funcional Total

**Pré-requisito:** A tabela deve estar na 1NF.

**Regra:** Todo atributo não-chave deve depender da **chave primária completa** — não apenas de parte dela. Aplica-se a tabelas com chaves compostas.

**Problema:** Na tabela abaixo, `Descrição_Prod` depende só de `ID_Prod`, e não da chave composta `(ID_Pedido, ID_Prod)`.

| ID_Pedido (PK) | ID_Prod (PK) | Descrição_Prod | Qtd |
| :------------- | :----------- | :------------- | :-- |
| 500            | 10           | Teclado        | 1   |

**Correção (2NF):** Mover o atributo com dependência parcial para uma tabela própria.

- **Tabela `Itens_Pedido`:** `ID_Pedido`, `ID_Prod`, `Qtd`
- **Tabela `Produtos`:** `ID_Prod`, `Descrição_Prod`

---

## 3ª Forma Normal (3NF): Dependência Transitiva

**Pré-requisito:** A tabela deve estar na 2NF.

**Regra:** Nenhum atributo não-chave deve depender de outro atributo não-chave. A dependência deve ser sempre direta com a chave primária.

**Problema:** `Estado` depende de `Cidade`, que depende de `ID_Func` — dependência transitiva.

| ID_Func (PK) | Nome  | Cidade    | Estado |
| :----------- | :---- | :-------- | :----- |
| 123          | Silva | São Paulo | SP     |

**Correção (3NF):** Isolar a dependência transitiva em uma tabela separada.

- **Tabela `Funcionários`:** `ID_Func`, `Nome`, `ID_Cidade`
- **Tabela `Cidades`:** `ID_Cidade`, `Nome_Cidade`, `Estado`