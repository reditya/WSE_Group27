-- REL FK: ReceivedContributionToContributionProfile [rel10#role20]
alter table `receivedcontribution`   add index fk_contributionprofile_receive (`campaignid`, `userid`), add constraint fk_contributionprofile_receive foreign key (`campaignid`, `userid`) references `receivedcontribution` (`campaignid`, `userid`);


-- REL FK: ReceivedContributionToPaymentMethods [rel16#role32]
alter table `receivedcontribution`   add index fk_paymentmethods_receivedcont (`campaignid`, `userid`), add constraint fk_paymentmethods_receivedcont foreign key (`campaignid`, `userid`) references `receivedcontribution` (`campaignid`, `userid`);


-- REL FK: ReceivedContributionToCampaign [rel6#role11]
alter table `receivedcontribution`   add index fk_campaign_receivedcontributi (`campaignid`, `userid`), add constraint fk_campaign_receivedcontributi foreign key (`campaignid`, `userid`) references `receivedcontribution` (`campaignid`, `userid`);


-- REL FK: ReceivedContributionToUser [rel9#role18]
alter table `receivedcontribution`   add index fk_user_receivedcontribution (`campaignid`, `userid`), add constraint fk_user_receivedcontribution foreign key (`campaignid`, `userid`) references `receivedcontribution` (`campaignid`, `userid`);


