# CREATE TABLE
USE cyclistic;
CREATE TABLE td_2110 (
		ride_id TEXT,
    rideable_type TEXT DEFAULT NULL,
    started_at DATETIME,
    ended_at DATETIME,
    start_station_name TEXT DEFAULT NULL,
    start_station_id TEXT DEFAULT NULL,
    end_station_name TEXT DEFAULT NULL,
    end_station_id TEXT DEFAULT NULL, 
    start_lat DOUBLE,
    start_lng DOUBLE,
    end_lat DOUBLE,
    end_lng DOUBLE,
    member_casual TEXT DEFAULT NULL
    );

# ----------------------------------------------------------------------------------------------
# LOAD THE DATA INTO THE TABLE

LOAD DATA LOCAL
	INFILE 'file\\C202110-cyclistic.csv'
    INTO TABLE cyclistic.td_2110
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;

# -----------------------------------------------------------------------------------------------
