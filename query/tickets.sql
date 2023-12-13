CREATE VIEW TicketsView AS
SELECT
    t.id AS ticket_id,
    t.title AS ticket_title,
    t.due_date,
    p.name AS project_name,
    td.title AS dependency_title,
    pr.description AS priority,
    tt.description AS ticket_type,
    s.name AS system_name,
    t.status_id,
    ts.description AS ticket_status,
    te.description AS ticket_entity,
    t.system_id,
    t.project_id,
    t.owner_id,
    e.name AS owner_name,
    ta.due_date AS next_action_date,
    t.access_approval_id,
    t.change_approval_id,
    t.slack_message_link,
    t.ticket_dependency_id,
    s.video_sop_link AS release_link
FROM
    tickets t
JOIN
    projects p ON t.project_id = p.id
LEFT JOIN
    tickets td ON t.ticket_dependency_id = td.id
JOIN
    ticket_priorities pr ON t.priority_id = pr.id
JOIN
    ticket_types tt ON t.type_id = tt.id
JOIN
    systems s ON t.system_id = s.id
JOIN
    ticket_statuses ts ON t.status_id = ts.id
JOIN
    ticket_entity_choices te ON t.entity_id = te.id
JOIN
    employees e ON t.owner_id = e.id
LEFT JOIN
    tickets ta ON t.id = ta.ticket_dependency_id;
