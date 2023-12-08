CREATE VIEW ProjectsView AS
SELECT
    p.id AS project_id,
    p.name AS project_name,
    st.system_id,
    s.name AS system_name
FROM
    projects p
JOIN
    system_teams st ON p.id = st.project_id
JOIN
    systems s ON st.system_id = s.id;
