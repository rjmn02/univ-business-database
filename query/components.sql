CREATE VIEW componentsView AS
SELECT
    components.name AS ComponentName,
    applications.name AS ApplicationName,
    component_statuses.description AS ComponentStatus,
    components.description AS ComponentDescription,
    component_types.description AS ComponentType,
    components.link AS ComponentLink,
    GROUP_CONCAT(DISTINCT systems.name ORDER BY systems.name ASC) AS Systems,
    COUNT(DISTINCT systems.id) AS SystemsCount,
    components.record_errors AS RecordErrors,
    creator.name AS CreatedBy,
    modifier.name AS ModifiedBy,
    components.created_at AS CreatedAt,
    MAX(component_edit_history.modified_at) AS ModifiedAt
FROM
    components
JOIN
    component_statuses ON components.status_id = component_statuses.id
JOIN
    component_types ON components.type_id = component_types.id
JOIN
    system_components ON components.id = system_components.component_id
JOIN
    systems ON system_components.system_id = systems.id
LEFT JOIN
    component_edit_history ON components.id = component_edit_history.component_id
LEFT JOIN
    employees AS creator ON components.creator_id = creator.id
LEFT JOIN
    employees AS modifier ON component_edit_history.modified_by = modifier.id
LEFT JOIN
    system_applications ON systems.id = system_applications.system_id
LEFT JOIN
    applications ON system_applications.application_id = applications.id
GROUP BY
    components.id, ComponentName, ApplicationName, ComponentStatus, ComponentDescription, ComponentType,
    ComponentLink, RecordErrors, CreatedBy, ModifiedBy, CreatedAt;