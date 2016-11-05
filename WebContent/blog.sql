--用户表
--字段：
--用户id:id,用户名:username,邮箱:email,密码:password,昵称:nickname,性别:sex,生日:birthday,QQ:qq,爱好:hobby,头像:headImg
create table blog_user(
  user_id number(4) primary key not null,
  user_name varchar2(20) not null,
  email varchar2(20) not null,
  password varchar2(40) not null,
  nick_name varchar2(20),
  gender char(1),
  birthday date,
  qq varchar2(20),
  hobby varchar2(100),
  head_path varchar2(100)
);
--主键生成策略  使用sequence序列
create sequence seq_user_id start with 1 increment by 1;
--博客表：字段：
--博客id：id，标题:title,内容:content,发表时间publish_date,阅读次数,read_times,评论人数，comment_counts,用户id，user_id
create table blog(
  blog_id number(4) primary key not null,
  blog_title varchar2(100) not null,
  blog_content clob not null,
  publish_date date not null,
  read_counts number(10),
  comment_counts number(10),
  user_id number(4) not null references blog_user(user_id)
);
create sequence seq_blog_id start with 1 increment by 1;
--评论表：字段：
--评论id，comment_id,父级评论id,parent_id,评论线路thread,评论内容，comment_content,评论时间comment_date,用户id,user_id,博客id，blog_id
create table blog_comment(
  comment_id number(4) primary key not null,
  parent_id number(4) not null,
  thread varchar2(20) not null,
  comment_content clob not null,
  comment_date date not null,
  user_id number(4) not null references blog_user(user_id),
  blog_id number(4) not null references blog(blog_id),
  depth number(4)  not null
);
create sequence seq_comment_id start with 1 increment by 1;
--爱好表:字段：
--爱好hobby_id，名称，hobby_name
create table hobby(
  hobby_id number(4) primary key not null,
  hobby_name varchar2(20)
);
--用户-爱好表:字段：
--用户id，user_id,爱好id,hobby_id
create table user_hobby(
  user_id number(4) not null references blog_user(user_id),
  hobby_id number(4) not null references hobby(hobby_id),
  constraint user_body_id_pk primary key(user_id,hobby_id)
 );