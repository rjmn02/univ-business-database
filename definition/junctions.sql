CREATE IF NOT EXISTS TABLE system_teams (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  system_id INT NOT NULL,
  team_id INT NOT NULL
);

CREATE IF NOT EXISTS TABLE ticket_entities (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  ticket_id INT NOT NULL,
  entity_id INT NOT NULL
);

CREATE IF NOT EXISTS TABLE component_edit_history (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  component_id INT NOT NULL,
  modified_by INT NOT NULL,
  modified_at DATETIME NOT NULL
);

CREATE IF NOT EXISTS TABLE system_approvers (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  system_id INT NOT NULL,
  approver_id INT NOT NULL
);

CREATE IF NOT EXISTS TABLE billing_access (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  application_billing_information_id INT NOT NULL,
  roles_id INT NOT NULL
);

CREATE IF NOT EXISTS TABLE system_components (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  system_id INT NOT NULL,
  component_id INT NOT NULL
);

CREATE IF NOT EXISTS TABLE system_applications (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  system_id INT NOT NULL,
  application_id INT NOT NULL
);

CREATE IF NOT EXISTS TABLE ticket_assignees (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  ticket_id INT NOT NULL,
  assignee_id INT NOT NULL
);

CREATE IF NOT EXISTS TABLE system_event_reporters (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  system_event_id INT NOT NULL,
  reporter_id INT NOT NULL
);

CREATE IF NOT EXISTS TABLE system_tickets (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  system_id INT NOT NULL,
  ticket_id INT NOT NULL
);

CREAT IF NOT EXISTS TABLE ticket_dependencies (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  ticket_id INT NOT NULL,
  dependency_id INT NOT NULL
);

CREATE IF NOT EXISTS TABLE system_release_notes (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  system_id INT NOT NULL,
  release_note_id INT NOT NULL
);

CREATE IF NOT EXISTS TABLE projects (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  system_id INT NOT NULL,
  project_id INT NOT NULL
);

CREATE IF NOT EXISTS TABLE release_note_tickets (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  release_note_id INT NOT NULL,
  ticket_id INT NOT NULL
);
