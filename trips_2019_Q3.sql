select*
from[dbo].[Divvy_Trips_2019_Q3]



Alter table[dbo].[Divvy_Trips_2019_Q3]
drop column from_station_id, from_station_name, to_station_id, to_station_name


--get trip duration in minutes

select tripduration, round(tripduration/60 ,2) as trip_in_min
from[dbo].[Divvy_Trips_2019_Q3]

Alter table[dbo].[Divvy_Trips_2019_Q3]
add trip_in_min float;

update [dbo].[Divvy_Trips_2019_Q3]
set trip_in_min = round(tripduration/60 ,2)

select trip_in_min
from[dbo].[Divvy_Trips_2019_Q3]

-- getting week days (date name)

select start_time, datepart(dw, start_time) as week_days
from [dbo].[Divvy_Trips_2019_Q3]

Alter table[dbo].[Divvy_Trips_2019_Q3]
add week_days int;

update [dbo].[Divvy_Trips_2019_Q3]
set week_days = datepart(dw, start_time)

select * 
from[dbo].[Divvy_Trips_2019_Q3]

-- get age

select cast (birthyear as int)
from[dbo].[Divvy_Trips_2019_Q3]

select birthyear, 2023 - birthyear as age
from[dbo].[Divvy_Trips_2019_Q3]

Alter table[dbo].[Divvy_Trips_2019_Q3]
add Age int;

update[dbo].[Divvy_Trips_2019_Q3]
set Age = 2023 - birthyear

select birthyear, Age
from [dbo].[Divvy_Trips_2019_Q3]

select *
from[dbo].[Divvy_Trips_2019_Q3]

select Avg(tripduration), avg(trip_in_min)
from [dbo].[Divvy_Trips_2019_Q3]


select start_time, month(start_time)
from[dbo].[Divvy_Trips_2019_Q3]

select start_time, DATENAME(month, start_time) as month
from[dbo].[Divvy_Trips_2019_Q3]


Alter table[dbo].[Divvy_Trips_2019_Q3]
add month nvarchar(50);

update[dbo].[Divvy_Trips_2019_Q3]
set month = DATENAME(month, start_time)

select count(*)
from [dbo].[Divvy_Trips_2019_Q3]
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


create view trips_2019_Q3 as
select *
from [dbo].[Divvy_Trips_2019_Q3]
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


select count(trip_id)
from [dbo].[Divvy_Trips_2019_Q3]

create view num_of_users as
select distinct usertype,  gender, count(gender) as num_of_users
from trips_2019_Q3
group by gender, usertype

select *
from num_of_users
order by num_of_users

select *
from [dbo].[trips_2019_Q3]