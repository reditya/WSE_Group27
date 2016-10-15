-- ReceivedContribution.maxBackingLimit [ent11#att19]
create view `receivedcontribution_maxbackin` as
select AL1.`contributionid` as `contributionid`, AL1.`campaignid` as `campaignid`, AL1.`userid` as `userid`, sum(AL2.`campaigngoal`) * 1.5 - AL3.`der_attr` as `der_attr`
from  `receivedcontribution` AL1 
               left outer join `campaign` AL2 on AL1.`campaignid`=AL2.`campaignid`
               left outer join `campaign_totalcampaigncontribu` AL3 on AL1.`campaignid`=AL3.`campaignid`
group by AL1.`contributionid`, AL1.`campaignid`, AL1.`userid`, AL3.`der_attr`;


