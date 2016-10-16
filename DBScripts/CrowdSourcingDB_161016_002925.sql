-- REL FK: CampaignToReceivedContribution [rel6#role12]
alter table `receivedcontribution`   add index fk_receivedcontribution_campai (`campaignid`), add constraint fk_receivedcontribution_campai foreign key (`campaignid`) references `campaign` (`campaignid`);


-- REL FK: UserToReceivedContribution [rel9#role17]
alter table `receivedcontribution`   add index fk_receivedcontribution_user (`userid`), add constraint fk_receivedcontribution_user foreign key (`userid`) references `user` (`userid`);


-- ContributionProfile.totalContribution [ent4#att3]
drop view `contributionprofile_totalcontr`;
create view `contributionprofile_totalcontr` as
select AL1.`contributionid` as `contributionid`, sum(AL2.`amount`) as `der_attr`
from  `contributionprofile` AL1 
               left outer join `receivedcontribution` AL2 on AL1.`contributionid`=AL2.`contributionid`
group by AL1.`contributionid`;


-- Campaign.totalCampaignContribution [ent3#att5]
drop view `campaign_totalcampaigncontribu`;
create view `campaign_totalcampaigncontribu` as
select AL1.`campaignid` as `campaignid`, sum(AL3.`der_attr`) as `der_attr`
from  `campaign` AL1 
               left outer join `contributionprofile` AL2 on AL1.`campaignid`=AL2.`campaign_campaignid`
               left outer join `contributionprofile_totalcontr` AL3 on AL2.`contributionid`=AL3.`contributionid`
group by AL1.`campaignid`;


