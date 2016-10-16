-- Vote [ent10]
create table `vote` (
   `vote_userid`  integer  not null,
   `vote_campaignid`  integer  not null,
  primary key (`vote_userid`, `vote_campaignid`)
);


-- User_Vote [rel13]
alter table `vote`  add column  `user_userid`  integer;
alter table `vote`   add index fk_vote_user (`user_userid`), add constraint fk_vote_user foreign key (`user_userid`) references `user` (`userid`);


-- Vote_Campaign [rel14]
alter table `vote`  add column  `vote_campaignid`  integer;
alter table `vote`   add index fk_vote_campaign (`vote_campaignid`), add constraint fk_vote_campaign foreign key (`vote_campaignid`) references `campaign` (`campaignid`);


-- Vote_VoteRange [rel17]
alter table `vote`  add column  `oid`  integer;
alter table `vote`   add index fk_vote_voterange (`oid`), add constraint fk_vote_voterange foreign key (`oid`) references `voterange` (`oid`);


