CREATE TABLE ���i�\
(
 ���i�R�[�h CHAR(4),
 ���i�� CHAR(16),
 �P�� INTEGER,
 PRIMARY KEY (���i�R�[�h)
);
INSERT INTO ���i�\(���i�R�[�h, ���i��, �P��) VALUES('1001', '�c�Ɍ�V', 1000);
INSERT INTO ���i�\(���i�R�[�h, ���i��, �P��) VALUES('1002', '�R�[��', 150);
CREATE TABLE �󒍕\
(
 �󒍔ԍ� CHAR(4),
 ���i�ԍ� CHAR(4),
 �󒍌� INTEGER,
 ���z INTEGER,
 ���Ӑ�ԍ� CHAR(4),
 �[�i�� CHAR(8),
 PRIMARY KEY (�󒍔ԍ�)
);
INSERT INTO �󒍕\ (�󒍔ԍ�, ���i�ԍ�, �󒍌�, ���z, ���Ӑ�ԍ�, �[�i��)
VALUES('2001', '1001', 7, 7000, '3001', '19990516');
INSERT INTO �󒍕\ (�󒍔ԍ�, ���i�ԍ�, �󒍌�, ���z, ���Ӑ�ԍ�, �[�i��)
VALUES('2002', '1002', 3, 450, '3001', '19990516');
INSERT INTO �󒍕\ (�󒍔ԍ�, ���i�ԍ�, �󒍌�, ���z, ���Ӑ�ԍ�, �[�i��)
VALUES('2003', '1001', 55, 450, '3002', '20180517');
INSERT INTO �󒍕\ (�󒍔ԍ�, ���i�ԍ�, �󒍌�, ���z, ���Ӑ�ԍ�, �[�i��)
VALUES('2004', '1001', 10, 5000, '3003', '20201117');

CREATE TABLE ���Ӑ�\
(
 ���Ӑ�R�[�h CHAR(4),
 ���Ӑ於 CHAR(16),
 PRIMARY KEY (���Ӑ�R�[�h)
);
INSERT INTO ���Ӑ�\ (���Ӑ�R�[�h, ���Ӑ於) VALUES ('3001', 'Seven to Seven');
INSERT INTO ���Ӑ�\ (���Ӑ�R�[�h, ���Ӑ於) VALUES ('3002', 'KAIT');
INSERT INTO ���Ӑ�\ (���Ӑ�R�[�h, ���Ӑ於) VALUES ('10001', 'Happy5');


SELECT * FROM ���i�\;

SELECT ���Ӑ�ԍ�, �󒍌� FROM �󒍕\
WHERE �[�i��='19990516' AND ���i�ԍ�='1001';

SELECT * FROM �󒍕\
ORDER BY ���i�ԍ�, ���Ӑ�ԍ�;


SELECT * FROM �󒍕\
WHERE ���Ӑ�ԍ�=
(
SELECT ���Ӑ�R�[�h FROM ���Ӑ�\
WHERE ���Ӑ於='Seven to Seven'
);

CREATE VIEW �Z�u���� AS
 SELECT * FROM �󒍕\
 WHERE ���Ӑ�ԍ�=
 (
 SELECT ���Ӑ�R�[�h FROM ���Ӑ�\
 WHERE ���Ӑ於='Seven to Seven'
 );


SELECT �󒍔ԍ�, ���Ӑ於, ���i��, �󒍌�, �[�i�� 
    FROM �󒍕\, ���Ӑ�\, ���i�\ 
    WHERE ���Ӑ�ԍ�=���Ӑ�R�[�h 
                 AND ���i�ԍ�=���i�R�[�h;

SELECT * FROM �󒍕\, ���Ӑ�\;

SELECT �󒍔ԍ�, ���Ӑ於, ���i��, �󒍌�, �[�i�� 
    FROM �󒍕\, ���Ӑ�\, ���i�\ 
        WHERE �󒍕\.���Ӑ�ԍ�=���Ӑ�\.���Ӑ�R�[�h 
                      AND �󒍕\.���i�ԍ�=���i�\.���i�R�[�h;

SELECT J.�󒍔ԍ�, T.���Ӑ於, S.���i��, 
              J.�󒍌�, J.�[�i�� 
    FROM �󒍕\ J, ���Ӑ�\ T, ���i�\ S 
        WHERE J.���Ӑ�ԍ�=T.���Ӑ�R�[�h 
                     AND J.���i�ԍ�=S.���i�R�[�h;

SELECT COUNT(*), AVG(�󒍌�), 
    MIN(�󒍌�), MAX(�󒍌�), SUM(�󒍌�) 
  FROM �󒍕\;

SELECT ���i�ԍ�, SUM(�󒍌�) FROM �󒍕\ 
    WHERE �[�i��= '19990516' GROUP BY ���i�ԍ�;


SELECT ���i�ԍ�, SUM(�󒍌�) FROM �󒍕\ 
    WHERE �[�i��= '19990516' GROUP BY ���i�ԍ�  
    HAVING SUM(�󒍌�) > 5;


SELECT ���i�ԍ�, ���i�R�[�h, 
              (SUM(�󒍌�))�󒍌v, �P��, 
              (SUM(�󒍌�)*�P��)������z 
    FROM �󒍕\, ���i�\ 
    WHERE �[�i��= '19990516' 
            AND ���i�ԍ�=���i�R�[�h 
    GROUP BY ���i�ԍ�, ���i��, �P��;
 

SELECT ���i�ԍ�, ���i�R�[�h, 
              (SUM(�󒍌�))�󒍌v, �P��, 
              (SUM(�󒍌�)*�P��)������z 
    FROM �󒍕\, ���i�\ 
    WHERE �[�i�� LIKE '199905%'
            AND ���i�ԍ�=���i�R�[�h 
            AND ���Ӑ�ԍ�='3001'  
    GROUP BY ���i�ԍ�, ���i��, �P��;

    
SELECT * FROM �󒍕\ 
    WHERE EXISTS
    ( 
        SELECT * FROM ���Ӑ�\ 
            WHERE ���Ӑ於='Seven to Seven'
             AND �󒍕\.���Ӑ�ԍ�=���Ӑ�\.���Ӑ�R�[�h 
    );

SELECT * FROM �󒍕\ 
    WHERE ���Ӑ�ԍ� NOT IN
    ( 
        SELECT ���Ӑ�R�[�h FROM ���Ӑ�\ 
    );
