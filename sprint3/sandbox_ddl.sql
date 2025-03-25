-- Create schemas if they don't exist
CREATE SCHEMA IF NOT EXISTS sandbox;
CREATE SCHEMA IF NOT EXISTS jobportal;
CREATE SCHEMA IF NOT EXISTS shared_profile;

-- Create tables in sandbox schema
CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_comm_code_base" (
  "code_type" VARCHAR PRIMARY KEY,
  "code_type_name" VARCHAR,
  "is_active" BOOLEAN DEFAULT true NOT NULL,
  "desc_attr1" VARCHAR,
  "desc_attr2" VARCHAR,
  "desc_attr3" VARCHAR,
  "desc_attr4" VARCHAR,
  "desc_attr5" VARCHAR,
  "desc_attr6" VARCHAR,
  "desc_attr7" VARCHAR,
  "desc_attr8" VARCHAR,
  "desc_attr9" VARCHAR,
  "desc_attr10" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_comm_code_base_upd_dttm_idx" ON "sandbox"."tb_sand_comm_code_base"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_comm_code_dtls" (
  "code_type" VARCHAR REFERENCES "sandbox"."tb_sand_comm_code_base"("code_type"),
  "comm_code" VARCHAR UNIQUE,
  "comm_code_name" VARCHAR,
  "order_index" INT NOT NULL CONSTRAINT "check_order_index_cmcd" CHECK ("order_index" >= 1),
  "is_active" BOOLEAN DEFAULT true NOT NULL,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "attr6" VARCHAR,
  "attr7" VARCHAR,
  "attr8" VARCHAR,
  "attr9" VARCHAR,
  "attr10" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  CONSTRAINT "tb_sand_comm_code_dtls_pkey" PRIMARY KEY ("code_type", "comm_code")
);
CREATE INDEX IF NOT EXISTS "tb_sand_comm_code_dtls_upd_dttm_idx" ON "sandbox"."tb_sand_comm_code_dtls"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_user_base" (
  "user_id" VARCHAR PRIMARY KEY,
  "employee_id" VARCHAR UNIQUE NOT NULL,
  "username" VARCHAR UNIQUE,
  "personal_email" VARCHAR UNIQUE,
  "phone_number" VARCHAR UNIQUE,
  "password" VARCHAR,
  "status" VARCHAR DEFAULT '01' NOT NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "activation_date" BIGINT,
  "failed_login_attempts" INT DEFAULT 0 NOT NULL CONSTRAINT "check_failed_login_attempts" CHECK ("failed_login_attempts" >= 0),
  "last_login_attempt" BIGINT,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT
);
CREATE INDEX IF NOT EXISTS "tb_sand_user_base_upd_dttm_idx" ON "sandbox"."tb_sand_user_base"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_user_dtls" (
  "user_id" VARCHAR PRIMARY KEY,
  "fullname" VARCHAR,
  "working_email" VARCHAR UNIQUE,
  "birthdate" BIGINT,
  "domicile" VARCHAR,
  "emergency_contact" VARCHAR(20),
  "avtr_path" TEXT,
  "department" TEXT NOT NULL,
  "division" TEXT,
  "system" TEXT,
  "position" TEXT,
  "custom_groupings" TEXT,
  "mentor_id" VARCHAR REFERENCES "sandbox"."tb_sand_user_dtls"("user_id"),
  "working_site" VARCHAR REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "gender" VARCHAR REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "joined_date" BIGINT,
  "korean_name" VARCHAR,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  CONSTRAINT "tb_sand_user_dtls_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "sandbox"."tb_sand_user_base"("user_id")
);
CREATE INDEX IF NOT EXISTS "tb_sand_user_dtls_upd_dttm_idx" ON "sandbox"."tb_sand_user_dtls"("upd_dttm");

-- Profile details education table one-to-many (in shared_profile schema)
CREATE TABLE IF NOT EXISTS "shared_profile"."tb_profile_dtls_edu" (
  "user_id" VARCHAR NOT NULL,
  "seq" INT,
  "type" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "institution_name" VARCHAR,
  "degree" VARCHAR REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "field_of_study" VARCHAR,
  "grade" VARCHAR,
  "description" TEXT,
  "certificate" VARCHAR,
  "start_date" BIGINT,
  "end_date" BIGINT,
  "issued_year" INT,
  "expired_year" INT,
  "is_expired" BOOLEAN DEFAULT false NOT NULL,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  CONSTRAINT "tb_profile_dtls_edu_pkey" PRIMARY KEY ("user_id", "seq")
);
CREATE INDEX IF NOT EXISTS "tb_profile_dtls_edu_upd_dttm_idx" ON "shared_profile"."tb_profile_dtls_edu"("upd_dttm");

-- Profile details career table one-to-many (in shared_profile schema)
CREATE TABLE IF NOT EXISTS "shared_profile"."tb_profile_dtls_career" (
  "user_id" VARCHAR NOT NULL,
  "seq" VARCHAR NOT NULL,
  "type" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "name" VARCHAR,
  "affiliation" VARCHAR,
  "position" VARCHAR,
  "employement_type" VARCHAR,
  "tech_stack" TEXT,
  "responsibility" TEXT,
  "start_date" BIGINT,
  "end_date" BIGINT,
  "is_still_there" BOOLEAN DEFAULT false NOT NULL,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  CONSTRAINT "tb_profile_dtls_career_pkey" PRIMARY KEY ("user_id", "seq")
);
CREATE INDEX IF NOT EXISTS "tb_profile_dtls_career_dttm_idx" ON "shared_profile"."tb_profile_dtls_career"("upd_dttm");

-- Skills table (in jobportal schema)
CREATE TABLE IF NOT EXISTS "jobportal"."tb_jobp_skill_base" (
  "skill_id" VARCHAR PRIMARY KEY,
  "type" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "skill_name" VARCHAR NOT NULL UNIQUE,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_jobp_skill_base_upd_dttm_idx" ON "jobportal"."tb_jobp_skill_base"("upd_dttm");

-- Profile details languages & skills table one-to-many (in shared_profile schema)
CREATE TABLE IF NOT EXISTS "shared_profile"."tb_profile_dtls_skill" (
  "user_id" VARCHAR NOT NULL,
  "seq" VARCHAR,
  "skill_id" VARCHAR NOT NULL REFERENCES "jobportal"."tb_jobp_skill_base"("skill_id"),
  "language_level" VARCHAR NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "level_or_score" VARCHAR,
  "issuer" VARCHAR,
  "description" TEXT,
  "certificate_number" VARCHAR,
  "certificate" VARCHAR,
  "obtained_date" BIGINT,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  PRIMARY KEY ("user_id", "seq")
);
CREATE INDEX IF NOT EXISTS "tb_profile_dtls_skill_dttm_idx" ON "shared_profile"."tb_profile_dtls_skill"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_otp_base" (
  "seq" BIGSERIAL PRIMARY KEY,
  "user_id" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_user_base"("user_id"),
  "otp_code" VARCHAR NOT NULL,
  "type_code" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "purpose_code" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "is_used" BOOLEAN,
  "exp_dttm" BIGINT,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_otp_base_upd_dttm_idx" ON "sandbox"."tb_sand_otp_base"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_user_status_log" (
  "seq" BIGSERIAL PRIMARY KEY,
  "user_id" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_user_base"("user_id"),
  "old_status" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "new_status" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "reason" TEXT,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_user_status_log_upd_dttm_idx" ON "sandbox"."tb_sand_user_status_log"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_login_attempt" (
  "seq" BIGSERIAL PRIMARY KEY,
  "user_id" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_user_base"("user_id"),
  "attempt_dttm" BIGINT,
  "is_successful" BOOLEAN NOT NULL,
  "ip_address" VARCHAR,
  "user_agent" TEXT,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_login_attempt_upd_dttm_idx" ON "sandbox"."tb_sand_login_attempt"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_group_category" (
  "group_cat" VARCHAR PRIMARY KEY,
  "description" TEXT,
  "is_classification" BOOLEAN DEFAULT false NOT NULL,
  "reference_code_type" VARCHAR REFERENCES "sandbox"."tb_sand_comm_code_base"("code_type"),
  "is_active" BOOLEAN DEFAULT true NOT NULL,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_group_category_upd_dttm_idx" ON "sandbox"."tb_sand_group_category"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_group_base" (
  "group_cat" VARCHAR REFERENCES "sandbox"."tb_sand_group_category"("group_cat"),
  "group_name" VARCHAR UNIQUE,
  "description" TEXT,
  "reference_code" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "parent_group" VARCHAR NULL REFERENCES "sandbox"."tb_sand_group_base"("group_name"),
  "auto_assign" BOOLEAN DEFAULT false NOT NULL,
  "is_active" BOOLEAN DEFAULT true NOT NULL,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  CONSTRAINT "tb_sand_group_base_pkey" PRIMARY KEY ("group_cat", "group_name")
);
CREATE INDEX IF NOT EXISTS "tb_sand_group_base_upd_dttm_idx" ON "sandbox"."tb_sand_group_base"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_user_group" (
  "user_id" VARCHAR REFERENCES "sandbox"."tb_sand_user_base"("user_id"),
  "group_name" VARCHAR REFERENCES "sandbox"."tb_sand_group_base"("group_name"),
  "is_primary" BOOLEAN DEFAULT false NOT NULL,
  "start_date" BIGINT,
  "end_date" BIGINT,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  CONSTRAINT "tb_sand_user_group_pkey" PRIMARY KEY ("user_id", "group_name")
);
CREATE INDEX IF NOT EXISTS "tb_sand_user_group_upd_dttm_idx" ON "sandbox"."tb_sand_user_group"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_role_base" (
  "role_id" VARCHAR PRIMARY KEY,
  "category" VARCHAR,
  "role" VARCHAR UNIQUE NOT NULL,
  "description" TEXT,
  "is_default" BOOLEAN DEFAULT false NOT NULL,
  "is_system" BOOLEAN DEFAULT false NOT NULL,
  "order_index" INT UNIQUE NOT NULL CONSTRAINT "check_order_index_role" CHECK ("order_index" >= 1),
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false
);
CREATE INDEX IF NOT EXISTS "tb_sand_role_base_upd_dttm_idx" ON "sandbox"."tb_sand_role_base"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_user_role" (
  "user_id" VARCHAR REFERENCES "sandbox"."tb_sand_user_base"("user_id"),
  "role_id" VARCHAR REFERENCES "sandbox"."tb_sand_role_base"("role_id"),
  "is_primary" BOOLEAN DEFAULT false NOT NULL,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  CONSTRAINT "tb_sand_user_role_pkey" PRIMARY KEY ("user_id", "role_id")
);
CREATE INDEX IF NOT EXISTS "tb_sand_user_role_upd_dttm_idx" ON "sandbox"."tb_sand_user_role"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_menu_base" (
  "menu_id" VARCHAR PRIMARY KEY,
  "menu_name" VARCHAR NOT NULL,
  "menu_cat" VARCHAR REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "description" TEXT,
  "path" TEXT,
  "parent_id" VARCHAR NULL REFERENCES "sandbox"."tb_sand_menu_base"("menu_id"),
  "menu_level" INT CONSTRAINT "check_menu_level" CHECK ("menu_level" >= 1),
  "order_index" INT CONSTRAINT "check_order_index_menu" CHECK ("order_index" >= 1),
  "is_displayed" BOOLEAN DEFAULT true NOT NULL,
  "is_active" BOOLEAN DEFAULT true NOT NULL,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_menu_base_upd_dttm_idx" ON "sandbox"."tb_sand_menu_base"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_role_menu_accs" (
  "role_id" VARCHAR REFERENCES "sandbox"."tb_sand_role_base"("role_id"),
  "menu_id" VARCHAR REFERENCES "sandbox"."tb_sand_menu_base"("menu_id"),
  "user_id" VARCHAR DEFAULT NULL REFERENCES "sandbox"."tb_sand_user_base"("user_id"),
  "is_read" BOOLEAN DEFAULT false NOT NULL,
  "is_create" BOOLEAN DEFAULT false NOT NULL,
  "is_modify" BOOLEAN DEFAULT false NOT NULL,
  "is_delete" BOOLEAN DEFAULT false NOT NULL,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  CONSTRAINT "tb_sand_role_menu_accs_pkey" PRIMARY KEY ("role_id", "menu_id")
);
CREATE INDEX IF NOT EXISTS "tb_sand_role_menu_accs_upd_dttm_idx" ON "sandbox"."tb_sand_role_menu_accs"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_badge_base" (
  "badge_code" VARCHAR PRIMARY KEY,
  "badge_name" VARCHAR(50) NOT NULL,
  "description" TEXT,
  "badge_image_path" TEXT,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_badge_base_upd_dttm_idx" ON "sandbox"."tb_sand_badge_base"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_course_base" (
  "course_id" VARCHAR PRIMARY KEY,
  "title" VARCHAR(100) NOT NULL,
  "description" TEXT,
  "course_type" VARCHAR(50) NOT NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "course_url" TEXT,
  "language" VARCHAR(50) NOT NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "duration" DECIMAL(5,2) NOT NULL,
  "is_mandatory" BOOLEAN DEFAULT false NOT NULL,
  "pic" VARCHAR(50),
  "path" VARCHAR(50) DEFAULT 'Default' REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "topic" VARCHAR(50) REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "has_assignment" BOOLEAN DEFAULT false,
  "has_quiz" BOOLEAN DEFAULT false,
  "points" DECIMAL(5,2) DEFAULT 0,
  "badge_code" VARCHAR REFERENCES "sandbox"."tb_sand_badge_base"("badge_code"),
  "group_cat" VARCHAR DEFAULT 'ALL' REFERENCES "sandbox"."tb_sand_group_category"("group_cat"),
  "group_name" VARCHAR REFERENCES "sandbox"."tb_sand_group_base"("group_name"),
  "display_yn" BOOLEAN DEFAULT true NOT NULL,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_course_base_upd_dttm_idx" ON "sandbox"."tb_sand_course_base"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_course_material" (
  "course_id" VARCHAR REFERENCES "sandbox"."tb_sand_course_base"("course_id"),
  "seq" INT,
  "material_type" VARCHAR(50) NOT NULL,
  "material_path_or_url" TEXT,
  "description" TEXT,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  CONSTRAINT "tb_sand_course_material_pkey" PRIMARY KEY ("course_id", "seq")
);
CREATE INDEX IF NOT EXISTS "tb_sand_course_material_upd_dttm_idx" ON "sandbox"."tb_sand_course_material"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_quiz_base" (
  "quiz_id" VARCHAR PRIMARY KEY,
  "course_id" VARCHAR REFERENCES "sandbox"."tb_sand_course_base"("course_id"),
  "title" VARCHAR(50) NOT NULL,
  "description" TEXT,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
);
CREATE INDEX IF NOT EXISTS "tb_sand_quiz_base_upd_dttm_idx" ON "sandbox"."tb_sand_quiz_base"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_quiz_question" (
  "question_id" SERIAL PRIMARY KEY,
  "quiz_id" VARCHAR REFERENCES "sandbox"."tb_sand_quiz_base"("quiz_id"),
  "question_text" TEXT NOT NULL,
  "question_type" VARCHAR(50) NOT NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "point_value" DECIMAL(5,2),
  "order_index" INT,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_quiz_question_upd_dttm_idx" ON "sandbox"."tb_sand_quiz_question"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_quiz_question_option" (
  "option_id" SERIAL PRIMARY KEY,
  "question_id" VARCHAR REFERENCES "sandbox"."tb_sand_quiz_question"("question_id"),
  "option_text" TEXT NOT NULL,
  "is_correct" BOOLEAN DEFAULT false,
  "order_index" INT,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_quiz_question_option_upd_dttm_idx" ON "sandbox"."tb_sand_quiz_question_option"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_user_course_enrollment" (
  "user_id" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_user_base"("user_id"),
  "course_id" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_course_base"("course_id"),
  "progress" DECIMAL(5,2) DEFAULT 0,
  "status" VARCHAR(50) DEFAULT 'ENROLLED' REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "points_earned" INT DEFAULT 0,
  "badge_earned" BOOLEAN DEFAULT false,
  -- EnrollmentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  -- CompletionDate TIMESTAMP,
  -- LastAccessDate TIMESTAMP,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  CONSTRAINT "tb_sand_user_course_enrollment_pkey" PRIMARY KEY ("user_id", "course_id")
);
CREATE INDEX IF NOT EXISTS "tb_sand_user_course_enrollment_upd_dttm_idx" ON "sandbox"."tb_sand_user_course_enrollment"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_user_quiz_attempt" (
  "attempt_id" SERIAL PRIMARY KEY,
  "user_id" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_user_base"("user_id"),
  "quiz_id" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_quiz_base"("quiz_id"),
  "score" DECIMAL(5,2) DEFAULT 0,
  "pass_status" BOOLEAN DEFAULT false,
  "time_spent" INT,
  -- AttemptDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_user_quiz_attempt_upd_dttm_idx" ON "sandbox"."tb_sand_user_quiz_attempt"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_user_quiz_answer" (
  "attempt_id" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_user_quiz_attempt"("attempt_id"),
  "question_id" INT NOT NULL REFERENCES "sandbox"."tb_sand_quiz_question"("question_id"),
  "option_id" INT REFERENCES "sandbox"."tb_sand_quiz_question_option"("option_id"),
  "pass_status" BOOLEAN DEFAULT false,
  "time_spent" INT,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  CONSTRAINT "tb_sand_user_quiz_answer_pkey" PRIMARY KEY ("attempt_id", "question_id", "option_id")
);
CREATE INDEX IF NOT EXISTS "tb_sand_user_quiz_answer_upd_dttm_idx" ON "sandbox"."tb_sand_user_quiz_answer"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_user_assign_sbmssion" (
  "user_id" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_user_base"("user_id"),
  "course_id" VARCHAR NOT NULL REFERENCES "sandbox"."tb_sand_course_base"("course_id"),
  "submission_text" TEXT,
  "submission_url" TEXT,
  "grade_status" VARCHAR(50) DEFAULT 'PENDING' REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "feedback_text" TEXT,
  -- SubmissionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  -- GradedBy INT,
  -- GradedDate TIMESTAMP,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  CONSTRAINT "tb_sand_user_assign_sbmssion_pkey" PRIMARY KEY ("user_id", "course_id")
);
CREATE INDEX IF NOT EXISTS "tb_sand_user_assign_sbmssion_upd_dttm_idx" ON "sandbox"."tb_sand_user_assign_sbmssion"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_journey_base" (
  "journey_id" VARCHAR PRIMARY KEY,
  "name" VARCHAR(50) NOT NULL,
  "description" TEXT,
  "journey_type" VARCHAR(50) NOT NULL REFERENCES "sandbox"."tb_sand_comm_code_dtls"("comm_code"),
  "level" VARCHAR,
  "total_duration" DECIMAL(5,2),
  "mentor" VARCHAR(50) REFERENCES "tb_sand_user_base"("user_id"),
  "group_cat" VARCHAR DEFAULT 'ALL' REFERENCES "sandbox"."tb_sand_group_category"("group_cat"),
  "group_name" VARCHAR REFERENCES "sandbox"."tb_sand_group_base"("group_name"),
  "display_yn" BOOLEAN DEFAULT true NOT NULL,
  "points" DECIMAL(5,2) DEFAULT 0,
  "badge_code" VARCHAR REFERENCES "sandbox"."tb_sand_badge_base"("badge_code"),
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_journey_base_upd_dttm_idx" ON "sandbox"."tb_sand_journey_base"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_journey_course" (
  "journey_id" VARCHAR REFERENCES "sandbox"."tb_sand_journey_base"("journey_id"),
  "course_id" VARCHAR REFERENCES "sandbox"."tb_sand_course_base"("course_id"),
  "order_index" INT,
  "is_mandatory" BOOLEAN DEFAULT true NOT NULL,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL,
  CONSTRAINT "tb_sand_journey_course_pkey" PRIMARY KEY ("journey_id", "course_id")
);
CREATE INDEX IF NOT EXISTS "tb_sand_journey_course_upd_dttm_idx" ON "sandbox"."tb_sand_journey_course"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_user_journey_enroll" (
  "enroll_id" VARCHAR PRIMARY KEY,
  "user_id" VARCHAR REFERENCES "sandbox"."tb_sand_user_base"("user_id"),
  "journey_id" VARCHAR REFERENCES "sandbox"."tb_sand_journey_base"("journey_id"),
  "mentor" VARCHAR(50),
  -- EnrollmentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  -- CompletionDate TIMESTAMP,
  -- LastAccessDate TIMESTAMP,
  "progress" DECIMAL(5,2) DEFAULT 0,
  "status" VARCHAR(50) DEFAULT 'Enrolled',
  "points_earned" DECIMAL(5,2) DEFAULT 0,
  "badge_earned" BOOLEAN DEFAULT false,
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_user_journey_enroll_upd_dttm_idx" ON "sandbox"."tb_sand_user_journey_enroll"("upd_dttm");

CREATE TABLE IF NOT EXISTS "sandbox"."tb_sand_user_journey_course_progress" (
  "enroll_id" VARCHAR REFERENCES "sandbox"."tb_sand_user_journey_enroll"("enroll_id"),
  "course_id" VARCHAR REFERENCES "sandbox"."tb_sand_course_base"("course_id"),
  -- CompletionDate TIMESTAMP,
  -- LastAccessDate TIMESTAMP,
  "status" VARCHAR(50) DEFAULT 'Enrolled',
  "attr1" VARCHAR,
  "attr2" VARCHAR,
  "attr3" VARCHAR,
  "attr4" VARCHAR,
  "attr5" VARCHAR,
  "reg_by" VARCHAR,
  "reg_dttm" BIGINT,
  "upd_by" VARCHAR,
  "upd_dttm" BIGINT,
  "is_deleted" BOOLEAN DEFAULT false NOT NULL
);
CREATE INDEX IF NOT EXISTS "tb_sand_user_journey_course_progress_upd_dttm_idx" ON "sandbox"."tb_sand_user_journey_course_progress"("upd_dttm");


-- Function for clear format
CREATE OR REPLACE FUNCTION "sandbox".clean_csv_format(input_text TEXT) 
RETURNS TEXT AS $$
BEGIN
    RETURN regexp_replace(
        regexp_replace(
            regexp_replace(
                trim(input_text),
                ',+$', ''     -- clear comma at the end
            ),
            ',+', ','        -- clear sequential commas
        ),
        ',\s*', ', '        -- space standardization after comma
    );
END;
$$ LANGUAGE plpgsql;

-- Helper Function for validation (comma-separated needed)
CREATE OR REPLACE FUNCTION "sandbox".validate_comm_codes(codes TEXT) 
RETURNS BOOLEAN AS $$
BEGIN
    -- Cross-check all values exist in reference table
    RETURN NOT EXISTS (
        SELECT 1
        FROM unnest(string_to_array(codes, ',')) AS code
        WHERE NOT EXISTS (
            SELECT 1 
            FROM "sandbox"."tb_sand_comm_code_dtls" 
            WHERE comm_code = trim(both ' ' from code)  -- Trim spaces from each code
        )
    );
END;
$$ LANGUAGE plpgsql;

-- Trigger to clear format and validate before insert or update
CREATE OR REPLACE FUNCTION "sandbox".validate_user_dtls_codes() 
RETURNS TRIGGER AS $$
BEGIN
    -- Clear format before validation
    NEW.department := "sandbox".clean_csv_format(NEW.department);
    NEW.division := "sandbox".clean_csv_format(NEW.division);
    NEW.system := "sandbox".clean_csv_format(NEW.system);
    NEW.position := "sandbox".clean_csv_format(NEW.position);
    NEW.custom_groupings := "sandbox".clean_csv_format(NEW.custom_groupings);
    
    -- Validation    
    IF NEW.department IS NOT NULL AND NOT "sandbox".validate_comm_codes(NEW.department) THEN
        RAISE EXCEPTION 'Invalid code in department';
    END IF;
    
    IF NEW.division IS NOT NULL AND NOT "sandbox".validate_comm_codes(NEW.division) THEN
        RAISE EXCEPTION 'Invalid code in division';
    END IF;
    
    IF NEW.system IS NOT NULL AND NOT "sandbox".validate_comm_codes(NEW.system) THEN
        RAISE EXCEPTION 'Invalid code in system';
    END IF;
    
    IF NEW.position IS NOT NULL AND NOT "sandbox".validate_comm_codes(NEW.position) THEN
        RAISE EXCEPTION 'Invalid code in position';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to invoke the validation function before insert or update
DROP TRIGGER IF EXISTS validate_user_dtls_codes_trigger ON "sandbox"."tb_sand_user_dtls";
CREATE TRIGGER validate_user_dtls_codes_trigger
BEFORE INSERT OR UPDATE ON "sandbox"."tb_sand_user_dtls"
FOR EACH ROW
EXECUTE FUNCTION "sandbox".validate_user_dtls_codes();

-- Function to generate formatted ID with date
CREATE OR REPLACE FUNCTION "sandbox".generate_id(prefix VARCHAR(4), seq_name VARCHAR) 
RETURNS VARCHAR AS $$
DECLARE
    date_part VARCHAR;
    seq_num VARCHAR(4);
BEGIN
    -- Get current date in YYMMDD format
    date_part := TO_CHAR(CURRENT_TIMESTAMP, 'YYMMDD');
    
    -- Get sequence number and pad with zeros
    EXECUTE 'SELECT LPAD(NEXTVAL(''' || seq_name || ''')::TEXT, 4, ''0'')'
    INTO seq_num;
    
    -- Return formatted ID
    RETURN prefix || date_part || seq_num;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION "jobportal".generate_id(prefix VARCHAR(4), seq_name VARCHAR) 
RETURNS VARCHAR AS $$
DECLARE
    date_part VARCHAR;
    seq_num VARCHAR(4);
BEGIN
    -- Get current date in YYMMDD format
    date_part := TO_CHAR(CURRENT_TIMESTAMP, 'YYMMDD');
    
    -- Get sequence number and pad with zeros
    EXECUTE 'SELECT LPAD(NEXTVAL(''' || seq_name || ''')::TEXT, 4, ''0'')'
    INTO seq_num;
    
    -- Return formatted ID
    RETURN prefix || date_part || seq_num;
END;
$$ LANGUAGE plpgsql;

-- Create sequences (resetting daily) if they don't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE schemaname = 'sandbox' AND sequencename = 'seq_sand_user_base_id') THEN
        CREATE SEQUENCE "sandbox".seq_sand_user_base_id
            START WITH 1
            INCREMENT BY 1
            MAXVALUE 9999
            CYCLE
            CACHE 1;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE schemaname = 'sandbox' AND sequencename = 'seq_sand_role_base_id') THEN
        CREATE SEQUENCE "sandbox".seq_sand_role_base_id
            START WITH 1
            INCREMENT BY 1
            MAXVALUE 9999
            CYCLE
            CACHE 1;
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE schemaname = 'sandbox' AND sequencename = 'seq_sand_menu_base_id') THEN
        CREATE SEQUENCE "sandbox".seq_sand_menu_base_id
            START WITH 1
            INCREMENT BY 1
            MAXVALUE 9999
            CYCLE
            CACHE 1;
    END IF;

    IF NOT EXISTS (SELECT 1 FROM pg_sequences WHERE schemaname = 'jobportal' AND sequencename = 'seq_jobp_skill_base_id') THEN
        CREATE SEQUENCE "jobportal".seq_jobp_skill_base_id
            START WITH 1
            INCREMENT BY 1
            MAXVALUE 9999
            CYCLE
            CACHE 1;
    END IF;
END
$$;

-- Alter tables to use new ID format (only if not already set)
DO $$
BEGIN
    -- We need to check if the default is already set before trying to alter it
    -- This query might need adaptation depending on your PostgreSQL version
    IF NOT EXISTS (
        SELECT 1 
        FROM pg_attrdef ad 
        JOIN pg_class c ON ad.adrelid = c.oid 
        JOIN pg_namespace n ON c.relnamespace = n.oid
        JOIN pg_attribute a ON a.attrelid = c.oid AND a.attnum = ad.adnum
        WHERE n.nspname = 'sandbox' AND c.relname = 'tb_sand_user_base' AND a.attname = 'user_id'
    ) THEN
        ALTER TABLE "sandbox"."tb_sand_user_base" 
            ALTER COLUMN user_id SET DEFAULT "sandbox".generate_id('USER', 'sandbox.seq_sand_user_base_id');
    END IF;
    
    IF NOT EXISTS (
        SELECT 1 
        FROM pg_attrdef ad 
        JOIN pg_class c ON ad.adrelid = c.oid 
        JOIN pg_namespace n ON c.relnamespace = n.oid
        JOIN pg_attribute a ON a.attrelid = c.oid AND a.attnum = ad.adnum
        WHERE n.nspname = 'sandbox' AND c.relname = 'tb_sand_role_base' AND a.attname = 'role_id'
    ) THEN
        ALTER TABLE "sandbox"."tb_sand_role_base" 
            ALTER COLUMN role_id SET DEFAULT "sandbox".generate_id('ROLE', 'sandbox.seq_sand_role_base_id');
    END IF;
    
    IF NOT EXISTS (
        SELECT 1 
        FROM pg_attrdef ad 
        JOIN pg_class c ON ad.adrelid = c.oid 
        JOIN pg_namespace n ON c.relnamespace = n.oid
        JOIN pg_attribute a ON a.attrelid = c.oid AND a.attnum = ad.adnum
        WHERE n.nspname = 'sandbox' AND c.relname = 'tb_sand_menu_base' AND a.attname = 'menu_id'
    ) THEN
        ALTER TABLE "sandbox"."tb_sand_menu_base" 
            ALTER COLUMN menu_id SET DEFAULT "sandbox".generate_id('MENU', 'sandbox.seq_sand_menu_base_id');
    END IF;

    IF NOT EXISTS (
        SELECT 1 
        FROM pg_attrdef ad 
        JOIN pg_class c ON ad.adrelid = c.oid 
        JOIN pg_namespace n ON c.relnamespace = n.oid
        JOIN pg_attribute a ON a.attrelid = c.oid AND a.attnum = ad.adnum
        WHERE n.nspname = 'jobportal' AND c.relname = 'tb_jobp_skill_base' AND a.attname = 'skill_id'
    ) THEN
        ALTER TABLE "jobportal"."tb_jobp_skill_base" 
            ALTER COLUMN skill_id SET DEFAULT "jobportal".generate_id('SKLL', 'jobportal.seq_jobp_skill_base_id');
    END IF;
END
$$;
