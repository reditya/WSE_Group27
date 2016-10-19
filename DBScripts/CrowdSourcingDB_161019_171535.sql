-- VoteValue [ent7]
create table `votevalue` (
   `v_id`  integer  not null,
   `v_value`  varchar(255),
  primary key (`v_id`)
);


-- Vote_VoteValue [rel16]
alter table `vote`  add column  `votevalue_v_id`  integer;
alter table `vote`   add index fk_vote_votevalue (`votevalue_v_id`), add constraint fk_vote_votevalue foreign key (`votevalue_v_id`) references `votevalue` (`v_id`);


