CREATE VIEW ReleaseNotesView AS
SELECT
    rn.id AS release_note_id,
    rn.name AS release_note_name,
    rn.new_features,
    rn.enhancements,
    rn.fixes,
    rn.active,
    rn.released_at,
    rn.last_modified_at,
    rn.broadcasted_at,
    s.name AS system_name,
    u.name AS approver_name,
    rs.description AS release_status
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
