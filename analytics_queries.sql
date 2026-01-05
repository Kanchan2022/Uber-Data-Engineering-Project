select * from uber-project-481716.uber_data_engineering.fact_table limit 10;

--Top pickup locations by trip volume
SELECT
    p.pickup_location_id,
    p.PULocationID,
    COUNT(*) AS total_trips
FROM `uber-project-481716.uber_data_engineering.fact_table` f
JOIN `uber-project-481716.uber_data_engineering.pickup_location_dim` p
    ON f.pickup_location_id = p.pickup_location_id
GROUP BY
    p.pickup_location_id,
    p.PULocationID
ORDER BY
    total_trips DESC
LIMIT 10;

--Trips by passenger count
SELECT
    p.passenger_count,
    COUNT(*) AS total_trips
FROM `uber-project-481716.uber_data_engineering.fact_table` f
JOIN `uber-project-481716.uber_data_engineering.passenger_count_dim` p
    ON f.passenger_count_id = p.passenger_count_id
GROUP BY
    p.passenger_count
ORDER BY
    p.passenger_count;

--Average fare by hour
SELECT
    d.pick_hour,
    ROUND(AVG(f.fare_amount), 2) AS avg_fare_amount
FROM `uber-project-481716.uber_data_engineering.fact_table` f
JOIN `uber-project-481716.uber_data_engineering.datetime_dim` d
    ON f.datetime_id = d.datetime_id
GROUP BY
    d.pick_hour
ORDER BY
    d.pick_hour;

--creating table analytics for analytics layer (only extracting the required columns)
CREATE OR REPLACE TABLE `uber-project-481716.uber_data_engineering.tbl_analytics` AS (
SELECT 
f.trip_id,
f.VendorID,
d.tpep_pickup_datetime,
d.tpep_dropoff_datetime,
p.passenger_count,
PULocationID,
DOLocationID,
t.trip_distance,
r.rate_code_name,
pay.payment_type_name,
f.fare_amount,
f.extra,
f.mta_tax,
f.tip_amount,
f.tolls_amount,
f.improvement_surcharge,
f.total_amount
FROM 

`uber-project-481716.uber_data_engineering.fact_table` f
JOIN `uber-project-481716.uber_data_engineering.datetime_dim` d  ON f.datetime_id=d.datetime_id
JOIN `uber-project-481716.uber_data_engineering.passenger_count_dim` p  ON p.passenger_count_id=f.passenger_count_id  
JOIN `uber-project-481716.uber_data_engineering.trip_distance_dim` t  ON t.trip_distance_id=f.trip_distance_id  
JOIN `uber-project-481716.uber_data_engineering.rate_code_dim` r ON r.rate_code_id=f.rate_code_id  
JOIN `uber-project-481716.uber_data_engineering.pickup_location_dim` pick ON pick.pickup_location_id=f.pickup_location_id
JOIN `uber-project-481716.uber_data_engineering.drop_location_dim` dropl ON dropl.drop_location_id=f.drop_location_id
JOIN `uber-project-481716.uber_data_engineering.payment_type_dim` pay ON pay.payment_type_id=f.payment_type_id)
;
