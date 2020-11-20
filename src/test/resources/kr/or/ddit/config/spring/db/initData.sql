
/*운영환경에서 돌아갈수 없는 테이블을 만들어놓았다. 에러방지용*/
/*select * 
from no_exists_in_prd; */


ALTER TABLE BOARD DISABLE CONSTRAINT FK_BOARD_TO_BOARD;
ALTER TABLE BOARD DISABLE CONSTRAINT FK_LBOARD_TO_BOARD;
ALTER TABLE BOARD DISABLE CONSTRAINT FK_MEMBER_TO_BOARD;
ALTER TABLE FILES DISABLE CONSTRAINT FK_BOARD_TO_FILES;
ALTER TABLE REPLY DISABLE CONSTRAINT FK_BOARD_TO_REPLY;
ALTER TABLE REPLY DISABLE CONSTRAINT FK_MEMBER_TO_REPLY;

DROP SEQUENCE BOARD_SEQ;
 
CREATE SEQUENCE BOARD_SEQ

        START WITH 140
        INCREMENT BY 1
        MAXVALUE  10000
        MINVALUE  1;



/*DELETE board;*/
TRUNCATE TABLE board;
TRUNCATE TABLE lboard;
TRUNCATE TABLE files;
TRUNCATE TABLE reply;



Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('1','111111',to_date('2020/11/16','RRRR/MM/DD'),1,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('2','ㅜㅜㅜㅜ',to_date('2020/11/16','RRRR/MM/DD'),1,'0','1','brown','1');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('3','망했어 ㅜㅜ',to_date('2020/11/16','RRRR/MM/DD'),3,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('4','222',to_date('2020/11/16','RRRR/MM/DD'),4,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('5','하이룽',to_date('2020/11/16','RRRR/MM/DD'),4,'0','2','brown','4');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('6','2',to_date('2020/11/17','RRRR/MM/DD'),6,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('7','212321',to_date('2020/11/17','RRRR/MM/DD'),7,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('8','12312',to_date('2020/11/17','RRRR/MM/DD'),8,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('9','312312',to_date('2020/11/17','RRRR/MM/DD'),9,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('10','안녕',to_date('2020/11/17','RRRR/MM/DD'),10,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('11','123123',to_date('2020/11/17','RRRR/MM/DD'),11,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('12','12312',to_date('2020/11/17','RRRR/MM/DD'),4,'1','2','brown','4');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('13','123123',to_date('2020/11/17','RRRR/MM/DD'),4,'1','2','brown','12');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('14','123123',to_date('2020/11/17','RRRR/MM/DD'),14,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('15','213123',to_date('2020/11/17','RRRR/MM/DD'),15,'0','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('16','2222',to_date('2020/11/17','RRRR/MM/DD'),1,'1','1','brown','1');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('17','3333',to_date('2020/11/17','RRRR/MM/DD'),1,'0','1','brown','16');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('18','1111',to_date('2020/11/17','RRRR/MM/DD'),18,'0','3','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('19','222',to_date('2020/11/17','RRRR/MM/DD'),18,'0','3','brown','18');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('32','안녕',to_date('2020/11/17','RRRR/MM/DD'),32,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('33','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('36','안녕',to_date('2020/11/17','RRRR/MM/DD'),36,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('37','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('39','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),15,'1','1','brown','15');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('40','안녕',to_date('2020/11/17','RRRR/MM/DD'),40,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('41','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('42','안녕',to_date('2020/11/17','RRRR/MM/DD'),42,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('43','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),15,'1','1','brown','15');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('44','안녕',to_date('2020/11/17','RRRR/MM/DD'),44,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('47','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('48','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('49','안녕',to_date('2020/11/17','RRRR/MM/DD'),49,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('50','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('51','안녕',to_date('2020/11/17','RRRR/MM/DD'),51,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('52','안녕',to_date('2020/11/17','RRRR/MM/DD'),52,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('53','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('54','안녕',to_date('2020/11/17','RRRR/MM/DD'),54,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('55','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),15,'1','1','brown','15');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('56','111222323',to_date('2020/11/17','RRRR/MM/DD'),56,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('57','222',to_date('2020/11/17','RRRR/MM/DD'),56,'0','1','brown','56');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('58','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('59','안녕',to_date('2020/11/17','RRRR/MM/DD'),59,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('60','안녕',to_date('2020/11/17','RRRR/MM/DD'),60,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('61','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('62','안녕',to_date('2020/11/17','RRRR/MM/DD'),62,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('63','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),15,'1','1','brown','15');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('64','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('65','안녕',to_date('2020/11/17','RRRR/MM/DD'),65,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('66','안녕',to_date('2020/11/17','RRRR/MM/DD'),66,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('67','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('68','안녕',to_date('2020/11/17','RRRR/MM/DD'),68,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('69','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),15,'1','1','brown','15');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('70','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('71','안녕',to_date('2020/11/17','RRRR/MM/DD'),71,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('72','안녕',to_date('2020/11/17','RRRR/MM/DD'),72,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('73','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('74','안녕',to_date('2020/11/17','RRRR/MM/DD'),74,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('75','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),15,'1','1','brown','15');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('76','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('77','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('78','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('79','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('80','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('81','안녕',to_date('2020/11/17','RRRR/MM/DD'),81,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('82','안녕',to_date('2020/11/17','RRRR/MM/DD'),82,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('83','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('84','안녕',to_date('2020/11/17','RRRR/MM/DD'),84,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('85','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),15,'1','1','brown','15');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('86','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('87','안녕',to_date('2020/11/17','RRRR/MM/DD'),87,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('88','안녕',to_date('2020/11/17','RRRR/MM/DD'),88,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('89','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('90','안녕',to_date('2020/11/17','RRRR/MM/DD'),90,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('91','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),15,'1','1','brown','15');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('92','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('93','안녕',to_date('2020/11/17','RRRR/MM/DD'),93,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('94','안녕',to_date('2020/11/17','RRRR/MM/DD'),94,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('95','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('96','안녕',to_date('2020/11/17','RRRR/MM/DD'),96,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('97','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),15,'1','1','brown','15');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('98','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('99','안녕',to_date('2020/11/17','RRRR/MM/DD'),99,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('100','안녕',to_date('2020/11/17','RRRR/MM/DD'),100,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('101','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('102','안녕',to_date('2020/11/17','RRRR/MM/DD'),102,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('103','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),15,'1','1','brown','15');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('104','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('105','안녕',to_date('2020/11/17','RRRR/MM/DD'),105,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('106','안녕',to_date('2020/11/17','RRRR/MM/DD'),106,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('107','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('108','안녕',to_date('2020/11/17','RRRR/MM/DD'),108,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('109','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),15,'1','1','brown','15');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('110','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('111','안녕',to_date('2020/11/17','RRRR/MM/DD'),111,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('112','안녕',to_date('2020/11/17','RRRR/MM/DD'),112,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('113','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('114','안녕',to_date('2020/11/17','RRRR/MM/DD'),114,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('115','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),15,'1','1','brown','15');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('116','안녕22',to_date('2020/11/17','RRRR/MM/DD'),0,'1','2','brown','6');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('117','안녕',to_date('2020/11/17','RRRR/MM/DD'),117,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('118','안녕',to_date('2020/11/17','RRRR/MM/DD'),118,'1','1','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('119','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),20,'1','1','brown','19');
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('120','안녕',to_date('2020/11/17','RRRR/MM/DD'),120,'1','2','brown',null);
Insert into BOARD (BO_ID,BO_TITLE,BO_DATE,GN,BO_STATUS,LBO_ID,MEM_ID,P_SEQ) values ('121','반갑습니다.',to_date('2020/11/17','RRRR/MM/DD'),15,'1','1','brown','15');


Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('17','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('25','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('3','3','DovYlrQU0AAFoEL.jpg','E:\profile\09bc9825-b216-4956-b69e-23556b1fe4ba.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('4','3','red.jpg','E:\profile\b7790c57-ead3-44e0-a1ce-10a2609b042c.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('21','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('6','5','ryan3.gif','E:\profile\0bf7eea9-dfbc-4988-b3fa-2adadce384d4.gif');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('7','5','ryan.gif','E:\profile\cb708569-69f2-44ea-a59e-730d81c450fb.gif');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('10','1','green.jpg','E:\profile\c1f859cb-e161-41e3-9c59-e4bee2669ca2.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('9','18','red.jpg','E:\profile\21ccae94-6ee9-47b6-9ee8-9c9e3de05af4.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('22','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('23','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('24','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('26','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('27','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('28','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('29','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('30','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('31','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('32','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('33','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('34','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('35','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('36','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('37','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('38','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('39','56','unnamed.jpg','E:\profile\e0fd9f27-97db-4fcb-9ebd-eda5ac991053.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('40','56','ryan3.gif','E:\profile\08bcc6f3-7179-454c-8ae1-285aba800e11.gif');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('41','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('42','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('43','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('44','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('45','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('46','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('47','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('48','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('49','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('50','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('51','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('52','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('53','79','ryan.jpg','E:\profile\bf65218f-ded9-4464-b221-3bd4a36e6b7e.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('54','80','ryan.jpg','E:\profile\6d232613-8ee8-43d4-b94a-72cdc855eeed.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('55','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('56','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('57','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('58','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('59','86','ryan.jpg','E:\profile\afc237bd-ac13-4b8c-b148-1a2d991f1d89.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('60','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('61','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('62','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('63','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('64','92','ryan.jpg','E:\profile\f01a46e8-6ee3-4d9c-bdbe-b99fbb0d5a6b.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('66','93','ryan.jpg','E:\profile\1fe68f30-f393-47d8-92d4-f0939e44e425.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('67','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('68','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('69','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('70','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('71','98','ryan.jpg','E:\profile\45b1e5b4-0b4c-4ebe-a8cd-1d0039891670.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('73','99','ryan.jpg','E:\profile\ad5db135-c1e9-45e1-a847-5877fa911d9d.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('74','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('75','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('76','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('77','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('78','104','ryan.jpg','E:\profile\142723ae-c76a-460c-bdbd-6c197a2788f0.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('80','105','ryan.jpg','E:\profile\137427ef-0cce-4aed-b708-9bfdfa0776ac.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('81','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('82','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('83','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('84','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('85','110','ryan.jpg','E:\profile\f34b68fb-1755-40e1-b523-8840a816a9ac.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('87','111','ryan.jpg','E:\profile\5b6f6753-68de-42a4-8a26-07a0a0457117.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('88','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('89','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('90','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('91','11','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('94','10','ryan.jpg','E:\profile\3967a6d7-6328-4ce8-8eaf-d8b66222eab6.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('95','116','ryan.jpg','E:\profile\dcec921c-d6ba-49e1-a77d-1dcb7d4c78e2.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('96','10','ryan.jpg','E:\profile\24f2fe9d-1566-4214-bcce-334aa0ac56e3.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('97','117','ryan.jpg','E:\profile\98727b4e-b462-4420-8085-bb5acdd120a5.jpg');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('98','1','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('99','19','ryan.png','e:\profile2\ryan.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('100','10','ryan2.png','e:\profile2\ryan2.png');
Insert into FILES (FILE_ID,BO_ID,FILE_NM,FILE_PATH) values ('101','11','ryan.png','e:\profile2\ryan.png');




Insert into LBOARD (LBO_ID,LBO_NM,LBO_STATUS) values ('1','질문게시판','1');
Insert into LBOARD (LBO_ID,LBO_NM,LBO_STATUS) values ('2','자유게시판','1');
Insert into LBOARD (LBO_ID,LBO_NM,LBO_STATUS) values ('3','QnA','1');
Insert into LBOARD (LBO_ID,LBO_NM,LBO_STATUS) values ('56','테스트','1');



Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('1','가버려',to_date('2020/11/16','RRRR/MM/DD'),'0','3','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('2','큰일났다 ㅠㅜ',to_date('2020/11/16','RRRR/MM/DD'),'1','3','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('4','dddd',to_date('2020/11/16','RRRR/MM/DD'),'0','3','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('5','aaaa',to_date('2020/11/16','RRRR/MM/DD'),'1','4','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('6','dddd',to_date('2020/11/16','RRRR/MM/DD'),'1','4','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('7','23123',to_date('2020/11/17','RRRR/MM/DD'),'1','12','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('8','222',to_date('2020/11/17','RRRR/MM/DD'),'1','12','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('9','11111',to_date('2020/11/17','RRRR/MM/DD'),'1','18','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('10','2222',to_date('2020/11/17','RRRR/MM/DD'),'1','18','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('16','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('17','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'0','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('18','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('19','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('20','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('21','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('22','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('23','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('24','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('25','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('26','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('27','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('28','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('29','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('30','11',to_date('2020/11/17','RRRR/MM/DD'),'1','56','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('31','22',to_date('2020/11/17','RRRR/MM/DD'),'0','56','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('32','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('33','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('34','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('35','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('36','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('37','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('38','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('39','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('40','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('41','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('42','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('43','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('44','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('45','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('46','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('47','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('48','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('49','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('50','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('51','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('52','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('53','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('54','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('55','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('56','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('57','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('58','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('59','안녕하세용',to_date('2020/11/17','RRRR/MM/DD'),'1','7','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('60','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','6','brown');
Insert into REPLY (RE_ID,RE_CON,RE_DATE,RE_STATUS,BO_ID,MEM_ID) values ('61','반갑습니다.!!',to_date('2020/11/17','RRRR/MM/DD'),'1','5','brown');




ALTER TABLE BOARD ENABLE CONSTRAINT FK_BOARD_TO_BOARD;
ALTER TABLE BOARD ENABLE CONSTRAINT FK_LBOARD_TO_BOARD;
ALTER TABLE BOARD ENABLE CONSTRAINT FK_MEMBER_TO_BOARD;
ALTER TABLE FILES ENABLE CONSTRAINT FK_BOARD_TO_FILES;
ALTER TABLE REPLY ENABLE CONSTRAINT FK_BOARD_TO_REPLY;
ALTER TABLE REPLY ENABLE CONSTRAINT FK_MEMBER_TO_REPLY;

