use espresso;

select * from member;

select count(*) from member;

SELECT 
	a.mmSeq
    ,a.mmName
    ,a.mmAddress1
    ,a.mmAddress2
    ,b.mmpPhoneNumber
FROM member a
-- 전부 보여주기
-- left join member_phone b on b.member_mmseq = a.mmSeq
-- 채워진 항목만 보여주기
-- inner join member_phone b on b.member_mmseq = a.mmSeq
join member_phone b on b.member_mmseq = a.mmSeq
;
