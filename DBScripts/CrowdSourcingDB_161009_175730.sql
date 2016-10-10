-- User_Tags [rel15]
create table `user_tags` (
   `user_userid`  integer not null,
   `tags_tagid`  integer not null,
  primary key (`user_userid`, `tags_tagid`)
);
alter table `user_tags`   add index fk_user_tags_user (`user_userid`), add constraint fk_user_tags_user foreign key (`user_userid`) references `user` (`userid`);
alter table `user_tags`   add index fk_user_tags_tags (`tags_tagid`), add constraint fk_user_tags_tags foreign key (`tags_tagid`) references `tags` (`tagid`);


