-- REL FK: ContributionProfileToReceivedContribution [rel10#role19]
alter table `receivedcontribution`   add index fk_receivedcontribution_contri (`rec_contributionid`), add constraint fk_receivedcontribution_contri foreign key (`rec_contributionid`) references `contributionprofile` (`contributionid`);


-- REL FK: ReceivedContributionToContributionProfile [rel10#role20]
alter table `receivedcontribution`   add index fk_contributionprofile_receive (`rec_campaignid`), add constraint fk_contributionprofile_receive foreign key (`rec_campaignid`) references `receivedcontribution` (`rec_campaignid`);


-- REL FK: UserToQuestions [rel11#role21]
alter table `questions`   add index fk_questions_user (`q_userid`), add constraint fk_questions_user foreign key (`q_userid`) references `user` (`userid`);


-- REL FK: QuestionsToUser [rel11#role22]
alter table `questions`   add index fk_user_questions (`questionid`), add constraint fk_user_questions foreign key (`questionid`) references `questions` (`questionid`);


-- REL FK: QuestionsToCampaign [rel12#role23]
alter table `questions`   add index fk_campaign_questions (`questionid`), add constraint fk_campaign_questions foreign key (`questionid`) references `questions` (`questionid`);


-- REL FK: CampaignToQuestions [rel12#role24]
alter table `questions`   add index fk_questions_campaign (`q_campaignid`), add constraint fk_questions_campaign foreign key (`q_campaignid`) references `campaign` (`campaignid`);


-- REL FK: UserToReceivedContribution [rel9#role17]
alter table `receivedcontribution`   add index fk_receivedcontribution_user (`rec_userid`), add constraint fk_receivedcontribution_user foreign key (`rec_userid`) references `user` (`userid`);


-- REL FK: ReceivedContributionToUser [rel9#role18]
alter table `receivedcontribution`   add index fk_user_receivedcontribution (`rec_campaignid`), add constraint fk_user_receivedcontribution foreign key (`rec_campaignid`) references `receivedcontribution` (`rec_campaignid`);


