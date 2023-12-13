INSERT INTO system_applications(system_id, application_id) VALUES
(1,3),
(2,1),
(3,2),
(4,4),
(5,4),
(6,3),
(7,6);

INSERT INTO release_note_tickets(release_note_id, ticket_id) VALUES
(1,2),
(2,6),
(3,4),
(4,2),
(5,5),
(6,5);

INSERT INTO billing_access(application_billing_information_id, roles_id) VALUES
(1,5),
(1,2),
(1,1),
(1,3),
(1,4),
(2,5),
(3,2),
(3,1),
(3,3),
(3,4),
(4,3),
(4,5),
(5,1),
(6,5);

INSERT INTO ticket_dependencies(ticket_id, depencency_id) VALUES
(1,''),
(2,''),
(3,''),
(4,''),
(5,''),
(6,'');

INSERT INTO ticket_projects(ticket_id, project_id) VALUES
(1,2),
(2,2),
(3,2),
(4,2),
(5,2),
(6,2);

INSERT INTO ticket_assignees(employee_id, ticket_id) VALUES
(19,1),
(10,2),
(21,3),
(15,4),
(12,5),
(14,6);





