use espresso;

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

-- 아이디 찾기
SELECT 
	a.mmName
    ,b.mmpPhoneNumber
FROM member a 
inner join member_phone b on b.member_mmSeq = a.mmSeq
WHERE a.mmName = "박지훈" and b.mmpPhoneNumber = "01001010101"
;

-- 비밀번호 찾기
SELECT a.mmEmail 
FROM member a 
WHERE mmEmail = "jiwon@naver.com"; 

-- 목록

-- 코멘트

-- 프로젝트 관련 쿼리