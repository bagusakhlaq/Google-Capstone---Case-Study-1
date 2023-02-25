# 1. Create index of blanks and known station name
SELECT *
FROM cyclistic.td_all
WHERE start_lat in
			(SELECT start_lat
			FROM cyclistic.td_all
			WHERE start_station_name = ""
			GROUP BY 1) 
    AND start_lng in
			(SELECT start_lng
			FROM cyclistic.td_all
			WHERE start_station_name = ""
			GROUP BY 1)
GROUP BY start_lat, start_lng
ORDER BY start_lat, start_lng DESC;

# --------------------------------------------------------------------------------------------

# 10. Update blanks in station name and id
UPDATE cyclistic.td_all
SET start_station_name = CASE
		WHEN start_lat = 41.79 and start_lng = -87.69 THEN start_station_name = 'Artesian Ave & 55th St'
		WHEN start_lat = 41.95 and start_lng = -87.75 THEN start_station_name = 'Cicero Ave & Grace St'
		WHEN start_lat = 41.91 and start_lng = -87.68 THEN start_station_name = 'Damen Ave & Wabansia Ave'
		WHEN start_lat = 41.92 and start_lng = -87.77 THEN start_station_name = 'Fullerton & Monitor'
		WHEN start_lat = 41.84 and start_lng = -87.72 THEN start_station_name = 'Harding Ave & 26th St'
		WHEN start_lat = 41.78 and start_lng = -87.71 THEN start_station_name = 'Homan Ave & 65th St'
		WHEN start_lat = 41.84 and start_lng = -87.73 THEN start_station_name = 'Komensky Ave & 31st St'
		WHEN start_lat = 41.92 and start_lng = -87.75 THEN start_station_name = 'Lamon Ave & Armitage Ave'
		WHEN start_lat = 41.95 and start_lng = -87.76 THEN start_station_name = 'Long & Irving Park'
		WHEN start_lat = 41.74 and start_lng = -87.54 THEN start_station_name = 'Mackinaw Ave & 85th St'
		WHEN start_lat = 41.87 and start_lng = -87.77 THEN start_station_name = 'Mayfield & Roosevelt Rd'
		WHEN start_lat = 41.89 and start_lng = -87.65 THEN start_station_name = 'N Carpenter St & W Lake St'
		WHEN start_lat = 41.94 and start_lng = -87.79 THEN start_station_name = 'Narragansett Ave & School St'
		WHEN start_lat = 41.93 and start_lng = -87.8 THEN start_station_name = 'Oak Park & Wellington'
		WHEN start_lat = 41.7 and start_lng = -87.56 THEN start_station_name = 'Orville T Bright School'
		WHEN start_lat = 41.78 and start_lng = -87.66 THEN start_station_name = 'Public Rack - Ashland Ave & 63rd St'
		WHEN start_lat = 41.68 and start_lng = -87.63 THEN start_station_name = 'Public Rack - Eggleston Ave & 115th St'
		WHEN start_lat = 41.72 and start_lng = -87.65 THEN start_station_name = 'Public Rack - Vincennes Ave & 95th St'
		WHEN start_lat = 41.72 and start_lng = -87.68 THEN start_station_name = 'Public Rack - Western Ave & 96th St'
		WHEN start_lat = 41.7 and start_lng = -87.65 THEN start_station_name = 'S Aberdeen St & W 106th St'
		WHEN start_lat = 41.94 and start_lng = -87.8 THEN start_station_name = 'Shabbona Park'
		WHEN start_lat = 41.81 and start_lng = -87.72 THEN start_station_name = 'Springfield Ave & 47th St'
		WHEN start_lat = 41.92 and start_lng = -87.65 THEN start_station_name = 'W Armitage Ave & N Sheffield Ave'
		WHEN start_lat = 41.7 and start_lng = -87.68 THEN start_station_name = 'Western Ave & 106th St - West'
		WHEN start_lat = 41.75 and start_lng = -87.68 THEN start_station_name = 'Western Ave & 79th St'
        ELSE start_station_name END
        ,
	start_station_id = CASE
		WHEN start_station_name = 'Artesian Ave & 55th St' THEN start_station_id = '345'
		WHEN start_station_name = 'Cicero Ave & Grace St' THEN start_station_id = '322'
		WHEN start_station_name = 'Damen Ave & Wabansia Ave' THEN start_station_id = '20'
		WHEN start_station_name = 'Fullerton & Monitor' THEN start_station_id = '474'
		WHEN start_station_name = 'Harding Ave & 26th St' THEN start_station_id = '332'
		WHEN start_station_name = 'Homan Ave & 65th St' THEN start_station_id = '392'
		WHEN start_station_name = 'Komensky Ave & 31st St' THEN start_station_id = '335'
		WHEN start_station_name = 'Lamon Ave & Armitage Ave' THEN start_station_id = '357'
		WHEN start_station_name = 'Long & Irving Park' THEN start_station_id = '398'
		WHEN start_station_name = 'Mackinaw Ave & 85th St' THEN start_station_id = '717'
		WHEN start_station_name = 'Mayfield & Roosevelt Rd' THEN start_station_id = '367'
		WHEN start_station_name = 'N Carpenter St & W Lake St' THEN start_station_id = '20251'
		WHEN start_station_name = 'Narragansett Ave & School St' THEN start_station_id = '397'
		WHEN start_station_name = 'Oak Park & Wellington' THEN start_station_id = '318'
		WHEN start_station_name = 'Orville T Bright School' THEN start_station_id = '850'
		WHEN start_station_name = 'Public Rack - Ashland Ave & 63rd St' THEN start_station_id = '996'
		WHEN start_station_name = 'Public Rack - Eggleston Ave & 115th St' THEN start_station_id = '592'
		WHEN start_station_name = 'Public Rack - Vincennes Ave & 95th St' THEN start_station_id = '619'
		WHEN start_station_name = 'Public Rack - Western Ave & 96th St' THEN start_station_id = '991'
		WHEN start_station_name = 'S Aberdeen St & W 106th St' THEN start_station_id = '20126'
		WHEN start_station_name = 'Shabbona Park' THEN start_station_id = '395'
		WHEN start_station_name = 'Springfield Ave & 47th St' THEN start_station_id = '344'
		WHEN start_station_name = 'W Armitage Ave & N Sheffield Ave' THEN start_station_id = '20254'
		WHEN start_station_name = 'Western Ave & 106th St - West' THEN start_station_id = '903'
		WHEN start_station_name = 'Western Ave & 79th St' THEN start_station_id = '714'
		else start_station_id END
WHERE start_station_name = "";

# -------------------------------------

UPDATE cyclistic.td_all
SET end_station_name = CASE 
		WHEN end_lat = 41.79 and end_lng = -87.69 THEN end_station_name = 'Artesian Ave & 55th St'
		WHEN end_lat = 41.95 and end_lng = -87.75 THEN end_station_name = 'Cicero Ave & Grace St'
		WHEN end_lat = 41.91 and end_lng = -87.68 THEN end_station_name = 'Damen Ave & Wabansia Ave'
		WHEN end_lat = 41.92 and end_lng = -87.77 THEN end_station_name = 'Fullerton & Monitor'
		WHEN end_lat = 41.84 and end_lng = -87.72 THEN end_station_name = 'Harding Ave & 26th St'
		WHEN end_lat = 41.78 and end_lng = -87.71 THEN end_station_name = 'Homan Ave & 65th St'
		WHEN end_lat = 41.84 and end_lng = -87.73 THEN end_station_name = 'Komensky Ave & 31st St'
		WHEN end_lat = 41.92 and end_lng = -87.75 THEN end_station_name = 'Lamon Ave & Armitage Ave'
		WHEN end_lat = 41.95 and end_lng = -87.76 THEN end_station_name = 'Long & Irving Park'
		WHEN end_lat = 41.74 and end_lng = -87.54 THEN end_station_name = 'Mackinaw Ave & 85th St'
		WHEN end_lat = 41.87 and end_lng = -87.77 THEN end_station_name = 'Mayfield & Roosevelt Rd'
		WHEN end_lat = 41.89 and end_lng = -87.65 THEN end_station_name = 'N Carpenter St & W Lake St'
		WHEN end_lat = 41.94 and end_lng = -87.79 THEN end_station_name = 'Narragansett Ave & School St'
		WHEN end_lat = 41.93 and end_lng = -87.8 THEN end_station_name = 'Oak Park & Wellington'
		WHEN end_lat = 41.7 and end_lng = -87.56 THEN end_station_name = 'Orville T Bright School'
		WHEN end_lat = 41.78 and end_lng = -87.66 THEN end_station_name = 'Public Rack - Ashland Ave & 63rd St'
		WHEN end_lat = 41.68 and end_lng = -87.63 THEN end_station_name = 'Public Rack - Eggleston Ave & 115th St'
		WHEN end_lat = 41.72 and end_lng = -87.65 THEN end_station_name = 'Public Rack - Vincennes Ave & 95th St'
		WHEN end_lat = 41.72 and end_lng = -87.68 THEN end_station_name = 'Public Rack - Western Ave & 96th St'
		WHEN end_lat = 41.7 and end_lng = -87.65 THEN end_station_name = 'S Aberdeen St & W 106th St'
		WHEN end_lat = 41.94 and end_lng = -87.8 THEN end_station_name = 'Shabbona Park'
		WHEN end_lat = 41.81 and end_lng = -87.72 THEN end_station_name = 'Springfield Ave & 47th St'
		WHEN end_lat = 41.92 and end_lng = -87.65 THEN end_station_name = 'W Armitage Ave & N Sheffield Ave'
		WHEN end_lat = 41.7 and end_lng = -87.68 THEN end_station_name = 'Western Ave & 106th St - West'
		WHEN end_lat = 41.75 and end_lng = -87.68 THEN end_station_name = 'Western Ave & 79th St'
		else end_station_name END
        ,
	end_station_id = CASE
		WHEN end_station_name = 'Artesian Ave & 55th St' THEN end_station_id = '345'
		WHEN end_station_name = 'Cicero Ave & Grace St' THEN end_station_id = '322'
		WHEN end_station_name = 'Damen Ave & Wabansia Ave' THEN end_station_id = '20'
		WHEN end_station_name = 'Fullerton & Monitor' THEN end_station_id = '474'
		WHEN end_station_name = 'Harding Ave & 26th St' THEN end_station_id = '332'
		WHEN end_station_name = 'Homan Ave & 65th St' THEN end_station_id = '392'
		WHEN end_station_name = 'Komensky Ave & 31st St' THEN end_station_id = '335'
		WHEN end_station_name = 'Lamon Ave & Armitage Ave' THEN end_station_id = '357'
		WHEN end_station_name = 'Long & Irving Park' THEN end_station_id = '398'
		WHEN end_station_name = 'Mackinaw Ave & 85th St' THEN end_station_id = '717'
		WHEN end_station_name = 'Mayfield & Roosevelt Rd' THEN end_station_id = '367'
		WHEN end_station_name = 'N Carpenter St & W Lake St' THEN end_station_id = '20251'
		WHEN end_station_name = 'Narragansett Ave & School St' THEN end_station_id = '397'
		WHEN end_station_name = 'Oak Park & Wellington' THEN end_station_id = '318'
		WHEN end_station_name = 'Orville T Bright School' THEN end_station_id = '850'
		WHEN end_station_name = 'Public Rack - Ashland Ave & 63rd St' THEN end_station_id = '996'
		WHEN end_station_name = 'Public Rack - Eggleston Ave & 115th St' THEN end_station_id = '592'
		WHEN end_station_name = 'Public Rack - Vincennes Ave & 95th St' THEN end_station_id = '619'
		WHEN end_station_name = 'Public Rack - Western Ave & 96th St' THEN end_station_id = '991'
		WHEN end_station_name = 'S Aberdeen St & W 106th St' THEN end_station_id = '20126'
		WHEN end_station_name = 'Shabbona Park' THEN end_station_id = '395'
		WHEN end_station_name = 'Springfield Ave & 47th St' THEN end_station_id = '344'
		WHEN end_station_name = 'W Armitage Ave & N Sheffield Ave' THEN end_station_id = '20254'
		WHEN end_station_name = 'Western Ave & 106th St - West' THEN end_station_id = '903'
		WHEN end_station_name = 'Western Ave & 79th St' THEN end_station_id = '714'
		else end_station_id END
WHERE end_station_name = "";

# -----------------------------------------------------------------------------------------------------
# 11. Fill the blank station name to "unknown" 
UPDATE divvy_tripdata.td_all
SET start_station_name = 'unknown'
WHERE start_station_name = "";

UPDATE divvy_tripdata.td_all
SET end_station_name = 'unknown'
WHERE end_station_name = "";

