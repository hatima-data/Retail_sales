create table retial_shop(
				product_id varchar,
				product_name varchar,
				category varchar,
				brand varchar,
				seller varchar,
				seller_city varchar,
				price numeric,
				dicount_price numeric,
			    final_price numeric(12, 2),
			    rating numeric(5, 2),
			    review_count int,
			    stock_availability int,
			    units_sold int,
			    listing_date varchar(50),
			    delivery_days int,
			    weight_g numeric(10, 2),
			    warranty_months int,
			    color varchar(50),
			    sizes varchar(50),
			    return_policy varchar(100),
			    is_returnable varchar(50),
			    payment_method varchar,
			    shipping_fee numeric,
			    product_added_date varchar,
			    seller_rating numeric
);


select*from retail_shop;

select product_name, brand, category, sum(units_sold) as total_units,
		sum(final_price *units_sold) as total_revenue
		from retail_shop
		group by product_name, brand, category
		order by total_revenue desc
		limit 10;



select category from retial_shop 
group by category;

select
	seller_city,
	count(*)  as total_orders,
	sum(units_sold) as total_items_sold,
	round(avg(final_price),2) as avg_price,
	sum(final_price *units_sold) as total_revenue
	from retail_shop
	group by seller_city
	order by total_revenue desc;

select 
	product_name, 
	brand,
	price,
	discount_price
	from retail_shop
	order by final_price desc
	limit 15;

alter table retial_shop rename to retail_shop;
alter table retail_shop rename column ptice to price;
alter table retail_shop rename column "dicount_price" to discount_price;

select 
	seller,
	seller_city,
	sum(units_sold) as total_units_sold,
	round(sum(final_price *units_sold), 2) as total_revenue
	from retail_shop
	group by seller,seller_city 
	order by total_revenue desc
	limit 10;
	
select 
	seller,
	seller_city,
	sum(units_sold) as total_units_sold,
	round(sum(final_price*units_sold), 2 )as total_revenue
	from retail_shop
	group by seller,seller_city
	order by total_revenue asc
	limit 10;

select 
	product_name,
	units_sold,
	final_price,
	round(final_price*units_sold, 2) as order_total_amount,
	case
		when (final_price*units_sold)>50000 then 'max'
		when (final_price*units_sold) between 20000 and 50000 then 'avg'
		else 'min'
		end as sales_category
		from retail_shop
		order by order_total_amount desc
		limit 20;
	
select 
	seller,
	seller_city,
	count(*) as trans_count,
	round(sum(final_price*units_sold), 2) as total_branch_rev,
	round(avg(final_price*units_sold), 2) as avg_trans_value
	from retail_shop
	group by seller, seller_city
	order by total_branch_rev desc;


select seller_city from retail_shop group by seller_city;

select max(price) from retail_shop;

select 
	brand, 
	count(*) from retail_shop group by brand ;

select 
	delivery_days,
	count(*) as total_orders,
	round(avg(seller_rating),2) as avg_seller_rating,
	sum(units_sold) as total_units_sold
	from retail_shop
	group by delivery_days
	order by delivery_days;

select 
	return_policy,
	is_returnable,
	count(*) as order_count,
	sum(units_sold) as total_sold
	from retail_shop
	group by return_policy, is_returnable
	order by total_sold desc;

select 
	warranty_months,
	count(*) as product_count,
	round(avg(final_price), 2) as avg_price,
	round(sum(final_price*units_sold), 2) as total_revenue
	from retail_shop
	group by warranty_months
	order by warranty_months desc;

select 
	product_name,
	brand,
	weight_g,
	final_price,
	shipping_fee
	from retail_shop
	order by weight_g desc
	limit 15;

select 
	category, count(*) from retail_shop
	group by  category;

select
	max(price),
	avg(price),
	min(price) 
	from retail_shop;

select 
	max(discount_price),
	avg(discount_price),
	min(discount_price)
	from retail_shop;

select 
	max(final_price),
	avg(final_price),
	min(final_price)
	from retail_shop;

select
	max(rating),
	min(rating)
	from retail_shop;
		
select
	color,
	count(*) as count_color
	from retail_shop
	group by color;

select
	sizes,
	count(*) as count_size
	from retail_shop
	group by sizes;

alter table retail_shop rename column size to sizes;	

select 
	payment_method,
	count(*) as count_pay_met
	from retail_shop
	group by  payment_method
	order by count_pay_met desc;
	
select*from retail_shop;

select category from retail_shop;

select 
	category,
	brand,
	sum(units_sold)
	from retail_shop
	where category='Electronics'
	group by brand, category
	order by sum(units_sold) desc;


select
	payment_method,
	round(avg(discount_price), 2) as avg_disc_pr,
	round(avg(final_price), 2) as avg_final_pr
	from retail_shop
	where seller_city='Mumbai'
	group by payment_method
	order by avg_disc_pr desc;
	

select
	brand,
	count(*) as count_brand,
	round(avg(final_price), 2) as avg_final_price
	from retail_shop
	where category='Fashion' and stock_availability>5
	group by brand
	order by brand asc
	limit 10;

select 
	seller_city,
	count(*) as count_seller_city,
	round(avg(delivery_days),2)
	from retail_shop
	where payment_method like '%CARD%'
	group by seller_city
	having count(*)>10000
	order by count(*) desc;

select 
	case
		when final_price>20000 then 'High price'
		else 'Low price'
		end as price_category,
		count(*),
		round(avg(final_price),2) as avg_final_price,
		max(final_price),
		min(final_price)
		from retail_shop
		group by price_category;
		
	
select 
	final_price, 
	product_name
	from retail_shop
	where category='Fashion'
	order by final_price desc
	limit 20;
	










