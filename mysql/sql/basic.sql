-- espresso database를 사용하겠다. 
use espresso;

-- 전체 컬럼 조회
SELECT * from member;

-- 컬럼 추가
ALTER TABLE member2 ADD COLUMN name varchar(45);

ALTER TABLE member2 ADD COLUMN nameEng varchar(45) AFTER name;

ALTER TABLE member2 ADD COLUMN bod int AFTER nameEng;

-- 컬럼 변경
-- 데이터가 없을땐 자유롭게 변경 가능, 있을 땐 제약이 있음
ALTER TABLE member2 MODIFY COLUMN bod date;

-- 컬럼 이름 변경
ALTER TABLE member2 CHANGE COLUMN bod birthday date;