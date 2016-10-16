-- REL FK: VoteToUser [rel13#role26]
alter table `vote`   add index fk_user_vote (`campaign_campaignid`, `user_userid`), add constraint fk_user_vote foreign key (`campaign_campaignid`, `user_userid`) references `vote` (`campaign_campaignid`, `user_userid`);


-- REL FK: VoteToCampaign [rel14#role27]
alter table `vote`   add index fk_campaign_vote (`campaign_campaignid`, `user_userid`), add constraint fk_campaign_vote foreign key (`campaign_campaignid`, `user_userid`) references `vote` (`campaign_campaignid`, `user_userid`);


