with wcap as(
select TO_DATE(t.date,'mm/dd/yyyy') as date,sum(t.total) as daily_balance,t.account 
  from (
  select p.*, (ZEROIFNULL(TO_NUMERIC(p.debit)) - ZEROIFNULL(TO_NUMERIC(p.credit))) as total from accounts_receivable p) t
  group by 1, 3
  Order by 1 )
  

 SELECT * FROM (
	SELECT z.*, 
	       ROW_NUMBER() OVER(PARTITION BY z.account ORDER BY z.date ) as row_number
	       FROM wcap z
	       ORDER BY 1
	)
