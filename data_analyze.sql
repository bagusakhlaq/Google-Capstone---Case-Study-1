# 1. Adding day name and time difference in minute (duration)

SELECT
	*,
	dayname(started_at) as day_start,
	timestampdiff(second, started_at, ended_at)/60 as duration
FROM
	cyclistic.td_all;

#-----------------------------------------------------------------------------------------------

# 2. Making a summary table using step 1 as the temp table

WITH td_c AS (
			SELECT
				*,
				dayname(started_at) as day_start,
				timestampdiff(second, started_at, ended_at)/60 as duration
			FROM
				cyclistic.td_all
			WHERE
				timestampdiff(second, started_at, ended_at)/60 <> 0	
                )
SELECT 
	count(distinct ride_id) as total_trip,
	min(duration) as min_dur,
	max(duration) as max_dur,
	stddev(duration) as std_dur,
	variance(duration) as var_dur,
	avg(duration) as mean_dur
FROM 
	td_c
WHERE
	start_station_name <> end_station_name AND
	(start_lat <> end_lat AND start_lng <> end_lng);


# --------------------------------------------------------------------------------------------
# 3. Swap the start_at date WITH end_at date data to fix the minus duration

UPDATE cyclistic.td_all
SET 
	started_at = (@tmpDate:=started_at), 
	started_at = ended_at, 
	ended_at = @tmpDate
WHERE timestampdiff(second, started_at, ended_at) < 0;


# 4. edit start station name 0 to unknown

UPDATE cyclistic.td_cl
SET start_station_name = 'unknown'
WHERE start_station_name = '0';

UPDATE cyclistic.td_cl
SET end_station_name = 'unknown'
WHERE end_station_name = '0';


# 5. migrating current table to clean table

CREATE TABLE td_cl LIKE td_all;

ALTER TABLE cyclistic.td_cl
	ADD day_name text,
	ADD month_name text,
	ADD duration float;
	
INSERT INTO cyclistic.td_cl
	SELECT
		*,
		dayname(started_at) as day_name,
		monthname(started_at) as month_name,
		timestampdiff(second, started_at, ended_at)/60 as duration
	FROM
		cyclistic.td_all
	WHERE
		timestampdiff(second, started_at, ended_at)/60 <> 0 and
		start_station_name <> end_station_name and
		(start_lat <> end_lat and start_lng <> end_lng);


# ----------------------------------------------------------------------------------
