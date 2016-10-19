-- User.Reputation Score [User#att26]
drop view `user_reputation_score_view`;
create view `user_reputation_score_view` as
select AL1.`userid` as `userid`, avg(AL3.`der_attr`) as `der_attr`
from  `user` AL1 
               left outer join `campaign` AL2 on AL1.`userid`=AL2.`user_userid`
               left outer join `campaign_quality_view` AL3 on AL2.`campaignid`=AL3.`campaignid`
group by AL1.`userid`;


