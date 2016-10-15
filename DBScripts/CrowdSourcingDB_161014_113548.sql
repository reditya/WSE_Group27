-- Advertisement [ent5]
create table `advertisement` (
   `advertisement_id`  integer  not null,
   `description`  varchar(255),
  primary key (`advertisement_id`)
);


-- Advertisement_Campaign [rel5]
alter table `advertisement`  add column  `campaign_campaignid`  integer;
alter table `advertisement`   add index fk_advertisement_campaign (`campaign_campaignid`), add constraint fk_advertisement_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


-- REL FK: ReceivedContributionToContributionProfile [rel10#role20]
alter table `receivedcontribution`   add index fk_contributionprofile_receive (`campaignid`), add constraint fk_contributionprofile_receive foreign key (`campaignid`) references `receivedcontribution` (`campaignid`);


-- REL FK: ReceivedContributionToUser [rel9#role18]
alter table `receivedcontribution`   add index fk_user_receivedcontribution (`campaignid`), add constraint fk_user_receivedcontribution foreign key (`campaignid`) references `receivedcontribution` (`campaignid`);


