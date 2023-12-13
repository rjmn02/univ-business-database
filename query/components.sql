CREATE VIEW ComponentsView AS
SELECT
    c.id AS component_id,
    c.name AS component_name,
    a.name AS application_name,
    cs.description AS component_status,
    c.description AS component_description,
    ct.description AS component_type,
    c.link AS component_link,
    GROUP_CONCAT(DISTINCT s.name ORDER BY s.name ASC) AS systems,
    COUNT(DISTINCT s.id) AS systems_count,
    c.record_errors AS record_errors,
    creator.name AS created_by,
    modifier.name AS modified_by,
    c.created_at AS created_at,
    MAX(ceh.modified_at) AS modified_at
FROM
    components c
JOIN
    component_statuses cs ON c.status_id = cs.id
JOIN
    component_types ct ON c.type_id = ct.id
JOIN
    system_components sc ON c.id = sc.component_id
JOIN
    systems s ON sc.system_id = s.id
LEFT JOIN
    component_edit_history ceh ON c.id = ceh.component_id
LEFT JOIN
    employees AS creator ON c.creator_id = creator.id
LEFT JOIN
    employees AS modifier ON ceh.modified_by = modifier.id
LEFT JOIN
    system_applications sa ON s.id = sa.system_id
LEFT JOIN
    applications a ON sa.application_id = a.id
GROUP BY
    c.id, component_name, application_name, component_status, component_description, component_type,
    component_link, record_errors, created_by, modified_by, created_at;