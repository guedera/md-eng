# Normalização de Dados: 1NF, 2NF e 3NF

O objetivo da normalização é organizar as tabelas para reduzir a redundância e evitar anomalias de inserção, atualização e eliminação.

---

## 1ª Forma Normal (1NF): Atomicidade
**Regra:** Cada campo deve conter apenas valores atômicos (indivisíveis) e não podem existir grupos repetidos ou listas dentro de uma célula.

* **Problema:** Uma coluna `Telefones` com múltiplos números ("9999-1111, 8888-2222").
* **Solução:** Criar linhas separadas para cada valor ou uma tabela secundária.

### Exemplo prático:
| ID_User | Nome | Hobby |
| :--- | :--- | :--- |
| 1 | Guilherme | Guitarra, F1 |

**Correção (1NF):**
| ID_User | Nome | Hobby |
| :--- | :--- | :--- |
| 1 | Guilherme | Guitarra |
| 1 | Guilherme | F1 |

---

## 2ª Forma Normal (2NF): Dependência Funcional Total
**Regra:** A tabela deve estar na 1NF e todos os atributos que não são chave devem depender da **Chave Primária completa**. Isto aplica-se a tabelas com chaves compostas.

* **Problema:** Numa tabela com chave `(ID_Pedido, ID_Produto)`, o `Nome_Produto` depende apenas do `ID_Produto`, e não da combinação total.
* **Solução:** Mover os dados que dependem apenas de parte da chave para uma nova tabela.

### Exemplo prático:
| ID_Pedido (PK) | ID_Prod (PK) | Descrição_Prod | Qtd |
| :--- | :--- | :--- | :--- |
| 500 | 10 | Teclado | 1 |

**Correção (2NF):**
* **Tabela Itens_Pedido:** `ID_Pedido`, `ID_Prod`, `Qtd`
* **Tabela Produtos:** `ID_Prod`, `Descrição_Prod`

---

## 3ª Forma Normal (3NF): Dependência Transitiva
**Regra:** A tabela deve estar na 2NF e não podem existir dependências entre colunas que não são chaves. Uma coluna não-chave não deve depender de outra coluna não-chave.

* **Problema:** Numa tabela `Funcionário`, a coluna `Estado` depende da `Cidade`, que por sua vez depende do `ID_Func`.
* **Solução:** Isolar os campos dependentes noutra tabela (ex: uma tabela de Cidades/Localidades).

### Exemplo prático:
| ID_Func (PK) | Nome | Cidade | Estado |
| :--- | :--- | :--- | :--- |
| 123 | Silva | São Paulo | SP |

**Correção (3NF):**
* **Tabela Funcionários:** `ID_Func`, `Nome`, `ID_Cidade`
* **Tabela Cidades:** `ID_Cidade`, `Nome_Cidade`, `Estado`

# Normalização de Dados: 1NF, 2NF e 3NF (Atualizado com SQL)

O objetivo da normalização é organizar as tabelas para reduzir a redundância e evitar anomalias de inserção, atualização e eliminação.

---

## 1ª Forma Normal (1NF): Atomicidade
**Regra:** Cada campo deve conter apenas valores atômicos (indivisíveis) e não podem existir grupos repetidos ou listas dentro de uma única célula.

* **O Problema:** Colunas desnormalizadas que guardam múltiplos dados (ex: `Endereço` misturando Rua, Cidade e Estado).
* **A Consequência:** Você é obrigado a usar funções de string complexas para extrair informações simples.

### Exemplo de Manipulação (O uso de `SUBSTRING_INDEX`)
Se a tabela viola a 1NF e a cidade está "presa" em uma string de endereço, você precisa do "corte duplo":

```sql
-- Exemplo: "Dos Quebradas Place, 220, 50877672, São Paulo, SP"
-- Objetivo: Isolar "São Paulo" (o penúltimo item da lista)
SELECT 
    SUBSTRING_INDEX(SUBSTRING_INDEX(endereco1, ', ', -2), ', ', 1) AS cidade 
FROM alunos;