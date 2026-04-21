drop table if exists zepto_inventory;

use zepto_inventory;

create table zepto(sku_id serial primary key,
catogery varchar (120),name varchar (120) not null,
mrp numeric (8,2),discountPercent numeric (8,2),
availableQuantity integer,
discountedSellingPrice numeric (8,2),
weightInGms integer,
outOfStock boolean,
quantity integer);

drop table zepto;

create table zepto (
category	varchar (120),
name	varchar (120),
mrp	int,
discountPercent	decimal(8,2),
availableQuantity	int,
discountedSellingPrice	decimal(8,2),
weightInGms	int,
outOfStock	tinyint,
quantity	int);

desc zepto;

alter table zepto rename column catogery to category;

alter table zepto modify outOfStock tinyint(1);

##data exploration

select * from zepto;

##count of rows
select count(*) from zepto;

# check for null values
select * from zepto where category is null or
name is null or mrp is null or
discountPercent is null or availableQuantity is null or discountedSellingPrice is null or 
weightInGms is null or outOfStock is null or quantity is null;

# different product categories

select distinct category from zepto order by category;

# checking how many products in stock and how many are in out of stock

select outOfStock,count(*) from zepto group by outOfStock;

# products names present multiple times

select name,count(*) no_of_units from zepto group by name order by no_of_units  desc;

## products with price = 0

select * from zepto where mrp = 0 or discountedSellingPrice = 0;

delete from zepto where mrp= 0;

-- converting paise into rupee

update zepto
set mrp = mrp/100.0, discountedSellingPrice = discountedSellingPrice/100.0;

select * from zepto;

# INSIGHTS

# 1.FIND TOP 10 BEST VALUE PRODUCTS BASED ON THE DISCOUNTED PERCENTAGE

select category,name,discountPercent from zepto order by discountPercent desc limit 10;

# 2.WHAT ARE THE PRODUCTS WITH HIGH MRP BUT OUT OF STOCK

select name,mrp,outOfStock from zepto where outOfStock = 1 order by mrp desc ;

#3.CALCULATE ESTIMATE D REVENUE FOR EACH CATEGOTY
select category,sum(discountedSellingPrice * availableQuantity) total_revenue from zepto
group by category order by total_revenue;

# 4. FIND ALL PRODUCTS WHERE MRP IS GREATER THAN 500/- AND DISCOUNT IS LESSTHAN 10%

select name,mrp,discountPercent from zepto where mrp > 500 and discountPercent < 10 
order by mrp desc, discountPercent desc;

# 5.IDENTIFY THE TOP 5 CATEGORIES OFFERING THE HIGHEST AVERAGE DISCOUNT PERCENTAGE.

select category,round(avg(discountPercent),2) avg_disc_percent from zepto group by category 
order by avg_disc_percent desc limit 5;

# 6. FIND THE PRICE PER GRAM FOR PRODUCTS ABOVE 100G AND SORT BY BEST values

select name,weightInGms,discountedSellingPrice,round(discountedSellingPrice/weightInGms,2) as pricePerGm from
zepto where weightinGms > 100 order by pricePerGm;

#7.GROUP THE PRODUCTS INTO CATEGORIES LIKE LOW,MEDIUM AND BULK

select name,weightInGms,
case when weightInGms < 1000 then 'Low'
when weightInGms < 5000 then 'High'
else 'Bulk'
end as wt_category
from zepto;

#8.TOTAL INVENTORY WEIGHT PER CATEGORY

select category,sum(weightInGms*availableQuantity) as Total_Inventory from zepto group by category order by Total_Inventory;




 







