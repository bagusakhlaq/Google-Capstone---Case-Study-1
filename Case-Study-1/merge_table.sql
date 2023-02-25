# MERGE ALL TABLE INTO ONE SINGLE TABLE

# CREATE A NEW TABLE FIRST
CREATE TABLE td_all (
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
# -----------------------------------------------------------------------------------------------
# INSERT ALL FIELDS AND RECORDS INTO THE NEW TABLE
INSERT INTO cyclistic.td_all (
				ride_id,
				rideable_type,
				started_at,
				ended_at,
				start_station_name,
				start_station_id,
				end_station_name,
				end_station_id,
				start_lat,
				start_lng,
				end_lat,
				end_lng,
				member_casual)
SELECT * FROM cyclistic.td_2209
UNION ALL
SELECT * FROM cyclistic.td_2208
UNION ALL
SELECT * FROM cyclistic.td_2207
UNION ALL
SELECT * FROM cyclistic.td_2206
UNION ALL
SELECT * FROM cyclistic.td_2205
UNION ALL
SELECT * FROM cyclistic.td_2204
UNION ALL
SELECT * FROM cyclistic.td_2203
UNION ALL
SELECT * FROM cyclistic.td_2202
UNION ALL
SELECT * FROM cyclistic.td_2201
UNION ALL
SELECT * FROM cyclistic.td_2112
UNION ALL
SELECT * FROM cyclistic.td_2111
UNION ALL
SELECT * FROM cyclistic.td_2110;
