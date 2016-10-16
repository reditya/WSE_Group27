-- REL FK: UserToMessage [rel1#role1]
alter table `message`   add index fk_message_user (`message_userid`), add constraint fk_message_user foreign key (`message_userid`) references `user` (`userid`);


-- REL FK: CampaignToMessage [rel2#role4]
alter table `message`   add index fk_message_campaign (`message_campaignid`), add constraint fk_message_campaign foreign key (`message_campaignid`) references `campaign` (`campaignid`);


