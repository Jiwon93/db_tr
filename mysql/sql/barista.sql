use espresso;

-- 한 회원의 여러 값을 표현하지 않음 slave table에 default NY를 통해 한개의 값만 보여지게 표현
-- 서브쿼리의 사용(data를 한개를 가져올 경우 사용함), 두개 이상은 join 사용.
-- 공통코드는 join을 걸지 않기.
-- web --> Java(Spring) 5개 이상을 거침 --> DB를 거쳐서 다시 돌아옴(cash를 통해 가져옴). 
-- 모든 데이터는 등록일, 수정일을 넣는다.
-- group by ~ having ~ > 숫자 , order by
-- UNION(유니온): 데이터의 갯수와 타입이 같아야 함. 
-- 예시) 해당 월, 년도 별 집계 데이터 뽑을 때 사용함.
-- * UNION ALL 로 SELECT와 SELECT를 연결. 

-- 파일
-- 1단계. url 컬럼을 추가해서 경로를 넣어줌. (사용빈도 낮음)
-- 2단계. 각 상위 테이블에 해당하는 각 업로드 테이블을 생성해줌. (추천)
-- 3단계. 업로드 테이블을 하나 생성해줌.

-- 어떤 조건을 할지에 따라 마스터 table 설정을 잘 해야함. 
-- 코드그룹:코드
SELECT
	a.ccgSeq
    ,a.ccgName
    ,b.ccSeq
    ,b.ccName
FROM codeGroup a
inner join code b on b.codeGroup_ccgSeq = a.ccgSeq
;

-- 코드 갯수(GROUP BY)
SELECT
	a.ccgName
    ,count(b.ccSeq)
FROM codeGroup a
JOIN code b on a.ccgseq = b.codeGroup_ccgSeq
GROUP BY a.ccgName
;

-- 코드 갯수(SUB 쿼리)
SELECT
	ccgName
    ,(SELECT
		count(ccSeq)
	FROM code
    WHERE 1=1
		AND ccgSeq = codeGroup_ccgSeq) AS ccCount
FROM codeGroup
;

SELECT
	a.*
    ,a.mmSeq
    ,a.mmNamemember
FROM member a
;

-- 로그인
SELECT 
	mmEmail
    ,mmPw
FROM member 
WHERE mmEmail = "dongsu@naver.com" and mmPw = "dongsu123"
;

-- 메인(인기 top4)
SELECT 
	breadcrumb
    ,a.item_itemseq
    ,count(a.item_itemseq)
FROM purchase a
INNER JOIN item b on a.item_itemseq = b.itemSeq
ORDER BY -- FIELD(item_itemseq, 1, 2, 3)
a.item_itemseq asc
;
    
-- 후기(top3)

-- 판매자 인터뷰(top3)

-- 상품 목록 페이지
SELECT 
	a.itemSeq
	,a.itMainImg
	,b.mmNickname
    ,a.itMain
    ,a.basicPrice
    ,ROUND(AVG(c.reGrade)/2, 1) AS reviewAvgGrade
    ,COUNT(c.item_itemseq) AS reviewCount
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
	,ROUND(AVG(c.reGrade)/2, 1) AS reviewAvgGrade
    ,COUNT(c.item_itemseq) AS reviewCount
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
    ,ROUND(AVG(c.reGrade)/2, 1) AS reviewAvgGrade
    ,COUNT(c.item_itemseq) AS reviewCount
    ,a.itInquiry
FROM item a
-- INNER JOIN member b on a.member_mmSeq = b.mmSeq
INNER JOIN review c on a.itemSeq = c.item_itemseq
WHERE 1=1
AND a.itemSeq = "1"
GROUP BY a.itemSeq
;	

-- 상품 후기
SELECT
	a.itemSeq
    ,b.reNickname
    ,ROUND(AVG(b.reGrade)/2, 1) AS AvgGrade
    ,b.reWriteTime
    ,b.reContent
    ,b.reWorkload
    ,b.reOrderPrice
FROM item a
INNER JOIN review b on a.itemSeq = b.item_itemseq
WHERE 1=1
AND a.itemSeq = "1"
;

-- 결제 
-- SELECT
-- 	a.itMainImg
--    ,a.itMain
--    ,
-- FROM item a
-- INNER JOIN member b on a.member_mmSeq = b.mmSeq
-- WHERE 1=1

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

-- UNION 연습
SELECT
    breadcrumb
    ,itMain
FROM item 
UNION ALL
SELECT
    reGrade
    ,reWorkload
FROM review
;

