select *
from [dbo].[Divvy_Trips_2019_Q2]

delete from [dbo].[Divvy_Trips_2019_Q2] where tripid = '01 - Rental Details Rental ID'


Alter table[dbo].[Divvy_Trips_2019_Q2]
drop column start_name, start_id, end_name, end_id


select cast(tripduration as float)
from [dbo].[Divvy_Trips_2019_Q2]

select tripduration, replace(tripduration, ',', '')
from[dbo].[Divvy_Trips_2019_Q2]

alter table [dbo].[Divvy_Trips_2019_Q2]
alter column tripduration float

select tripduration
from [dbo].[Divvy_Trips_2019_Q2]

update [dbo].[Divvy_Trips_2019_Q2]
set tripduration = replace(tripduration, ',', '')


select tripduration, round(tripduration/60, 2) as trip_in_min
from[dbo].[Divvy_Trips_2019_Q2]

alter table [dbo].[Divvy_Trips_2019_Q2]
add trip_in_min float

update [dbo].[Divvy_Trips_2019_Q2]
set trip_in_min = round(tripduration/60, 2)


select *
from[dbo].[Divvy_Trips_2019_Q2]


-- get months


select start_time, datename(month, start_time) as months
from [dbo].[Divvy_Trips_2019_Q2]
order by start_time

alter table [dbo].[Divvy_Trips_2019_Q2]
add month datetime2(7)


alter table [dbo].[Divvy_Trips_2019_Q2]
alter column start_time date

select start_time, replace(start_time, '-', '/')
from[dbo].[Divvy_Trips_2019_Q2]


update [dbo].[Divvy_Trips_2019_Q2]
set month = DATENAME(month, start_time)


--weekdays 

select start_time, datepart(dw, start_time) as week_days
from [dbo].[Divvy_Trips_2019_Q2]


alter table [dbo].[Divvy_Trips_2019_Q2]
add weekdays int

update [dbo].[Divvy_Trips_2019_Q2]
set weekdays = datepart(dw, start_time)

select *
from [dbo].[Divvy_Trips_2019_Q2]


--age

select birthyear, age
from [dbo].[Divvy_Trips_2019_Q2]


alter table [dbo].[Divvy_Trips_2019_Q2]
add age int

update [dbo].[Divvy_Trips_2019_Q2]
set age = 2023-birthyear
