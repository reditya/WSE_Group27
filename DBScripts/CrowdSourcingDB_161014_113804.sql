-- Advertisement [ent5]
create table `advertisement` (
   `advertisement_id`  integer  not null,
   `description`  varchar(255),
  primary key (`advertisement_id`)
);


-- Advertisement_Campaign [rel5]
alter table `advertisement`  add column  `campaign_campaignid`  integer;
alter table `advertisement`   add index fk_advertisement_campaign (`campaign_campaignid`), add constraint fk_advertisement_campaign foreign key (`campaign_campaignid`) references `campaign` (`campaignid`);


