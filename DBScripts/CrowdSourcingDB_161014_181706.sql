-- PaymentMethods_ReceivedContribution [rel16]
alter table `receivedcontribution`  add column  `paymentmethods_methodid`  integer;
alter table `receivedcontribution`   add index fk_receivedcontribution_paymen (`paymentmethods_methodid`), add constraint fk_receivedcontribution_paymen foreign key (`paymentmethods_methodid`) references `paymentmethods` (`methodid`);


