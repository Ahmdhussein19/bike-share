select *
from [dbo].[Trips_2019_Q2_exp]



select ROUND(trip_in_mins,2,2)
from[dbo].[Trips_2019_Q2_exp]

update [dbo].[Trips_2019_Q2_exp]
set trip_in_mins = ROUND(trip_in_mins,2,2)