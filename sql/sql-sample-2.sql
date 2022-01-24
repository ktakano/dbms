CREATE TABLE 商品表
(
 商品コード CHAR(4),
 商品名 CHAR(16),
 単価 INTEGER,
 PRIMARY KEY (商品コード)
);
INSERT INTO 商品表(商品コード, 商品名, 単価) VALUES('1001', '田舎御膳', 1000);
INSERT INTO 商品表(商品コード, 商品名, 単価) VALUES('1002', 'コーラ', 150);
CREATE TABLE 受注表
(
 受注番号 CHAR(4),
 商品番号 CHAR(4),
 受注個数 INTEGER,
 金額 INTEGER,
 得意先番号 CHAR(4),
 納品日 CHAR(8),
 PRIMARY KEY (受注番号)
);
INSERT INTO 受注表 (受注番号, 商品番号, 受注個数, 金額, 得意先番号, 納品日)
VALUES('2001', '1001', 7, 7000, '3001', '19990516');
INSERT INTO 受注表 (受注番号, 商品番号, 受注個数, 金額, 得意先番号, 納品日)
VALUES('2002', '1002', 3, 450, '3001', '19990516');
INSERT INTO 受注表 (受注番号, 商品番号, 受注個数, 金額, 得意先番号, 納品日)
VALUES('2003', '1001', 55, 450, '3002', '20180517');
INSERT INTO 受注表 (受注番号, 商品番号, 受注個数, 金額, 得意先番号, 納品日)
VALUES('2004', '1001', 10, 5000, '3003', '20201117');

CREATE TABLE 得意先表
(
 得意先コード CHAR(4),
 得意先名 CHAR(16),
 PRIMARY KEY (得意先コード)
);
INSERT INTO 得意先表 (得意先コード, 得意先名) VALUES ('3001', 'Seven to Seven');
INSERT INTO 得意先表 (得意先コード, 得意先名) VALUES ('3002', 'KAIT');
INSERT INTO 得意先表 (得意先コード, 得意先名) VALUES ('10001', 'Happy5');


SELECT * FROM 商品表;

SELECT 得意先番号, 受注個数 FROM 受注表
WHERE 納品日='19990516' AND 商品番号='1001';

SELECT * FROM 受注表
ORDER BY 商品番号, 得意先番号;


SELECT * FROM 受注表
WHERE 得意先番号=
(
SELECT 得意先コード FROM 得意先表
WHERE 得意先名='Seven to Seven'
);

CREATE VIEW セブン受注 AS
 SELECT * FROM 受注表
 WHERE 得意先番号=
 (
 SELECT 得意先コード FROM 得意先表
 WHERE 得意先名='Seven to Seven'
 );


SELECT 受注番号, 得意先名, 商品名, 受注個数, 納品日 
    FROM 受注表, 得意先表, 商品表 
    WHERE 得意先番号=得意先コード 
                 AND 商品番号=商品コード;

SELECT * FROM 受注表, 得意先表;

SELECT 受注番号, 得意先名, 商品名, 受注個数, 納品日 
    FROM 受注表, 得意先表, 商品表 
        WHERE 受注表.得意先番号=得意先表.得意先コード 
                      AND 受注表.商品番号=商品表.商品コード;

SELECT J.受注番号, T.得意先名, S.商品名, 
              J.受注個数, J.納品日 
    FROM 受注表 J, 得意先表 T, 商品表 S 
        WHERE J.得意先番号=T.得意先コード 
                     AND J.商品番号=S.商品コード;

SELECT COUNT(*), AVG(受注個数), 
    MIN(受注個数), MAX(受注個数), SUM(受注個数) 
  FROM 受注表;

SELECT 商品番号, SUM(受注個数) FROM 受注表 
    WHERE 納品日= '19990516' GROUP BY 商品番号;


SELECT 商品番号, SUM(受注個数) FROM 受注表 
    WHERE 納品日= '19990516' GROUP BY 商品番号  
    HAVING SUM(受注個数) > 5;


SELECT 商品番号, 商品コード, 
              (SUM(受注個数))受注計, 単価, 
              (SUM(受注個数)*単価)売上金額 
    FROM 受注表, 商品表 
    WHERE 納品日= '19990516' 
            AND 商品番号=商品コード 
    GROUP BY 商品番号, 商品名, 単価;
 

SELECT 商品番号, 商品コード, 
              (SUM(受注個数))受注計, 単価, 
              (SUM(受注個数)*単価)売上金額 
    FROM 受注表, 商品表 
    WHERE 納品日 LIKE '199905%'
            AND 商品番号=商品コード 
            AND 得意先番号='3001'  
    GROUP BY 商品番号, 商品名, 単価;

    
SELECT * FROM 受注表 
    WHERE EXISTS
    ( 
        SELECT * FROM 得意先表 
            WHERE 得意先名='Seven to Seven'
             AND 受注表.得意先番号=得意先表.得意先コード 
    );

SELECT * FROM 受注表 
    WHERE 得意先番号 NOT IN
    ( 
        SELECT 得意先コード FROM 得意先表 
    );
