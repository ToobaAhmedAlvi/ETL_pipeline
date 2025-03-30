SELECT 
fte.driver_age,dv.vehicle_type,  COUNT(dv.vehicle_id) AS ViolationCount
FROM
    [dbo].[DIM_VEHICLE] dv
JOIN
     [dbo].[FACT_TRAFFIC_EVENT] fte ON fte.vehicle_id = dv.vehicle_id
	WHERE fte.driver_age<25 and dv.has_violated_speed=1

GROUP BY
    fte.driver_age,dv.vehicle_type
ORDER BY
    ViolationCount DESC;
	
