-- Vote [ent10]
create table `vote` (
   `votevalue`  integer
);


-- User_Vote [rel13]
alter table `vote`  add column  `user_userid`  integer;
alter table `vote`   add index fk_vote_user (`user_userid`), add constraint fk_vote_user foreign key (`user_userid`) references `user` (`userid`);


-- Vote_Campaign [rel14]
alter table `vote`  add column  `campaign_campaignid`  integer;
alter table `vote`   add index fk_vote_campaign (`campaign_campaignid`), add constraint fk_vote_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


