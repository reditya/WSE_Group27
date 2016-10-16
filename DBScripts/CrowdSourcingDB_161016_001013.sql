-- ReceivedContribution [ent11]
create table `receivedcontribution` (
   `amount`  double precision,
   `rc_campaignid`  integer  not null,
   `rc_userid`  integer  not null,
  primary key (`rc_campaignid`, `rc_userid`)
);


-- ContributionProfile_ReceivedContribution [rel10]
alter table `receivedcontribution`  add column  `contributionid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_contri (`contributionid`), add constraint fk_receivedcontribution_contri foreign key (`contributionid`) references `contributionprofile` (`contributionid`);


-- PaymentMethods_ReceivedContribution [rel16]
alter table `receivedcontribution`  add column  `paymentmethods_methodid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_paymen (`paymentmethods_methodid`), add constraint fk_receivedcontribution_paymen foreign key (`paymentmethods_methodid`) references `paymentmethods` (`methodid`);


-- ReceivedContribution_Campaign [rel6]
alter table `receivedcontribution`  add column  `campaignid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_campai (`campaignid`), add constraint fk_receivedcontribution_campai foreign key (`campaignid`) references `campaign` (`campaignid`);


-- User_ReceivedContribution [rel9]
alter table `receivedcontribution`  add column  `userid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_user (`userid`), add constraint fk_receivedcontribution_user foreign key (`userid`) references `user` (`userid`);


-- ContributionProfile.totalContribution [ent4#att3]
drop view `contributionprofile_totalcontr`;
create view `contributionprofile_totalcontr` as
select AL1.`contributionid` as `contributionid`, sum(AL3.`amount`) as `der_attr`
from  `contributionprofile` AL1 
               left outer join `receivedcontribution` AL2 on AL1.`contributionid`=AL2.`contributionid`
               left outer join `receivedcontribution` AL3 on AL2.`campaignid`=AL3.`rc_campaignid` and AL2.`userid`=AL3.`rc_userid`
group by AL1.`contributionid`;


-- Campaign.totalCampaignContribution [ent3#att5]
drop view `campaign_totalcampaigncontribu`;
create view `campaign_totalcampaigncontribu` as
select AL1.`campaignid` as `campaignid`, sum(AL3.`der_attr`) as `der_attr`
from  `campaign` AL1 
               left outer join `contributionprofile` AL2 on AL1.`campaignid`=AL2.`campaign_campaignid`
               left outer join `contributionprofile_totalcontr` AL3 on AL2.`contributionid`=AL3.`contributionid`
group by AL1.`campaignid`;


