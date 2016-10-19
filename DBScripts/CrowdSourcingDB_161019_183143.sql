-- ReceivedContribution.minimumContribution [ent11#att36]
create view `receivedcontribution_minimumco` as
select AL1.`campaignid` as `campaignid`, AL1.`userid` as `userid`, AL2.`minimumamount` as `der_attr`
from  `receivedcontribution` AL1 
               left outer join `contributionprofile` AL2 on AL1.`contributionid`=AL2.`contributionid`;


