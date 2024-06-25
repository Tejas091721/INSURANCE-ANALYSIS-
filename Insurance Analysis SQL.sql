use insuranceanalysis;

-- KPI 1 - No of Invoice by Accnt Exec --
select count(distinct (invoice_number)),account_exe
from invo
group by account_exe;

-- KPI 2 - Yearly Meeting Count --
desc meet;

alter table meet
modify column meeting_date date;

select count(*)
from meet;

select distinct year(meeting_date) as years ,count( (meeting_date)) as meetings
from meet
group by year(meeting_date);

-- KPI 3.1Cross Sell--Target,Achive,new--

select  items as Income_class , target,achieved,invoice
from kpi3;


-- KPI 4. Stage Funnel by Revenue --

select distinct(stage)  as stages, sum(revenue_amount)
from opp
group by stage;

-- KPI 5. No of meeting By Account Exe --

select * from meet;

select distinct (Account_exe) as Employees, count(meeting_date)
from meet
group by account_exe;

-- KPI 6-Top Open Opportunity --

select * from opp;

select opportunity_name, revenue_amount,rank()
over (partition by opportunity_name order by revenue_amount desc) as 'Revenue'
from opp;

SELECT opportunity_name,revenue_amount
FROM opp 
WHERE revenue_amount>340000
order by revenue_amount desc
LIMIT 4;



