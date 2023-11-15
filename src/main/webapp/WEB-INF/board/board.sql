show tables;

create table board (
	idx     int not null auto_increment,		-- 게시글 고유번호
	mid     varchar(30) not null,			    -- 게시글 작성자 아이디
	nickName varchar(30) not null,				-- 게시글 작성자 닉네임
	title   varchar(100) not null, 				-- 게시글 제목
	email   varchar(60),						-- 이메일주소
	homePage varchar(60),						-- 홈페이지(개인블로그) 주소
	content text not null,						-- 게시글 내용
	readNum int not null default 0,				-- 글 조회수
	hostIp  varchar(40) not null, 				-- 글 작성자 IP
	openSw  char(2) default 'OK',				-- 게시글 공개여부(OK:공개|NO:비공개)
	wDate   datetime default now(),				-- 글 작성한 날짜(시간)
	good    int default 0,						-- 좋아요 클릭 횟수 누적
	primary key(idx)
);

desc board;

insert into board values (default,'admin','관리맨','게시판 서비스를 시작합니다.','admin1234@naver.com','','게시할 내용들을 입력해주세요.',default,'192.168.50.54',default,default,default);