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

CREATE SEQUENCE seq_sand_course_base_id
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999
    CYCLE
    CACHE 1;

CREATE SEQUENCE seq_sand_journey_base_id
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

ALTER TABLE "tb_sand_course_base"
    ALTER COLUMN course_id SET DEFAULT generate_id('CRSE', 'seq_sand_course_base_id');

ALTER TABLE "tb_sand_journey_base"
    ALTER COLUMN journey_id SET DEFAULT generate_id('JRNY', 'seq_sand_journey_base_id');