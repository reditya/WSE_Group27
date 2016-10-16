-- ContributionProfile_ReceivedContribution [rel10]
alter table `receivedcontribution`   drop foreign key `fk_receivedcontribution_contri`;
alter table `receivedcontribution`  drop column  `contributionid`;
-- ReceivedContribution [ent11]
drop table `receivedcontribution`;
