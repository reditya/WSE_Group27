-- User.Reputation Score [User#att26]
drop view `user_reputation_score_view`;
create view `user_reputation_score_view` as
select AL1.`userid` as `userid`, avg(AL4.`v_value`) as `der_attr`
from  `user` AL1 
               left outer join `campaign` AL2 on AL1.`userid`=AL2.`user_userid`
               left outer join `vote` AL3 on AL2.`campaignid`=AL3.`vote_campaignid`
               left outer join `votevalue` AL4 on AL3.`votevalue_v_id`=AL4.`v_id`
group by AL1.`userid`;


-- Campaign.Quality [ent3#att25]
drop view `campaign_quality_view`;
create view `campaign_quality_view` as
select AL1.`campaignid` as `campaignid`, avg(AL3.`v_value`) as `der_attr`
from  `campaign` AL1 
               left outer join `vote` AL2 on AL1.`campaignid`=AL2.`vote_campaignid`
               left outer join `votevalue` AL3 on AL2.`votevalue_v_id`=AL3.`v_id`
group by AL1.`campaignid`;


