SELECT
    dv.vehicle_type,
    AVG(CASE 
        WHEN DATEPART(hour, dsv.violation_time) BETWEEN 7 AND 9 
          OR DATEPART(hour, dsv.violation_time) BETWEEN 16 AND 18 
        THEN dsv.speed_limit 
        ELSE NULL 
    END) AS AvgSpeedViolationsDuringPeakHours
FROM
    dbo.dim_speed_violation dsv
JOIN
    dbo.dim_vehicle dv ON dsv.vehicle_id = dv.vehicle_id
GROUP BY
    dv.vehicle_type 
ORDER BY AvgSpeedViolationsDuringPeakHours DESC;
