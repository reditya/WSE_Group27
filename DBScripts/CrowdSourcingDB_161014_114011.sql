-- ReceivedContribution [ent11]
create table `receivedcontribution` (
   `amount`  double precision,
   `campaignid`  integer  not null,
  primary key (`campaignid`)
);


-- ContributionProfile_ReceivedContribution [rel10]
alter table `receivedcontribution`  add column  `contributionprofile_contributi`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_contri (`contributionprofile_contributi`), add constraint fk_receivedcontribution_contri foreign key (`contributionprofile_contributi`) references `contributionprofile` (`contributionid`);


-- User_ReceivedContribution [rel9]
alter table `receivedcontribution`  add column  `user_userid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_user (`user_userid`), add constraint fk_receivedcontribution_user foreign key (`user_userid`) references `user` (`userid`);


