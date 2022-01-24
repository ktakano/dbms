# 第2回演習用データベース構築SQL

第2回演習で使用するデータベースを構築するためのSQLです。<br>
INDEXの検索効率向上を確認するために、1000件、...、200000件、300000件
のデータ件数を持つテーブルをそれぞれ構築します。

## データベースの作成方法
```bash
c:\myemp>mysql -u root < myemp.sql
INFO
CREATING DATABASE STRUCTURE
INFO
storage engine: InnoDB
INFO
LOADING employees300000
INFO
LOADING employees200000
…
INFO
Copying to employees1000_idx
```

## 問い合わせ例

```bash
MariaDB [myemp]> SELECT * FROM employees WHERE first_name = 'Mary' ;
… (検索結果の表)…
224 rows in set (0.181 sec)
```

## MySQLでのINDE作成・削除例

```bash
MariaDB [myemp]> ALTER TABLE employees300000_idx ADD INDEX idx_firstname(first_name);
Query OK, 0 rows affected (1.225 sec)
Records: 0 Duplicates: 0 Warnings: 0
MariaDB [myemp]> ALTER TABLE employees300000_idx DROP INDEX idx_firstname;
Query OK, 0 rows affected (0.020 sec)
Records: 0 Duplicates: 0 Warnings: 0
```

## EXPLAINの実行例
```bash
MariaDB [myemp]> EXPLAIN SELECT * FROM employees300000_idx WHERE first_name = 'Mary'¥G
*************************** 1. row ***************************
id: 1
select_type: SIMPLE
table: employees300000_idx
type: ref
possible_keys: idx_firstname
key: idx_firstname
key_len: 16
ref: const
rows: 224
Extra: Using index condition
1 row in set (0.000 sec)
```
