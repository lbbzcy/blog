select u.*,b.user_id as b_user_id,b.blog_id,b.blog_title,b.blog_content,b.publish_date,b.read_counts,b.comment_counts 
  	from blog_user u , blog b 
  	where u.user_id = b.user_id and u.user_id=1;
desc blog;    
select u.*,b.user_id as b_user_id,b.blog_id,b.blog_title,b.blog_content,b.publish_date,b.read_counts,b.comment_counts 
  	from blog_user u , blog b 
    where u.user_id = b.user_id and b.blog_id=21;
select * from blog_user;    
update blog_user set nick_name='zhangsan',gender='M',birthday=to_date('1995-12-12','YYYY-MM-DD'),qq='123456',hobby='1,2,3' where user_id=1;
insert into blog(blog_id,blog_title,blog_content,publish_date,read_counts,comment_counts,user_id) 
values 
(seq_blog_id.nextval,'博客标题1','博客内容1',to_date('2008-08-08 20:08:05','YYYY-MM-DD HH24:MI:SS'),14,8,1);    
insert into blog(blog_id,blog_title,blog_content,publish_date,read_counts,comment_counts,user_id) 
values 
(seq_blog_id.nextval,'博客标题2','博客内容2',to_date('2008-09-08 08:08:05','YYYY-MM-DD HH24:MI:SS'),25,11,1); 

select * from blog;
select * from blog_user;
desc hobby;
desc blog_user;
alter table blog_user drop(hobby);

insert into hobby(hobby_id,hobby_name) values(1,'看书');
insert into hobby(hobby_id,hobby_name) values(2,'跑步');
insert into hobby(hobby_id,hobby_name) values(3,'篮球');
insert into hobby(hobby_id,hobby_name) values(4,'足球');
insert into hobby(hobby_id,hobby_name) values(5,'摄影');

insert into user_hobby(user_id,hobby_id) values(1,1);
insert into user_hobby(user_id,hobby_id) values(1,3);
insert into user_hobby(user_id,hobby_id) values(1,5);

select * from hobby;
select * from user_hobby;
select u.*,b.user_id as b_user_id,b.blog_id,b.blog_title,b.blog_content,b.publish_date,b.read_counts,b.comment_counts,h.*
  	from blog_user u , blog b ,hobby h,user_hobby uh
  	where u.user_id = b.user_id and h.hobby_id=uh.hobby_id and u.user_id = uh.user_id and u.user_id=3;
desc user_hobby;
insert into user_hobby (user_id,hobby_id) select 1,2 from dual union all select 1,4 from dual;

desc blog;
select seq_blog_id.nextval from dual;
alter sequence seq_blog_id increment by 1;
select * from blog;

select u.*,b.USER_ID as B_USER_ID,b.BLOG_ID,b.BLOG_TITLE,b.BLOG_CONTENT,b.PUBLISH_DATE,b.READ_COUNTS,b.COMMENT_COUNTS,h.*
		from BLOG_USER u
		left outer join BLOG b
		on u.USER_ID = b.USER_ID
		left outer join USER_HOBBY uh
		on u.USER_ID = uh.USER_ID
		left outer join HOBBY h
		on h.HOBBY_ID = uh.HOBBY_ID
		where u.USER_ID=1 order by b.publish_date desc;
    
    
SELECT *
FROM
  (SELECT ROWNUM AS rn,
    t.*
  FROM
    (select u.*,b.USER_ID as
		"B_USER_ID",
		b.BLOG_ID,b.BLOG_TITLE,b.BLOG_CONTENT,b.PUBLISH_DATE,b.READ_COUNTS,b.COMMENT_COUNTS
		from BLOG_USER u,BLOG b
		where u.USER_ID = b.USER_ID ORDER BY
		b.PUBLISH_DATE DESC
    ) t
  WHERE ROWNUM <=10
  )
WHERE rn >=1;

desc blog_comment;
desc blog
select * from blog_comment;


    
    
select * from blog,blog_comment
		where blog.blog_id= 
		(select blog_comment.blog_id from blog_comment where user_id = 1)
select * from blog b,blog_comment bc where b.blog_id = bc.blog_id and b.blog_id = 3;


select * from blog b ,blog_comment bc 
where b.blog_id = bc.blog_id order by bc.comment_date;

select bc.*, u.*,b.USER_ID as "B_USER_ID", b.BLOG_ID,b.BLOG_TITLE,b.BLOG_CONTENT,b.PUBLISH_DATE,b.READ_COUNTS,b.COMMENT_COUNTS 
from BLOG_USER u,BLOG b,blog_comment bc
where u.USER_ID = b.USER_ID
and bc.BLOG_ID = 4;  

select  u.*,b.USER_ID as "B_USER_ID", b.BLOG_ID,b.BLOG_TITLE,b.BLOG_CONTENT,b.PUBLISH_DATE,b.READ_COUNTS,b.COMMENT_COUNTS ,bc.comment_content,bc.comment_date
		from BLOG_USER u
		left outer join BLOG b
		on u.USER_ID = b.USER_ID
    left outer join blog_comment bc
    on b.blog_id = bc.blog_id
		where b.BLOG_ID = 5 order by bc.comment_date desc;

select  u.*,b.USER_ID as "B_USER_ID", b.BLOG_ID,b.BLOG_TITLE,b.BLOG_CONTENT,b.PUBLISH_DATE,b.READ_COUNTS,b.COMMENT_COUNTS
		from BLOG_USER u
		left outer join BLOG b
		on u.USER_ID = b.USER_ID
		where b.BLOG_ID = 5
    select * from blog_comment;
select * from blog ,blog_user,blog_comment where blog_user.user_id = blog.user_id and blog.blog_id = 3;
    
    
select * from blog_comment;
desc blog_comment;
alter table blog_comment add(depth number(4) not null);
delete from blog_comment where comment_id = 2;
insert into blog_comment values(1,0,'/','我是第一条信息',sysdate,1,3,0);
insert into blog_comment values(2,1,'/1/','我回复第一条信息1次',sysdate,1,3,1);
insert into blog_comment values(3,1,'/1/','我回复第一条信息2次',sysdate,1,3,1);
insert into blog_comment values(4,2,'/1/2/','我回复第一条信息1次的1次',sysdate,1,3,2);
insert into blog_comment values(5,0,'/','我是第二条信息',sysdate,1,3,0);
insert into blog_comment values(6,5,'/5/','我回复第二条信息1次',sysdate,1,3,1);
insert into blog_comment values(7,5,'/5/','我回复第二条信息2次',sysdate,1,3,1);
insert into blog_comment values(8,1,'0','我回复第二条信息2次',sysdate,2,4,1);

select comment_content  from blog_comment
desc blog_comment;
select * from blog_comment left outer join blog_user on blog_comment.user_id = blog_user.user_id where blog_id =3 order by blog_comment.comment_date desc

select * from blog_user;
delete from blog_user
alter table blog_user disable primary key cascade;
alter table blog_user enable primary key;
truncate table blog;
truncate table blog_user;
truncate table blog_comment;
truncate table user_hobby;