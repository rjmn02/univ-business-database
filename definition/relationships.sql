ALTER TABLE employees
ADD FOREIGN KEY (status_id) REFERENCES employee_statuses(id),
ADD FOREIGN KEY (role_id) REFERENCES employee_roles(id);

ALTER TABLE components
ADD FOREIGN KEY (status_id) REFERENCES component_statuses(id),
ADD FOREIGN KEY (type_id) REFERENCES component_types(id);

ALTER TABLE systems
ADD FOREIGN KEY (status_id) REFERENCES system_statuses(id),
ADD FOREIGN KEY (audit_frequency_id) REFERENCES audit_frequencies(id),
ADD FOREIGN KEY (approver_id) REFERENCES employees(id),
ADD FOREIGN KEY (audit_satatus_id) REFERENCES audit_statuses(id);

ALTER TABLE system_teams
ADD FOREIGN KEY (system_id) REFERENCES systems(id),
ADD FOREIGN KEY (team_id) REFERENCES teams(id);

ALTER TABLE system_events
ADD FOREIGN KEY (event_type_id) REFERENCES event_types(id),
ADD FOREIGN KEY (system_id) REFERENCES systems(id),
ADD FOREIGN KEY (resolver_id) REFERENCES employees(id);

ALTER TABLE release_notes
ADD FOREIGN KEY (status_id) REFERENCES release_note_statuses(id);

ALTER TABLE application_billing_information
ADD FOREIGN KEY (application_id) REFERENCES applications(id),
ADD FOREIGN KEY (billing_frequency_id) REFERENCES billing_frequencies(id),
ADD FOREIGN KEY (cost_audit_frequency_id) REFERENCES audit_frequencies(id),
ADD FOREIGN KEY (payment_method_id) REFERENCES payment_methods(id);

ALTER TABLE applications
ADD FOREIGN KEY (status_id) REFERENCES application_statuses(id),
ADD FOREIGN KEY (billing_information_id) REFERENCES application_billing_information(id);

ALTER TABLE tickets
ADD FOREIGN KEY (ticket_dependency_id) REFERENCES ticket_dependencies(id),
ADD FOREIGN KEY (priority_id) REFERENCES ticket_priorities(id),
ADD FOREIGN KEY (tier_id) REFERENCES ticket_tiers(id),
ADD FOREIGN KEY (owner_id) REFERENCES employees(id),
ADD FOREIGN KEY (access_approval_id) REFERENCES ticket_access_approvals(id),
ADD FOREIGN KEY (change_approval_id) REFERENCES ticket_change_approvals(id),
ADD FOREIGN KEY (status_id) REFERENCES ticket_statuses(id),
ADD FOREIGN KEY (type_id) REFERENCES ticket_types(id),
ADD FOREIGN KEY (system_id) REFERENCES systems(id);

ALTER TABLE ticket_entities
ADD FOREIGN KEY (ticket_id) REFERENCES tickets(id),
ADD FOREIGN KEY (entity_id) REFERENCES ticket_entity_choices(id);

ALTER TABLE component_edit_history
ADD FOREIGN KEY (component_id) REFERENCES components(id),
ADD FOREIGN KEY (modified_by) REFERENCES employees(id);

ALTER TABLE system_approvers
ADD FOREIGN KEY (system_id) REFERENCES systems(id),
ADD FOREIGN KEY (approver_id) REFERENCES employees(id);

ALTER TABLE billing_access
ADD FOREIGN KEY (application_billing_information_id) REFERENCES application_billing_information(id),
ADD FOREIGN KEY (roles_id) REFERENCES roles(id);

ALTER TABLE system_components
ADD FOREIGN KEY (system_id) REFERENCES systems(id),
ADD FOREIGN KEY (component_id) REFERENCES components(id);

ALTER TABLE system_applications
ADD FOREIGN KEY (system_id) REFERENCES systems(id),
ADD FOREIGN KEY (application_id) REFERENCES applications(id);

ALTER TABLE ticket_assignees
ADD FOREIGN KEY (ticket_id) REFERENCES tickets(id),
ADD FOREIGN KEY (assignee_id) REFERENCES employees(id);

ALTER TABLE system_event_reporters
ADD FOREIGN KEY (system_event_id) REFERENCES system_events(id),
ADD FOREIGN KEY (reporter_id) REFERENCES employees(id);

ALTER TABLE system_tickets
ADD FOREIGN KEY (system_id) REFERENCES systems(id),
ADD FOREIGN KEY (ticket_id) REFERENCES tickets(id);

ALTER TABLE ticket_dependencies
ADD FOREIGN KEY (ticket_dependency_id) REFERENCES tickets(id);

ALTER TABLE system_tickets
ADD FOREIGN KEY (system_id) REFERENCES systems(id),
ADD FOREIGN KEY (ticket_id) REFERENCES tickets(id);

ALTER TABLE system_release_notes
ADD FOREIGN KEY (system_id) REFERENCES systems(id),
ADD FOREIGN KEY (release_note_id) REFERENCES release_notes(id);

ALTER TABLE ticket_projects
ADD FOREIGN KEY (ticket_id) REFERENCES tickets(id),
ADD FOREIGN KEY (project_id) REFERENCES projects(id);

ALTER TABLE release_note_tickets
ADD FOREIGN KEY (release_note_id) REFERENCES release_notes(id),
ADD FOREIGN KEY (ticket_id) REFERENCES tickets(id);