CREATE VIEW SystemEventsView AS
SELECT
    se.id AS system_event_id,
    et.description AS event_type,
    se.description AS event_description,
    se.occured_at,
    se.resolved_at,
    e.name AS resolver_name,
    s.name AS system_name
FROM
    system_events se
JOIN
    event_types et ON se.event_type_id = et.id
LEFT JOIN
    employees e ON se.resolver_id = e.id
JOIN
    systems s ON se.system_id = s.id;
