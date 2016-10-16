-- User_Campaign [rel3]
alter table `campaign`  add column  `user_userid`  integer;
alter table `campaign`   add index fk_campaign_user (`user_userid`), add constraint fk_campaign_user foreign key (`user_userid`) references `user` (`userid`);


