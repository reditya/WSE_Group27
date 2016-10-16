-- ReceivedContribution [ent11]
create table `receivedcontribution` (
   `amount`  double precision,
   `rec_campaignid`  integer  not null,
   `rec_contributionid`  integer  not null,
   `rec_userid`  integer  not null,
  primary key (`rec_campaignid`, `rec_contributionid`, `rec_userid`)
);


-- Questions [ent9]
create table `questions` (
   `questionid`  integer  not null,
   `answerstring`  varchar(255),
   `questionstring`  varchar(255),
   `q_campaignid`  integer  not null,
   `q_userid`  integer  not null,
   `isprivate`  bit,
  primary key (`questionid`, `q_campaignid`, `q_userid`)
);


-- ContributionProfile_ReceivedContribution [rel10]
alter table `receivedcontribution`  add column  `contributionprofile_contributi`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_contri (`contributionprofile_contributi`), add constraint fk_receivedcontribution_contri foreign key (`contributionprofile_contributi`) references `contributionprofile` (`contributionid`);


-- User_Questions [rel11]
alter table `questions`  add column  `user_userid`  integer;
alter table `questions`   add index fk_questions_user (`user_userid`), add constraint fk_questions_user foreign key (`user_userid`) references `user` (`userid`);


-- Questions_Campaign [rel12]
alter table `questions`  add column  `campaign_campaignid`  integer;
alter table `questions`   add index fk_questions_campaign (`campaign_campaignid`), add constraint fk_questions_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


-- User_ReceivedContribution [rel9]
alter table `receivedcontribution`  add column  `user_userid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_user (`user_userid`), add constraint fk_receivedcontribution_user foreign key (`user_userid`) references `user` (`userid`);


