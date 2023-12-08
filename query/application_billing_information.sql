CREATE VIEW ApplicationBillingInformationView AS
SELECT
    abi.id AS billing_info_id,
    abi.billable_users,
    abi.cost_per_user_per_month,
    abi.cost_per_user_per_year,
    abi.cost_per_month,
    abi.cost_per_year,
    abi.billing_amount,
    abi.billing_page_link,
    abi.cost_audit_frequency_id,
    abi.last_cost_audit,
    abi.next_cost_audit,
    abi.payment_method_id,
    abi.invoice_ninja_id,
    af.description AS billing_frequency,
    caf.description AS cost_audit_frequency,
    pm.issuing_bank,
    pm.card_holder_name,
    pm.last_four_digits
FROM
    application_billing_information abi
JOIN
    billing_frequencies af ON abi.billing_frequency_id = af.id
JOIN
    cost_audit_frequencies caf ON abi.cost_audit_frequency_id = caf.id
JOIN
    payment_methods pm ON abi.payment_method_id = pm.id;
