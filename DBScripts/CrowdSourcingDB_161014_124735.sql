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
alter table `receivedcontribution`  add column  `rec_contributionid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_contri (`rec_contributionid`), add constraint fk_receivedcontribution_contri foreign key (`rec_contributionid`) references `contributionprofile` (`contributionid`);


-- User_Questions [rel11]
alter table `questions`  add column  `q_userid`  integer;
alter table `questions`   add index fk_questions_user (`q_userid`), add constraint fk_questions_user foreign key (`q_userid`) references `user` (`userid`);


-- Questions_Campaign [rel12]
alter table `questions`  add column  `q_campaignid`  integer;
alter table `questions`   add index fk_questions_campaign (`q_campaignid`), add constraint fk_questions_campaign foreign key (`q_campaignid`) references `campaign` (`campaignid`);


-- ReceivedContribution_Campaign [rel6]
alter table `receivedcontribution`  add column  `campaign_campaignid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_campai (`campaign_campaignid`), add constraint fk_receivedcontribution_campai foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


-- User_ReceivedContribution [rel9]
alter table `receivedcontribution`  add column  `rec_userid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_user (`rec_userid`), add constraint fk_receivedcontribution_user foreign key (`rec_userid`) references `user` (`userid`);


