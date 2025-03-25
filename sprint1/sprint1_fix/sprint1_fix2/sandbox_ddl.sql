CREATE TABLE "tb_sand_comm_code_base" (
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
CREATE INDEX "tb_sand_comm_code_base_upd_dttm_idx" ON "tb_sand_comm_code_base"("upd_dttm");

CREATE TABLE "tb_sand_comm_code_dtls" (
  "code_type" VARCHAR REFERENCES "tb_sand_comm_code_base"("code_type"),
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
CREATE INDEX "tb_sand_comm_code_dtls_upd_dttm_idx" ON "tb_sand_comm_code_dtls"("upd_dttm");

CREATE TABLE "tb_sand_user_base" (
  "user_id" VARCHAR PRIMARY KEY,
  "employee_id" VARCHAR UNIQUE NOT NULL,
  "username" VARCHAR UNIQUE NOT NULL,
  "personal_email" VARCHAR UNIQUE NOT NULL,
  "phone_number" VARCHAR UNIQUE,
  "password" VARCHAR,
  "status" VARCHAR DEFAULT '01' NOT NULL REFERENCES "tb_sand_comm_code_dtls"("comm_code"),
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
CREATE INDEX "tb_sand_user_base_upd_dttm_idx" ON "tb_sand_user_base"("upd_dttm");

CREATE TABLE "tb_sand_user_dtls" (
  "user_id" VARCHAR PRIMARY KEY,
  "fullname" VARCHAR,
  "working_email" VARCHAR UNIQUE,
  "avtr_path" TEXT,
  "main_role" VARCHAR DEFAULT 'USER' NOT NULL REFERENCES "tb_sand_comm_code_dtls"("comm_code"),
  "added_role" TEXT,
  "department" TEXT NOT NULL,
  "division" TEXT,
  "system" TEXT,
  "position" TEXT,
  "custom_groupings" TEXT,
  "mentor_id" VARCHAR REFERENCES "tb_sand_user_dtls"("user_id"),
  "working_site" VARCHAR REFERENCES "tb_sand_comm_code_dtls"("comm_code"),
  "gender" VARCHAR REFERENCES "tb_sand_comm_code_dtls"("comm_code"),
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
  CONSTRAINT "tb_sand_user_dtls_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "tb_sand_user_base"("user_id")
);
CREATE INDEX "tb_sand_user_dtls_upd_dttm_idx" ON "tb_sand_user_base"("upd_dttm");

CREATE TABLE "tb_sand_otp_base" (
  "seq" BIGSERIAL PRIMARY KEY,
  "user_id" VARCHAR NOT NULL REFERENCES "tb_sand_user_base"("user_id"),
  "otp_code" VARCHAR NOT NULL,
  "type_code" VARCHAR NOT NULL REFERENCES "tb_sand_comm_code_dtls"("comm_code"),
  "purpose_code" VARCHAR NOT NULL REFERENCES "tb_sand_comm_code_dtls"("comm_code"),
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
CREATE INDEX "tb_sand_otp_base_upd_dttm_idx" ON "tb_sand_otp_base"("upd_dttm");

CREATE TABLE "tb_sand_user_status_log" (
  "seq" BIGSERIAL PRIMARY KEY,
  "user_id" VARCHAR NOT NULL REFERENCES "tb_sand_user_base"("user_id"),
  "old_status" VARCHAR NOT NULL REFERENCES "tb_sand_comm_code_dtls"("comm_code"),
  "new_status" VARCHAR NOT NULL REFERENCES "tb_sand_comm_code_dtls"("comm_code"),
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
CREATE INDEX "tb_sand_user_status_log_upd_dttm_idx" ON "tb_sand_user_status_log"("upd_dttm");

CREATE TABLE "tb_sand_login_attempt" (
  "seq" BIGSERIAL PRIMARY KEY,
  "user_id" VARCHAR NOT NULL REFERENCES "tb_sand_user_base"("user_id"),
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
CREATE INDEX "tb_sand_login_attempt_upd_dttm_idx" ON "tb_sand_login_attempt"("upd_dttm");

CREATE TABLE "tb_sand_group_category" (
  "group_cat" VARCHAR PRIMARY KEY,
  "description" TEXT,
  "is_classification" BOOLEAN DEFAULT false NOT NULL,
  "reference_code_type" VARCHAR REFERENCES "tb_sand_comm_code_base"("code_type"),
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
CREATE INDEX "tb_sand_group_category_upd_dttm_idx" ON "tb_sand_group_category"("upd_dttm");

CREATE TABLE "tb_sand_group_base" (
  "group_cat" VARCHAR REFERENCES "tb_sand_group_category"("group_cat"),
  "group" VARCHAR UNIQUE,
  "description" TEXT,
  "reference_code" VARCHAR NOT NULL REFERENCES "tb_sand_comm_code_dtls"("comm_code"),
  "parent_group" VARCHAR NULL REFERENCES "tb_sand_group_base"("group"),
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
  CONSTRAINT "tb_sand_group_base_pkey" PRIMARY KEY ("group_cat", "group")
);
CREATE INDEX "tb_sand_group_base_upd_dttm_idx" ON "tb_sand_group_base"("upd_dttm");

CREATE TABLE "tb_sand_user_group" (
  "user_id" VARCHAR REFERENCES "tb_sand_user_base"("user_id"),
  "group" VARCHAR REFERENCES "tb_sand_group_base"("group"),
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
  CONSTRAINT "tb_sand_user_group_pkey" PRIMARY KEY ("user_id", "group")
);
CREATE INDEX "tb_sand_user_group_upd_dttm_idx" ON "tb_sand_user_group"("upd_dttm");

CREATE TABLE "tb_sand_role_base" (
  "role_id" VARCHAR PRIMARY KEY,
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
CREATE INDEX "tb_sand_role_base_upd_dttm_idx" ON "tb_sand_role_base"("upd_dttm");

CREATE TABLE "tb_sand_user_role" (
  "user_id" VARCHAR REFERENCES "tb_sand_user_base"("user_id"),
  "role_id" VARCHAR REFERENCES "tb_sand_role_base"("role_id"),
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
CREATE INDEX "tb_sand_user_role_upd_dttm_idx" ON "tb_sand_user_role"("upd_dttm");

CREATE TABLE "tb_sand_menu_base" (
  "menu_id" VARCHAR PRIMARY KEY,
  "menu_name" VARCHAR NOT NULL,
  "menu_cat" VARCHAR,
  "description" TEXT,
  "path" TEXT,
  "parent_id" VARCHAR NULL REFERENCES "tb_sand_menu_base"("menu_id"),
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
CREATE INDEX "tb_sand_menu_base_upd_dttm_idx" ON "tb_sand_menu_base"("upd_dttm");

CREATE TABLE "tb_sand_role_menu_accs" (
  "role_id" VARCHAR REFERENCES "tb_sand_role_base"("role_id"),
  "menu_id" VARCHAR REFERENCES "tb_sand_menu_base"("menu_id"),
  "user_id" VARCHAR DEFAULT NULL REFERENCES "tb_sand_user_base"("user_id"),
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
CREATE INDEX "tb_sand_role_menu_accs_upd_dttm_idx" ON "tb_sand_role_menu_accs"("upd_dttm");


-- Function for clear format
CREATE OR REPLACE FUNCTION clean_csv_format(input_text TEXT) 
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
CREATE OR REPLACE FUNCTION validate_comm_codes(codes TEXT) 
RETURNS BOOLEANEAN AS $$
BEGIN
    -- Cross-check all values exist in reference table
    RETURN NOT EXISTS (
        SELECT 1
        FROM unnest(string_to_array(codes, ',')) AS code
        WHERE NOT EXISTS (
            SELECT 1 
            FROM "tb_sand_comm_code_dtls" 
            WHERE comm_code = trim(both ' ' from code)  -- Trim spaces from each code
        )
    );
END;
$$ LANGUAGE plpgsql;


-- Trigger to clear format and validate before insert or update
CREATE OR REPLACE FUNCTION validate_user_dtls_codes() 
RETURNS TRIGGER AS $$
BEGIN
    -- Clear format before validation
    NEW.added_role := clean_csv_format(NEW.added_role);
    NEW.department := clean_csv_format(NEW.department);
    NEW.division := clean_csv_format(NEW.division);
    NEW.system := clean_csv_format(NEW.system);
    NEW.position := clean_csv_format(NEW.position);
    NEW.custom_groupings := clean_csv_format(NEW.custom_groupings);
    
    -- Validation
    IF NEW.added_role IS NOT NULL AND NOT validate_comm_codes(NEW.added_role) THEN
        RAISE EXCEPTION 'Invalid code in added_role';
    END IF;
    
    IF NEW.department IS NOT NULL AND NOT validate_comm_codes(NEW.department) THEN
        RAISE EXCEPTION 'Invalid code in department';
    END IF;
    
    IF NEW.division IS NOT NULL AND NOT validate_comm_codes(NEW.division) THEN
        RAISE EXCEPTION 'Invalid code in division';
    END IF;
    
    IF NEW.system IS NOT NULL AND NOT validate_comm_codes(NEW.system) THEN
        RAISE EXCEPTION 'Invalid code in system';
    END IF;
    
    IF NEW.position IS NOT NULL AND NOT validate_comm_codes(NEW.position) THEN
        RAISE EXCEPTION 'Invalid code in position';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to invoke the validation function before insert or update
CREATE TRIGGER validate_user_dtls_codes_trigger
BEFORE INSERT OR UPDATE ON "tb_sand_user_dtls"
FOR EACH ROW
EXECUTE FUNCTION validate_user_dtls_codes();


-- Function to generate formatted ID with date
CREATE OR REPLACE FUNCTION generate_id(prefix VARCHAR(4), seq_name VARCHAR) 
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

-- Create sequences (resetting daily)
CREATE SEQUENCE seq_sand_user_base_id
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    CYCLE
    CACHE 1;

CREATE SEQUENCE seq_sand_role_base_id
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    CYCLE
    CACHE 1;

CREATE SEQUENCE seq_sand_menu_base_id
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    CYCLE
    CACHE 1;

-- Alter tables to use new ID format
ALTER TABLE "tb_sand_user_base" 
    ALTER COLUMN user_id SET DEFAULT generate_id('USER', 'seq_sand_user_base_id');

ALTER TABLE "tb_sand_role_base" 
    ALTER COLUMN role_id SET DEFAULT generate_id('ROLE', 'seq_sand_role_base_id');

ALTER TABLE "tb_sand_menu_base" 
    ALTER COLUMN menu_id SET DEFAULT generate_id('MENU', 'seq_sand_menu_base_id');
