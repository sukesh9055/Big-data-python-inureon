3.create table if not exists sukesh.sales_orders_orc(ORDERNUMBER int,QUANTITYORDERED int,PRICEEACH Double,ORDERLINENUMBER int,SALES Double,STATUS string,QTR_ID int,MONTH_ID int,YEAR_ID int,PRODUCTLINE string,PHONE BIGINT,CITY string,STATE string,POSTALCODE string,COUNTRY string,TERRITORY string,CONTACTLASTNAME string,CONTACTFIRSTNAME string,DEALSIZE string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS ORC TBLPROPERTIES ("skip.header.line.count"="1");

5.create table if not exists sukesh.sales_orders_csv(ORDERNUMBER int,QUANTITYORDERED int,PRICEEACH Double,ORDERLINENUMBER int,SALES Double,STATUS string,QTR_ID int,MONTH_ID int,YEAR_ID int,PRODUCTLINE string,PHONE BIGINT,CITY string,STATE string,POSTALCODE string,COUNTRY string,TERRITORY string,CONTACTLASTNAME string,CONTACTFIRSTNAME string,DEALSIZE string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE TBLPROPERTIES ("skip.header.line.count"="1");

4.load data local inpath 'Sukesh/sales_order_data.csv' overwrite into table sales_orders_csv;

6.INSERT overwrite table sales_orders_csv select * from sales_orders_orc;

---Perform below menioned queries on "sales_order_orc" table :
select YEAR_ID,SUM(SALES) as total_sales_per_year from sales_order_orc group by YEAR_ID;

select MAX(QUANTITYORDERED) as max_order_number,PRODUCTLINE from sales_order_orc group by PRODUCTLINE;  

select sum(sales) as Total_Sales_By_year,QTR_ID from sukesh.sales_orders_csv group by QTR_ID order by Total_Sales_By_year asc limit 1;

select sum(SALES) as Total_Sales,COUNTRY from sales_order_orc group by COUNTRY order by Total_Sales asc limit 1
union all
select sum(SALES) as Total_Sales,COUNTRY from sales_order_orc group by COUNTRY order by Total_Sales desc limit 1;


select sum(SALES) as Quarter_Sales,CITY from sales_order_orc group by CITY;

select MAX(QUANTITYORDERED) as max,MONTH_ID,YEAR_ID from sales_order_orc group by YEAR_ID;
