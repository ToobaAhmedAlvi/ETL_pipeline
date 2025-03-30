SELECT TOP 10
    dl.location_Area,
    SUM(tf.vehicle_count) AS TotalVehicles
FROM
    dbo.dim_traffic_flow tf
JOIN
    dbo.dim_location dl ON tf.location_id = dl.location_id
WHERE
    tf.traffic_flow_date >= '2025-02-01' AND tf.traffic_flow_date < '2025-03-01'
GROUP BY
    dl.location_Area
ORDER BY
    TotalVehicles DESC;
