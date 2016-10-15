-- Message [ent1]
create table `message` (
   `message`  varchar(255),
   `message_campaignid`  integer  not null,
   `message_userid`  integer  not null,
  primary key (`message_campaignid`, `message_userid`)
);


-- Vote [ent10]
create table `vote` (
   `votevalue`  integer,
   `user_userid`  integer  not null,
   `campaign_campaignid`  integer  not null,
  primary key (`user_userid`, `campaign_campaignid`)
);


-- User_Message [rel1]
alter table `message`  add column  `user_userid`  integer;
alter table `message`   add index fk_message_user (`user_userid`), add constraint fk_message_user foreign key (`user_userid`) references `user` (`userid`);


-- User_Vote [rel13]
alter table `vote`  add column  `user_userid`  integer;
alter table `vote`   add index fk_vote_user (`user_userid`), add constraint fk_vote_user foreign key (`user_userid`) references `user` (`userid`);


-- Vote_Campaign [rel14]
alter table `vote`  add column  `campaign_campaignid`  integer;
alter table `vote`   add index fk_vote_campaign (`campaign_campaignid`), add constraint fk_vote_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


-- Message_Campaign [rel2]
alter table `message`  add column  `campaign_campaignid`  integer;
alter table `message`   add index fk_message_campaign (`campaign_campaignid`), add constraint fk_message_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


