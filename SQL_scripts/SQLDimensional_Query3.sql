SELECT
    da.location_id,
    dl.location_name,
    COUNT(da.incident_id) AS IncidentFrequency
FROM
    dbo.dim_incident da
JOIN
    dbo.dim_location dl ON da.location_id = dl.location_name
WHERE
    dl.location_name IN ('University Road','Shahrah-e-Faisal')
    AND da.incident_date >= '2025-01-01'
 
GROUP BY
    da.location_id,
    dl.location_name
ORDER BY
    IncidentFrequency DESC;
