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


-- PaymentInfo [ent1]
create table `paymentinfo` (
   `paymentinfoid`  integer  not null,
   `accountnumber`  varchar(255),
  primary key (`paymentinfoid`)
);


-- Vote [ent10]
create table `vote` (
   `supporterid`  integer  not null,
   `isupvote`  bit,
   `campaignid`  integer  not null,
  primary key (`supporterid`, `campaignid`)
);


-- ReceivedContribution [ent11]
create table `receivedcontribution` (
   `contributionid`  integer  not null,
   `amount`  double precision,
   `campaignid`  integer  not null,
   `supporterid`  integer  not null,
  primary key (`contributionid`, `campaignid`, `supporterid`)
);


-- UserPreference [ent13]
create table `userpreference` (
   `tagid`  integer  not null,
   `userid`  integer  not null,
  primary key (`tagid`, `userid`)
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
   `maxbackinglimit`  double precision,
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
   `campaignid`  integer,
  primary key (`contributionid`)
);


-- Tags [ent6]
create table `tags` (
   `tagid`  integer  not null,
   `keywords`  varchar(255),
  primary key (`tagid`)
);


-- ProposedCampaign [ent8]
create table `proposedcampaign` (
   `campaignid`  integer  not null,
   `campaignerid`  integer  not null,
  primary key (`campaignid`, `campaignerid`)
);


-- Questions [ent9]
create table `questions` (
   `questionid`  integer  not null,
   `campaignid`  integer,
   `campaignerid`  integer,
   `supporterid`  integer,
   `isprivate`  bit,
   `answerstring`  varchar(255),
   `questionstring`  varchar(255),
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


-- PaymentInfo_PaymentMethods [rel1]
alter table `paymentinfo`  add column  `paymentmethods_methodid`  integer;
alter table `paymentinfo`   add index fk_paymentinfo_paymentmethods (`paymentmethods_methodid`), add constraint fk_paymentinfo_paymentmethods foreign key (`paymentmethods_methodid`) references `paymentmethods` (`methodid`);


-- ContributionProfile_ReceivedContribution [rel10]
alter table `receivedcontribution`  add column  `contributionprofile_contributi`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_contri (`contributionprofile_contributi`), add constraint fk_receivedcontribution_contri foreign key (`contributionprofile_contributi`) references `contributionprofile` (`contributionid`);


-- User_Questions [rel11]
alter table `questions`  add column  `user_userid`  integer;
alter table `questions`   add index fk_questions_user (`user_userid`), add constraint fk_questions_user foreign key (`user_userid`) references `user` (`userid`);


-- Questions_Campaign [rel12]
alter table `questions`  add column  `campaign_campaignid`  integer;
alter table `questions`   add index fk_questions_campaign (`campaign_campaignid`), add constraint fk_questions_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


-- User_Vote [rel13]
alter table `vote`  add column  `user_userid`  integer;
alter table `vote`   add index fk_vote_user (`user_userid`), add constraint fk_vote_user foreign key (`user_userid`) references `user` (`userid`);


-- Vote_Campaign [rel14]
alter table `vote`  add column  `campaign_campaignid`  integer;
alter table `vote`   add index fk_vote_campaign (`campaign_campaignid`), add constraint fk_vote_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


-- User_PaymentInfo [rel2]
alter table `paymentinfo`  add column  `user_userid`  integer;
alter table `paymentinfo`   add index fk_paymentinfo_user (`user_userid`), add constraint fk_paymentinfo_user foreign key (`user_userid`) references `user` (`userid`);


-- UserPreference_Tags [rel3]
alter table `userpreference`  add column  `tags_tagid`  integer;
alter table `userpreference`   add index fk_userpreference_tags (`tags_tagid`), add constraint fk_userpreference_tags foreign key (`tags_tagid`) references `tags` (`tagid`);


-- User_UserPreference [rel4]
alter table `userpreference`  add column  `user_userid`  integer;
alter table `userpreference`   add index fk_userpreference_user (`user_userid`), add constraint fk_userpreference_user foreign key (`user_userid`) references `user` (`userid`);


-- User_ProposedCampaign [rel5]
alter table `proposedcampaign`  add column  `user_userid`  integer;
alter table `proposedcampaign`   add index fk_proposedcampaign_user (`user_userid`), add constraint fk_proposedcampaign_user foreign key (`user_userid`) references `user` (`userid`);


-- ProposedCampaign_Campaign [rel6]
alter table `proposedcampaign`  add column  `campaign_campaignid`  integer;
alter table `proposedcampaign`   add index fk_proposedcampaign_campaign (`campaign_campaignid`), add constraint fk_proposedcampaign_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


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
alter table `receivedcontribution`  add column  `user_userid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_user (`user_userid`), add constraint fk_receivedcontribution_user foreign key (`user_userid`) references `user` (`userid`);


