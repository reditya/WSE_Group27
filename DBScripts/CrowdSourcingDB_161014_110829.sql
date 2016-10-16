-- Message [ent1]
create table `message` (
   `campaignid`  integer  not null,
   `message`  varchar(255),
   `supporterid`  integer  not null,
  primary key (`campaignid`, `supporterid`)
);


-- User_Message [rel1]
create table `user_message` (
   `user_userid`  integer not null,
   `message_campaignid`  integer not null,
   `message_supporterid`  integer not null,
  primary key (`user_userid`, `message_campaignid`, `message_supporterid`)
);
alter table `user_message`   add index fk_user_message_user (`user_userid`), add constraint fk_user_message_user foreign key (`user_userid`) references `user` (`userid`);
alter table `user_message`   add index fk_user_message_message (`message_campaignid`, `message_supporterid`), add constraint fk_user_message_message foreign key (`message_campaignid`, `message_supporterid`) references `message` (`campaignid`, `supporterid`);


-- Message_Campaign [rel2]
create table `message_campaign` (
   `message_campaignid`  integer not null,
   `message_supporterid`  integer not null,
   `campaign_campaignid`  integer not null,
  primary key (`message_campaignid`, `message_supporterid`, `campaign_campaignid`)
);
alter table `message_campaign`   add index fk_message_campaign_message (`message_campaignid`, `message_supporterid`), add constraint fk_message_campaign_message foreign key (`message_campaignid`, `message_supporterid`) references `message` (`campaignid`, `supporterid`);
alter table `message_campaign`   add index fk_message_campaign_campaign (`campaign_campaignid`), add constraint fk_message_campaign_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


