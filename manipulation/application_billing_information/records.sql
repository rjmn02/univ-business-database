INSERT INTO application_billing_information (
    billable_users,
    application_id,
    billing_frequency_id,
    cost_per_year_per_month,
    cost_per_year_per_year,
    cost_per_month,
    cost_per_year,
    billing_amount,
    billing_page_link,
    cost_audit_frequency,
    last_cost_audit,
    next_cost_audit,
    payment_method_id,
    invoice_ninja_id,
)
VALUES
('', 1, 5, '', '', 82.50, 990.00, 990.00, 'https://www.jotform.com/myaccount/billing', 5, '', '2023-04-01', 1, 'None', '4zbqjYlDdp'),
(1, 2, 7, '', '', '', '', 12.28, 'https://www.render.com/billing', 5, '2023-10-28', '2023-11-28', 4, 'None', NULL),
(215, 3, 3, 17.00, 204.00, 3655.00, 43860.00, 3655.00, 'https://admin.google.com/ac/billing', 5, '2023-11-30', '2023-12-30', 2, 'None', 'jneg5LnZbw'),

-- AI generated
(150, 6, 4, 19.99, 239.88, 19.99, 239.88, 199.99, 'https://zapier.com/myaccount/billing', 4, '2023-11-25', '2023-12-25', 5, 'None', 'ZpR123'),
(100, 7, 5, 9.99, 119.88, 9.99, 119.88, 99.99, 'https://ifttt.com/myaccount/billing', 6, '2023-11-22', '2023-12-22', 3, 'None', 'Ift987'),
(200, 8, 1, 14.99, 179.88, 14.99, 179.88, 149.99, 'https://airtable.com/myaccount/billing', 5, '2023-11-18', '2023-12-18', 1, 'None', 'AT123');