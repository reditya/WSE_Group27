-- REL FK: ContributionProfileToReceivedContribution [rel10#role19]
alter table `receivedcontribution`   add index fk_receivedcontribution_contri (`contributionid`), add constraint fk_receivedcontribution_contri foreign key (`contributionid`) references `contributionprofile` (`contributionid`);


-- REL FK: ReceivedContributionToContributionProfile [rel10#role20]
alter table `receivedcontribution`   add index fk_contributionprofile_receive (`campaignid`), add constraint fk_contributionprofile_receive foreign key (`campaignid`) references `receivedcontribution` (`campaignid`);


-- REL FK: ReceivedContributionToCampaign [rel6#role11]
alter table `receivedcontribution`   add index fk_campaign_receivedcontributi (`campaignid`), add constraint fk_campaign_receivedcontributi foreign key (`campaignid`) references `receivedcontribution` (`campaignid`);


-- REL FK: CampaignToReceivedContribution [rel6#role12]
alter table `receivedcontribution`   add index fk_receivedcontribution_campai (`campaignid`), add constraint fk_receivedcontribution_campai foreign key (`campaignid`) references `campaign` (`campaignid`);


-- REL FK: UserToReceivedContribution [rel9#role17]
alter table `receivedcontribution`   add index fk_receivedcontribution_user (`userid`), add constraint fk_receivedcontribution_user foreign key (`userid`) references `user` (`userid`);


-- REL FK: ReceivedContributionToUser [rel9#role18]
alter table `receivedcontribution`   add index fk_user_receivedcontribution (`campaignid`), add constraint fk_user_receivedcontribution foreign key (`campaignid`) references `receivedcontribution` (`campaignid`);


