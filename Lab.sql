-- QUERY 1
select client_id from  client
where district_id = 1
limit 5;

-- QUERY 2
select client_id from client
where district_id = 72
order by client_id desc
limit 1;

-- QUERY 3
select amount from loan
order by amount asc
limit 3;

-- QUERY 4
select distinct status from loan
order by status asc;

-- QUERY 5
select loan_id from loan
order by payments asc
limit 1;

-- QUERY 6
select account_id, amount from loan
order by account_id asc
limit 5;

-- 	QUERY 7
select account_id from loan
where duration = 60
order by amount asc
limit 5;

-- QUERY 8
select distinct k_symbol from `order`
order by k_symbol asc;

-- QUERY 9
select order_id from `order`
where account_id = 34;

-- QUERY 10
select distinct account_id from `order`
where order_id between 29540 and 29560;

-- QUERY 11
select amount from `order`
where account_to = 30067122;

-- QUERY 12
select trans_id, date, type, amount from trans
where account_id = 793
order by date desc
limit 10;

-- QUERY 13
select district_id, count(client_id) from client
where district_id < 10
group by district_id
order by district_id asc;

-- QUERY 14 
select type, count(type) as number_cards from card
group by type
order by number_cards desc;

-- QUERY 15
select account_id, sum(amount) from loan
group by account_id
order by sum(amount) desc
limit 10;

-- QUERY 16
select date, count(loan_id) from loan
where date < 930907
group by date
order by date desc;

-- QUERY 17
select date, duration, count(loan_id) from loan
where date < 971231 and date > 971201
group by date, duration
order by date, duration asc; -- I have more December days with respect to the supposed output

-- QUERY 18
select account_id, type, sum(amount) as total_amount from trans
where account_id = 396
group by type
order by type;

-- QUERY 19 (Found it really difficult)(Didn't know where to write case)
select 
	account_id,
	case type
		when 'PRIJEM' then 'INCOMING'
        when 'VYDAJ' then 'OUTCOMING'
        else 'Unknown'
	end as transaction_type,
    floor(sum(amount)) as total_amount
from trans
where account_id = 396
group by transaction_type
order by transaction_type;

-- QUERY 20 (ALMOST IMPOSSIBLE)
select 
	account_id,
    floor(sum(case when type = 'PRIJEM' then amount else 0 end)) as incoming_amount,
    floor(sum(case when type = 'VYDAJ' then amount else 0 end)) as outcoming_amount,
    floor(sum(case when type = 'PRIJEM' then amount else - amount end)) as difference    
from trans
where account_id = 396;

-- QUERY 21 (DO NOT KNOW HOW TO SOLVE IT)
select 
	account_id, 
    floor(sum(case when type = 'PRIJEM' then amount else - amount end)) as difference    
from trans
group by account_id
order by difference desc
limit 10;