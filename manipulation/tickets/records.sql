INSERT INTO tickets (
    title,
    due_date,
    projects_id,
    ticket_dependencies_id,
    priority_id,
    tier_id,
    slack_message_link,
    next_action_date,
    owner_id,
    access_approval_id,
    change_approval_id,
    status_id,
    type_id,
    system_id,
)
VALUES
('Automated New Website Order Tracker for PMs', NULL, 1, NULL, 3, 4, NULL, NULL, 'Michael Ian Alvarez', NULL, NULL, NULL, NULL, 2),
('Create a Client Feedback Survey Tracking System', '08-04', 1, NULL, 3, 3, 'https://myamazonguy.slack.com/archives/C043YL0NFSS/p169516899499059?thread_ts=1695156772.464619&cid=C043YL0NFSS', 'Jhovenell Manait', NULL, NULL, NULL, 3, 3),
('Ensure Pay Slip Automation is Fixed / Split Sheets', NULL, 1, NULL, 3, 2, NULL, '12-04', 'Bryce Gabenhart', NULL, NULL, NULL, NULL, 1),

-- AI generated
('Automate Weekly Report Generation for Marketing Team', '12-15', 2, NULL, 2, 3, 'https://teamchat.slack.com/archives/C0ABCDE12/p123456789012345?thread_ts=1234567890.123456&cid=C0ABCDE12', NULL, 'Emma Johnson', NULL, NULL, NULL, 1, 6),
('Upgrade Database Server to Latest Version', '12-20', 5, NULL, 1, 4, 'https://itops.slack.com/archives/C0FGHIJKL/p234567890123456?thread_ts=2345678901.234567&cid=C0FGHIJKL', NULL, 'Alex Mitchell', NULL, 1, NULL, 2, 4),
('Implement Two-Factor Authentication for User Login', '12-10', 3, NULL, 1, 2, 'https://security-team.slack.com/archives/C0MNOPQR/p345678901234567?thread_ts=3456789012.345678&cid=C0MNOPQR', NULL, 'Elena Rodriguez', 1, NULL, NULL, 4, 6);


INSERT INTO ticket_entities(tickets_id,entity_id) VALUES
(3,28),
(2,34),
(1,28),
(4,29),
(5,30),
(6,40);