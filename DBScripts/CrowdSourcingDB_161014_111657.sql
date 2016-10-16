-- Message [ent1]
create table `message` (
   `message`  varchar(255)
);


-- User_Message [rel1]
create table `user_message` (
   `user_userid`  integer not null,
  primary key (`user_userid`)
);
alter table `user_message`   add index fk_user_message_user (`user_userid`), add constraint fk_user_message_user foreign key (`user_userid`) references `user` (`userid`);
alter table `user_message`   add index fk_user_message_message (), add constraint fk_user_message_message foreign key () references `message` ();


-- Message_Campaign [rel2]
create table `message_campaign` (
   `campaign_campaignid`  integer not null,
  primary key (`campaign_campaignid`)
);
alter table `message_campaign`   add index fk_message_campaign_message (), add constraint fk_message_campaign_message foreign key () references `message` ();
alter table `message_campaign`   add index fk_message_campaign_campaign (`campaign_campaignid`), add constraint fk_message_campaign_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


