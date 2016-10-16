-- VoteRange [ent8]
create table `voterange_2` (
   `oid`  integer  not null,
   `value`  varchar(255),
  primary key (`oid`)
);


-- VoteRange_Vote [rel18]
alter table `vote`  add column  `voterange_2_oid`  integer;
alter table `vote`   add index fk_vote_voterange_2 (`voterange_2_oid`), add constraint fk_vote_voterange_2 foreign key (`voterange_2_oid`) references `voterange_2` (`oid`);


