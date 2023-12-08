INSERT INTO ticket_priorities (description) VALUES
('Low'),
('Medium'),
('High'),
('Critical');

INSERT INTO ticket_tiers (description, points) VALUES
('Tier 1 - Low Difficulty, Low Complexity', 1),
('Tier 2 - High Difficulty, Low Complexity', 8),
('Tier 3 - Low Difficulty, High Complexity', 32),
('Tier 4 - High Difficulty, High Complexity', 64);

INSERT INTO ticket_access_approvals (description) VALUES
('Requesting for Approval'),
('Approved'),
('Denied');

INSERT INTO ticket_change_approvals (description) VALUES
('Requesting for Approval'),
('Approved'),
('Denied');

INSERT INTO ticket_statuses (description) VALUES
('On Track'),
('At Risk'),
('Off Track'),
('Completed'),
('For Client Approval'),
('Approved');

INSERT INTO ticket_types (description) VALUES
('Question'),
('Incident'),
('Request'),
('Audit'),
('Root Caust Analysis'),
('QA');

INSERT INTO ticket_entity_choices (description) VALUES
('Client - Age of sage'),
('Service - MAG School'),
('Service - MAGai'),
('Service - My Agency Guy'),
('Service - My Chargeback Guy'),
('Service - Seller Central Jobs'),
('Service - SOP Library'),
('Team - Brand Management'),
('Team - Information Technology'),
('Team - Marketing'),
('Team - Sales'),
('Team - Social'),
('Team - Advertising'),
('Team - Recruiting'),
('Team - Website'),
('Team - Catalog'),
('Team - Copywriting'),
('Team - Operations'),
('Team - Project Management'),
('Org - Organization');