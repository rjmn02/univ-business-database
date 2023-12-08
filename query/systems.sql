CREATE VIEW systemView AS
SELECT
    systems.id AS SystemID,
    systems.name AS SystemName,
    systems.description AS SystemDescription,
    applications.name AS ApplicationName,
    GROUP_CONCAT(DISTINCT components.name ORDER BY components.name ASC) AS Components,
    COUNT(DISTINCT components.id) AS ComponentsCount,
    systems.service_start AS ServiceStart,
    systems.service_end AS ServiceEnd,
    system_statuses.description AS SystemStatus,
    system_audit_frequencies.description AS ITAuditFrequency,
    systems.last_audit AS LastITAudit,
    systems.next_audit AS NextITAudit,
    approver.name AS Approver,
    GROUP_CONCAT(DISTINCT tickets.title ORDER BY tickets.title ASC) AS Tickets,
    GROUP_CONCAT(DISTINCT components.record_errors ORDER BY components.record_errors ASC) AS RecordErrors,
    systems.video_sop_link AS HasVideoSOP,
    systems.written_sop_link AS HasWrittenSOP,
    systems.id AS RecordID,
    system_audit_statuses.description AS AuditStatus
FROM
    systems
JOIN
    system_approvers ON systems.id = system_approvers.system_id
JOIN
    employees AS approver ON system_approvers.approver_id = approver.id
JOIN
    applications ON systems.id = applications.id
JOIN
    system_components ON systems.id = system_components.system_id
JOIN
    components ON system_components.component_id = components.id
JOIN
    system_statuses ON systems.status_id = system_statuses.id
JOIN
    system_audit_frequencies ON systems.audit_frequency_id = system_audit_frequencies.id
LEFT JOIN
    system_tickets ON systems.id = system_tickets.system_id
LEFT JOIN
    tickets ON system_tickets.ticket_id = tickets.id
LEFT JOIN
    system_audit_statuses ON systems.audit_status_id = system_audit_statuses.id
GROUP BY
    systems.id, SystemName, SystemDescription, ApplicationName, ServiceStart, ServiceEnd, SystemStatus, ITAuditFrequency,
    LastITAudit, NextITAudit, Approver, HasVideoSOP, HasWrittenSOP, RecordID, AuditStatus;