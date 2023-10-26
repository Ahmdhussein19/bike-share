select *
from [dbo].[Divvy_Trips_2019_Q4]

Alter table[dbo].[Divvy_Trips_2019_Q4]
drop column from_station_id, from_station_name, to_station_id, to_station_name

select tripduration, round(tripduration/60 ,2) as trip_in_min
from[dbo].[Divvy_Trips_2019_Q4]

Alter table[dbo].[Divvy_Trips_2019_Q4]
add trip_in_min float;

update [dbo].[Divvy_Trips_2019_Q4]
set trip_in_min = round(tripduration/60 ,2)

select trip_in_min
from[dbo].[Divvy_Trips_2019_Q4]

--get weekdays

select start_time, datepart(dw, start_time) as week_days
from [dbo].[Divvy_Trips_2019_Q4]


Alter table[dbo].[Divvy_Trips_2019_Q4]
add week_days int;

update [dbo].[Divvy_Trips_2019_Q4]
set week_days = datepart(dw, start_time)

select * 
from[dbo].[Divvy_Trips_2019_Q4]

--get months

select start_time, DATENAME(month, start_time) as month
from[dbo].[Divvy_Trips_2019_Q4]

Alter table[dbo].[Divvy_Trips_2019_Q4]
add month nvarchar(50);

update[dbo].[Divvy_Trips_2019_Q4]
set month = DATENAME(month, start_time)

--get age


select birthyear, 2023 - birthyear as age
from[dbo].[Divvy_Trips_2019_Q4]


Alter table[dbo].[Divvy_Trips_2019_Q4]
add Age int;

update[dbo].[Divvy_Trips_2019_Q4]
set Age = 2023 - birthyear

select birthyear, Age
from [dbo].[Divvy_Trips_2019_Q4]

select *
from[dbo].[Divvy_Trips_2019_Q4]


select Avg(tripduration/60), avg(trip_in_min)
from [dbo].[Divvy_Trips_2019_Q4]

create view Trips_2019_Q4 as
select *
from [dbo].[Divvy_Trips_2019_Q4]
where trip_id is not null and
start_time is not null and
end_time is not null and
bikeid is not null and
tripduration is not null and
usertype is not null and
gender is not null and
birthyear is not null and
trip_in_min is not null and
week_days is not null and
Age is not null and
month is not null

select *
from [dbo].[Trips_2019_Q4]
join [dbo].[Trips_2019_Q3]
on [dbo].[Trips_2019_Q4].bikeid = [dbo].[trips_2019_Q3].bikeid

select count(*)
from [dbo].[Divvy_Trips_2019_Q4]

create view num_of_users_Q4 as
select distinct usertype,  gender, count(gender) as num_of_users
from Trips_2019_Q4
group by gender, usertype

select *
from [dbo].[Trips_2019_Q2]



select top 100000 [dbo].[Trips_2019_Q1_final].gender,
[dbo].[Trips_2019_Q2_exp].gender,
[dbo].[Trips_2019_Q1_final].month,
[dbo].[Trips_2019_Q2_exp].month
from [dbo].[Trips_2019_Q1_final]
join[dbo].[Trips_2019_Q2_exp] 
on [dbo].[Trips_2019_Q1_final].gender = [dbo].[Trips_2019_Q2_exp].gender