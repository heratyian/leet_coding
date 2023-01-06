SELECT  DISTINCT ON (event_type) event_type,
        value - LAG(value) OVER (PARTITION BY event_type ORDER BY time asc) v
FROM events
