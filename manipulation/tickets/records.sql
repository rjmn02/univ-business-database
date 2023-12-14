INSERT INTO tickets (
    title,
    due_date,
    project_id,
    ticket_dependency_id,
    priority_id,
    tier_id,
    slack_message_link,
    next_action_date,
    owner_id,
    access_approval_id,
    change_approval_id,
    status_id,
    type_id,
    system_id
)
VALUES
('Automated New Website Order Tracker for PMs', NULL, 2, NULL, 3, 4, NULL, NULL, 12, NULL, NULL, NULL, 3, 2),
('Create a Client Feedback Survey Tracking System', '08-04', 2, NULL, 3, 3, 'https://myamazonguy.slack.com/archives/C043YL0NFSS/p169516899499059?thread_ts=1695156772.464619&cid=C043YL0NFSS', 'Jhovenell Manait', 9, NULL, NULL, NULL, 3, 3),
('Ensure Pay Slip Automation is Fixed / Split Sheets', NULL, 2, NULL, 3, 2, NULL, '12-04', 17, NULL, NULL, NULL, 3, 1),
('Automate Weekly Report Generation for Marketing Team', '12-15', 2, NULL, 2, 3, 'https://teamchat.slack.com/archives/C0ABCDE12/p123456789012345?thread_ts=1234567890.123456&cid=C0ABCDE12', NULL, 14, NULL, NULL, NULL, 1, 6),
('Upgrade Database Server to Latest Version', '12-20', 2, NULL, 1, 4, 'https://itops.slack.com/archives/C0FGHIJKL/p234567890123456?thread_ts=2345678901.234567&cid=C0FGHIJKL', NULL, 21, NULL, 1, NULL, 2, 4),
('Implement Two-Factor Authentication for User Login', '12-10', 2, NULL, 1, 2, 'https://security-team.slack.com/archives/C0MNOPQR/p345678901234567?thread_ts=3456789012.345678&cid=C0MNOPQR', NULL, 10, 1, NULL, NULL, 4, 6);

ALTER TABLE tickets
MODIFY COLUMN due_date DATETIME;

UPDATE tickets
SET due_date = '2023-01-01 12:00:00'
WHERE title = 'Automated New Website Order Tracker for PMs';

UPDATE tickets
SET due_date = '2023-08-04 15:30:00'
WHERE title = 'Create a Client Feedback Survey Tracking System';

UPDATE tickets
SET due_date = '2023-12-04 09:00:00'
WHERE title = 'Ensure Pay Slip Automation is Fixed / Split Sheets';

UPDATE tickets
SET entity_id = 8
WHERE title = 'Automated New Website Order Tracker for PMs';

UPDATE tickets
SET entity_id = 14
WHERE title = 'Create a Client Feedback Survey Tracking System';

UPDATE tickets
SET entity_id = 8
WHERE title = 'Ensure Pay Slip Automation is Fixed / Split Sheets';

UPDATE tickets
SET entity_id = 9
WHERE title = 'Automate Weekly Report Generation for Marketing Team';

UPDATE tickets
SET entity_id = 9
WHERE title = 'Upgrade Database Server to Latest Version';

UPDATE tickets
SET entity_id = 9
WHERE title = 'Implement Two-Factor Authentication for User Login ';

UPDATE tickets
SET next_action_date = '0000-00-00 00:00:00';