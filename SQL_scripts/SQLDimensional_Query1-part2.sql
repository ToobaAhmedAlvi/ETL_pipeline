SELECT TOP 10 -- To limit the result to the top 10 locations
    dl.location_Area,da.road_surface,
    COUNT(da.accident_id) AS AccidentCount
FROM
    dbo.dim_accident da
JOIN
    dbo.dim_location dl ON da.location_id = dl.location_name
GROUP BY
    dl.location_Area,da.road_surface
ORDER BY
    AccidentCount DESC;
