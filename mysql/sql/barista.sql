use espresso;

-- 어떤 조건을 할지에 따라 마스터 table 설정을 잘 해야함. 
-- 코드그룹:코드
SELECT
	c.ccgSeq
    ,c.ccgName
    ,d.ccSeq
    ,d.ccName
FROM codeGroup c
inner join code d on d.codeGroup_ccgSeq = c.ccgSeq
;

-- 로그인
SELECT * 
FROM member 
WHERE mmEmail = "jihun@naver.com" and mmPw = "jihun123"
;

-- 이메일 찾기
SELECT a.mmEmail
FROM member a 
inner join member_phone b on b.member_mmSeq = a.mmSeq
WHERE a.mmName = "" and b.mmpPhoneNumber = ""
;

SELECT 
	b.mmpPhoneNumber
FROM member a
inner join member_phone b on b.member_mmSeq = a.mmSeq
WHERE a.mmEmail = ""
;

-- 비밀번호 찾기
SELECT mmEmail FROM member WHERE mmEmail = ""; 

-- 이메일 중복확인
SELECT mmEmail FROM member WHERE mmEmail = "";

-- 닉네임 중복확인
SELECT mmNickname FROM member WHERE mmNickname = "";

-- 생일자 정보확인
SELECT 
	mmName
    ,mmBod
FROM member 
WHERE mmName = "" and mmBod = ""
;

-- 

-- 목록

-- 코멘트

-- 프로젝트 관련 쿼리