-- Campaign.Quality [ent3#att25]
create view `campaign_quality_view` as
select AL1.`campaignid` as `campaignid`, sum(AL2.`vote_value`) as `der_attr`
from  `campaign` AL1 
               left outer join `vote` AL2 on AL1.`campaignid`=AL2.`vote_campaignid`
group by AL1.`campaignid`;


