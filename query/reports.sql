/*REPORTS*/

CREATE VIEW SystemOverview AS
SELECT
    s.id AS SystemID,
    s.name AS SystemName,
    s.description AS SystemDescription,
    s.service_start AS ServiceStart,
    s.service_end AS ServiceEnd,
    ss.description AS SystemStatus,
    saf.description AS ITAuditFrequency,
    s.last_audit AS LastITAudit,
    s.next_audit AS NextITAudit,
    a.name AS Approver,
    GROUP_CONCAT(DISTINCT c.name ORDER BY c.name ASC) AS Components,
    COUNT(DISTINCT c.id) AS ComponentsCount,
    GROUP_CONCAT(DISTINCT t.title ORDER BY t.title ASC) AS RelatedTickets
FROM
    systems s
JOIN
    system_approvers sa ON s.id = sa.system_id
JOIN
    employees a ON sa.approver_id = a.id
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
GROUP BY
    s.id, SystemName, SystemDescription, ServiceStart, ServiceEnd, SystemStatus,
    ITAuditFrequency, LastITAudit, NextITAudit, Approver;




CREATE VIEW BillingInformationReport AS
SELECT
    pm.id AS PaymentID,
    pm.issuing_bank AS BankName,
    pm.card_holder_name AS CardHolderName,
    a.id AS ApplicationID,
    a.name AS ApplicationName,
    abi.cost_per_user_per_month AS CostPerUserPerMonth,
    abi.cost_per_user_per_year AS CostPerUserPerYear,
    abi.cost_per_month AS CostPerMonth,
    abi.cost_per_year AS CostPerYear,
    abi.billing_amount AS BillingAmount,
    abi.billing_page_link AS BillingPageLink,
    bf.description AS BillingFrequency,
    ast.description AS ApplicationStatus
FROM
    payment_methods pm
JOIN
    application_billing_information abi ON abi.payment_method_id = pm.id
JOIN
    billing_frequencies bf ON bf.id = abi.billing_frequency_id
JOIN
    applications a ON a.id = abi.application_id
JOIN
    application_statuses ast ON a.status_id = ast.id;




CREATE VIEW ReleaseNotesReport AS
SELECT
    rn.id AS ReleaseNoteID,
    rn.name AS ReleaseNoteName,
    rn.new_features AS NewFeatures,
    rn.enhancements AS Enhancements,
    rn.fixes AS Fixes,
    rn.active AS Active,
    rn.released_at AS ReleasedAt,
    rn.last_modified_at AS LastModifiedAt,
    rn.broadcasted_at AS BroadcastedAt,
    s.name AS SystemName,
    u.name AS ApproverName,
    rs.description AS ReleaseStatus
FROM
    release_notes rn
JOIN
    system_release_notes srn ON rn.id = srn.release_note_id
JOIN
    systems s ON srn.system_id = s.id
JOIN
    system_approvers sa ON s.id = sa.system_id
JOIN
    employees u ON sa.approver_id = u.id
JOIN
    release_note_statuses rs ON rn.status_id = rs.id;




CREATE VIEW EmployeeActivityReport AS
SELECT
    e.id AS EmployeeID,
    e.name AS EmployeeName,
    e.email_address AS EmailAddress,
    r.name AS Role,
    COUNT(DISTINCT c.id) AS ComponentsCreated,
    COUNT(DISTINCT t.id) AS TicketsAssigned,
    COUNT(DISTINCT s.id) AS SystemsApproved,
    COUNT(DISTINCT rn.id) AS ReleaseNotesApproved
FROM
    employees e
LEFT JOIN
    components c ON e.id = c.creator_id
LEFT JOIN
    tickets t ON e.id = t.owner_id
LEFT JOIN
    system_approvers sa ON e.id = sa.approver_id
LEFT JOIN
    systems s ON sa.system_id = s.id
LEFT JOIN
    system_release_notes srn ON s.id = srn.system_id
LEFT JOIN
    release_notes rn ON srn.release_note_id = rn.id
LEFT JOIN
    roles r ON e.role_id = r.id
GROUP BY
    e.id, EmployeeName, EmailAddress, Role;





CREATE VIEW TicketStatusReport AS
SELECT
    ts.id AS TicketStatusID,
    ts.description AS TicketStatus,
    COUNT(t.id) AS TotalTickets,
    SUM(CASE WHEN ts.description = 'Open' THEN 1 ELSE 0 END) AS OpenTickets,
    SUM(CASE WHEN ts.description = 'Closed' THEN 1 ELSE 0 END) AS ClosedTickets,
    SUM(CASE WHEN ts.description = 'Pending' THEN 1 ELSE 0 END) AS PendingTickets,
    p.name AS ProjectName,
    tt.description AS TicketType,
    pr.description AS Priority,
    s.name AS SystemName
FROM
    ticket_statuses ts
LEFT JOIN
    tickets t ON ts.id = t.status_id
LEFT JOIN
    projects p ON t.project_id = p.id
LEFT JOIN
    ticket_types tt ON t.type_id = tt.id
LEFT JOIN
    ticket_priorities pr ON t.priority_id = pr.id
LEFT JOIN
    systems s ON t.system_id = s.id
GROUP BY
    ts.id, TicketStatus, ProjectName, TicketType, Priority, SystemName;




CREATE VIEW ProjectStatusReport AS
SELECT
    p.id AS ProjectID,
    p.name AS ProjectName,
    NULL AS ProjectDescription,
    GROUP_CONCAT(DISTINCT t.title ORDER BY t.title ASC) AS Tickets,
    MAX(t.due_date) AS DueDate,
    GROUP_CONCAT(DISTINCT e.name ORDER BY e.name ASC) AS TeamMembers
FROM
    projects p
JOIN
    ticket_projects tp ON p.id = tp.project_id
JOIN
    tickets t ON tp.ticket_id = t.id
JOIN
    employees e ON e.id = t.owner_id
GROUP BY
    p.id, ProjectName, ProjectDescription;




CREATE VIEW AuditStatusReport AS
SELECT
    s.id AS SystemID,
    s.name AS SystemName,
    s.last_audit AS LastITAudit,
    s.next_audit AS NextITAudit,
    sas.description AS AuditStatus
FROM
    systems s
LEFT JOIN
    system_audit_statuses sas ON s.audit_status_id = sas.id;




CREATE VIEW ComponentsViewReport AS
SELECT
    c.id AS ComponentID,
    c.name AS ComponentName,
    c.description AS ComponentDescription,
    cs.description AS ComponentStatus,
    ct.description AS ComponentType,
    c.link AS ComponentLink,
    GROUP_CONCAT(DISTINCT s.name ORDER BY s.name ASC) AS Systems,
    COUNT(DISTINCT s.id) AS SystemsCount,
    c.record_errors AS RecordErrors,
    e.name AS CreatedBy,
    me.name AS ModifiedBy,
    c.created_at AS CreatedAt,
    MAX(ceh.modified_at) AS ModifiedAt
FROM
    components c
JOIN
    component_statuses cs ON c.status_id = cs.id
JOIN
    component_types ct ON c.type_id = ct.id
JOIN
    system_components sc ON c.id = sc.component_id
JOIN
    systems s ON sc.system_id = s.id
LEFT JOIN
    component_edit_history ceh ON c.id = ceh.component_id
LEFT JOIN
    employees e ON c.creator_id = e.id
LEFT JOIN
    employees me ON ceh.modified_by = me.id
GROUP BY
    c.id, ComponentName, ComponentDescription, ComponentStatus, ComponentType,
    ComponentLink, RecordErrors, CreatedBy, ModifiedBy, CreatedAt;





CREATE VIEW ITAuditFrequencyReport AS
SELECT
    s.id AS SystemID,
    s.name AS SystemName,
    saf.description AS ITAuditFrequency
FROM
    systems s
JOIN
    system_audit_frequencies saf ON s.audit_frequency_id = saf.id;

