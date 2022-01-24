/* 文字コードの確認 */
SHOW CHARSET;

/* 照合順序の確認 */
SHOW COLLATION Where Charset = 'utf8mb4';

/* 文字コードを指定したテーブル作成 */
CREATE TABLE 商品表
(
 商品コード CHAR(4),
 商品名 CHAR(16),
 単価 INTEGER,
 PRIMARY KEY (商品コード)
) DEFAULT CHARSET=cp932;

INSERT INTO 商品表(商品コード, 商品名, 単価)
 VALUES('1001', '田舎御膳', 1000);

INSERT INTO 商品表(商品コード, 商品名, 単価)
 VALUES('1002', '汁物', 500);

/* 参照制約の例題 */
CREATE TABLE 関連商品表
(
 参照コード CHAR(4),
 関連商品名 CHAR(16),
 FOREIGN KEY (参照コード)
 REFERENCES 商品表(商品コード)
);

INSERT INTO 関連商品表(参照コード, 関連商品名)
 VALUES('1001', 'お箸');

/* 参照制約エラーとなる */
INSERT INTO 関連商品表(参照コード, 関連商品名)
 VALUES('1003', '茶碗蒸し');

/* トランザクション */
SELECT @@autocommit;
SET AUTOCOMMIT = 0;
START TRANSACTION;
CREATE TABLE river (
 id NUMERIC(4) PRIMARY KEY,
 name VARCHAR(32),
 length NUMERIC(8)
);

INSERT INTO river(id, name, length) VALUES(1, '利根川', 322);
INSERT INTO river(id, name, length) VALUES(2, '信濃川', 367);
INSERT INTO river(id, name, length) VALUES(3, '相模川', 109);

COMMIT; /* 破棄する場合は ROLLBACK (ROLLBACK してもテーブル river は残る) */

/* トリガーの作成 */
delimiter //
create procedure whattime()
 begin
 select NOW();
