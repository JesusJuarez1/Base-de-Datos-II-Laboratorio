insert into Channels values(cha_id.nextval, 'chanel '||cha_id.currval);
insert into Channels values(cha_id.nextval, 'chanel '||cha_id.currval);
insert into Channels values(cha_id.nextval, 'chanel '||cha_id.currval);
insert into Channels values(cha_id.nextval, 'chanel '||cha_id.currval);
insert into Channels values(cha_id.nextval, 'chanel '||cha_id.currval);

insert into Employees values(emp_id.nextval, 'Juan', 'Fernandez', null, 'address '||emp_id.currval, sysdate, 'Man', 'Fernando');
insert into Employees values(emp_id.nextval, 'Lucia', 'martinez', 1, 'address '||emp_id.currval, sysdate, 'Man', 'Fernando');
insert into Employees values(emp_id.nextval, 'Pedro', 'Beltran', 1, 'address '||emp_id.currval, sysdate, 'Man', 'Fernando');
insert into Employees values(emp_id.nextval, 'Maria', 'Juarez', 1, 'address '||emp_id.currval, sysdate, 'Man', 'Fernando');
insert into Employees values(emp_id.nextval, 'Vanessa', 'Flores', 1, 'address '||emp_id.currval, sysdate, 'Man', 'Fernando');

insert into Products values(pro_id.nextval, 'Product '||pro_id.currval, 54.21,50.50, 'Provider '||pro_id.currval);
insert into Products values(pro_id.nextval, 'Product '||pro_id.currval, 25.25,22.50, 'Provider '||pro_id.currval);
insert into Products values(pro_id.nextval, 'Product '||pro_id.currval, 12.21,10.50, 'Provider '||pro_id.currval);
insert into Products values(pro_id.nextval, 'Product '||pro_id.currval, 12.21,12.00, 'Provider '||pro_id.currval);
insert into Products values(pro_id.nextval, 'Product '||pro_id.currval, 99.99,90.50, 'Provider '||pro_id.currval);

insert into Shops values(sho_id.nextval, 'Shop address '||sho_id.currval, 1);
insert into Shops values(sho_id.nextval, 'Shop address '||sho_id.currval, 2);
insert into Shops values(sho_id.nextval, 'Shop address '||sho_id.currval, 3);
insert into Shops values(sho_id.nextval, 'Shop address '||sho_id.currval, 4);
insert into Shops values(sho_id.nextval, 'Shop address '||sho_id.currval, 5);

insert into Sales values(sal_id.nextval, 1, 1, 1, 300, 1, sysdate);
insert into Sales values(sal_id.nextval, 2, 2, 2, 109, 2, sysdate);
insert into Sales values(sal_id.nextval, 3, 3, 3, 123, 3, sysdate);
insert into Sales values(sal_id.nextval, 4, 4, 4, 421, 4, sysdate);
insert into Sales values(sal_id.nextval, 5, 5, 5, 542, 5, sysdate);

commit;