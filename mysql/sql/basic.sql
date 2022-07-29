-- espresso database를 사용하겠다. 
use espresso;

INSERT INTO member2 (
	name
    ,nameEng
    ,birthday
)

VALUES (
	"고수"
    ,"Gosu"
    ,"1992-02-10"
)
;

-- 전체 컬럼 조회
SELECT * from member2;

-- 컬럼 추가
ALTER TABLE member2 ADD COLUMN name varchar(45);

ALTER TABLE member2 ADD COLUMN nameEng varchar(45) AFTER name;

ALTER TABLE member2 ADD COLUMN bod int AFTER nameEng;

-- 컬럼 변경
-- 데이터가 없을땐 자유롭게 변경 가능, 있을 땐 제약이 있음
ALTER TABLE member2 MODIFY COLUMN bod date;

-- 컬럼 이름 변경
ALTER TABLE member2 CHANGE COLUMN bod birthday date;

-- 컬럼 삭제
ALTER TABLE member2 drop COLUMN nameEng;

-- row 삭제
DELETE FROM member WHERE mmSeq = 10;

-- commit / rollback

-- 데이터 수정
UPDATE member2 SET
	name = "신지원"
	, nameEng = "Shinjiwon"
	, birthday = "1993-02-10"
WHERE mmseSeq = 1;

-- Where
SELECT * FROM member
WHERE 1=1
-- AND member_nickname like 'do%'
-- AND member_nickname like '%on'
-- 사이 검색이 가장 많이 쓰임.
AND member_bod like '%02%'
;    

SELECT * FROM member
WHERE 1=1
-- AND mmSeq = 2
-- AND mmSeq > 1
-- AND mmSeq >= 3
AND mmSeq Between 4 and 9
;

SELECT * FROM member
WHERE 1=1
-- AND member_zip is null
-- AND career = null 에러, is로 해줘야 함. 
AND member_detailed = ""
;



