ALTER TABLE application_billing_information
MODIFY COLUMN application_id INT NULL;

ALTER TABLE applications
MODIFY COLUMN billing_information_id INT NULL;

INSERT INTO application_billing_information (
    billable_users,
    application_id,
    billing_frequency_id,
    cost_per_user_per_month,
    cost_per_user_per_year,
    cost_per_month,
    cost_per_year,
    billing_amount,
    billing_page_link,
    cost_audit_frequency_id,
    last_cost_audit,
    next_cost_audit,
    payment_method_id,
    invoice_ninja_id
)
VALUES
    (0, NULL, 5, NULL, NULL, 82.50, 990.00, 990.00, 'https://www.jotform.com/myaccount/billing', 5, NULL, '2023-04-01', 1, '4zbqjYlDdp'),
    (1, NULL, 7, NULL, NULL, NULL, NULL, 12.28, 'https://www.render.com/billing', 5, '2023-10-28', '2023-11-28', 4, ''),
    (215, NULL, 3, 17.00, 204.00, 3655.00, 43860.00, 3655.00, 'https://admin.google.com/ac/billing', 5, '2023-11-30', '2023-12-30', 2, 'jneg5LnZbw'),
    (150, NULL, 4, 19.99, 239.88, 19.99, 239.88, 199.99, 'https://zapier.com/myaccount/billing', 4, '2023-11-25', '2023-12-25', 5, 'ZpR123'),
    (100, NULL, 5, 9.99, 119.88, 9.99, 119.88, 99.99, 'https://ifttt.com/myaccount/billing', 6, '2023-11-22', '2023-12-22', 3, 'Ift987'),
    (200, NULL, 1, 14.99, 179.88, 14.99, 179.88, 149.99, 'https://airtable.com/myaccount/billing', 5, '2023-11-18', '2023-12-18', 1, 'AT123');


INSERT INTO applications(
    name,
    website_homepage_link,
    status_id,
    billing_information_id,
    record_errors
)
VALUES
    ('Jotform', 'https://www.jotform.com', 1, NULL, 'None'),
    ('Render', 'https://www.render.com', 1, NULL, 'None'),
    ('Google Workspace - My Amazon Guy', 'https://www.google.com', 1, NULL, 'None'),
    ('Zapier', 'https://www.zapier.com', 1, NULL, 'None'),
    ('IFTTT', 'https://www.ifttt.com', 1, NULL, 'None'),
    ('Airtable', 'https://www.airtable.com', 2, NULL, 'None');


UPDATE application_billing_information
SET application_id = 13
WHERE id = 13;

UPDATE application_billing_information
SET application_id = 14
WHERE id = 14;

UPDATE application_billing_information
SET application_id = 15
WHERE id = 15;

UPDATE application_billing_information
SET application_id = 16
WHERE id = 16;

UPDATE application_billing_information
SET application_id = 17
WHERE id = 17;

UPDATE application_billing_information
SET application_id = 18
WHERE id = 18;

--application--
UPDATE applications
SET billing_information_id = 13
WHERE id = 13;

UPDATE applications
SET billing_information_id = 14
WHERE id = 14;

UPDATE applications
SET billing_information_id = 15
WHERE id = 15;

UPDATE applications
SET billing_information_id = 16
WHERE id = 16;

UPDATE applications
SET billing_information_id = 17
WHERE id = 17;

UPDATE applications
SET billing_information_id = 18
WHERE id = 18;


--tickets--
UPDATE tickets
SET ticket_dependency_id = 25
WHERE id = 13;

UPDATE tickets
SET ticket_dependency_id = 26
WHERE id = 14;

UPDATE tickets
SET ticket_dependency_id = 27
WHERE id = 15;

UPDATE tickets
SET ticket_dependency_id = 28
WHERE id = 16;

UPDATE tickets
SET ticket_dependency_id = 29
WHERE id = 17;

UPDATE tickets
SET ticket_dependency_id = 30
WHERE id = 18;

--ticket_dependencies--
ALTER TABLE ticket_dependencies
MODIFY COLUMN depencency_id INT NOT NULL,
ADD FOREIGN KEY (dependency_id) REFERENCES tickets(id);


--applications--
ALTER TABLE application_billing_information
MODIFY COLUMN application_id INT,
ADD CONSTRAINT unique_application_id UNIQUE (application_id);

ALTER TABLE applications
MODIFY COLUMN billing_information_id INT,
ADD CONSTRAINT unique_billing_information_id UNIQUE (billing_information_id);