INSERT INTO billing_frequencies (description) VALUES
('None'),
('One Time'),
('Monthly'),
('Quarterly'),
('Annually'),
('Billing Cycle'),
('Pay As You Go');

INSERT INTO cost_audit_frequencies (description) VALUES
('None'),
('Daily'),
('Weekly'),
('Event Other Week'),
('Monthly'),
('Every Other Month'),
('Quarterly'),
('Twice a Year'),
('Yearly');

INSERT INTO payment_methods (issuing_bank, cardholder_name, last_four_digits) VALUES
('Chase', 'Steven Pope', 4983),
('Capital One', 'Janriz Christian Prado', 1010),
('Visa', 'Christian Rhyss Jimenez', 2121),
('Mastercard', 'Jemriz Advincula', 3232),
('American Express', 'Thony Danielle Labrador', 4343);