CREATE VIEW SystemView AS
SELECT
    s.id AS system_id,
    s.name AS system_name,
    s.description AS system_description,
    a.name AS application_name,
    GROUP_CONCAT(DISTINCT c.name ORDER BY c.name ASC) AS components,
    COUNT(DISTINCT c.id) AS components_count,
    s.service_start AS service_start,
    s.service_end AS service_end,
    ss.description AS system_status,
    saf.description AS it_audit_frequency,
    s.last_audit AS last_it_audit,
    s.next_audit AS next_it_audit,
    approver.name AS approver,
    GROUP_CONCAT(DISTINCT t.title ORDER BY t.title ASC) AS tickets,
    GROUP_CONCAT(DISTINCT c.record_errors ORDER BY c.record_errors ASC) AS record_errors,
    s.video_sop_link AS has_video_sop,
    s.written_sop_link AS has_written_sop,
    s.id AS record_id,
    sas.description AS audit_status
FROM
    systems s
JOIN
    system_approvers sa ON s.id = sa.system_id
JOIN
    employees approver ON sa.approver_id = approver.id
JOIN
    applications a ON s.id = a.id
JOIN
    system_components sc ON s.id = sc.system_id
JOIN
    components c ON sc.component_id = c.id
JOIN
    system_statuses ss ON s.status_id = ss.id
JOIN
    system_audit_frequencies saf ON s.audit_frequency_id = saf.id
LEFT JOIN
    system_tickets st ON s.id = st.system_id
LEFT JOIN
    tickets t ON st.ticket_id = t.id
LEFT JOIN
    system_audit_statuses sas ON s.audit_status_id = sas.id
GROUP BY
    s.id, system_name, system_description, application_name, service_start, service_end, system_status,
    it_audit_frequency, last_it_audit, next_it_audit, approver, has_video_sop, has_written_sop, record_id, audit_status;
