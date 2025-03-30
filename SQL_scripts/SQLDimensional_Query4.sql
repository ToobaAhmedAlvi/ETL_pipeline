WITH TopLocations AS (
    -- 1. Find Top 5 Location Areas by Traffic Flow in February 2025
    SELECT TOP 10
        dl.location_Area,
        SUM(tf.vehicle_count) AS TotalTraffic
    FROM
        dbo.dim_traffic_flow tf
    JOIN
        dbo.dim_location dl ON tf.location_id = dl.location_id
    WHERE
        tf.traffic_flow_date >= '2025-02-01' AND tf.traffic_flow_date < '2025-03-01'
    GROUP BY
        dl.location_Area
    ORDER BY
        TotalTraffic DESC
),
CameraStatus AS (
    -- 2. Get Camera Status for each Location Area
    SELECT
        tl.location_Area,
        CASE
            WHEN dl.camera_status = 'Inactive' THEN 1
            ELSE 0
        END AS IsInactive
    FROM
        TopLocations tl
    JOIN
        dbo.dim_location dl ON tl.location_Area = dl.location_Area
)
-- 3. Calculate Percentage of Inactive Cameras by Location Area
SELECT
    location_Area,
    (SUM(IsInactive * 1.0) / COUNT(*)) * 100 AS PercentageInactive
FROM
    CameraStatus
GROUP BY
    location_Area
ORDER BY
    PercentageInactive DESC;
