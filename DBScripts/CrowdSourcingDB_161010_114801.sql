-- User_PaymentMethods [rel4]
create table `user_paymentmethods` (
   `user_userid`  integer not null,
   `paymentmethods_methodid`  integer not null,
  primary key (`user_userid`, `paymentmethods_methodid`)
);
alter table `user_paymentmethods`   add index fk_user_paymentmethods_user (`user_userid`), add constraint fk_user_paymentmethods_user foreign key (`user_userid`) references `user` (`userid`);
alter table `user_paymentmethods`   add index fk_user_paymentmethods_payment (`paymentmethods_methodid`), add constraint fk_user_paymentmethods_payment foreign key (`paymentmethods_methodid`) references `paymentmethods` (`methodid`);


