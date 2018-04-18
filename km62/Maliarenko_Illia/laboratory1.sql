/*---------------------------------------------------------------------------
1.Створити схему даних з назвою – прізвище студента, у якій користувач може: 
робити вибірки з таблиць
4 бали

---------------------------------------------------------------------------*/
--Код відповідь:
create user ASIMER
identified by 123456
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";
ALTER USER ASIMER QUOTA 100M ON USERS;
GRANT "CONNECT" TO ASIMER;
grant select any table to ASIMER;








/*---------------------------------------------------------------------------
2. Створити таблиці, у яких визначити поля та типи. Головні та зовнішні ключі 
створювати окремо від таблиць використовуючи команди ALTER TABLE. 
Комп’ютер складається з апаратного (деталі: процесор, блок живлення) та програмного забезпечення.
4 бали

---------------------------------------------------------------------------*/
--Код відповідь:
create table table1(
processor varchar2(20),
"power" varchar2(20),
programs varchar2(20)
);
alter table table1
add constraints table1_pk primary key(processor);

















  
/* --------------------------------------------------------------------------- 
3. Надати додаткові права користувачеві (створеному у пункті № 1) для створення таблиць, 
внесення даних у таблиці та виконання вибірок використовуючи команду ALTER/GRANT. 
Згенерувати базу даних використовуючи код з теки OracleScript та виконати запити: 

---------------------------------------------------------------------------*/
--Код відповідь:

grant create any table to ASIMER;
grant insert any table to ASIMER;





/*---------------------------------------------------------------------------
3.a. 
Який номер замовлення куди входить найдорожчий товар?
Виконати завдання в SQL. 
4 бали
---------------------------------------------------------------------------*/

--Код відповідь:
Select disctinct Order_item
from Orderitems
where item_price in (
  select max(item_price)
  from orderitems)








/*---------------------------------------------------------------------------
3.b. 
Визначити скільки унікальних імен покупців - назвавши це поле count_name.
Виконати завдання в SQL. 
4 бали

---------------------------------------------------------------------------*/

--Код відповідь:


SELECT count(disctinct cust_name) as count_name
from customers








/*---------------------------------------------------------------------------
c. 
Вивести імена постачальників у нижньому регістрі,назвавши це поле vendor_name, що мають товар, але його ніхто не купляв.
Виконати завдання в алгебрі Кодда. 
4 бали

---------------------------------------------------------------------------*/
--Код відповідь:
PROJECT
Vendors TIMES ORDERITEMS TIMES PRODUCTS
WHERE VENDORS.vend_id=PRODUCTS.vend_id
{RENAME LOWER(vend_name) AS "vendor_name"}

MINUS

PROJECT
Vendors TIMES ORDERITEMS TIMES PRODUCTS
WHERE ORDERITEMS.prod_id=PRODUCTS.prod_id and
VENDORS.vend_id=PRODUCTS.vend_id;
{RENAME LOWER( vend_name) AS "vendor_name"}
