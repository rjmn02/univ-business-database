INSERT INTO system_applications(system_id, application_id) VALUES
(1,13),
(2,14),
(3,15),
(4,16),
(5,17),
(6,18),
(7,18);

INSERT INTO release_note_tickets(release_note_id, ticket_id) VALUES
(1,13),
(1,13),
(4,15),

INSERT INTO billing_access(application_billing_information_id, roles_id) VALUES
(13,5),
(13,2),
(13,1),
(13,3),
(13,4),
(14,5),
(15,2),
(15,1),
(15,3),
(15,4),
(16,3),
(16,5),
(17,1),
(18,5);

INSERT INTO ticket_projects(ticket_id, project_id) VALUES
(13,2),
(14,2),
(15,2),
(16,2),
(17,2),
(18,2);

INSERT INTO ticket_assignees(assignee_id, ticket_id) VALUES
(10,13),
(11,14),
(13,15),
(15,16),
(19,17),
(21,18);

INSERT INTO ticket_dependencies (ticket_id, dependency_id)
VALUES
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18);

INSERT INTO ticket_entities (ticket_id, entity_id) VALUES
(13,8),
(14,14),
(15,8),
(16,9),
(17,9),
(18,9);

