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
-- left join member_phone b on b.member_mmseq = a.mmSeq
-- inner join member_phone b on b.member_mmseq = a.mmSeq
join member_phone b on b.member_mmseq = a.mmSeq
;
