# Revisão — Avaliação Final

Mapeamento baseado nos dois simulados disponíveis em `simulado_1/` e `simulado_2/`.

---

## Tópicos cobertos nos simulados

| Questão | Simulado | Tópico |
|---------|----------|--------|
| 1a | 1 | JOIN (LEFT JOIN) + COUNT + GROUP BY |
| 1b | 1 | CREATE TEMPORARY TABLE + agregação |
| 1c | 1 | GROUP BY múltiplas colunas + ORDER BY |
| 1d | 1 | Consulta com tabela temporária + HAVING |
| 1e | 1 | ACID — consistência e necessidade de transações |
| 1f | 1 | TRIGGER para manter coluna desnormalizada |
| 2  | 1 | Por que Spark é baseado em programação funcional (teórico) |
| 3  | 1 | Programação funcional em Python (map, filter, reduce, zip) sem loops |
| 4  | 1 | Cálculo de capacidade de armazenamento com crescimento exponencial |
| 5  | 1 | Normalização — identificar 1FN/2FN/3FN e propor 3FN |
| 1  | 2 | Spark RDD — filtrar por ano e contar acessos |
| 2  | 2 | Spark RDD — top 20 datas com maior acesso (groupBy, sort) |
| 3  | 2 | TRIGGER — atualizar hash SHA1 de colunas compostas após UPDATE |
| 4  | 2 | Permissões — REVOKE INSERT de um usuário |
| 5  | 2 | Cálculo de armazenamento com RAID 5 (função Python) |
| 6  | 2 | ACID — nível de isolamento adequado para dashboard em tempo real |
| 7a | 2 | Normalização — analisar se tabela está em 2FN mas não em 1FN |
| 7b | 2 | Normalização — projetar ER e normalizar tabela para 3FN |

---

## Aulas por prioridade

### Tier 1 — Crítico (aparecem diretamente nos simulados)

| Aula | Título | Relevância para a prova |
|------|--------|------------------------|
| **07** | SELECT com JOIN | S1-Q1a, S1-Q1c: LEFT JOIN, INNER JOIN com agregação |
| **08** | SELECT — Agrupamento | S1-Q1a,c,d: GROUP BY múltiplas colunas, HAVING, COUNT/SUM |
| **09** | Views, Subqueries e Tabelas Temporárias | S1-Q1b,c,d: CREATE TEMPORARY TABLE, subqueries |
| **14** | Normalização | S1-Q5, S2-Q7a,b: 1FN/2FN/3FN, dependências transitivas, projeto ER |
| **17** | ACID | S1-Q1e, S2-Q6: propriedades ACID, níveis de isolamento |
| **18** | Triggers, Procedures, Functions | S1-Q1f, S2-Q3: CREATE TRIGGER AFTER INSERT/UPDATE, SHA1, CONCAT |
| **20** | Cálculo Lambda / Prog. Funcional | S1-Q2,3, S2-Q1,2: map, filter, reduce, zip, por que Spark é funcional |

### Tier 2 — Importante (base necessária ou diretamente testado)

| Aula | Título | Relevância para a prova |
|------|--------|------------------------|
| **02** | SELECT | Base para todos os queries dos simulados |
| **04** | Modelagem e DDL | CREATE TABLE, tipos, constraints — suporte a vários exercícios |
| **06** | DML | INSERT/UPDATE/DELETE — contexto de triggers e transações |
| **13** | Permissões | S2-Q4: GRANT, REVOKE INSERT |
| **16** | Transactions | S1-Q1e: BEGIN, COMMIT, ROLLBACK, atomicidade |
| **19** | Armazenamento | S1-Q4, S2-Q5: cálculo de capacidade, RAID 5, série geométrica |
| **21** | Spark — Introdução | S2-Q1,2: textFile(), map(), filter(), count(), collect() |

### Tier 3 — Contextual (útil para entender os exercícios)

| Aula | Título | Relevância para a prova |
|------|--------|------------------------|
| **03** | Modelo Relacional | Fundamento para normalização e diagramas ER |
| **11** | Modelagem ER | S2-Q7b: desenho de diagrama ER para tabela normalizada |
| **15** | Índices e Particionamento | S2-Q3: contexto de índices hash usados na trigger |
| **22** | Spark — RDD | Complementa Aula 21 para operações de groupBy e sort |

### Tier 4 — Fundacional (menos provável de cair diretamente)

| Aula | Título | Observação |
|------|--------|-----------|
| **01** | Introdução | Configuração de ambiente, sem conteúdo de prova |
| **05** | Experimento DDL | Prática de DDL, suporte implícito |
| **10** | Prática | Reforço de SELECT/JOIN/GROUP BY |
| **12** | Revisão (P1) | Revisão de Aulas 1–11, conteúdo já coberto acima |
| **23** | Spark DataFrames e SQL | Não aparece diretamente nos simulados |

---

## Conceitos mais frequentes (aparecem nos dois simulados)

- **Normalização** (S1-Q5, S2-Q7a, S2-Q7b) → Aula 14
- **Triggers** (S1-Q1f, S2-Q3) → Aula 18
- **Programação Funcional / Spark RDD** (S1-Q2,3, S2-Q1,2) → Aulas 20, 21
- **ACID e Isolamento** (S1-Q1e, S2-Q6) → Aulas 16, 17
- **Armazenamento / Cálculos de capacidade** (S1-Q4, S2-Q5) → Aula 19

---

## Checklist de habilidades exigidas

- [ ] Escrever queries complexas com múltiplos JOINs e GROUP BY / HAVING
- [ ] Criar e usar CREATE TEMPORARY TABLE dentro de uma query maior
- [ ] Criar TRIGGER (AFTER UPDATE/INSERT) com lógica SQL (SHA1, CONCAT)
- [ ] Usar GRANT e REVOKE para gerenciar permissões de usuários
- [ ] Implementar funções Python com `map`, `filter`, `reduce`, `zip` (sem loops)
- [ ] Escrever operações em Spark RDD (`textFile`, `map`, `filter`, `groupByKey`, `sortBy`)
- [ ] Calcular capacidade de armazenamento com crescimento constante ou geométrico
- [ ] Identificar normal forms (1FN, 2FN, 3FN) e apontar anomalias
- [ ] Justificar nível de isolamento de transação para um cenário dado
- [ ] Projetar diagrama ER a partir de uma tabela desnormalizada
