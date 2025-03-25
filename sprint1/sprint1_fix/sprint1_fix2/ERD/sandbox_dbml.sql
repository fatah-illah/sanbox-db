Project Sandbox {
  database_type: 'PostgreSQL'
}

// Common code tables
Table tb_sand_comm_code_base {
  code_type varchar [pk]
  code_type_name varchar
  is_active bool [default: true, not null]
  desc_attr1 varchar [note: 'Description for Additional properties']
  desc_attr2 varchar
  desc_attr3 varchar
  desc_attr4 varchar
  desc_attr5 varchar
  desc_attr6 varchar
  desc_attr7 varchar
  desc_attr8 varchar
  desc_attr9 varchar
  desc_attr10 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint
  is_deleted bool [default: false, not null]

  indexes {
    upd_dttm
  }

  Note: 'Master table for code groups'
}

Table tb_sand_comm_code_dtls {
  code_type varchar [ref: > tb_sand_comm_code_base.code_type]
  comm_code varchar [unique]
  comm_code_name varchar
  order_index int [not null]
  is_active bool [default: true, not null]
  attr1 varchar [note: 'Additional properties']
  attr2 varchar
  attr3 varchar
  attr4 varchar
  attr5 varchar
  attr6 varchar
  attr7 varchar
  attr8 varchar
  attr9 varchar
  attr10 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint
  is_deleted bool [default: false, not null]

  indexes {
    upd_dttm
  }

  Note: 'Detailed codes for each code group'
}

// Base user table
Table tb_sand_user_base {
  user_id varchar [pk]
  employee_id varchar [not null, unique, note: 'LGSM Employee ID']
  username varchar [not null, unique, note: '(G-Portal ID) or (Min 5 chars, alphanumeric, no special chars)']
  personal_email varchar [not null, unique, note: 'Personal/External email for OTP']
  phone_number varchar [unique]
  password varchar
  status varchar [not null, default: '01', ref: > tb_sand_comm_code_dtls.comm_code, note: 'FK to COMM_CODE: USER_STATUS']
  activation_date bigint
  failed_login_attempts int [default: 0, not null]
  last_login_attempt bigint
  attr1 varchar [note: 'Additional properties']
  attr2 varchar
  attr3 varchar
  attr4 varchar
  attr5 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint

  indexes {
    upd_dttm
  }

  Note: 'Stores base user information including login credentials and audit data'
}

// User details table
Table tb_sand_user_dtls {
  user_id varchar [pk, ref: > tb_sand_user_base.user_id]
  fullname varchar
  working_email varchar [unique]
  avtr_path text
  main_role varchar [default: 'USER', not null, ref: > tb_sand_comm_code_dtls.comm_code, note: 'FK to COMM_CODE: ROLE']
  // Arrays for static groupings
  added_role text [ref: > tb_sand_comm_code_dtls.comm_code, note: 'FK to COMM_CODE: ROLE']
  department text [not null, ref: > tb_sand_comm_code_dtls.comm_code, note: 'FK to COMM_CODE: DEPARTMENT']
  division text [ref: > tb_sand_comm_code_dtls.comm_code, note: 'FK to COMM_CODE: DIVISION']
  system text [ref: > tb_sand_comm_code_dtls.comm_code, note: 'FK to COMM_CODE: SYSTEM']
  position text [ref: > tb_sand_comm_code_dtls.comm_code, note: 'FK to COMM_CODE: POSITION']
  // Arrays for custom groupings
  custom_groupings text [note: 'Flexible JSONB for custom or dynamic groupings']
  mentor_id varchar [ref: > tb_sand_user_dtls.user_id]
  working_site varchar(10) [ref: > tb_sand_comm_code_dtls.comm_code, note: 'FK to COMM_CODE: WORKING_SITE']
  gender varchar [ref: > tb_sand_comm_code_dtls.comm_code, note: 'FK to COMM_CODE: GENDER']
  joined_date bigint
  korean_name varchar
  attr1 varchar [note: 'Additional properties']
  attr2 varchar
  attr3 varchar
  attr4 varchar
  attr5 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint
  is_deleted bool [default: false, not null]

  indexes {
    upd_dttm
  }

  Note: 'Contains detailed user information and classifications'
}

// OTP management
Table tb_sand_otp_base {
  seq bigserial [pk]
  user_id varchar [not null, ref: > tb_sand_user_base.user_id]
  otp_code varchar [not null]
  type_code varchar [not null, ref: > tb_sand_comm_code_dtls.comm_code]
  purpose_code varchar [not null, ref: > tb_sand_comm_code_dtls.comm_code]
  is_used bool
  exp_dttm bigint
  attr1 varchar [note: 'Additional properties']
  attr2 varchar
  attr3 varchar
  attr4 varchar
  attr5 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint
  is_deleted bool [default: false, not null]

  indexes {
    upd_dttm
  }

  Note: 'OTP management with automatic cleanup after expiration'
}

// User status log table
Table tb_sand_user_status_log {
  seq bigserial [pk]
  user_id varchar [not null, ref: > tb_sand_user_base.user_id]
  old_status varchar [not null, ref: > tb_sand_comm_code_dtls.comm_code, note: 'FK to COMM_CODE: USER_STATUS']
  new_status varchar [not null, ref: > tb_sand_comm_code_dtls.comm_code, note: 'FK to COMM_CODE: USER_STATUS']
  reason text
  attr1 varchar [note: 'Additional properties']
  attr2 varchar
  attr3 varchar
  attr4 varchar
  attr5 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint
  is_deleted bool [default: false, not null]

  indexes {
    upd_dttm
  }
}

// Login attempts tracking
Table tb_sand_login_attempt {
  seq bigserial [pk]
  user_id varchar [not null, ref: > tb_sand_user_base.user_id]
  attempt_dttm bigint
  is_successful bool [not null]
  ip_address varchar
  user_agent text
  attr1 varchar [note: 'Additional properties']
  attr2 varchar
  attr3 varchar
  attr4 varchar
  attr5 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint
  is_deleted bool [default: false, not null]

  indexes {
    upd_dttm
  }
}

// Enhanced Group Category untuk mendukung multiple classification
Table tb_sand_group_category {
  group_cat varchar [pk] // e.g., 'DIVISION', 'SYSTEM', 'PROJECT', 'DEPARTMENT', 'CUSTOM'
  description text
  is_classification bool [default: false, not null, note: 'True if category matches user classification (division, system, etc)']
  reference_code_type varchar [ref: > tb_sand_comm_code_base.code_type, note: 'References code_type in COMM_CODE_BASE for classification-based groups']
  is_active bool [default: true, not null]
  attr1 varchar [note: 'Additional properties']
  attr2 varchar
  attr3 varchar
  attr4 varchar
  attr5 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint
  is_deleted bool [default: false, not null]

  indexes {
    upd_dttm
  }
  
  Note: 'Enhanced category system supporting both classification-based and custom groups'
}

// Enhanced group base table
Table tb_sand_group_base {
  group_cat varchar [pk, ref: > tb_sand_group_category.group_cat]
  group varchar [pk, ref: > tb_sand_group_category.group_cat]
  description text
  reference_code varchar [not null, ref: > tb_sand_comm_code_dtls.comm_code, note: 'Maps to classification code when is_classification is true']
  parent_group varchar [null, ref: > tb_sand_group_base.group]
  auto_assign bool [default: false, not null, note: 'Auto-assign members based on user classification']
  is_active bool [default: true, not null]
  attr1 varchar [note: 'Additional properties']
  attr2 varchar
  attr3 varchar
  attr4 varchar
  attr5 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint
  is_deleted bool [default: false, not null]

  indexes {
    upd_dttm
  }

  Note: 'Enhanced group table supporting both classification-based and custom groups'
}

// User-Group mapping (unchanged structure but enhanced purpose)
Table tb_sand_user_group {
  user_id varchar [pk, ref: > tb_sand_user_base.user_id]
  group varchar [pk, ref: > tb_sand_group_base.group]
  is_primary bool [default: false, not null]
  start_date bigint
  end_date bigint
  attr1 varchar [note: 'Additional properties']
  attr2 varchar
  attr3 varchar
  attr4 varchar
  attr5 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint
  is_deleted bool [default: false, not null]
  
  indexes {
    upd_dttm
  }

  Note: 'Mapping table supporting multiple group memberships with time period'
}

// Role management tables
Table tb_sand_role_base {
  role_id varchar [pk]
  role varchar [unique, not null]
  description text
  is_default bool [default: false, not null, note: 'Default: User role']
  is_system bool [default: false, not null, note: 'True for built-in roles like User']
  order_index int [not null, unique]
  attr1 varchar [note: 'Additional properties']
  attr2 varchar
  attr3 varchar
  attr4 varchar
  attr5 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint
  is_deleted bool [default: false, not null]

  indexes {
    upd_dttm
  }
}

// User-Role mapping
Table tb_sand_user_role {
  user_id varchar [pk, ref: > tb_sand_user_base.user_id]
  role_id varchar [pk, ref: > tb_sand_role_base.role_id]
  is_primary bool [default: false, not null, note: 'Primary role for the user']
  attr1 varchar [note: 'Additional properties']
  attr2 varchar
  attr3 varchar
  attr4 varchar
  attr5 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint
  is_deleted bool [default: false, not null]

  indexes {
    upd_dttm
  }

  Note: 'Mapping table for users and their roles (multiple roles per user allowed)'
}

// Menu management
Table tb_sand_menu_base {
  menu_id varchar [pk]
  menu_name varchar [not null, unique]
  menu_cat varchar
  description text
  path text
  parent_id varchar [null, ref: > tb_sand_menu_base.menu_id]
  menu_level int
  order_index int
  is_displayed bool [default: true, not null]
  is_active bool [default: true, not null]
  attr1 varchar [note: 'Additional properties']
  attr2 varchar
  attr3 varchar
  attr4 varchar
  attr5 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint
  is_deleted bool [default: false, not null]

  indexes {
    upd_dttm
  }

  Note: 'Supports parent menu, menu, and sub menu hierarchy'
}

// Role-Menu access control
Table tb_sand_role_menu_accs {
  role_id varchar [pk, ref: > tb_sand_role_base.role_id]
  menu_id varchar [pk, ref: > tb_sand_menu_base.menu_id]
  user_id varchar [null, ref: > tb_sand_user_base.user_id]
  is_read bool [default: false, not null]
  is_create bool [default: false, not null]
  is_modify bool [default: false, not null]
  is_delete bool [default: false, not null]
  attr1 varchar [note: 'Additional properties']
  attr2 varchar
  attr3 varchar
  attr4 varchar
  attr5 varchar
  reg_by varchar
  reg_dttm bigint 
  upd_by varchar
  upd_dttm bigint
  is_deleted bool [default: false, not null]

  indexes {
    upd_dttm
  }
}

/* 
Example of common codes that would be used:

1. USER_STATUS
   - 01: Inactive
   - 02: Active
   - 03: Deleted
   - 04: Locked

# Optional
1. USER_ROLE
   - SUPER_ADMIN: Super Administrator with full access
   - ADMIN_1: Administrator with extended access 1
   - ADMIN_2: Administrator with extended access 2
   - ADMIN_3: Administrator with extended access 3
   - USER: Reguler user access

2. DEPARTMENT
   - CTO_DEP: Chief Technology Officer
   - GDC_DEP: Glocal Delivery Center
   - LDC_DEP: Local Delivery Center
   - PMQ_DEP: PMO & QA Team
   - AIT_DEP: Architecture & Innovation Team
   etc.

3. DIVISION
   - CTO_DIV: Chief Technology Officer Division
   - BSE_DIV: Bridge Software Engineer
   - SFC_DIV: Smart Factory Core
   - SFA_DIV: Smart Facotory Automation
   - SFS_DIV: Smart Factory Solution
   - PMO_DIV: Project Manager Officer
   - QA_DIV: Quality Assurance
   etc.

4. SYSTEM
   - MES: Manufacturing Execution System
   - MHS: Material Handling System
   - MMD: Manufacturing Master Data
   - PDA: Personal Digital Assistant
   - EIF: Equipment Interface
   - RTD: Real-Time Dispatcher
   - MCS: Material Control System
   - CIM: Computer Integrated Machine
   - SPC: Statistical Process Control
   - FDC: Fault Detection & Classification
   - IRS: Image Re-Inspection System
   - VCT: Virtual Computed Tomography
   - OCAP: Out of Control Action Plan
   - RMS: Recipe Management System
   etc.

5. POSITION
   - CTO_POS: Chief Technology Officer
   - BSE_POS: Bridge Software Engineer
   - SPSE_POS: Specialist Software Engineer
   - ASSE_POS: Assistant Software Engineer
   etc.

6. WORKING_SITE
   - JKT: Jakarta
   - KRW: Karawang
   - CJ: Cheong-Ju
   etc.

7. GENDER
   - M: Male
   - F: Female

8. OTP_TYPE
   - EMAIL: Email OTP
   - SMS: SMS OTP
   - APP: APP OTP

9. OTP_PURPOSE 
   - REG: Registration OTP
   - PWD: Password Reset OTP
   - VER: Account Verification OTP

Example of USER_ROLE that would be used:

1. USER_ROLE
   - SUPER_ADMIN: Super Administrator with full access
   - ADMIN_1: Administrator with extended access 1
   - ADMIN_2: Administrator with extended access 2
   - ADMIN_3: Administrator with extended access 3
   - USER: Reguler user access
*/
