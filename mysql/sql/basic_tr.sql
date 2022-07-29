use espresso;

INSERT INTO inquiry (
	memberSeqInquiry
    ,item_itemseq
    ,inquiry_nickname
    ,inquiry_writeTime
    ,inquiry_content
)

VALUES (
	3
    ,11
    ,"jimin"
    ,"2022-05-28 09:35"
    ,"덕분에 결혼식 때 이쁜 사진 잘 쓸 수 있었습니다."
)
;

SELECT * from member;

SELECT * from item;

SELECT * from inquiry;

ALTER TABLE inquiry MODIFY COLUMN inquiry_content TEXT;

INSERT INTO member_phone (
	member_mmseq
    ,mmpDIv
    ,mmpPhoneNumber
)

VALUES (
	11
    ,2
    ,"02-678-1489"
)
;