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

select * from board;

select * from board order by idx desc limit 0, 10;

select *,datediff(wDate, now()) from board order by idx desc limit 0, 10;

/* new.gif를 24시간동안만 보여주기 위한 처리하기 */
select *,timestampdiff(hour, wDate, now()) from board order by idx desc limit 0, 10;

/* 이전글|다음글 꺼내오기 */
select * from board where idx = 8; -- 현재글
select * from board where idx < 8 order by idx desc limit 1; -- 이전글
select * from board where idx > 8 order by idx limit 1; -- 다음글

/* 날짜 함수 연습 */
select now();
/* date_add() - datetime형식비교 */
select now() as 오늘날짜, date_add(now(), interval 1 day);   -- 하루 후
select now() as 오늘날짜, date_add(now(), interval -1 day);  -- 하루 전
select now() as 오늘날짜, date_add(now(), interval 10 hour); -- 10시간 후
select now() as 오늘날짜, date_add(now(), interval -10 hour) as preHour; -- 10시간 후

/* date_sub() - datetime형식비교 */
select now() as 오늘날짜, date_sub(now(), interval 1 day);   -- 하루 전
select now() as 오늘날짜, date_sub(now(), interval -1 day);  -- 하루 후

/* board테이블에 적용 */
-- 게시글 중 하루전에 올라온 글만 보여주기
select wDate, date_sub(now(), interval 1 day) from board;
select substring(wDate,1,10), substring(date_sub(now(), interval 1 day),1,10) from board;
select idx,nickName,wDate from board;
select idx,nickName,wDate from board where substring(wDate,1,10) = substring(date_sub(now(), interval 1 day),1,10);

/* 날짜차이 계산 : DATEDIFF(시작날짜,마지막날짜) - int형식비교 */
select datediff('2023-11-14', now());
select datediff(now(), wDate) from board;
select datediff(wDate, now()) from board;
select idx,nickName,wDate

select timestampdiff(hour, now(), wDate) from board;
select timestampdiff(day, now(), wDate) from board;

/* 날짜형식(date_format(날짜형식, 포맷)) : 년도4자리(%Y)|월(%m)|일(%d), 시간(%H)|분(%i) */
select wDate, date_format(wDate, '%Y-%m-%d') from board;
select wDate, date_format(wDate, '%Y-%m-%d %H:%i') from board;