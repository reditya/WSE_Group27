-- Campaign.maxIndividualBacking [ent3#att36]
drop view `campaign_maxindividualbacking`;
create view `campaign_maxindividualbacking` as
select AL1.`campaignid` as `campaignid`, max(AL1.`campaigngoal`) * 1.5 - sum(AL3.`der_attr`) as `der_attr`
from  `campaign` AL1 
               left outer join `contributionprofile` AL2 on AL1.`campaignid`=AL2.`campaign_campaignid`
               left outer join `contributionprofile_totalcontr` AL3 on AL2.`contributionid`=AL3.`contributionid`
group by AL1.`campaignid`;


