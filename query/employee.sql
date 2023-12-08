CREATE VIEW EmployeeView AS
SELECT
    e.id AS employee_id,
    e.name AS employee_name,
    e.status_id,
    es.description AS employee_status,
    e.email_address,
    e.slack_member_id,
    e.asana_user_id,
    e.role_id,
    r.name AS role_name
FROM
    employees e
JOIN
    employee_statuses es ON e.status_id = es.id
JOIN
    roles r ON e.role_id = r.id;
