-- Vote [ent10]
create table `vote` (
   `vote_userid`  integer  not null,
   `vote_campaignid`  integer  not null,
  primary key (`vote_userid`, `vote_campaignid`)
);


