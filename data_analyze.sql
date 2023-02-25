# 3. Swap the start_at date with end_at date data to fix the minus duration
/*
update divvy_tripdata.td_all
set started_at = (@tmpDate:=started_at), started_at = ended_at, ended_at = @tmpDate
where timestampdiff(second, started_at, ended_at) < 0;
*/

# 4. edit start station name 0 to unknown
/*
update divvy_tripdata.td_cl
set start_station_name = 'unknown'
where start_station_name = '0';

update divvy_tripdata.td_cl
set end_station_name = 'unknown'
where end_station_name = '0';
*/

# 5. migrating current table to clean table
/*
create table td_cl like td_all;
alter table divvy_tripdata.td_cl
add day_name text,
add month_name text,
add duration float;
insert into divvy_tripdata.td_cl
			select
				*,
				dayname(started_at) as day_name,
                monthname(started_at) as month_name,
				timestampdiff(second, started_at, ended_at)/60 as duration
			from
				divvy_tripdata.td_all
			where
				timestampdiff(second, started_at, ended_at)/60 <> 0 and
                start_station_name <> end_station_name and
				(start_lat <> end_lat and start_lng <> end_lng);
*/

# ----------------------------------------------------------------------------------

# 1. Adding day name and time difference in minute (duration)
select
	*,
    dayname(started_at) as day_start,
    timestampdiff(second, started_at, ended_at)/60 as duration
from
	divvy_tripdata.td_all;

#-----------------------------------------------------------------------------------------------

# 2. Making a summary table using step 1 as the temp table
with td_c as (
			select
				*,
				dayname(started_at) as day_start,
				timestampdiff(second, started_at, ended_at)/60 as duration
			from
				divvy_tripdata.td_all
			where
				timestampdiff(second, started_at, ended_at)/60 <> 0	
                )
select 
	count(distinct ride_id) as total_trip,
    min(duration) as min_dur,
    max(duration) as max_dur,
    stddev(duration) as std_dur,
    variance(duration) as var_dur,
    avg(duration) as mean_dur
from 
	td_c
where
	start_station_name <> end_station_name AND
    (start_lat <> end_lat and start_lng <> end_lng);


# ------------------------------------------------------------------------------------
select * from td_cl limit 100;