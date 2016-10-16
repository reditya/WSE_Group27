-- VoteRange [ent7]
create table `voterange` (
   `oid`  integer  not null,
   `value`  integer,
  primary key (`oid`)
);


-- Vote_VoteRange [rel17]
alter table `vote`  add column  `oid`  integer;
alter table `vote`   add index fk_vote_voterange (`oid`), add constraint fk_vote_voterange foreign key (`oid`) references `voterange` (`oid`);


