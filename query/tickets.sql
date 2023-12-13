CREATE VIEW TicketsView AS
SELECT
    t.id AS ticket_id,
    t.title AS ticket_title,
    p.name AS project_name,
    s.name AS system_name,
    t.priority_id,
    t.type_id,
    t.status_id,
    pr.description AS priority_description,
    tt.description AS type_description,
    ts.description AS status_description,
    td.title AS dependency_title,
    te.description AS ticket_entity,
    e.name AS owner_name,
    ta.due_date AS next_action_date
FROM
    tickets t
LEFT JOIN
    projects p ON t.project_id = p.id
LEFT JOIN
    systems s ON t.system_id = s.id
LEFT JOIN
    ticket_priorities pr ON t.priority_id = pr.id
LEFT JOIN
    ticket_types tt ON t.type_id = tt.id
LEFT JOIN
    ticket_statuses ts ON t.status_id = ts.id
LEFT JOIN
    tickets td ON t.ticket_dependency_id = td.id
LEFT JOIN
    ticket_entity_choices te ON t.entity_id = te.id
LEFT JOIN
    employees e ON t.owner_id = e.id
LEFT JOIN
    tickets ta ON t.id = ta.ticket_dependency_id;

