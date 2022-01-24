# 第2回演習用データベース構築SQL

第2回演習で使用するデータベースを構築するためのSQLです。

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
