-- open our database
.open restaurant.db

-- Create Restaurant Database (menus, sections, servers, transactions tables)
-- Create menus table
Create table if not exists menus
  (menu_id int unique,
  menu_name text,
  section_id int,
  menu_price real
  );

insert into menus values
(1, 'edamame', 1, 5.50),
(2, 'crab wonton', 1, 6.95),
(3, 'shrimp tempura', 1, 11.95),
(4, 'volcano shrimp', 1, 11.50),
(5, 'california roll', 2, 6.50),
(6, 'alaska roll', 2, 7.50),
(7, 'sutset roll', 2, 16.95),
(8, 'infinity roll', 2, 17.50),
(9, 'dragon roll', 2, 14.50),
(10, 'hibachi chicken', 1, 17.95),
(11, 'hibachi steak', 1, 24.00),
(12, 'hibachi salmon', 1, 22.50),
(13, 'udon chicken', 1, 13.00),
(14, 'pad thai chicken', 1, 13.00),
(15, 'mojito', 3, 12.50),
(16, 'martini', 3, 12.50),
(17, 'bourbon', 3, 13.00),
(18, 'gin', 3, 13.00),
(19, 'vodka', 3, 12.00),
(20, 'whisky', 3, 13.00);

-- Create severs table
Create table if not exists servers
  (server_id int unique,
  server_name text
  );

INSERT INTO servers VALUES 
(1, 'Sun'),
(2, 'Star'),
(3, 'Pluto');

-- Create sections table
Create table if not exists sections
  (section_id int unique,
  section_name text
  );

INSERT INTO sections VALUES 
(1, 'hot kichen'),
(2, 'sushi'),
(3, 'bartender');

-- Create transactions table
/*Create table if not exists transactions
  (transaction_id int,
  server_id int,
  menu_id int,
  date date
  );

INSERT INTO transactions VALUES 
(1, 1, 1, '2022-08-01'),
(1, 1, 1, '2022-08-01'),
(1, 1, 2, '2022-08-01'),
(1, 1, 6, '2022-08-01'),
(1, 1, 9, '2022-08-01'),
(1, 1, 9, '2022-08-01'),
(1, 1, 13, '2022-08-01'),
(1, 1, 11, '2022-08-01'),
(1, 1, 16, '2022-08-01'),
(1, 1, 17, '2022-08-01'),
(1, 1, 20, '2022-08-01'),
(1, 1, 10, '2022-08-01'),
  
(2, 2, 4, '2022-08-01'),
(2, 2, 1,'2022-08-01'),
(2, 2, 7, '2022-08-01'),
(2, 2, 9, '2022-08-01'),
(2, 2, 10, '2022-08-01'),
(2, 2, 11, '2022-08-01'),
(2, 2, 11, '2022-08-01'),
(2, 2, 15, '2022-08-01'),
(2, 2, 15, '2022-08-01'),
(2, 2, 19, '2022-08-01'),

(3, 3, 3, '2022-08-01'),
(3, 3, 2, '2022-08-01'),
(3, 3, 2, '2022-08-01'),
(3, 3, 5, '2022-08-01'),
(3, 3, 5, '2022-08-01'),
(3, 3, 5, '2022-08-01'),
(3, 3, 5, '2022-08-01'),
(3, 3, 7, '2022-08-01'),
(3, 3, 7, '2022-08-01'),
(3, 3, 12, '2022-08-01'),
(3, 3, 13, '2022-08-01'),
(3, 3, 18, '2022-08-01'),
(3, 3, 17, '2022-08-01'),
(3, 3, 20, '2022-08-01'),

(4, 1, 3, '2022-08-02'),
(4, 1, 3,'2022-08-02'),
(4, 1, 5, '2022-08-02'),
(4, 1, 5, '2022-08-02'),
(4, 1, 8, '2022-08-02'),
(4, 1, 12, '2022-08-02'),
(4, 1, 14, '2022-08-02'),
(4, 1, 16, '2022-08-02'),
(4, 1, 19, '2022-08-02'),

(5, 2, 1, '2022-08-02'),
(5, 2, 1,'2022-08-02'),
(5, 2, 4, '2022-08-02'),
(5, 2, 7, '2022-08-02'),
(5, 2, 8, '2022-08-02'),
(5, 2, 8, '2022-08-02'),
(5, 2, 13, '2022-08-02'),
(5, 2, 14, '2022-08-02'),
(5, 2, 15, '2022-08-02'),
(5, 2, 15, '2022-08-02'),

(6, 3, 4, '2022-08-02'),
(6, 3, 3, '2022-08-02'),
(6, 3, 6, '2022-08-02'),
(6, 3, 6, '2022-08-02'),
(6, 3, 7, '2022-08-02'),
(6, 3, 7, '2022-08-02'),
(6, 3, 8, '2022-08-02'),
(6, 3, 9, '2022-08-02'),
(6, 3, 10, '2022-08-02'),
(6, 3, 13, '2022-08-02'),
(6, 3, 20, '2022-08-02'),
(6, 3, 18, '2022-08-02'),
(6, 3, 15, '2022-08-02');*/


--Filtering Data
--Create Full Data for summarizing a sale, (View, Join tables)
CREATE VIEW if not exists full_data AS
  select
    a.transaction_id,
    c.server_name,
    b.menu_name,
    b.menu_price,
    d.section_name,
    a.date
  from transactions a, menus b, servers c, sections d
  where a.menu_id = b.menu_id
    and a.server_id = c.server_id
    and b.section_id = d.section_id;

-- Sale summarize 
-- Who have the most sale per day?
.mode column
select
  server_name,
  sum(menu_price) as sale
  from full_data
  where date = '2022-08-02'
  group by server_name
  order by 2 desc;


-- Which food is the most popular?
select
  menu_name,
  count(*) as count
  from full_data
  where date = '2022-08-02'
  group by menu_name
  order by 2 desc
  limit 3;


-- the average sale of the day
--(Sub query)
select
  avg(sale)
  from (
    select
      server_name,
      sum(menu_price) as sale
      from full_data
      where date = '2022-08-02'
      group by server_name);

-- All of the sale product will be deducted 2% for each section as a tip
--(With, common table expression + Aggregate function)
with 
  a as (select * from menus, sections
        where menus.section_id = sections.section_id),
  b as (
        select * from transactions
        where date = '2022-08-02')
select 
  section_name,
  sum(menu_price) as profit,
  sum(menu_price) * 0.02 as tip
  from b 
  join a
    on b.menu_id = a.menu_id
  group by section_name;
