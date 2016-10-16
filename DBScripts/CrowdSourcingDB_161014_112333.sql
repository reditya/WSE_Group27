-- Message [ent1]
create table `message` (
   `message`  varchar(255)
);


-- User_Message [rel1]
alter table `message`  add column  `user_userid`  integer;
alter table `message`   add index fk_message_user (`user_userid`), add constraint fk_message_user foreign key (`user_userid`) references `user` (`userid`);


-- Message_Campaign [rel2]
alter table `message`  add column  `campaign_campaignid`  integer;
alter table `message`   add index fk_message_campaign (`campaign_campaignid`), add constraint fk_message_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


