INSERT INTO component_edit_history(component_id, modified_by, modified_at) VALUES
(2, 15, '2023-10-13 11:21:00'),
(3, 22, '2023-11-10 11:32:00'),
(4, 17, '2023-10-13 11:24:00'),
(5, 18, '2023-11-21 16:44:00'),
(1, 22, '2023-10-27 00:01:00'),

(6, 13, '2023-09-03 12:12:00'),
(7, 14, '2023-03-27 15:47:00');

INSERT INTO system_approvers(system_id, employee_id) VALUES
(1, 9),
(2, 20),
(3, 9),
(4, 21),
(5, 20),
(6, 11),
(7, 11);

INSERT INTO system_event_reporters(event_id, it_member_id) VALUES
(1, 11),
(2, 22),
(3, 17),
(4, 14),
(5, 14),
(6, 13),
(7, 18);

INSERT INTO system_release_notes(system_id, release_note_id) VALUES
(2 ,1),
(2 ,2),
(5 ,3),
(3 ,4),
(6 ,5),
(6 ,4),;
