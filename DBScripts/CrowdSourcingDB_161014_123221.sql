-- ReceivedContribution [ent11]
alter table `receivedcontribution`  add column  `rec_contributionid`  integer  not null;
alter table `receivedcontribution`  add column  `rec_userid`  integer  not null;


-- Questions [ent9]
alter table `questions`  add column  `q_campaignid`  integer  not null;
alter table `questions`  add column  `q_userid`  integer  not null;
alter table `questions`  add column  `isprivate_2`  bit;


