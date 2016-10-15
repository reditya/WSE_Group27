-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `userid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
   `dateofbirth`  date,
   `fullname`  varchar(255),
  primary key (`userid`)
);


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
   `vote_userid`  integer  not null,
   `vote_campaignid`  integer  not null,
  primary key (`vote_userid`, `vote_campaignid`)
);


-- ReceivedContribution [ent11]
create table `receivedcontribution` (
   `amount`  double precision,
   `campaignid`  integer  not null,
   `contributionid`  integer  not null,
   `userid`  integer  not null,
  primary key (`campaignid`, `contributionid`, `userid`)
);


-- PaymentMethods [ent2]
create table `paymentmethods` (
   `methodid`  integer  not null,
   `methodname`  varchar(255),
  primary key (`methodid`)
);


-- Campaign [ent3]
create table `campaign` (
   `campaignid`  integer  not null,
   `campaignexpirationdate`  date,
   `campaigngoal`  double precision,
   `campaigndescription`  varchar(255),
   `campaigntitle`  varchar(255),
  primary key (`campaignid`)
);


-- ContributionProfile [ent4]
create table `contributionprofile` (
   `contributionid`  integer  not null,
   `minimumamount`  double precision,
   `contributiondescription`  varchar(255),
   `contributiontitle`  varchar(255),
  primary key (`contributionid`)
);


-- Advertisement [ent5]
create table `advertisement` (
   `advertisement_id`  integer  not null,
   `description`  varchar(255),
  primary key (`advertisement_id`)
);


-- Tags [ent6]
create table `tags` (
   `tagid`  integer  not null,
   `keywords`  varchar(255),
  primary key (`tagid`)
);


-- Questions [ent9]
create table `questions` (
   `questionid`  integer  not null,
   `answerstring`  varchar(255),
   `questionstring`  varchar(255),
   `isprivate`  bit,
  primary key (`questionid`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_userid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_userid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_userid`), add constraint fk_user_group_user foreign key (`user_userid`) references `user` (`userid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Message [rel1]
alter table `message`  add column  `message_userid`  integer;
alter table `message`   add index fk_message_user (`message_userid`), add constraint fk_message_user foreign key (`message_userid`) references `user` (`userid`);


-- ContributionProfile_ReceivedContribution [rel10]
alter table `receivedcontribution`  add column  `contributionid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_contri (`contributionid`), add constraint fk_receivedcontribution_contri foreign key (`contributionid`) references `contributionprofile` (`contributionid`);


-- User_Questions [rel11]
alter table `questions`  add column  `q_userid`  integer;
alter table `questions`   add index fk_questions_user (`q_userid`), add constraint fk_questions_user foreign key (`q_userid`) references `user` (`userid`);


-- Questions_Campaign [rel12]
alter table `questions`  add column  `q_campaignid`  integer;
alter table `questions`   add index fk_questions_campaign (`q_campaignid`), add constraint fk_questions_campaign foreign key (`q_campaignid`) references `campaign` (`campaignid`);


-- User_Vote [rel13]
alter table `vote`  add column  `vote_userid`  integer;
alter table `vote`   add index fk_vote_user (`vote_userid`), add constraint fk_vote_user foreign key (`vote_userid`) references `user` (`userid`);


-- Vote_Campaign [rel14]
alter table `vote`  add column  `vote_campaignid`  integer;
alter table `vote`   add index fk_vote_campaign (`vote_campaignid`), add constraint fk_vote_campaign foreign key (`vote_campaignid`) references `campaign` (`campaignid`);


-- User_Tags [rel15]
create table `user_tags` (
   `user_userid`  integer not null,
   `tags_tagid`  integer not null,
  primary key (`user_userid`, `tags_tagid`)
);
alter table `user_tags`   add index fk_user_tags_user (`user_userid`), add constraint fk_user_tags_user foreign key (`user_userid`) references `user` (`userid`);
alter table `user_tags`   add index fk_user_tags_tags (`tags_tagid`), add constraint fk_user_tags_tags foreign key (`tags_tagid`) references `tags` (`tagid`);


-- Message_Campaign [rel2]
alter table `message`  add column  `message_campaignid`  integer;
alter table `message`   add index fk_message_campaign (`message_campaignid`), add constraint fk_message_campaign foreign key (`message_campaignid`) references `campaign` (`campaignid`);


-- User_Campaign [rel3]
alter table `campaign`  add column  `user_userid`  integer;
alter table `campaign`   add index fk_campaign_user (`user_userid`), add constraint fk_campaign_user foreign key (`user_userid`) references `user` (`userid`);


-- User_PaymentMethods [rel4]
create table `user_paymentmethods` (
   `user_userid`  integer not null,
   `paymentmethods_methodid`  integer not null,
  primary key (`user_userid`, `paymentmethods_methodid`)
);
alter table `user_paymentmethods`   add index fk_user_paymentmethods_user (`user_userid`), add constraint fk_user_paymentmethods_user foreign key (`user_userid`) references `user` (`userid`);
alter table `user_paymentmethods`   add index fk_user_paymentmethods_payment (`paymentmethods_methodid`), add constraint fk_user_paymentmethods_payment foreign key (`paymentmethods_methodid`) references `paymentmethods` (`methodid`);


-- Advertisement_Campaign [rel5]
alter table `advertisement`  add column  `campaign_campaignid`  integer;
alter table `advertisement`   add index fk_advertisement_campaign (`campaign_campaignid`), add constraint fk_advertisement_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


-- ReceivedContribution_Campaign [rel6]
alter table `receivedcontribution`  add column  `campaignid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_campai (`campaignid`), add constraint fk_receivedcontribution_campai foreign key (`campaignid`) references `campaign` (`campaignid`);


-- Campaign_ContributionProfile [rel7]
alter table `contributionprofile`  add column  `campaign_campaignid`  integer;
alter table `contributionprofile`   add index fk_contributionprofile_campaig (`campaign_campaignid`), add constraint fk_contributionprofile_campaig foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


-- Tags_Campaign [rel8]
create table `tags_campaign` (
   `tags_tagid`  integer not null,
   `campaign_campaignid`  integer not null,
  primary key (`tags_tagid`, `campaign_campaignid`)
);
alter table `tags_campaign`   add index fk_tags_campaign_tags (`tags_tagid`), add constraint fk_tags_campaign_tags foreign key (`tags_tagid`) references `tags` (`tagid`);
alter table `tags_campaign`   add index fk_tags_campaign_campaign (`campaign_campaignid`), add constraint fk_tags_campaign_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


-- User_ReceivedContribution [rel9]
alter table `receivedcontribution`  add column  `userid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_user (`userid`), add constraint fk_receivedcontribution_user foreign key (`userid`) references `user` (`userid`);


