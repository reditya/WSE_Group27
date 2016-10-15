-- Vote_VoteRange [rel17]
alter table `vote`  add column  `oid`  integer;
alter table `vote`   add index fk_vote_voterange_2 (`oid`), add constraint fk_vote_voterange_2 foreign key (`oid`) references `voterange` (`oid`);


