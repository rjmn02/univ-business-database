INSERT INTO systems(name, description, service_start, service_end, status_id, audit_frequency_id, last_audit, next_audit, approver_id, video_sop_link, written_sop_link, flowchart_link, audit_status_id) VALUES
    ('Amazon FBA Calculator Quote', 'Fill out and submit to receive an email of total amazon fees from selling a product', '2023-03-30', '2025-09-22', 4, 7, '2023-11-22', '2024-02-22', 2, "", "", "", 3),
    ("Website Order Task/Record Creation", "Create a Task within Asana and record in the Client CRM when a website order is made", '2023-01-01', NULL, 3, 7, '2023-04-18', '2023-08-24', 4, "", "", "", 3),
    ("Automated Pay Slips", "Sends Pay Slips to international employees", '0000-00-00', NULL, 1, 7, NULL, '0000-00-00', 4, "", "", "", 1),
    
    --ChatGPT generated
    ('Customer Support', 'Handles customer inquiries and complaints', '2023-02-01', NULL, 3, 7, '2023-05-01', '2026-09-01', 1, '', '', '', 3),
    ('Employee Performance Review', 'Conduct quarterly performance reviews for all employees', '2023-01-15', NULL, 2, 90, '2023-04-15', '2023-07-15', 5, '', '', '', 2);    
INSERT INTO system_teams(team_id, system_id) VALUES
    (17,1),
    (17,2),
    (2,2),
    (9,3),
    (13,4),
    (10,5),
    (9,5);
