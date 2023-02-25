# 1. Create new table to eliminate all duplication
CREATE TABLE divvy_tripdata.td_all_temp LIKE divvy_tripdata.td_all;

INSERT INTO divvy_tripdata.td_all_temp
  SELECT * FROM divvy_tripdata.td_all
  GROUP BY ride_id;
  
DROP TABLE divvy_tripdata.td_all;

ALTER TABLE divvy_tripdata.td_all_temp RENAME TO td_all;

# 2. Update DIVVY CASSETTE name into proper case
UPDATE divvy_tripdata.td_all
SET
	  start_station_name = "Divvy Cassette Repair Mobile Station",
    start_station_id = "Divvy Cassette Repair Mobile Station",
    end_station_name = "Divvy Cassette Repair Mobile Station",
    end_station_id = "Divvy Cassette Repair Mobile Station"
WHERE start_station_name = "DIVVY CASSETTE REPAIR MOBILE STATION" OR
	    end_station_name = "DIVVY CASSETTE REPAIR MOBILE STATION";
