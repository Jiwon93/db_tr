-- espresso database를 사용하겠다. 
use espresso;

-- Select문
SELECT 
	member_nickname
    ,member_email 
    ,member_bod
    FROM member
WHERE 1 = 1 
	AND member_gender = 1
;

-- Insert문 
INSERT INTO item (
	product_main
    ,product_shareNaver
    ,product_shareKakao
    ,product_price
)

VALUES (
	"바디프로필 보정,웨딩사진 보정 등 인물 사진보정 해드립니다."
    ,"www.naver.com"
    ,"www.kakaocorp.com"
    ,"5,000원~"
)
;

CREATE TABLE IF NOT EXISTS `espresso`.`member2` (
  `mmseSeq` INT NOT NULL,
  PRIMARY KEY (`mmseSeq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `espresso`.`member` (
  `mmSeq` INT NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `mmRank` TINYINT NULL COMMENT '1: 판매자, 2: 일반회원',
  `mmName` VARCHAR(45) NULL,
  `mmNickname` VARCHAR(45) NULL,
  `mmEmail` VARCHAR(45) NULL,
  `mmPw` VARCHAR(45) NULL,
  `mmBod` DATE NULL,
  `mmGender` TINYINT NULL COMMENT '1: 남자, 2: 여자',
  `mmZip` INT NULL,
  `mmAddress1` VARCHAR(45) NULL,
  `mmAddress2` VARCHAR(45) NULL,
  `mmJob` TINYINT NULL COMMENT '1: 직장인, 2: 프리랜서, 3: 소상공인, 4: 스타트업 창업자, 5: 대학(원)생, 6: 취업준비생',
  `mmInterest` TINYINT NULL COMMENT '1: 디자인, 2: IT프로그래밍, 3: 영상사진음향, 4: 마케팅, 5: 번역통역, 6: 문서 글쓰기, 7: 건강미용, 8: 비즈니스컨설팅 9: 심리상담, 10: 주문제작, 11: 세무법무노무, 12: 이벤트, 13: 레슨 ',
  `mmSpecialty` TINYINT NULL COMMENT '1: 디자인, 2: IT프로그래밍, 3: 영상사진음향, 4: 마케팅, 5: 번역통역, 6: 문서 글쓰기, 7: 건강미용, 8: 비즈니스컨설팅 9: 심리상담, 10: 주문제작, 11: 세무법무노무, 12: 이벤트, 13: 레슨 ',
  `mmDetailed` TINYINT NULL COMMENT '11: 로고디자인, 12: 명함디자인, 13: 간판디자인, 14: 웹모바일디자인, 15: 앱디자인, \n\n21: 웹사이트신규제작, 22: 웹사이트개선버그수정, 23: 모바일앱신규제작, 24: 모바일앱개선버그수정, 25: 프로그램개발\n\n31: 영상제작, 32: 사진촬영, 33: 더빙녹음, 34: 음악사운드, 35: 엔터테이너',
  `mmTechnique` TINYINT NULL COMMENT '101: 포토샵, 102: 일러스트레이터, 103: creative suite, 104: dreamweaver, 105: flash, 106: XD, 107: 인디자인, 108: 파워포인트\n\n201: 워드프레스, 202: 자바스크립트, 203: 자바, 204: 파이썬, 205: PHP, 206: 리액트, 207: 부스트스랩, 208: JSP, 209: Spring, 210: MySQL, 211: jQuery, 212: HTML, 213: CSS',
  `mmCareer` INT NULL,
  `mmSchool` TINYINT NULL COMMENT '1: 서울대학교, 2: 숭실대학교, 3: 서강대학교, 4: 연세대학교, 5: 고려대학교',
  `mmCertificate` TINYINT NULL COMMENT '1: 정보처리기사, 2: 정보처리산업기사, 3: 컴활1급, 4: 컴활2급',
  `mmWishPay` INT NULL,
  `mmWorkTime` VARCHAR(45) NULL,
  `mmIntroduce` TEXT NULL,
  `mmCash` INT NULL,
  PRIMARY KEY (`mmSeq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci
;

CREATE TABLE IF NOT EXISTS `espresso`.`item` (
  `itemSeq` INT NOT NULL AUTO_INCREMENT COMMENT '상세페이지',
  `member_mmSeq` INT NOT NULL,
  `breadcrumb` VARCHAR(45) NULL COMMENT '상세페이지경로',
  `itMain` VARCHAR(45) NULL COMMENT '상품메인',
  `itShareUrl` VARCHAR(45) NULL,
  `itServiceDetail` TEXT NULL COMMENT '상품서비스설명',
  `itCancleRefund` TEXT NULL COMMENT '상품취소환불',
  `basicPrice` INT NULL,
  `basicDetail` VARCHAR(100) NULL,
  `basicBenefit` VARCHAR(45) NULL,
  `basicPeriod` INT NULL,
  `bestPrice` INT NULL,
  `bestDetail` VARCHAR(100) NULL,
  `bestBenefit` VARCHAR(45) NULL,
  `bestPeriod` INT NULL,
  `proPrice` INT NULL,
  `proDetail` VARCHAR(100) NULL,
  `proBenefit` VARCHAR(45) NULL,
  `proPeriod` INT NULL,
  `itInquiry` TEXT NULL,
  PRIMARY KEY (`itemSeq`),
  INDEX `fk_item_member1_idx` (`member_mmSeq` ASC) VISIBLE,
  CONSTRAINT `fk_item_member1`
    FOREIGN KEY (`member_mmSeq`)
    REFERENCES `espresso`.`member` (`mmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `espresso`.`member_phone` (
  `mmpSeq` INT NOT NULL AUTO_INCREMENT,
  `member_mmseq` INT NOT NULL,
  `mmpDiv` TINYINT NULL COMMENT '1: 핸드폰, 2: 회사전화, 3: 핸드폰2, 4: 비상연락망',
  `mmpPhoneNumber` INT NULL,
  PRIMARY KEY (`mmpSeq`),
  INDEX `fk_member_phone_member1_idx` (`member_mmseq` ASC) VISIBLE,
  CONSTRAINT `fk_member_phone_member1`
    FOREIGN KEY (`member_mmseq`)
    REFERENCES `espresso`.`member` (`mmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `espresso`.`product_favorite` (
  `favSeq` INT NOT NULL AUTO_INCREMENT,
  `favDiv` TINYINT NULL COMMENT '1: 선택안함, 2: 선택(좋아요)',
  `item_itemseq` INT NOT NULL,
  PRIMARY KEY (`favSeq`),
  INDEX `fk_product_favorite_item_idx` (`item_itemseq` ASC) VISIBLE,
  CONSTRAINT `fk_product_favorite_item`
    FOREIGN KEY (`item_itemseq`)
    REFERENCES `espresso`.`item` (`itemSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `espresso`.`product_wish` (
  `wishseq` INT NOT NULL AUTO_INCREMENT,
  `wishDiv` TINYINT NULL COMMENT '1: 선택안함, 2: 선택(찜)',
  `item_itemseq` INT NOT NULL,
  PRIMARY KEY (`wishseq`),
  INDEX `fk_product_wish_item1_idx` (`item_itemseq` ASC) VISIBLE,
  CONSTRAINT `fk_product_wish_item1`
    FOREIGN KEY (`item_itemseq`)
    REFERENCES `espresso`.`item` (`itemSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `espresso`.`purchase` (
  `purSeq` INT NOT NULL AUTO_INCREMENT,
  `basicPrice` VARCHAR(45) NULL,
  `basicDetail` VARCHAR(100) NULL,
  `basicBenefit` VARCHAR(45) NULL,
  `basicPeriod` VARCHAR(45) NULL,
  `bestPrice` VARCHAR(45) NULL,
  `bestDetail` VARCHAR(100) NULL,
  `bestBenefit` VARCHAR(45) NULL,
  `bestPeriod` VARCHAR(45) NULL,
  `proPrice` VARCHAR(45) NULL,
  `proDetail` VARCHAR(100) NULL,
  `proBenefit` VARCHAR(45) NULL,
  `proPeriod` VARCHAR(45) NULL,
  `payment` TINYINT NULL COMMENT '1: 신용카드, 2: 실시간 계좌이체, 3: 무통장입금, 4: 휴대폰',
  `item_itemseq` INT NOT NULL,
  `member_mmseq` INT NOT NULL,
  PRIMARY KEY (`purSeq`),
  INDEX `fk_purchase_item1_idx` (`item_itemseq` ASC) VISIBLE,
  INDEX `fk_purchase_member1_idx` (`member_mmseq` ASC) VISIBLE,
  CONSTRAINT `fk_purchase_item1`
    FOREIGN KEY (`item_itemseq`)
    REFERENCES `espresso`.`item` (`itemSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_member1`
    FOREIGN KEY (`member_mmseq`)
    REFERENCES `espresso`.`member` (`mmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `espresso`.`review` (
  `revSeq` INT NOT NULL AUTO_INCREMENT,
  `reNickname` VARCHAR(45) NULL,
  `reGrade` VARCHAR(45) NULL,
  `reWriteTime` DATETIME NULL,
  `reContent` TEXT NULL,
  `reWorkload` VARCHAR(45) NULL,
  `reOrderPrice` VARCHAR(45) NULL,
  `item_itemseq` INT NOT NULL,
  `member_mmseq` INT NOT NULL,
  PRIMARY KEY (`revSeq`),
  INDEX `fk_product_review_item1_idx` (`item_itemseq` ASC) VISIBLE,
  INDEX `fk_product_review_member1_idx` (`member_mmseq` ASC) VISIBLE,
  CONSTRAINT `fk_product_review_item1`
    FOREIGN KEY (`item_itemseq`)
    REFERENCES `espresso`.`item` (`itemSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_review_member1`
    FOREIGN KEY (`member_mmseq`)
    REFERENCES `espresso`.`member` (`mmSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `espresso`.`inquiry` (
  `inqSeq` INT NOT NULL AUTO_INCREMENT,
  `iqNickname` VARCHAR(45) NULL,
  `iqWriteTIme` DATETIME NULL,
  `iqContent` TEXT NULL,
  `mmSeqInquiry` VARCHAR(45) NULL,
  `item_itemseq` INT NOT NULL,
  PRIMARY KEY (`inqSeq`),
  INDEX `fk_inquiry_item1_idx` (`item_itemseq` ASC) VISIBLE,
  CONSTRAINT `fk_inquiry_item1`
    FOREIGN KEY (`item_itemseq`)
    REFERENCES `espresso`.`item` (`itemSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `espresso`.`CCG` (
  `CCGSeq` INT NOT NULL AUTO_INCREMENT,
  `ccgName` VARCHAR(45) NULL,
  `ccgOrder` VARCHAR(45) NULL,
  `ccgUseNY` VARCHAR(45) NULL,
  `ccgDelNY` VARCHAR(45) NULL,
  PRIMARY KEY (`CCGSeq`))
ENGINE = InnoDB
;

CREATE TABLE IF NOT EXISTS `espresso`.`CC` (
  `CCSeq` INT NOT NULL AUTO_INCREMENT,
  `ccName` VARCHAR(45) NULL,
  `CCG_CCGSeq` INT NOT NULL,
  `ccOrder` VARCHAR(45) NULL,
  `ccUseNY` VARCHAR(45) NULL,
  `ccDelNY` VARCHAR(45) NULL,
  PRIMARY KEY (`CCSeq`),
  INDEX `fk_CC_CCG1_idx` (`CCG_CCGSeq` ASC) VISIBLE,
  CONSTRAINT `fk_CC_CCG1`
    FOREIGN KEY (`CCG_CCGSeq`)
    REFERENCES `espresso`.`CCG` (`CCGSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
;

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



