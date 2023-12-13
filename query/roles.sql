CREATE VIEW RolesView AS
SELECT
    e.id AS employee_id,
    e.name AS employee_name,
    e.status_id,
    es.description AS employee_status,
    e.email_address,
    e.slack_member_id,
    e.asana_user_id,
    r.id AS role_id,
    r.name AS role_name,
    s.name AS system_name
FROM
    employees e
JOIN
    roles r ON e.role_id = r.id
JOIN
    systems s ON e.id = s.approver_id 
JOIN
    employee_statuses es ON e.status_id = es.id;
