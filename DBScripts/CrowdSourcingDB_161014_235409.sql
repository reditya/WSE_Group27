-- VoteRange [ent7]
create table `voterange` (
   `oid`  integer  not null,
   `value`  integer,
  primary key (`oid`)
);


-- Vote_VoteRange [rel17]
alter table `voterange`  add column  `vote_vote_userid`  integer;
alter table `voterange`  add column  `vote_vote_campaignid`  integer;
alter table `voterange`   add index fk_voterange_vote (`vote_vote_userid`, `vote_vote_campaignid`), add constraint fk_voterange_vote foreign key (`vote_vote_userid`, `vote_vote_campaignid`) references `vote` (`vote_userid`, `vote_campaignid`);


