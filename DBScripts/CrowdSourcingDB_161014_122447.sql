-- REL FK: UserToVote [rel13#role25]
alter table `vote`   add index fk_vote_user (`vote_userid`), add constraint fk_vote_user foreign key (`vote_userid`) references `user` (`userid`);


-- REL FK: CampaignToVote [rel14#role28]
alter table `vote`   add index fk_vote_campaign (`vote_campaignid`), add constraint fk_vote_campaign foreign key (`vote_campaignid`) references `campaign` (`campaignid`);


