CREATE IF NOT EXISTS TABLE roles (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(30) NOT NULL
);

CREATE IF NOT EXISTS TABLE employees (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(75) NOT NULL,
  status_id INT NOT NULL,
  email_address VARCHAR(50) NOT NULL,
  slack_member_id VARCHAR(20) NOT NULL,
  asana_user_id VARCHAR(20) NOT NULL,
  role_id INT NOT NULL
);

CREATE IF NOT EXISTS TABLE components (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(75) NOT NULL,
  status_id INT NOT NULL,
  description VARCHAR(500),
  type_id INT NOT NULL,
  link VARCHAR(200) NOT NULL,
  record_errors VARCHAR(500),
  creator_id INT NOT NULL,
  created_at DATETIME NOT NULL
);

CREATE IF NOT EXISTS TABLE systems (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(75) NOT NULL,
  description VARCHAR(500),
  service_start DATE NOT NULL,
  service_end DATE,
  status_id INT NOT NULL,
  audit_frequency_id INT NOT NULL,
  last_audit DATE,
  next_audit DATE NOT NULL,
  approver_id INT NOT NULL,
  video_sop_link VARCHAR(200),
  written_sop_link VARCHAR(200),
  flowchart_link VARCHAR(200),
  audit_status_id INT NOT NULL
);

CREATE IF NOT EXISTS TABLE system_events (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  event_type_id INT NOT NULL,
  system_id INT NOT NULL,
  description VARCHAR(500),
  occured_at DATETIME NOT NULL,
  resolved_at DATETIME,
  resolver_id INT
);

CREATE IF NOT EXISTS TABLE application_billing_information (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  billable_users INT NOT NULL,
  application_id INT NOT NULL,
  billing_frequency_id INT NOT NULL,
  cost_per_user_per_month DOUBLE(10,2),
  cost_per_user_per_year DOUBLE(10,2),
  cost_per_month DOUBLE(10,2),
  cost_per_year DOUBLE(10,2),
  billing_amount DOUBLE(10,2) NOT NULL,
  billing_page_link VARCHAR(200) NOT NULL,
  cost_audit_frequency_id INT NOT NULL,
  last_cost_audit DATE,
  next_cost_audit DATE NOT NULL,
  payment_method_id INT NOT NULL,
  invoice_ninja_id VARCHAR(20) NOT NULL
);

CREATE IF NOT EXISTS TABLE applications (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(75) NOT NULL,
  website_homepage_link VARCHAR(200) NOT NULL,
  status_id INT NOT NULL,
  billing_information_id INT NOT NULL,
  record_errors VARCHAR(500)
);

CREATE IF NOT EXISTS TABLE tickets (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  title VARCHAR(100) NOT NULL,
  due_date DATETIME,
  project_id INT NOT NULL,
  ticket_dependency_id INT,
  priority_id INT NOT NULL,
  tier_id INT NOT NULL,
  slack_message_link VARCHAR(200) NOT NULL,
  next_action_date DATETIME,
  owner_id INT NOT NULL,
  entity_id INT NOT NULL,
  access_approval_id INT,
  change_approval_id INT,
  status_id INT,
  type_id INT NOT NULL,
  system_id INT
);

CREATE IF NOT EXISTS TABLE projects (
  id INT PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(75) NOT NULL
)