-- ReceivedContribution [ent11]
create table `receivedcontribution` (
   `amount`  double precision,
   `campaignid`  integer  not null,
   `contributionid`  integer  not null,
   `userid`  integer  not null,
  primary key (`campaignid`, `contributionid`, `userid`)
);


-- ContributionProfile_ReceivedContribution [rel10]
alter table `receivedcontribution`  add column  `rec_contributionid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_contri (`rec_contributionid`), add constraint fk_receivedcontribution_contri foreign key (`rec_contributionid`) references `contributionprofile` (`contributionid`);


-- ReceivedContribution_Campaign [rel6]
alter table `receivedcontribution`  add column  `rec_campaignid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_campai (`rec_campaignid`), add constraint fk_receivedcontribution_campai foreign key (`rec_campaignid`) references `campaign` (`campaignid`);


-- User_ReceivedContribution [rel9]
alter table `receivedcontribution`  add column  `rec_userid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_user (`rec_userid`), add constraint fk_receivedcontribution_user foreign key (`rec_userid`) references `user` (`userid`);


