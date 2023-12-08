CREATE VIEW ApplicationsView AS
SELECT
    a.id AS application_id,
    a.name AS application_name,
    a.website_homepage_link,
    a.record_errors AS application_record_errors,
    b.billable_users,
    b.cost_per_user_per_month,
    b.cost_per_user_per_year,
    b.cost_per_month,
    b.cost_per_year,
    b.billing_amount,
    b.billing_page_link,
    bf.description AS billing_frequency,
    bs.description AS application_status
FROM
    applications a
JOIN
    application_billing_information b ON a.billing_information_id = b.id
JOIN
    billing_frequencies bf ON b.billing_frequency_id = bf.id
JOIN
    application_statuses bs ON a.status_id = bs.id;
