-- Insert dummy data for "sandbox"."tb_sand_comm_code_base"
INSERT INTO "sandbox"."tb_sand_comm_code_base" ("code_type", "code_type_name", "is_active", "reg_by", "reg_dttm", "upd_by", "upd_dttm")
VALUES 
('USER_STATUS', 'Status codes for user accounts', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DEPARTMENT', 'Department codes', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DIVISION', 'Division codes', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'System codes', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('POSITION', 'Position codes', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('WORKING_SITE', 'Woriking Location codes', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('GENDER', 'Gender codes', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('OTP_TYPE', 'OTP type codes', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('OTP_PURPOSE', 'OTP purpose codes', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('USER_ROLE', 'Role codes for user accounts', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('MENU_CAT', 'Menu category codes for menu management', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SKILL_TYPE', 'Skill Types codes for skill management', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('EDU_TYPE', 'Education Types codes for Education management', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('CAREER_TYPE', 'Career Types codes for Career management', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('LANG_LVL', 'Languages level codes for skill management', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));

-- Insert dummy data for "sandbox"."tb_sand_comm_code_dtls"
INSERT INTO "sandbox"."tb_sand_comm_code_dtls" ("code_type", "comm_code", "comm_code_name", "order_index", "is_active", "reg_by", "reg_dttm", "upd_by", "upd_dttm")
VALUES 
-- User Status
('USER_STATUS', '01', 'Inactive', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('USER_STATUS', '02', 'Active', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('USER_STATUS', '03', 'Deleted', 3, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('USER_STATUS', '04', 'Locked', 4, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- Department
('DEPARTMENT', 'CTO_DEP', 'Department Chief Technology Officer', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DEPARTMENT', 'GDC_DEP', 'Department Glocal Delivery Center', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DEPARTMENT', 'LDC_DEP', 'Department Local Delivery Center', 3, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DEPARTMENT', 'PMQ_DEP', 'Department PMO & QA Team', 4, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DEPARTMENT', 'AIT_DEP', 'Department Architecture & Innovation Team', 5, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- Division
('DIVISION', 'CTO_DIV', 'Division Chief Technology Officer', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DIVISION', 'BSE_DIV', 'Division Bridge Software Engineer', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DIVISION', 'SFC_DIV', 'Division Smart Factory Core', 3, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DIVISION', 'SFA_DIV', 'Division Smart Facotory Automation', 4, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DIVISION', 'SFS_DIV', 'Division Smart Factory Solution', 5, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DIVISION', 'PMO_DIV', 'Division Project Manager Officer', 6, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DIVISION', 'QA_DIV', 'Division Quality Assurance', 7, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- System
('SYSTEM', 'MES', 'Manufacturing Execution System', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'MHS', 'Material Handling System', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'MMD', 'Manufacturing Master Data', 3, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'PDA', 'Personal Digital Assistant', 4, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'EIF', 'Equipment Interface', 5, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'RTD', 'Real-Time Dispatcher', 6, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'MCS', 'Material Control System', 7, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'CIM', 'Computer Integrated Machine', 8, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'SPC', 'Statistical Process Control', 9, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'FDC', 'Fault Detection & Classification', 10, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'IRS', 'Image Re-Inspection System', 11, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'VCT', 'Virtual Computed Tomography', 12, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'OCAP', 'Out of Control Action Plan', 13, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'RMS', 'Recipe Management System', 14, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- Position
('POSITION', 'CTO_POS', 'Position Chief Technology Officer', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('POSITION', 'BSE_POS', 'Position Bridge Software Engineer Position', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('POSITION', 'SPSE_POS', 'Position Specialist Software Engineer', 3, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('POSITION', 'ASSE_POS', 'Position Assistant Software Engineer', 4, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- Working site
('WORKING_SITE', 'JKT', 'Jakarta', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('WORKING_SITE', 'KRW', 'Karawang', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('WORKING_SITE', 'CJ', 'Cheong-Ju', 3, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- Gender
('GENDER', 'M', 'Male', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('GENDER', 'F', 'Female', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- OTP type
('OTP_TYPE', 'EMAIL', 'Email OTP', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('OTP_TYPE', 'SMS', 'SMS OTP', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('OTP_TYPE', 'APP', 'APP OTP', 3, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- OTP purpose
('OTP_PURPOSE', 'REG', 'Registration OTP', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('OTP_PURPOSE', 'PWD', 'Password Reset OTP', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('OTP_PURPOSE', 'VER', 'Account Verification OTP', 3, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- User role
('USER_ROLE', 'SUPER_ADMIN', 'Super Administrator with full access', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('USER_ROLE', 'ADMIN_1', 'Administrator with extended access 1', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('USER_ROLE', 'ADMIN_2', 'Administrator with extended access 2', 3, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('USER_ROLE', 'ADMIN_3', 'Administrator with extended access 3', 4, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('USER_ROLE', 'USER', 'Reguler user access', 5, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- Menu Category
('MENU_CAT', 'MENU_ADMIN', 'Admin', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('MENU_CAT', 'MENU_USER', 'User', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('MENU_CAT', 'MENU_ADMIN_USER', 'Admin and User', 3, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- Skill Type
('SKILL_TYPE', 'TECH', 'Technology', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SKILL_TYPE', 'SOFT', 'Softskill', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SKILL_TYPE', 'LANG', 'Language', 3, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- Eduaction Type
('EDU_TYPE', 'FORM', 'Formal', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('EDU_TYPE', 'INFORM', 'Informal', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- Eduaction Type
('CAREER_TYPE', 'WORK', 'Work Experience', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('CAREER_TYPE', 'PROJECT', 'Project Experience', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),

-- Language Level
('LANG_LVL', 'ELM', 'Elementary Level', 1, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('LANG_LVL', 'LMW', 'Limited Working', 2, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('LANG_LVL', 'PFW', 'Professional Working', 3, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('LANG_LVL', 'NOB', 'Native or Bilingual', 4, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));

-- tb_sand_user_base
INSERT INTO "sandbox"."tb_sand_user_base" 
(employee_id, username, personal_email, phone_number, "password", "status", activation_date, reg_by, reg_dttm)
VALUES 
('EMP001', 'jsmith', 'john.smith@email.com', '+821012345678', 'hashedpwd123', '01', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('EMP002', 'mjohnson', 'mary.johnson@email.com', '+821087654321', 'hashedpwd456', '01', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('EMP003', 'rlee', 'robert.lee@email.com', '+821098765432', 'hashedpwd789', '02', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('EMP004', 'izradum', 'izradum@email.com', '+821098765435', 'hashedpwd789', '02', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));

-- tb_sand_user_dtls
INSERT INTO "sandbox"."tb_sand_user_dtls" 
(user_id, fullname, working_email, department, division, working_site, gender, joined_date, reg_by, reg_dttm)
VALUES 
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'jsmith'), 'John Smith', 'john.smith@company.com', 'GDC_DEP', 'SFS_DIV', 'JKT', 'M', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'mjohnson'), 'Mary Johnson', 'mary.johnson@company.com', 'GDC_DEP', 'BSE_DIV', 'KRW', 'F', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'rlee'), 'Robert Lee', 'robert.lee@company.com', 'LDC_DEP', 'SFA_DIV', 'CJ', 'M', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'izradum'), 'Izri Addum', 'izri.addm@company.com', 'LDC_DEP', 'SFA_DIV, SFS_DIV', 'CJ', 'M', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));

-- Skills base table (jobportal schema)
INSERT INTO "jobportal"."tb_jobp_skill_base" 
(type, skill_name, reg_by, reg_dttm, is_deleted)
VALUES 
('TECH', 'Java Programming', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
('TECH', 'Python', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
('TECH', 'SQL', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
('TECH', 'React', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
('TECH', 'AWS', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
('SOFT', 'Project Management', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
('SOFT', 'Team Leadership', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
('LANG', 'English', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
('LANG', 'Korean', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
('LANG', 'Japanese', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false);

-- Education details (shared_profile schema)
INSERT INTO "shared_profile"."tb_profile_dtls_edu" 
(user_id, seq, type, institution_name, degree, field_of_study, grade, start_date, end_date, reg_by, reg_dttm, is_deleted)
VALUES 
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'jsmith'), 1, 'FORM', 'Stanford University', 'Bachelor of Science', 'Computer Science', 'A', EXTRACT(EPOCH FROM TIMESTAMP '2010-09-01'), EXTRACT(EPOCH FROM TIMESTAMP '2014-06-30'), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'jsmith'), 2, 'FORM', 'MIT', 'Master of Science', 'Artificial Intelligence', 'A-', EXTRACT(EPOCH FROM TIMESTAMP '2014-09-01'), EXTRACT(EPOCH FROM TIMESTAMP '2016-06-30'), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'mjohnson'), 1, 'FORM', 'Harvard University', 'Bachelor of Arts', 'Economics', 'B+', EXTRACT(EPOCH FROM TIMESTAMP '2012-09-01'), EXTRACT(EPOCH FROM TIMESTAMP '2016-06-30'), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'mjohnson'), 2, 'INFORM', 'Google', 'Certification', 'Data Analytics', 'Pass', EXTRACT(EPOCH FROM TIMESTAMP '2017-01-01'), EXTRACT(EPOCH FROM TIMESTAMP '2017-03-30'), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'rlee'), 1, 'FORM', 'Seoul National University', 'Bachelor of Engineering', 'Computer Engineering', 'A+', EXTRACT(EPOCH FROM TIMESTAMP '2011-03-01'), EXTRACT(EPOCH FROM TIMESTAMP '2015-02-28'), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'izradum'), 1, 'FORM', 'University of Maryland', 'Bachelor of Science', 'Information Systems', 'A-', EXTRACT(EPOCH FROM TIMESTAMP '2010-09-01'), EXTRACT(EPOCH FROM TIMESTAMP '2014-05-30'), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'izradum'), 2, 'FORM', 'Georgia Tech', 'Master of Science', 'Cybersecurity', 'A', EXTRACT(EPOCH FROM TIMESTAMP '2015-08-01'), EXTRACT(EPOCH FROM TIMESTAMP '2017-05-30'), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false);

-- Career details (shared_profile schema)
INSERT INTO "shared_profile"."tb_profile_dtls_career" 
(user_id, seq, type, name, affiliation, position, employement_type, tech_stack, responsibility, start_date, end_date, is_still_there, reg_by, reg_dttm, is_deleted)
VALUES 
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'jsmith'), '1', 'WORK', 'Google', 'Engineering', 'Software Engineer', 'FULLTIME', 'Java, Python, Kubernetes', 'Developed backend services for Google Cloud Platform', EXTRACT(EPOCH FROM TIMESTAMP '2016-07-01'), EXTRACT(EPOCH FROM TIMESTAMP '2020-06-30'), false, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'jsmith'), '2', 'PROJECT', 'Current Company', 'GDC', 'Senior Developer', 'FULLTIME', 'Java, Spring, AWS', 'Leading development of microservices architecture', EXTRACT(EPOCH FROM TIMESTAMP '2020-07-01'), NULL, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'mjohnson'), '1', 'WORK', 'Amazon', 'Finance', 'Financial Analyst', 'FULLTIME', 'SQL, Excel, Tableau', 'Performed financial analysis and forecasting', EXTRACT(EPOCH FROM TIMESTAMP '2016-08-01'), EXTRACT(EPOCH FROM TIMESTAMP '2019-12-31'), false, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'mjohnson'), '2', 'PROJECT', 'Current Company', 'BSE', 'Business Solutions Expert', 'FULLTIME', 'SQL, PowerBI, Python', 'Developing business intelligence solutions', EXTRACT(EPOCH FROM TIMESTAMP '2020-02-01'), NULL, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'rlee'), '1', 'WORK', 'Samsung', 'R&D', 'Research Engineer', 'FULLTIME', 'C++, Python, TensorFlow', 'Developed machine learning algorithms for image processing', EXTRACT(EPOCH FROM TIMESTAMP '2015-03-01'), EXTRACT(EPOCH FROM TIMESTAMP '2021-02-28'), false, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'rlee'), '2', 'PROJECT', 'Current Company', 'LDC', 'AI Engineer', 'FULLTIME', 'Python, PyTorch, Kubernetes', 'Implementing AI solutions for business processes', EXTRACT(EPOCH FROM TIMESTAMP '2021-03-01'), NULL, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'izradum'), '1', 'WORK', 'Microsoft', 'Security', 'Security Analyst', 'FULLTIME', 'Python, SIEM tools, Network Security', 'Implemented security protocols and monitored threats', EXTRACT(EPOCH FROM TIMESTAMP '2017-06-01'), EXTRACT(EPOCH FROM TIMESTAMP '2022-05-31'), false, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'izradum'), '2', 'PROJECT', 'Current Company', 'LDC', 'Security Architect', 'FULLTIME', 'Cloud Security, IAM, DevSecOps', 'Designing and implementing security architecture', EXTRACT(EPOCH FROM TIMESTAMP '2022-06-15'), NULL, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false);

-- User skills (shared_profile schema)
INSERT INTO "shared_profile"."tb_profile_dtls_skill" 
(user_id, seq, skill_id, language_level, level_or_score, reg_by, reg_dttm, is_deleted)
VALUES 
-- John Smith's skills
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'jsmith'), '1', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'Python'), NULL, 'Expert', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'jsmith'), '2', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'Project Management'), NULL, 'Intermediate', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'jsmith'), '3', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'English'), 'NOB', 'Advanced', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'jsmith'), '4', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'Korean'), 'PFW', 'Fluent', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
-- Mary Johnson's skills
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'mjohnson'), '1', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'SQL'), NULL, 'Expert', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'mjohnson'), '2', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'Team Leadership'), NULL, 'Advanced', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'mjohnson'), '3', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'English'), 'PFW', 'Fluent', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'mjohnson'), '4', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'Korean'), 'LMW', 'Conversational', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
-- Robert Lee's skills
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'rlee'), '1', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'AWS'), NULL, 'Expert', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'rlee'), '2', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'Team Leadership'), NULL, 'Intermediate', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'rlee'), '3', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'English'), 'PFW', 'Advanced', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'rlee'), '4', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'Korean'), 'LMW', 'Professional', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'rlee'), '5', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'Japanese'), 'ELM', 'Native', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
-- Izri Addum's skills
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'izradum'), '1', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'Java Programming'), NULL, 'Advanced', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'izradum'), '2', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'React'), NULL, 'Expert', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'izradum'), '3', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'English'), 'NOB', 'Fluent', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'izradum'), '4', 
(SELECT skill_id FROM "jobportal"."tb_jobp_skill_base" WHERE skill_name = 'Korean'), 'ELM', 'Basic', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), false);

-- tb_sand_role_base
INSERT INTO "sandbox"."tb_sand_role_base" 
("role", "description", is_default, is_system, order_index, reg_by, reg_dttm)
VALUES 
('SUPER_ADMIN', 'Super Administrator with full access', false, true, 1, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('ADMIN_1', 'Administrator with extended access 1', false, true, 2, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('ADMIN_2', 'Administrator with extended access 2', false, true, 3, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('ADMIN_3', 'Administrator with extended access 3', false, true, 4, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('USER', 'Reguler user access', true, true, 5, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));

-- tb_sand_user_role
INSERT INTO "sandbox"."tb_sand_user_role" 
(user_id, role_id, is_primary, reg_by, reg_dttm)
VALUES 
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'jsmith'), 
 (SELECT role_id FROM "sandbox"."tb_sand_role_base" WHERE "role" = 'SUPER_ADMIN'), 
 true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'mjohnson'), 
 (SELECT role_id FROM "sandbox"."tb_sand_role_base" WHERE "role" = 'ADMIN_2'), 
 true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'rlee'), 
 (SELECT role_id FROM "sandbox"."tb_sand_role_base" WHERE "role" = 'USER'), 
 true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));

-- tb_sand_group_category
INSERT INTO "sandbox"."tb_sand_group_category" 
(group_cat, "description", is_classification, reference_code_type, reg_by, reg_dttm)
VALUES 
('DEPARTMENT', 'Department Groups', true, 'DEPARTMENT', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DIVISION', 'Project Teams', true, 'DIVISION', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('SYSTEM', 'System Teams', true, 'SYSTEM', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('POSITION', 'Position Groups', true, 'POSITION', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));

-- tb_sand_group_base
INSERT INTO "sandbox"."tb_sand_group_base" 
(group_cat, "group_id", "description", reference_code, auto_assign, reg_by, reg_dttm)
VALUES 
('DEPARTMENT', 'GDC', 'Global Delivery Center', 'GDC_DEP', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('DIVISION', 'SFS', 'Smart Factory Solution', 'SFS_DIV', true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));

-- tb_sand_user_group
INSERT INTO "sandbox"."tb_sand_user_group" 
(user_id, "group_id", is_primary, start_date, reg_by, reg_dttm)
VALUES 
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'jsmith'),
 'GDC', true, EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'mjohnson'),
 'SFS', true, EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));

-- tb_sand_menu_base
INSERT INTO "sandbox"."tb_sand_menu_base" 
(menu_name, menu_cat, description, path, parent_id, menu_level, order_index, reg_by, reg_dttm)
VALUES 
('Dashboard', 'MENU_USER', 'Main Dashboard', '/dashboard', null, 1, 1, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('User Management', 'MENU_USER', 'User Management Section', '/users', null, 1, 2, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('Roles', 'MENU_ADMIN', 'Role Management', '/users/roles', (SELECT menu_id from "sandbox"."tb_sand_menu_base" WHERE menu_name = 'User Management'), 2, 1, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('Groups', 'MENU_ADMIN', 'Group Management', '/users/groups', (SELECT menu_id from "sandbox"."tb_sand_menu_base" WHERE menu_name = 'User Management'), 2, 2, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('Role Permissions', 'MENU_ADMIN', 'Role Permission Management', '/users/roles/permissions', (SELECT menu_id from "sandbox"."tb_sand_menu_base" WHERE menu_name = 'User Management'), 3, 1, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
('Group Categories', 'MENU_ADMIN_USER', 'Group Category Management', '/users/groups/categories', (SELECT menu_id from "sandbox"."tb_sand_menu_base" WHERE menu_name = 'User Management'), 3, 2, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));

-- tb_sand_role_menu_accs
INSERT INTO "sandbox"."tb_sand_role_menu_accs" 
(role_id, menu_id, user_id, is_read, is_create, is_modify, is_delete, reg_by, reg_dttm)
VALUES 
((SELECT role_id FROM "sandbox"."tb_sand_role_base" WHERE "role" = 'USER'), 
(SELECT menu_id FROM "sandbox"."tb_sand_menu_base" WHERE menu_name = 'Dashboard' AND menu_cat = 'MENU_USER'),
 NULL, true, true, true, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
((SELECT role_id FROM "sandbox"."tb_sand_role_base" WHERE "role" = 'ADMIN_2'), 
(SELECT menu_id FROM "sandbox"."tb_sand_menu_base" WHERE menu_name = 'User Management' AND menu_cat = 'MENU_USER'),
 NULL, true, true, false, false, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
((SELECT role_id FROM "sandbox"."tb_sand_role_base" WHERE "role" = 'SUPER_ADMIN'), 
(SELECT menu_id FROM "sandbox"."tb_sand_menu_base" WHERE menu_name = 'Roles' AND menu_cat = 'MENU_ADMIN'),
 NULL, true, true, true, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP)),
((SELECT role_id FROM "sandbox"."tb_sand_role_base" WHERE "role" = 'ADMIN_3'), 
(SELECT menu_id FROM "sandbox"."tb_sand_menu_base" WHERE menu_name = 'Group Categories' AND menu_cat = 'MENU_ADMIN_USER'),
(SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'izradum'), 
 true, true, true, true, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));

-- tb_sand_otp_base
INSERT INTO "sandbox"."tb_sand_otp_base" 
(user_id, otp_code, type_code, purpose_code, is_used, exp_dttm, reg_by, reg_dttm)
VALUES 
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'jsmith'),
 '123456', 'EMAIL', 'REG', false, 1805392000000, 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));

-- tb_sand_user_status_log
INSERT INTO "sandbox"."tb_sand_user_status_log" 
(user_id, old_status, new_status, reason, reg_by, reg_dttm)
VALUES 
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'rlee'),
 '02', '01', 'Account deactivated due to inactivity', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));

-- tb_sand_login_attempt
INSERT INTO "sandbox"."tb_sand_login_attempt" 
(user_id, attempt_dttm, is_successful, ip_address, user_agent, reg_by, reg_dttm)
VALUES 
((SELECT user_id FROM "sandbox"."tb_sand_user_base" WHERE username = 'jsmith'),
 EXTRACT(EPOCH FROM CURRENT_TIMESTAMP), true, '192.168.1.100', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'SYSTEM', EXTRACT(EPOCH FROM CURRENT_TIMESTAMP));
