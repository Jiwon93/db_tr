use espresso;

-- 어떤 조건을 할지에 따라 마스터 table 설정을 잘 해야함. 
-- 코드그룹:코드
SELECT
	a.ccgSeq
    ,a.ccgName
    ,b.ccSeqcode
    ,b.ccName
FROM codeGroup a
inner join code b on b.codeGroup_ccgSeq = a.ccgSeq
;

-- 로그인
SELECT 
	mmEmail
    ,mmPw
FROM member 
WHERE mmEmail = "dongsu@naver.com" and mmPw = "dongsu123"
;

-- 메인(인기 top4)

-- 후기(top3)

-- 판매자 인터뷰(top3)

-- 상품 목록 페이지
SELECT 
	a.itemSeq
	,a.itMainImg
	,b.mmNickname
    ,a.itMain
    ,a.basicPrice
    ,(SELECT ROUND(AVG(reGrade)/2, 1) FROM review WHERE item_itemseq = "1") AS reviewAvgGrade
    ,(SELECT COUNT(item_itemseq) FROM review WHERE item_itemseq = "1") AS reviewCount
FROM item a
INNER JOIN member b ON a.member_mmSeq = b.mmSeq
INNER JOIN review c ON a.itemSeq = c.item_itemseq
WHERE 1=1
AND a.itemSeq = "1"
GROUP BY a.itemSeq
;

-- 상품상세페이지
SELECT
	a.breadcrumb
    ,a.itMainImg
	,(SELECT ROUND(AVG(reGrade)/2, 1) FROM review WHERE item_itemseq = "1") AS reviewAvgGrade
    ,(SELECT COUNT(item_itemseq) FROM review WHERE item_itemseq = "1") AS reviewCount
    ,a.itServiceDetail
    ,a.basicPrice
    ,a.basicDetail
    ,a.basicBenefit
    ,a.basicPeriod
    ,a.bestPrice
    ,a.bestDetail
    ,a.bestBenefit
    ,a.bestPeriod
    ,a.proPrice
    ,a.proDetail
    ,a.proBenefit
    ,a.proPeriod
    ,a.itCancleRefund
    ,(SELECT ROUND(AVG(reGrade)/2, 1) FROM review WHERE item_itemseq = "1") AS reviewAvgGrade
    ,(SELECT COUNT(item_itemseq) FROM review WHERE item_itemseq = "1") AS reviewCount
    ,a.itInquiry
FROM item a
INNER JOIN member b on a.member_mmSeq = b.mmSeq
INNER JOIN review c on a.itemSeq = c.item_itemseq
WHERE 1=1
AND a.itemSeq = "1"
GROUP BY a.itemSeq
;	

-- 상품 후기
SELECT
    b.reNickname
    ,b.reGrade
    ,b.reWriteTime
    ,b.reContent
    ,b.reWorkload
    ,b.reOrderPrice
FROM item a
INNER JOIN review b on a.itemSeq = b.item_itemseq
WHERE 1=1
AND a.itemSeq = "1"
;


-- 구매 내역


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

-- 검색창

-- 마이페이지(일반회원)
SELECT 
	a.mmNickname
    ,a.mmEmail
    ,b.mmpPhoneNumber
    ,a.mmBod
    ,a.mmGender
    ,a.mmAddress1
    ,a.mmAddress2
    ,a.mmJob
    ,a.mmInterest
FROM member a
INNER JOIN member_phone b on a.mmSeq = b.member_mmSeq
WHERE a.mmEmail = "" AND a.mmRank = "26"
;

-- 마이페이지(판매자)
SELECT 
	a.mmNickname
    ,a.mmEmail
    ,b.mmpPhoneNumber
    ,a.mmBod
    ,a.mmGender
    ,a.mmAddress1
    ,a.mmAddress2
    ,a.mmJob
    ,a.mmInterest
    ,a.mmSpecial
    ,a.mmDetail
    ,a.mmTechnique
    ,a.mmCareer
    ,a.mmSchool
    ,a.mmSchoolMajor
    ,a.mmSchoolState
    ,a.mmCertificate
    ,a.mmWishPay
    ,a.mmWorkTime
    ,a.mmIntroduce
FROM member a
INNER JOIN member_phone b on a.mmSeq = b.member_mmSeq
WHERE a.mmEmail = "" AND a.mmRank = "25"
;

-- 비밀번호 변경
SELECT mmPw FROM mmPw
WHERE mmPw = ""
;

UPDATE member SET
	mmPw = ""
WHERE mmPw = ""
;

-- 목록

-- 코멘트

-- 프로젝트 관련 쿼리