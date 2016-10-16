-- User.Reputation Score [User#att26]
create view `user_reputation_score_view` as
select AL1.`userid` as `userid`, avg(AL3.`vote_value`) as `der_attr`
from  `user` AL1 
               left outer join `campaign` AL2 on AL1.`userid`=AL2.`user_userid`
               left outer join `vote` AL3 on AL2.`campaignid`=AL3.`vote_campaignid`
group by AL1.`userid`;


-- User.Wisdom Score [User#att34]
create view `user_wisdom_score_view` as
select AL1.`userid` as `userid`, avg(AL3.`der_attr`) as `der_attr`
from  `user` AL1 
               left outer join `receivedcontribution` AL2 on AL1.`userid`=AL2.`userid`
               left outer join `campaign_quality_view` AL3 on AL2.`campaignid`=AL3.`campaignid`
group by AL1.`userid`;


