--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

-- DROP DATABASE directus;
-- DROP DATABASE template_postgis;


--
-- Roles
--

-- CREATE ROLE postgres;
-- ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md553f48b7c4b76a86ce72276c5755f217d';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5
-- Dumped by pg_dump version 13.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "directus" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5
-- Dumped by pg_dump version 13.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: directus; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE directus WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE directus OWNER TO postgres;

\connect directus

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: directus; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE directus SET search_path TO '$user', 'public', 'tiger';


\connect directus

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO postgres;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO postgres;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO postgres;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO postgres;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json
);


ALTER TABLE public.directus_files OWNER TO postgres;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO postgres;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO postgres;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO postgres;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO postgres;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_notifications_id_seq OWNER TO postgres;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO postgres;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO postgres;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);


ALTER TABLE public.directus_permissions OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO postgres;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(30) DEFAULT 'bookmark_outline'::character varying NOT NULL,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO postgres;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO postgres;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer
);


ALTER TABLE public.directus_revisions OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO postgres;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO postgres;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid,
    origin character varying(255)
);


ALTER TABLE public.directus_sessions OWNER TO postgres;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(50) DEFAULT NULL::character varying,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    translation_strings json,
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json
);


ALTER TABLE public.directus_settings OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO postgres;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64),
    item character varying(255),
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO postgres;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    theme character varying(20) DEFAULT 'auto'::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true
);


ALTER TABLE public.directus_users OWNER TO postgres;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json
);


ALTER TABLE public.directus_webhooks OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO postgres;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: doctors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctors (
    doctor_id bigint NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    age integer,
    contact_info text,
    name character varying(255),
    gender integer DEFAULT 0,
    profile uuid
);


ALTER TABLE public.doctors OWNER TO postgres;

--
-- Name: doctors_doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.doctors_doctor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctors_doctor_id_seq OWNER TO postgres;

--
-- Name: doctors_doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.doctors_doctor_id_seq OWNED BY public.doctors.doctor_id;


--
-- Name: patients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patients (
    patient_id integer NOT NULL,
    name text NOT NULL,
    gender character(1) NOT NULL,
    age integer NOT NULL,
    contact_info text
);


ALTER TABLE public.patients OWNER TO postgres;

--
-- Name: patients_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patients_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_patient_id_seq OWNER TO postgres;

--
-- Name: patients_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patients_patient_id_seq OWNED BY public.patients.patient_id;


--
-- Name: pharmacist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pharmacist (
    pharmacist_id integer NOT NULL,
    name text NOT NULL,
    gender character(1) NOT NULL,
    age integer NOT NULL,
    contact_info text,
    pp uuid
);


ALTER TABLE public.pharmacist OWNER TO postgres;

--
-- Name: pharmacist_pharmacist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pharmacist_pharmacist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pharmacist_pharmacist_id_seq OWNER TO postgres;

--
-- Name: pharmacist_pharmacist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pharmacist_pharmacist_id_seq OWNED BY public.pharmacist.pharmacist_id;


--
-- Name: prescriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prescriptions (
    prescription_id integer NOT NULL,
    patient_id integer NOT NULL,
    drug_name text NOT NULL,
    dosage real NOT NULL,
    frequency text NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.prescriptions OWNER TO postgres;

--
-- Name: prescriptions_prescription_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prescriptions_prescription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescriptions_prescription_id_seq OWNER TO postgres;

--
-- Name: prescriptions_prescription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prescriptions_prescription_id_seq OWNED BY public.prescriptions.prescription_id;


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: doctors doctor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors ALTER COLUMN doctor_id SET DEFAULT nextval('public.doctors_doctor_id_seq'::regclass);


--
-- Name: patients patient_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients ALTER COLUMN patient_id SET DEFAULT nextval('public.patients_patient_id_seq'::regclass);


--
-- Name: pharmacist pharmacist_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacist ALTER COLUMN pharmacist_id SET DEFAULT nextval('public.pharmacist_pharmacist_id_seq'::regclass);


--
-- Name: prescriptions prescription_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions ALTER COLUMN prescription_id SET DEFAULT nextval('public.prescriptions_prescription_id_seq'::regclass);


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM stdin;
1	login	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 04:39:09.26+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	b76f063d-86b5-421a-b985-6f4e0885eb66	\N	http://localhost:8055
2	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:24:34.532+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	1	\N	http://localhost:8055
3	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:24:34.571+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	2	\N	http://localhost:8055
4	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:24:34.589+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	3	\N	http://localhost:8055
5	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:24:34.609+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	4	\N	http://localhost:8055
6	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:24:34.63+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	5	\N	http://localhost:8055
7	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:24:34.648+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	6	\N	http://localhost:8055
8	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:24:34.669+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	patients	\N	http://localhost:8055
9	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:30:46.936+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	doctors	\N	http://localhost:8055
10	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:30:47.505+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	doctors	\N	http://localhost:8055
11	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:31:41.969+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	7	\N	http://localhost:8055
12	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:31:45.491+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	8	\N	http://localhost:8055
13	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:31:48.294+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	9	\N	http://localhost:8055
14	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:31:50.714+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	10	\N	http://localhost:8055
15	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:31:53.098+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	11	\N	http://localhost:8055
16	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:32:40.746+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	doctors	\N	http://localhost:8055
18	delete	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:33:17.86+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	doctors	\N	http://localhost:8055
19	delete	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:33:21.554+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	patients	\N	http://localhost:8055
20	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:43:59.98+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	doctors	\N	http://localhost:8055
21	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:44:06.375+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	12	\N	http://localhost:8055
22	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:44:07.98+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	12	\N	http://localhost:8055
23	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:44:17.214+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	13	\N	http://localhost:8055
24	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:44:20.04+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	14	\N	http://localhost:8055
25	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:44:32.157+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	15	\N	http://localhost:8055
26	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:44:36.284+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	16	\N	http://localhost:8055
27	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:45:58.865+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	doctors	\N	http://localhost:8055
28	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:46:08.564+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	patients	\N	http://localhost:8055
29	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:46:31.263+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	17	\N	http://localhost:8055
30	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:46:36.417+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	18	\N	http://localhost:8055
31	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:46:41.002+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	19	\N	http://localhost:8055
32	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:47:08.043+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	20	\N	http://localhost:8055
33	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:47:16.602+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	21	\N	http://localhost:8055
34	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:47:35.959+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	patients	\N	http://localhost:8055
35	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:47:37.671+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	drug_stocks	\N	http://localhost:8055
36	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:47:42.016+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	22	\N	http://localhost:8055
37	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:47:49.304+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	drug_stocks	\N	http://localhost:8055
38	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:47:51.305+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	medical_records	\N	http://localhost:8055
39	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:48:01.747+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	medical_records	\N	http://localhost:8055
40	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:48:06.316+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	prescriptions	\N	http://localhost:8055
41	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:48:11.075+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	prescriptions	\N	http://localhost:8055
42	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:48:14.542+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	sales	\N	http://localhost:8055
43	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 05:48:18.657+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	sales	\N	http://localhost:8055
46	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 06:04:19.862+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	1	\N	http://localhost:8055
47	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 06:06:27.888+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	1	\N	http://localhost:8055
48	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 06:07:27.407+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	1	\N	http://localhost:8055
49	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 06:37:58.603+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	2	\N	http://localhost:8055
50	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 06:41:37.36+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	1	\N	http://localhost:8055
51	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 06:45:25.674+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	1	\N	http://localhost:8055
53	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 07:06:40.313+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	1	\N	http://localhost:8055
54	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 08:15:03.873+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	3	\N	http://localhost:8055
55	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 08:47:07.044+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	23	\N	http://localhost:8055
56	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 08:47:07.08+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	test_collection	\N	http://localhost:8055
57	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 08:47:28.812+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	test_collection	1	\N	http://localhost:8055
58	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 08:50:41.378+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	3	\N	http://localhost:8055
59	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 08:50:54.482+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	3	\N	http://localhost:8055
62	delete	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:07:01.47+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	test_collection	\N	http://localhost:8055
63	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:07:13.491+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	12	\N	http://localhost:8055
64	delete	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:14:10.563+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	sales	\N	http://localhost:8055
65	delete	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:14:13.359+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	prescriptions	\N	http://localhost:8055
66	delete	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:14:24.741+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	medical_records	\N	http://localhost:8055
70	login	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:14:59.458+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	b76f063d-86b5-421a-b985-6f4e0885eb66	\N	http://0.0.0.0:8055
67	delete	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:14:27.765+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	drug_stocks	\N	http://localhost:8055
68	delete	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:14:30.329+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	patients	\N	http://localhost:8055
69	delete	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:14:35.348+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	doctors	\N	http://localhost:8055
71	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:16:04.424+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	24	\N	http://0.0.0.0:8055
72	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:16:04.454+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	25	\N	http://0.0.0.0:8055
73	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:16:04.469+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	26	\N	http://0.0.0.0:8055
74	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:16:04.486+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	27	\N	http://0.0.0.0:8055
75	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:16:04.502+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	28	\N	http://0.0.0.0:8055
76	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:16:04.516+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	29	\N	http://0.0.0.0:8055
77	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:16:04.534+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	doctors	\N	http://0.0.0.0:8055
78	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:17:43.884+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	30	\N	http://0.0.0.0:8055
79	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:18:23.453+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	31	\N	http://0.0.0.0:8055
80	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:18:41.271+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	32	\N	http://0.0.0.0:8055
81	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:18:57.707+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	doctors	\N	http://0.0.0.0:8055
82	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:20:25.646+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	33	\N	http://0.0.0.0:8055
83	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:22:01.38+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	doctors	1	\N	http://0.0.0.0:8055
84	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:24:38.316+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	4	\N	http://0.0.0.0:8055
85	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:24:40.109+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	5	\N	http://0.0.0.0:8055
86	create	\N	2022-12-25 09:24:42.751+00	127.0.0.1	PostmanRuntime/7.30.0	doctors	2	\N	\N
87	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:25:01.622+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	doctors	2	\N	http://0.0.0.0:8055
88	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:26:27.985+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	34	\N	http://0.0.0.0:8055
89	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:26:36.513+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	doctors	2	\N	http://0.0.0.0:8055
90	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:28:49.843+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_files	867bceb2-8601-42a5-9688-965ee6c9f0bc	\N	http://0.0.0.0:8055
91	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:29:19.4+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	35	\N	http://0.0.0.0:8055
92	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:29:37.332+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	doctors	1	\N	http://0.0.0.0:8055
93	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:31:12.244+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
94	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:32:10.909+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_files	47e75f64-540b-4e02-aec7-d679cf109cc0	\N	http://0.0.0.0:8055
95	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:32:29.026+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
96	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:33:56.515+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_files	ba3f1be0-8670-434e-81cd-c4718443b45f	\N	http://0.0.0.0:8055
97	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:34:00.491+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
98	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:46:30.352+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	patients	\N	http://0.0.0.0:8055
99	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:47:22.572+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	36	\N	http://0.0.0.0:8055
100	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:49:16.067+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	36	\N	http://0.0.0.0:8055
101	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:49:23.896+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	36	\N	http://0.0.0.0:8055
102	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:49:26.293+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	37	\N	http://0.0.0.0:8055
103	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:49:34.858+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	38	\N	http://0.0.0.0:8055
104	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:49:37.557+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	39	\N	http://0.0.0.0:8055
105	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:49:53.65+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	40	\N	http://0.0.0.0:8055
106	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:50:26.709+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	patients	1	\N	http://0.0.0.0:8055
107	delete	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:50:38.152+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	patients	1	\N	http://0.0.0.0:8055
108	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:53:51.334+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	39	\N	http://0.0.0.0:8055
109	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:56:02.379+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
110	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:58:11.387+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	pharmacist	\N	http://0.0.0.0:8055
111	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:58:15.063+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	41	\N	http://0.0.0.0:8055
112	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:58:30.386+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	41	\N	http://0.0.0.0:8055
113	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:58:32.058+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	42	\N	http://0.0.0.0:8055
114	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:58:34.21+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	43	\N	http://0.0.0.0:8055
115	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:58:37.96+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	44	\N	http://0.0.0.0:8055
116	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:58:40.66+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	45	\N	http://0.0.0.0:8055
117	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:02:23.79+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	pharmacist	1	\N	http://0.0.0.0:8055
118	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:05:32.497+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	6	\N	http://0.0.0.0:8055
119	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:05:33.436+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	7	\N	http://0.0.0.0:8055
120	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:05:34.555+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	8	\N	http://0.0.0.0:8055
121	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:05:35.634+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	9	\N	http://0.0.0.0:8055
122	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:08:42.685+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	prescriptions	\N	http://0.0.0.0:8055
123	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:08:59.631+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	46	\N	http://0.0.0.0:8055
124	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:09:17.892+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	46	\N	http://0.0.0.0:8055
125	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:15:53.634+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
126	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:16:13.718+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
127	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:16:15.803+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	48	\N	http://0.0.0.0:8055
128	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:16:21.545+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	48	\N	http://0.0.0.0:8055
129	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:16:26.359+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	49	\N	http://0.0.0.0:8055
130	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:16:31.208+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	50	\N	http://0.0.0.0:8055
131	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:16:38.131+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	51	\N	http://0.0.0.0:8055
132	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:16:40.993+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	52	\N	http://0.0.0.0:8055
133	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:17:35.138+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
134	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:28:18.751+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	24	\N	http://0.0.0.0:8055
135	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:28:19.104+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	25	\N	http://0.0.0.0:8055
136	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:28:19.361+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	26	\N	http://0.0.0.0:8055
137	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:28:19.591+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	27	\N	http://0.0.0.0:8055
138	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:28:19.819+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	28	\N	http://0.0.0.0:8055
139	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:28:20.048+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	29	\N	http://0.0.0.0:8055
140	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:28:20.279+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	32	\N	http://0.0.0.0:8055
141	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:28:20.511+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	31	\N	http://0.0.0.0:8055
142	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:28:20.736+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	33	\N	http://0.0.0.0:8055
143	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:28:20.962+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	34	\N	http://0.0.0.0:8055
144	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:28:21.186+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	35	\N	http://0.0.0.0:8055
145	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:29:32.91+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	patients	2	\N	http://0.0.0.0:8055
146	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:30:36.586+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	prescriptions	1	\N	http://0.0.0.0:8055
147	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:31:35.155+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
148	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:38:09.093+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
149	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:38:35.417+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	prescriptions	1	\N	http://0.0.0.0:8055
150	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 10:38:50.953+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
151	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:16:47.325+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
152	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:17:32.532+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
153	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:18:15.099+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
154	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:33:59.988+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_roles	d6c8e3e4-8750-4a8f-a459-3a3294f06361	\N	http://0.0.0.0:8055
155	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.065+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	10	\N	http://0.0.0.0:8055
156	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.086+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	11	\N	http://0.0.0.0:8055
157	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.105+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	12	\N	http://0.0.0.0:8055
158	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.124+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	13	\N	http://0.0.0.0:8055
159	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.147+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	14	\N	http://0.0.0.0:8055
160	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.17+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	15	\N	http://0.0.0.0:8055
161	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.191+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	16	\N	http://0.0.0.0:8055
162	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.21+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	17	\N	http://0.0.0.0:8055
163	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.234+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	18	\N	http://0.0.0.0:8055
164	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.254+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	19	\N	http://0.0.0.0:8055
165	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.276+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	20	\N	http://0.0.0.0:8055
166	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.296+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	21	\N	http://0.0.0.0:8055
167	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.313+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	22	\N	http://0.0.0.0:8055
168	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.331+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	23	\N	http://0.0.0.0:8055
169	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.346+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	24	\N	http://0.0.0.0:8055
170	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.361+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	25	\N	http://0.0.0.0:8055
171	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.375+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	26	\N	http://0.0.0.0:8055
172	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.393+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	27	\N	http://0.0.0.0:8055
173	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.41+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	28	\N	http://0.0.0.0:8055
174	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.428+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	29	\N	http://0.0.0.0:8055
175	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.444+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	30	\N	http://0.0.0.0:8055
176	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.46+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	31	\N	http://0.0.0.0:8055
177	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.477+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	32	\N	http://0.0.0.0:8055
178	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:34:00.493+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	33	\N	http://0.0.0.0:8055
179	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:35:00.032+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_roles	d6c8e3e4-8750-4a8f-a459-3a3294f06361	\N	http://0.0.0.0:8055
180	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:35:46.62+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	ee825428-4a62-4412-a006-e67b7e030f89	\N	http://0.0.0.0:8055
181	login	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:36:26.653+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	b76f063d-86b5-421a-b985-6f4e0885eb66	\N	http://0.0.0.0:8055
182	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:36:45.382+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	ee825428-4a62-4412-a006-e67b7e030f89	\N	http://0.0.0.0:8055
183	login	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:37:17.359+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	b76f063d-86b5-421a-b985-6f4e0885eb66	\N	http://0.0.0.0:8055
184	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:37:48.096+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	ee825428-4a62-4412-a006-e67b7e030f89	\N	http://0.0.0.0:8055
185	login	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:38:16.827+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	b76f063d-86b5-421a-b985-6f4e0885eb66	\N	http://0.0.0.0:8055
186	delete	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:38:29.103+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	ee825428-4a62-4412-a006-e67b7e030f89	\N	http://0.0.0.0:8055
187	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:38:47.881+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	1e5d5cea-b51e-42ab-a864-efbf487496e0	\N	http://0.0.0.0:8055
188	login	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:39:11.341+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	b76f063d-86b5-421a-b985-6f4e0885eb66	\N	http://0.0.0.0:8055
189	delete	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:39:26.671+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	1e5d5cea-b51e-42ab-a864-efbf487496e0	\N	http://0.0.0.0:8055
190	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:40:19.998+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	36329cc9-42f6-4f3c-b316-f55d29bec75b	\N	http://0.0.0.0:8055
191	login	36329cc9-42f6-4f3c-b316-f55d29bec75b	2022-12-25 11:40:47.277+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	36329cc9-42f6-4f3c-b316-f55d29bec75b	\N	http://0.0.0.0:8055
192	update	36329cc9-42f6-4f3c-b316-f55d29bec75b	2022-12-25 11:43:36.256+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	36329cc9-42f6-4f3c-b316-f55d29bec75b	\N	http://0.0.0.0:8055
193	login	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:44:59.042+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_users	b76f063d-86b5-421a-b985-6f4e0885eb66	\N	http://0.0.0.0:8055
194	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:45:23.599+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	34	\N	http://0.0.0.0:8055
195	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:45:25.145+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	35	\N	http://0.0.0.0:8055
196	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:45:26.3+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	36	\N	http://0.0.0.0:8055
197	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:45:27.353+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	37	\N	http://0.0.0.0:8055
198	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:48:40.49+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	53	\N	http://0.0.0.0:8055
199	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:49:05.631+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	pharmacist	1	\N	http://0.0.0.0:8055
200	create	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:58:00.705+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	38	\N	http://0.0.0.0:8055
201	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 11:58:33.5+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	38	\N	http://0.0.0.0:8055
202	delete	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:00:06.693+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_permissions	38	\N	http://0.0.0.0:8055
203	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:09:19.603+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	prescriptions	\N	http://0.0.0.0:8055
204	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:14:44.751+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
205	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:23:54.038+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_collections	prescriptions	\N	http://0.0.0.0:8055
206	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:24:16.022+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	prescriptions	1	\N	http://0.0.0.0:8055
207	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:26:39.212+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
208	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:31:12.05+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
209	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:31:16.716+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
210	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:31:20.076+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	46	\N	http://0.0.0.0:8055
211	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:31:24.934+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	49	\N	http://0.0.0.0:8055
212	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:31:30.055+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
213	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:31:53.848+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
214	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:32:47.015+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
215	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:35:17.712+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	47	\N	http://0.0.0.0:8055
216	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:38:31.222+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	39	\N	http://0.0.0.0:8055
217	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:42:50.09+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	39	\N	http://0.0.0.0:8055
218	update	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 12:49:03.038+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	directus_fields	39	\N	http://0.0.0.0:8055
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse) FROM stdin;
doctors	\N	\N	\N	f	f	\N	status	t	archived	draft	\N	activity	\N	\N	\N	\N	open
patients	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
pharmacist	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open
prescriptions	\N	\N	{{patient_id}}{{prescription_id}}	f	f	\N	\N	t	\N	\N	\N	all	\N	["patient_id"]	\N	\N	open
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
31	doctors	age	\N	input	\N	\N	\N	f	f	8	full	\N	\N	\N	t	\N	\N	\N
23	test_collection	tc_id	\N	input	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
33	doctors	name	\N	input	\N	\N	\N	f	f	9	full	\N	\N	\N	t	\N	\N	\N
34	doctors	gender	\N	select-dropdown	{"choices":[{"text":"man","value":0},{"text":"woman","value":1},{"text":"other","value":2}]}	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
35	doctors	profile	file	file-image	\N	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
36	patients	patient_id	\N	\N	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
37	patients	age	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
38	patients	name	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
40	patients	contact_info	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
41	pharmacist	pharmacist_id	\N	\N	\N	\N	\N	t	t	\N	full	\N	\N	\N	f	\N	\N	\N
42	pharmacist	name	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
43	pharmacist	gender	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
44	pharmacist	age	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
45	pharmacist	contact_info	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
50	prescriptions	dosage	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
51	prescriptions	frequency	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
52	prescriptions	date_created	\N	\N	\N	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
24	doctors	doctor_id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
25	doctors	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]}	labels	{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
26	doctors	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
27	doctors	date_created	date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
28	doctors	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
29	doctors	date_updated	date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
32	doctors	contact_info	\N	input-multiline	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
53	pharmacist	pp	m2o	select-dropdown-m2o	{"choices":null,"filter":{"_and":[{"role":{"name":{"_contains":"Pharmacist"}}}]}}	\N	\N	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
46	prescriptions	prescription_id	\N	\N	\N	\N	\N	t	t	\N	half	\N	\N	\N	f	\N	\N	\N
49	prescriptions	drug_name	\N	\N	\N	\N	\N	f	f	\N	half	\N	\N	\N	f	\N	\N	\N
47	prescriptions	patient_id	\N	select-dropdown-m2o	{"template":" {{name}} {{contact_info}}"}	related-values	{"template":"{{name}} {{contact_info}} "}	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
39	patients	gender	\N	select-dropdown	{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}]}	labels	{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}],"format":true}	f	f	\N	full	\N	\N	\N	f	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata) FROM stdin;
867bceb2-8601-42a5-9688-965ee6c9f0bc	local	867bceb2-8601-42a5-9688-965ee6c9f0bc.png	Black_Jack_-_special.png	Black Jack   Special	image/png	\N	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:28:49.773955+00	\N	2022-12-25 09:28:49.913+00	\N	116170	364	273	\N	\N	\N	\N	\N	{}
47e75f64-540b-4e02-aec7-d679cf109cc0	local	47e75f64-540b-4e02-aec7-d679cf109cc0.png	medical-symbol.png	Medical Symbol	image/png	\N	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:32:10.869908+00	\N	2022-12-25 09:32:10.946+00	\N	83439	840	800	\N	\N	\N	\N	\N	{}
ba3f1be0-8670-434e-81cd-c4718443b45f	local	ba3f1be0-8670-434e-81cd-c4718443b45f.png	caduceus-symbol.png	Caduceus Symbol	image/png	\N	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:33:56.50386+00	\N	2022-12-25 09:33:56.543+00	\N	5191	64	64	\N	\N	\N	\N	\N	{}
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2022-12-25 04:37:53.56051+00
20201029A	Remove System Relations	2022-12-25 04:37:53.576398+00
20201029B	Remove System Collections	2022-12-25 04:37:53.582984+00
20201029C	Remove System Fields	2022-12-25 04:37:53.596907+00
20201105A	Add Cascade System Relations	2022-12-25 04:37:53.815607+00
20201105B	Change Webhook URL Type	2022-12-25 04:37:53.827908+00
20210225A	Add Relations Sort Field	2022-12-25 04:37:53.837769+00
20210304A	Remove Locked Fields	2022-12-25 04:37:53.845921+00
20210312A	Webhooks Collections Text	2022-12-25 04:37:53.855114+00
20210331A	Add Refresh Interval	2022-12-25 04:37:53.861052+00
20210415A	Make Filesize Nullable	2022-12-25 04:37:53.874348+00
20210416A	Add Collections Accountability	2022-12-25 04:37:53.885246+00
20210422A	Remove Files Interface	2022-12-25 04:37:53.891305+00
20210506A	Rename Interfaces	2022-12-25 04:37:53.955472+00
20210510A	Restructure Relations	2022-12-25 04:37:54.013057+00
20210518A	Add Foreign Key Constraints	2022-12-25 04:37:54.048286+00
20210519A	Add System Fk Triggers	2022-12-25 04:37:54.160303+00
20210521A	Add Collections Icon Color	2022-12-25 04:37:54.165903+00
20210525A	Add Insights	2022-12-25 04:37:54.230695+00
20210608A	Add Deep Clone Config	2022-12-25 04:37:54.236682+00
20210626A	Change Filesize Bigint	2022-12-25 04:37:54.270198+00
20210716A	Add Conditions to Fields	2022-12-25 04:37:54.275708+00
20210721A	Add Default Folder	2022-12-25 04:37:54.290335+00
20210802A	Replace Groups	2022-12-25 04:37:54.300874+00
20210803A	Add Required to Fields	2022-12-25 04:37:54.312973+00
20210805A	Update Groups	2022-12-25 04:37:54.325773+00
20210805B	Change Image Metadata Structure	2022-12-25 04:37:54.332288+00
20210811A	Add Geometry Config	2022-12-25 04:37:54.339401+00
20210831A	Remove Limit Column	2022-12-25 04:37:54.346306+00
20210903A	Add Auth Provider	2022-12-25 04:37:54.383904+00
20210907A	Webhooks Collections Not Null	2022-12-25 04:37:54.397274+00
20210910A	Move Module Setup	2022-12-25 04:37:54.408592+00
20210920A	Webhooks URL Not Null	2022-12-25 04:37:54.42137+00
20210924A	Add Collection Organization	2022-12-25 04:37:54.442519+00
20210927A	Replace Fields Group	2022-12-25 04:37:54.465995+00
20210927B	Replace M2M Interface	2022-12-25 04:37:54.472784+00
20210929A	Rename Login Action	2022-12-25 04:37:54.479682+00
20211007A	Update Presets	2022-12-25 04:37:54.493703+00
20211009A	Add Auth Data	2022-12-25 04:37:54.501157+00
20211016A	Add Webhook Headers	2022-12-25 04:37:54.508261+00
20211103A	Set Unique to User Token	2022-12-25 04:37:54.519804+00
20211103B	Update Special Geometry	2022-12-25 04:37:54.528108+00
20211104A	Remove Collections Listing	2022-12-25 04:37:54.536086+00
20211118A	Add Notifications	2022-12-25 04:37:54.594521+00
20211211A	Add Shares	2022-12-25 04:37:54.686196+00
20211230A	Add Project Descriptor	2022-12-25 04:37:54.694137+00
20220303A	Remove Default Project Color	2022-12-25 04:37:54.711969+00
20220308A	Add Bookmark Icon and Color	2022-12-25 04:37:54.725596+00
20220314A	Add Translation Strings	2022-12-25 04:37:54.735217+00
20220322A	Rename Field Typecast Flags	2022-12-25 04:37:54.746146+00
20220323A	Add Field Validation	2022-12-25 04:37:54.756628+00
20220325A	Fix Typecast Flags	2022-12-25 04:37:54.766791+00
20220325B	Add Default Language	2022-12-25 04:37:54.798139+00
20220402A	Remove Default Value Panel Icon	2022-12-25 04:37:54.818103+00
20220429A	Add Flows	2022-12-25 04:37:54.963127+00
20220429B	Add Color to Insights Icon	2022-12-25 04:37:54.97101+00
20220429C	Drop Non Null From IP of Activity	2022-12-25 04:37:54.976822+00
20220429D	Drop Non Null From Sender of Notifications	2022-12-25 04:37:54.982347+00
20220614A	Rename Hook Trigger to Event	2022-12-25 04:37:54.987978+00
20220801A	Update Notifications Timestamp Column	2022-12-25 04:37:55.000078+00
20220802A	Add Custom Aspect Ratios	2022-12-25 04:37:55.007652+00
20220826A	Add Origin to Accountability	2022-12-25 04:37:55.0164+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
4	\N	doctors	read	{}	{}	\N	*
5	\N	doctors	create	{}	{}	\N	*
6	\N	patients	read	{}	{}	\N	*
7	\N	patients	create	{}	{}	\N	*
8	\N	pharmacist	create	{}	{}	\N	*
9	\N	pharmacist	read	{}	{}	\N	*
10	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_files	create	{}	\N	\N	*
11	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_files	read	{}	\N	\N	*
12	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_files	update	{}	\N	\N	*
13	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_files	delete	{}	\N	\N	*
14	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_dashboards	create	{}	\N	\N	*
15	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_dashboards	read	{}	\N	\N	*
16	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_dashboards	update	{}	\N	\N	*
17	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_dashboards	delete	{}	\N	\N	*
18	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_panels	create	{}	\N	\N	*
19	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_panels	read	{}	\N	\N	*
20	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_panels	update	{}	\N	\N	*
21	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_panels	delete	{}	\N	\N	*
22	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_folders	create	{}	\N	\N	*
23	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_folders	read	{}	\N	\N	*
24	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_folders	update	{}	\N	\N	*
25	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_folders	delete	{}	\N	\N	\N
26	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_users	read	{}	\N	\N	*
27	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_users	update	{"id":{"_eq":"$CURRENT_USER"}}	\N	\N	first_name,last_name,email,password,location,title,description,avatar,language,theme,tfa_secret
28	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_roles	read	{}	\N	\N	*
29	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_shares	read	{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]}	\N	\N	*
30	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_shares	create	{}	\N	\N	*
31	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_shares	update	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*
32	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_shares	delete	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*
33	d6c8e3e4-8750-4a8f-a459-3a3294f06361	directus_flows	read	{"trigger":{"_eq":"manual"}}	\N	\N	id,name,icon,color,options,trigger
34	d6c8e3e4-8750-4a8f-a459-3a3294f06361	patients	create	{}	{}	\N	*
35	d6c8e3e4-8750-4a8f-a459-3a3294f06361	patients	read	{}	{}	\N	*
36	d6c8e3e4-8750-4a8f-a459-3a3294f06361	patients	update	{}	{}	\N	*
37	d6c8e3e4-8750-4a8f-a459-3a3294f06361	patients	delete	{}	{}	\N	*
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
14	\N	b76f063d-86b5-421a-b985-6f4e0885eb66	\N	prescriptions	\N	tabular	{"tabular":{"fields":["date_created","dosage","drug_name","frequency","patient_id"],"page":1}}	{"tabular":{"widths":{"date_created":357.734375,"patient_id":698.46484375},"spacing":"comfortable"},"calendar":{"viewInfo":{"type":"dayGridMonth","startDateStr":"2022-12-01T00:00:00+08:00"},"template":"{{patient_id}}","startDateField":"date_created","endDateField":"date_created","firstDay":0},"cards":{"title":"{{patient_id}}"}}	\N	{"_and":[{"date_created":{"_lt":"2022-12-26T12:00:00+08:00"}}]}	bookmark_outline	\N
10	\N	b76f063d-86b5-421a-b985-6f4e0885eb66	\N	directus_files	\N	cards	{"cards":{"sort":["-uploaded_on"],"page":1}}	{"cards":{"icon":"insert_drive_file","title":"{{ title }}","subtitle":"{{ type }} • {{ filesize }}","size":4,"imageFit":"crop"}}	\N	\N	bookmark_outline	\N
12	\N	b76f063d-86b5-421a-b985-6f4e0885eb66	\N	doctors	\N	cards	{"tabular":{"fields":["name","age","contact_info","gender","status"]},"cards":{"page":1}}	{"tabular":{"widths":{}},"cards":{"title":"{{name}}","subtitle":"{{age}} ","size":5}}	\N	\N	bookmark_outline	\N
15	\N	b76f063d-86b5-421a-b985-6f4e0885eb66	\N	patients	\N	\N	{"tabular":{"page":1,"fields":["name","age","contact_info","gender"]}}	{"tabular":{"widths":{"contact_info":602.4453125}}}	\N	\N	bookmark_outline	\N
1	\N	b76f063d-86b5-421a-b985-6f4e0885eb66	\N	directus_users	\N	cards	{"cards":{"sort":["email"],"page":1}}	{"cards":{"icon":"account_circle","title":"{{ first_name }} {{ last_name }}","subtitle":"{{ email }}","size":4}}	\N	\N	bookmark_outline	\N
13	\N	b76f063d-86b5-421a-b985-6f4e0885eb66	\N	pharmacist	\N	cards	{"tabular":{"page":1}}	{"cards":{"title":"{{name}}","subtitle":"{{gender}}"}}	\N	\N	bookmark_outline	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
3	doctors	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
4	doctors	user_created	directus_users	\N	\N	\N	\N	\N	nullify
5	doctors	profile	directus_files	\N	\N	\N	\N	\N	nullify
6	pharmacist	pp	directus_users	\N	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent) FROM stdin;
1	2	directus_fields	1	{"hidden":true,"interface":"input","readonly":true,"field":"patient_id","collection":"patients"}	{"hidden":true,"interface":"input","readonly":true,"field":"patient_id","collection":"patients"}	\N
2	3	directus_fields	2	{"interface":"input","hidden":true,"field":"sort","collection":"patients"}	{"interface":"input","hidden":true,"field":"sort","collection":"patients"}	\N
3	4	directus_fields	3	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"patients"}	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"patients"}	\N
4	5	directus_fields	4	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"patients"}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"patients"}	\N
5	6	directus_fields	5	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"patients"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"patients"}	\N
6	7	directus_fields	6	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"patients"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"patients"}	\N
7	8	directus_collections	patients	{"sort_field":"sort","singleton":false,"collection":"patients"}	{"sort_field":"sort","singleton":false,"collection":"patients"}	\N
8	9	directus_collections	doctors	{"collection":"doctors"}	{"collection":"doctors"}	\N
9	11	directus_fields	7	{"special":null,"collection":"doctors","field":"doctor_id"}	{"special":null,"collection":"doctors","field":"doctor_id"}	\N
10	12	directus_fields	8	{"special":null,"collection":"doctors","field":"name"}	{"special":null,"collection":"doctors","field":"name"}	\N
11	13	directus_fields	9	{"special":null,"collection":"doctors","field":"gender"}	{"special":null,"collection":"doctors","field":"gender"}	\N
12	14	directus_fields	10	{"special":null,"collection":"doctors","field":"age"}	{"special":null,"collection":"doctors","field":"age"}	\N
13	15	directus_fields	11	{"special":null,"collection":"doctors","field":"contact_info"}	{"special":null,"collection":"doctors","field":"contact_info"}	\N
14	16	directus_collections	doctors	{"collection":"doctors","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":["doctor_id","name","gender","age","contact_info"],"sort":null,"group":null,"collapse":"open"}	{"item_duplication_fields":["doctor_id","name","gender","age","contact_info"]}	\N
16	20	directus_collections	doctors	{"collection":"doctors"}	{"collection":"doctors"}	\N
17	21	directus_fields	12	{"special":null,"collection":"doctors","field":"doctor_id"}	{"special":null,"collection":"doctors","field":"doctor_id"}	\N
18	22	directus_fields	12	{"id":12,"collection":"doctors","field":"doctor_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"doctors","field":"doctor_id","special":null}	\N
19	23	directus_fields	13	{"special":null,"collection":"doctors","field":"name"}	{"special":null,"collection":"doctors","field":"name"}	\N
20	24	directus_fields	14	{"special":null,"collection":"doctors","field":"gender"}	{"special":null,"collection":"doctors","field":"gender"}	\N
21	25	directus_fields	15	{"special":null,"collection":"doctors","field":"age"}	{"special":null,"collection":"doctors","field":"age"}	\N
22	26	directus_fields	16	{"special":null,"collection":"doctors","field":"contact_info"}	{"special":null,"collection":"doctors","field":"contact_info"}	\N
23	27	directus_collections	doctors	{"collection":"doctors","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"activity","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"accountability":"activity"}	\N
24	28	directus_collections	patients	{"collection":"patients"}	{"collection":"patients"}	\N
25	29	directus_fields	17	{"special":null,"collection":"patients","field":"patient_id"}	{"special":null,"collection":"patients","field":"patient_id"}	\N
26	30	directus_fields	18	{"special":null,"collection":"patients","field":"name"}	{"special":null,"collection":"patients","field":"name"}	\N
27	31	directus_fields	19	{"special":null,"collection":"patients","field":"gender"}	{"special":null,"collection":"patients","field":"gender"}	\N
28	32	directus_fields	20	{"special":null,"collection":"patients","field":"age"}	{"special":null,"collection":"patients","field":"age"}	\N
29	33	directus_fields	21	{"special":null,"collection":"patients","field":"contact_info"}	{"special":null,"collection":"patients","field":"contact_info"}	\N
30	34	directus_collections	patients	{"collection":"patients","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"activity","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"accountability":"activity"}	\N
31	35	directus_collections	drug_stocks	{"collection":"drug_stocks"}	{"collection":"drug_stocks"}	\N
32	36	directus_fields	22	{"special":null,"collection":"drug_stocks","field":"drug_id"}	{"special":null,"collection":"drug_stocks","field":"drug_id"}	\N
36	40	directus_collections	prescriptions	{"collection":"prescriptions"}	{"collection":"prescriptions"}	\N
33	37	directus_collections	drug_stocks	{"collection":"drug_stocks","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"activity","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"accountability":"activity"}	\N
34	38	directus_collections	medical_records	{"collection":"medical_records"}	{"collection":"medical_records"}	\N
35	39	directus_collections	medical_records	{"collection":"medical_records","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"activity","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"accountability":"activity"}	\N
38	42	directus_collections	sales	{"collection":"sales"}	{"collection":"sales"}	\N
39	43	directus_collections	sales	{"collection":"sales","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"activity","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"accountability":"activity"}	\N
37	41	directus_collections	prescriptions	{"collection":"prescriptions","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"activity","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"accountability":"activity"}	\N
40	46	directus_permissions	1	{"role":null,"collection":"doctors","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"doctors","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
41	47	directus_permissions	1	{"id":1,"role":null,"collection":"doctors","action":"read","permissions":{"_and":[{"name":{"_contains":null}}]},"validation":{},"presets":null,"fields":["name","contact_info","gender"]}	{"role":null,"collection":"doctors","action":"read","permissions":{"_and":[{"name":{"_contains":null}}]},"validation":{},"presets":null,"fields":["name","contact_info","gender"]}	\N
42	48	directus_permissions	1	{"id":1,"role":null,"collection":"doctors","action":"read","permissions":null,"validation":{},"presets":null,"fields":["name","contact_info","gender"]}	{"role":null,"collection":"doctors","action":"read","permissions":null,"validation":{},"presets":null,"fields":["name","contact_info","gender"]}	\N
43	49	directus_permissions	2	{"role":null,"collection":"medical_records","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"medical_records","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
44	50	directus_permissions	1	{"id":1,"role":null,"collection":"doctors","action":"read","permissions":{"_and":[{"doctor_id":{"_eq":"1"}}]},"validation":{},"presets":null,"fields":["name","contact_info","gender"]}	{"role":null,"collection":"doctors","action":"read","permissions":{"_and":[{"doctor_id":{"_eq":"1"}}]},"validation":{},"presets":null,"fields":["name","contact_info","gender"]}	\N
45	51	directus_permissions	1	{"id":1,"role":null,"collection":"doctors","action":"read","permissions":{"_and":[{"doctor_id":{"_eq":"1"}}]},"validation":{},"presets":null,"fields":["name","contact_info","gender"]}	{"role":null,"collection":"doctors","action":"read","permissions":{"_and":[{"doctor_id":{"_eq":"1"}}]},"validation":{},"presets":null,"fields":["name","contact_info","gender"]}	\N
46	53	directus_permissions	1	{"id":1,"role":null,"collection":"doctors","action":"read","permissions":null,"validation":{},"presets":null,"fields":["name","contact_info","gender"]}	{"role":null,"collection":"doctors","action":"read","permissions":null,"validation":{},"presets":null,"fields":["name","contact_info","gender"]}	\N
47	54	directus_permissions	3	{"role":null,"collection":"doctors","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"doctors","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
48	55	directus_fields	23	{"hidden":true,"interface":"input","readonly":true,"field":"tc_id","collection":"test_collection"}	{"hidden":true,"interface":"input","readonly":true,"field":"tc_id","collection":"test_collection"}	\N
49	56	directus_collections	test_collection	{"singleton":false,"collection":"test_collection"}	{"singleton":false,"collection":"test_collection"}	\N
50	57	test_collection	1	\N	\N	\N
51	58	directus_permissions	3	{"id":3,"role":null,"collection":"doctors","action":"create","permissions":{},"validation":{},"presets":null,"fields":["name","gender","age","contact_info"]}	{"role":null,"collection":"doctors","action":"create","permissions":{},"validation":{},"presets":null,"fields":["name","gender","age","contact_info"]}	\N
52	59	directus_permissions	3	{"id":3,"role":null,"collection":"doctors","action":"create","permissions":{},"validation":{},"presets":null,"fields":["name","gender","age","contact_info","doctor_id"]}	{"role":null,"collection":"doctors","action":"create","permissions":{},"validation":{},"presets":null,"fields":["name","gender","age","contact_info","doctor_id"]}	\N
53	63	directus_fields	12	{"id":12,"collection":"doctors","field":"doctor_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":true,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"doctors","field":"doctor_id","hidden":false}	\N
54	71	directus_fields	24	{"hidden":true,"interface":"input","readonly":true,"field":"doctor_id","collection":"doctors"}	{"hidden":true,"interface":"input","readonly":true,"field":"doctor_id","collection":"doctors"}	\N
55	72	directus_fields	25	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"doctors"}	{"width":"full","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"interface":"select-dropdown","display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"field":"status","collection":"doctors"}	\N
56	73	directus_fields	26	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"doctors"}	{"special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_created","collection":"doctors"}	\N
57	74	directus_fields	27	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"doctors"}	{"special":["date-created"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_created","collection":"doctors"}	\N
58	75	directus_fields	28	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"doctors"}	{"special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","readonly":true,"hidden":true,"width":"half","field":"user_updated","collection":"doctors"}	\N
59	76	directus_fields	29	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"doctors"}	{"special":["date-updated"],"interface":"datetime","readonly":true,"hidden":true,"width":"half","display":"datetime","display_options":{"relative":true},"field":"date_updated","collection":"doctors"}	\N
60	77	directus_collections	doctors	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"doctors"}	{"archive_field":"status","archive_value":"archived","unarchive_value":"draft","singleton":false,"collection":"doctors"}	\N
61	78	directus_fields	30	{"interface":"select-multiple-dropdown","special":["cast-json"],"options":{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}]},"collection":"doctors","field":"gender"}	{"interface":"select-multiple-dropdown","special":["cast-json"],"options":{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}]},"collection":"doctors","field":"gender"}	\N
62	79	directus_fields	31	{"interface":"input","special":null,"required":true,"collection":"doctors","field":"age"}	{"interface":"input","special":null,"required":true,"collection":"doctors","field":"age"}	\N
63	80	directus_fields	32	{"interface":"input-multiline","special":null,"collection":"doctors","field":"contact_info"}	{"interface":"input-multiline","special":null,"collection":"doctors","field":"contact_info"}	\N
64	81	directus_collections	doctors	{"collection":"doctors","icon":null,"note":null,"display_template":null,"hidden":false,"singleton":false,"translations":null,"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"activity","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open"}	{"accountability":"activity"}	\N
65	82	directus_fields	33	{"interface":"input","special":null,"required":true,"collection":"doctors","field":"name"}	{"interface":"input","special":null,"required":true,"collection":"doctors","field":"name"}	\N
66	84	directus_permissions	4	{"role":null,"collection":"doctors","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"doctors","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
67	85	directus_permissions	5	{"role":null,"collection":"doctors","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"doctors","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
68	88	directus_fields	34	{"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"man","value":0},{"text":"woman","value":1},{"text":"other","value":2}]},"collection":"doctors","field":"gender"}	{"interface":"select-dropdown","special":null,"options":{"choices":[{"text":"man","value":0},{"text":"woman","value":1},{"text":"other","value":2}]},"collection":"doctors","field":"gender"}	\N
69	90	directus_files	867bceb2-8601-42a5-9688-965ee6c9f0bc	{"folder":null,"title":"Black Jack   Special","filename_download":"Black_Jack_-_special.png","type":"image/png","storage":"local"}	{"folder":null,"title":"Black Jack   Special","filename_download":"Black_Jack_-_special.png","type":"image/png","storage":"local"}	\N
70	91	directus_fields	35	{"interface":"file-image","special":["file"],"collection":"doctors","field":"profile"}	{"interface":"file-image","special":["file"],"collection":"doctors","field":"profile"}	\N
71	93	directus_settings	1	{"project_logo":"867bceb2-8601-42a5-9688-965ee6c9f0bc"}	{"project_logo":"867bceb2-8601-42a5-9688-965ee6c9f0bc"}	\N
72	94	directus_files	47e75f64-540b-4e02-aec7-d679cf109cc0	{"folder":null,"title":"Medical Symbol","filename_download":"medical-symbol.png","type":"image/png","storage":"local"}	{"folder":null,"title":"Medical Symbol","filename_download":"medical-symbol.png","type":"image/png","storage":"local"}	\N
73	95	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":null,"project_logo":"47e75f64-540b-4e02-aec7-d679cf109cc0","public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"translation_strings":null,"default_language":"en-US","custom_aspect_ratios":null}	{"project_logo":"47e75f64-540b-4e02-aec7-d679cf109cc0"}	\N
74	96	directus_files	ba3f1be0-8670-434e-81cd-c4718443b45f	{"title":"Caduceus Symbol","filename_download":"caduceus-symbol.png","type":"image/png","storage":"local"}	{"title":"Caduceus Symbol","filename_download":"caduceus-symbol.png","type":"image/png","storage":"local"}	\N
75	97	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":null,"project_logo":"ba3f1be0-8670-434e-81cd-c4718443b45f","public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"translation_strings":null,"default_language":"en-US","custom_aspect_ratios":null}	{"project_logo":"ba3f1be0-8670-434e-81cd-c4718443b45f"}	\N
76	98	directus_collections	patients	{"collection":"patients"}	{"collection":"patients"}	\N
77	99	directus_fields	36	{"special":null,"collection":"patients","field":"patient_id"}	{"special":null,"collection":"patients","field":"patient_id"}	\N
78	100	directus_fields	36	{"id":36,"collection":"patients","field":"patient_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":true,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"patients","field":"patient_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":true,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
79	101	directus_fields	36	{"id":36,"collection":"patients","field":"patient_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"patients","field":"patient_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
80	102	directus_fields	37	{"special":null,"collection":"patients","field":"age"}	{"special":null,"collection":"patients","field":"age"}	\N
81	103	directus_fields	38	{"special":null,"collection":"patients","field":"name"}	{"special":null,"collection":"patients","field":"name"}	\N
82	104	directus_fields	39	{"special":null,"collection":"patients","field":"gender"}	{"special":null,"collection":"patients","field":"gender"}	\N
83	105	directus_fields	40	{"special":null,"collection":"patients","field":"contact_info"}	{"special":null,"collection":"patients","field":"contact_info"}	\N
84	106	patients	1	{"age":18,"name":"ad","gender":"2"}	{"age":18,"name":"ad","gender":"2"}	\N
85	108	directus_fields	39	{"id":39,"collection":"patients","field":"gender","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"patients","field":"gender","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
86	109	directus_settings	1	{"id":1,"project_name":"DBMS","project_url":null,"project_color":null,"project_logo":"ba3f1be0-8670-434e-81cd-c4718443b45f","public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"translation_strings":null,"default_language":"en-US","custom_aspect_ratios":null}	{"project_name":"DBMS"}	\N
87	110	directus_collections	pharmacist	{"collection":"pharmacist"}	{"collection":"pharmacist"}	\N
88	111	directus_fields	41	{"special":null,"collection":"pharmacist","field":"pharmacist_id"}	{"special":null,"collection":"pharmacist","field":"pharmacist_id"}	\N
89	112	directus_fields	41	{"id":41,"collection":"pharmacist","field":"pharmacist_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"pharmacist","field":"pharmacist_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
90	113	directus_fields	42	{"special":null,"collection":"pharmacist","field":"name"}	{"special":null,"collection":"pharmacist","field":"name"}	\N
91	114	directus_fields	43	{"special":null,"collection":"pharmacist","field":"gender"}	{"special":null,"collection":"pharmacist","field":"gender"}	\N
92	115	directus_fields	44	{"special":null,"collection":"pharmacist","field":"age"}	{"special":null,"collection":"pharmacist","field":"age"}	\N
93	116	directus_fields	45	{"special":null,"collection":"pharmacist","field":"contact_info"}	{"special":null,"collection":"pharmacist","field":"contact_info"}	\N
94	117	pharmacist	1	{"name":"藥師一號","gender":"0","age":30}	{"name":"藥師一號","gender":"0","age":30}	\N
95	118	directus_permissions	6	{"role":null,"collection":"patients","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"patients","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
96	119	directus_permissions	7	{"role":null,"collection":"patients","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"patients","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
97	120	directus_permissions	8	{"role":null,"collection":"pharmacist","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"pharmacist","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
98	121	directus_permissions	9	{"role":null,"collection":"pharmacist","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"pharmacist","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
99	122	directus_collections	prescriptions	{"collection":"prescriptions"}	{"collection":"prescriptions"}	\N
100	123	directus_fields	46	{"special":null,"collection":"prescriptions","field":"prescription_id"}	{"special":null,"collection":"prescriptions","field":"prescription_id"}	\N
101	124	directus_fields	46	{"id":46,"collection":"prescriptions","field":"prescription_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"prescription_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
102	125	directus_fields	47	{"special":null,"collection":"prescriptions","field":"patient_id"}	{"special":null,"collection":"prescriptions","field":"patient_id"}	\N
103	126	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
104	127	directus_fields	48	{"special":null,"collection":"prescriptions","field":"doctor_id"}	{"special":null,"collection":"prescriptions","field":"doctor_id"}	\N
105	128	directus_fields	48	{"id":48,"collection":"prescriptions","field":"doctor_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"doctor_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
106	129	directus_fields	49	{"special":null,"collection":"prescriptions","field":"drug_name"}	{"special":null,"collection":"prescriptions","field":"drug_name"}	\N
107	130	directus_fields	50	{"special":null,"collection":"prescriptions","field":"dosage"}	{"special":null,"collection":"prescriptions","field":"dosage"}	\N
108	131	directus_fields	51	{"special":null,"collection":"prescriptions","field":"frequency"}	{"special":null,"collection":"prescriptions","field":"frequency"}	\N
109	132	directus_fields	52	{"special":null,"collection":"prescriptions","field":"date_created"}	{"special":null,"collection":"prescriptions","field":"date_created"}	\N
110	133	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}}"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
111	134	directus_fields	24	{"id":24,"collection":"doctors","field":"doctor_id","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":1,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"doctors","field":"doctor_id","sort":1,"group":null}	\N
112	135	directus_fields	25	{"id":25,"collection":"doctors","field":"status","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"$t:published","value":"published"},{"text":"$t:draft","value":"draft"},{"text":"$t:archived","value":"archived"}]},"display":"labels","display_options":{"showAsDot":true,"choices":[{"text":"$t:published","value":"published","foreground":"#FFFFFF","background":"var(--primary)"},{"text":"$t:draft","value":"draft","foreground":"#18222F","background":"#D3DAE4"},{"text":"$t:archived","value":"archived","foreground":"#FFFFFF","background":"var(--warning)"}]},"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"doctors","field":"status","sort":2,"group":null}	\N
113	136	directus_fields	26	{"id":26,"collection":"doctors","field":"user_created","special":["user-created"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":3,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"doctors","field":"user_created","sort":3,"group":null}	\N
114	137	directus_fields	27	{"id":27,"collection":"doctors","field":"date_created","special":["date-created"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":4,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"doctors","field":"date_created","sort":4,"group":null}	\N
115	138	directus_fields	28	{"id":28,"collection":"doctors","field":"user_updated","special":["user-updated"],"interface":"select-dropdown-m2o","options":{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"},"display":"user","display_options":null,"readonly":true,"hidden":true,"sort":5,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"doctors","field":"user_updated","sort":5,"group":null}	\N
116	139	directus_fields	29	{"id":29,"collection":"doctors","field":"date_updated","special":["date-updated"],"interface":"datetime","options":null,"display":"datetime","display_options":{"relative":true},"readonly":true,"hidden":true,"sort":6,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"doctors","field":"date_updated","sort":6,"group":null}	\N
117	140	directus_fields	32	{"id":32,"collection":"doctors","field":"contact_info","special":null,"interface":"input-multiline","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":7,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"doctors","field":"contact_info","sort":7,"group":null}	\N
118	141	directus_fields	31	{"id":31,"collection":"doctors","field":"age","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":8,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"doctors","field":"age","sort":8,"group":null}	\N
119	142	directus_fields	33	{"id":33,"collection":"doctors","field":"name","special":null,"interface":"input","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":9,"width":"full","translations":null,"note":null,"conditions":null,"required":true,"group":null,"validation":null,"validation_message":null}	{"collection":"doctors","field":"name","sort":9,"group":null}	\N
120	143	directus_fields	34	{"id":34,"collection":"doctors","field":"gender","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"man","value":0},{"text":"woman","value":1},{"text":"other","value":2}]},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":10,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"doctors","field":"gender","sort":10,"group":null}	\N
121	144	directus_fields	35	{"id":35,"collection":"doctors","field":"profile","special":["file"],"interface":"file-image","options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":11,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"doctors","field":"profile","sort":11,"group":null}	\N
122	145	patients	2	{"age":18,"name":"ピノコ","gender":"1","contact_info":"https://zh.m.wikipedia.org/zh-tw/%E7%9A%AE%E8%AB%BE%E5%8F%AF"}	{"age":18,"name":"ピノコ","gender":"1","contact_info":"https://zh.m.wikipedia.org/zh-tw/%E7%9A%AE%E8%AB%BE%E5%8F%AF"}	\N
123	146	prescriptions	1	{"patient_id":2,"drug_name":"安眠藥","dosage":1,"frequency":"一週一次","date_created":"2022-12-25T04:00:00.000Z"}	{"patient_id":2,"drug_name":"安眠藥","dosage":1,"frequency":"一週一次","date_created":"2022-12-25T04:00:00.000Z"}	\N
137	160	directus_permissions	15	{"collection":"directus_dashboards","action":"read","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_dashboards","action":"read","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
138	161	directus_permissions	16	{"collection":"directus_dashboards","action":"update","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_dashboards","action":"update","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
124	147	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}}"},"display":"related-values","display_options":{"template":"{{name}}{{gender}}{{age}}{{contact_info}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}}"},"display":"related-values","display_options":{"template":"{{name}}{{gender}}{{age}}{{contact_info}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
125	148	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}}"},"display":"related-values","display_options":{"template":"{{name}}{{gender}}{{age}}{{contact_info}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}}"},"display":"related-values","display_options":{"template":"{{name}}{{gender}}{{age}}{{contact_info}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
126	149	prescriptions	1	{"prescription_id":1,"patient_id":2,"drug_name":"安眠藥","dosage":1,"frequency":"一週一次","date_created":"2022-12-25T04:00:00.000Z"}	{"date_created":"2022-12-25T04:00:00.000Z"}	\N
127	150	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":null,"options":{"template":"{{patient_id}} {{name}}"},"display":"related-values","display_options":{"template":"{{name}}{{gender}}{{age}}{{contact_info}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","special":null,"interface":null,"options":{"template":"{{patient_id}} {{name}}"},"display":"related-values","display_options":{"template":"{{name}}{{gender}}{{age}}{{contact_info}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
128	151	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} ","enableCreate":false,"enableSelect":false},"display":"related-values","display_options":{"template":"{{name}}{{gender}}{{age}}{{contact_info}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} ","enableCreate":false,"enableSelect":false},"display":"related-values","display_options":{"template":"{{name}}{{gender}}{{age}}{{contact_info}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
129	152	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} ","enableCreate":false},"display":"related-values","display_options":{"template":"{{name}}{{gender}}{{age}}{{contact_info}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} ","enableCreate":false},"display":"related-values","display_options":{"template":"{{name}}{{gender}}{{age}}{{contact_info}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
130	153	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} "},"display":"related-values","display_options":{"template":"{{name}}{{gender}}{{age}}{{contact_info}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} "},"display":"related-values","display_options":{"template":"{{name}}{{gender}}{{age}}{{contact_info}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
131	154	directus_roles	d6c8e3e4-8750-4a8f-a459-3a3294f06361	{"name":"Phamasist","admin_access":false,"app_access":true}	{"name":"Phamasist","admin_access":false,"app_access":true}	\N
132	155	directus_permissions	10	{"collection":"directus_files","action":"create","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_files","action":"create","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
133	156	directus_permissions	11	{"collection":"directus_files","action":"read","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_files","action":"read","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
134	157	directus_permissions	12	{"collection":"directus_files","action":"update","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_files","action":"update","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
135	158	directus_permissions	13	{"collection":"directus_files","action":"delete","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_files","action":"delete","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
136	159	directus_permissions	14	{"collection":"directus_dashboards","action":"create","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_dashboards","action":"create","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
139	162	directus_permissions	17	{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
140	163	directus_permissions	18	{"collection":"directus_panels","action":"create","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_panels","action":"create","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
141	164	directus_permissions	19	{"collection":"directus_panels","action":"read","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_panels","action":"read","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
142	165	directus_permissions	20	{"collection":"directus_panels","action":"update","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_panels","action":"update","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
143	166	directus_permissions	21	{"collection":"directus_panels","action":"delete","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_panels","action":"delete","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
144	167	directus_permissions	22	{"collection":"directus_folders","action":"create","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_folders","action":"create","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
145	168	directus_permissions	23	{"collection":"directus_folders","action":"read","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_folders","action":"read","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
146	169	directus_permissions	24	{"collection":"directus_folders","action":"update","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_folders","action":"update","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
147	170	directus_permissions	25	{"collection":"directus_folders","action":"delete","permissions":{},"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_folders","action":"delete","permissions":{},"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
148	171	directus_permissions	26	{"collection":"directus_users","action":"read","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_users","action":"read","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
149	172	directus_permissions	27	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":["first_name","last_name","email","password","location","title","description","avatar","language","theme","tfa_secret"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":["first_name","last_name","email","password","location","title","description","avatar","language","theme","tfa_secret"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
150	173	directus_permissions	28	{"collection":"directus_roles","action":"read","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_roles","action":"read","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
151	174	directus_permissions	29	{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
152	175	directus_permissions	30	{"collection":"directus_shares","action":"create","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_shares","action":"create","permissions":{},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
153	176	directus_permissions	31	{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
154	177	directus_permissions	32	{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":["*"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
155	178	directus_permissions	33	{"collection":"directus_flows","action":"read","permissions":{"trigger":{"_eq":"manual"}},"fields":["id","name","icon","color","options","trigger"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	{"collection":"directus_flows","action":"read","permissions":{"trigger":{"_eq":"manual"}},"fields":["id","name","icon","color","options","trigger"],"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361"}	\N
156	179	directus_roles	d6c8e3e4-8750-4a8f-a459-3a3294f06361	{"id":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","name":"Pharmacist","icon":"accessibility_new","description":null,"ip_access":null,"enforce_tfa":false,"admin_access":false,"app_access":true,"users":[]}	{"name":"Pharmacist","icon":"accessibility_new"}	\N
157	180	directus_users	ee825428-4a62-4412-a006-e67b7e030f89	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","first_name":"aiden","last_name":"pharmacist","email":"aidennnnnn@aiden.aidennn","password":"**********"}	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","first_name":"aiden","last_name":"pharmacist","email":"aidennnnnn@aiden.aidennn","password":"**********"}	\N
158	182	directus_users	ee825428-4a62-4412-a006-e67b7e030f89	{"id":"ee825428-4a62-4412-a006-e67b7e030f89","first_name":"aiden","last_name":"pharmacist","email":"aidennnnnn@aiden.aidennn","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","token":null,"last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"password":"**********"}	\N
159	184	directus_users	ee825428-4a62-4412-a006-e67b7e030f89	{"id":"ee825428-4a62-4412-a006-e67b7e030f89","first_name":"aiden","last_name":"pharmacist","email":"aidennnnnn@aiden.aidennn","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":null,"theme":"auto","tfa_secret":null,"status":"active","role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","token":null,"last_access":null,"last_page":null,"provider":"default","external_identifier":null,"auth_data":null,"email_notifications":true}	{"password":"**********"}	\N
160	187	directus_users	1e5d5cea-b51e-42ab-a864-efbf487496e0	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","first_name":"Aiden","last_name":"B","email":"B","password":"**********"}	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","first_name":"Aiden","last_name":"B","email":"B","password":"**********"}	\N
161	190	directus_users	36329cc9-42f6-4f3c-b316-f55d29bec75b	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","first_name":"Aiden","last_name":"B","email":"aiden@oly.com","password":"**********","email_notifications":false,"theme":"light"}	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","first_name":"Aiden","last_name":"B","email":"aiden@oly.com","password":"**********","email_notifications":false,"theme":"light"}	\N
162	192	directus_users	36329cc9-42f6-4f3c-b316-f55d29bec75b	{"id":"36329cc9-42f6-4f3c-b316-f55d29bec75b","first_name":"Aiden","last_name":"B","email":"aiden@oly.com","password":"**********","location":null,"title":null,"description":null,"tags":null,"avatar":null,"language":"zh-TW","theme":"light","tfa_secret":null,"status":"active","role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","token":null,"last_access":"2022-12-25T11:40:47.288Z","last_page":"/users/36329cc9-42f6-4f3c-b316-f55d29bec75b","provider":"default","external_identifier":null,"auth_data":null,"email_notifications":false}	{"language":"zh-TW"}	\N
163	194	directus_permissions	34	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","collection":"patients","action":"create","fields":["*"],"permissions":{},"validation":{}}	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","collection":"patients","action":"create","fields":["*"],"permissions":{},"validation":{}}	\N
164	195	directus_permissions	35	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","collection":"patients","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","collection":"patients","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N
165	196	directus_permissions	36	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","collection":"patients","action":"update","fields":["*"],"permissions":{},"validation":{}}	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","collection":"patients","action":"update","fields":["*"],"permissions":{},"validation":{}}	\N
166	197	directus_permissions	37	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","collection":"patients","action":"delete","fields":["*"],"permissions":{},"validation":{}}	{"role":"d6c8e3e4-8750-4a8f-a459-3a3294f06361","collection":"patients","action":"delete","fields":["*"],"permissions":{},"validation":{}}	\N
167	198	directus_fields	53	{"interface":"select-dropdown-m2o","special":["m2o"],"options":{"choices":null,"filter":{"_and":[{"role":{"name":{"_contains":"Pharmacist"}}}]}},"collection":"pharmacist","field":"pp"}	{"interface":"select-dropdown-m2o","special":["m2o"],"options":{"choices":null,"filter":{"_and":[{"role":{"name":{"_contains":"Pharmacist"}}}]}},"collection":"pharmacist","field":"pp"}	\N
168	199	pharmacist	1	{"pharmacist_id":1,"name":"藥師一號","gender":"0","age":30,"contact_info":null,"pp":"36329cc9-42f6-4f3c-b316-f55d29bec75b"}	{"pp":"36329cc9-42f6-4f3c-b316-f55d29bec75b"}	\N
169	200	directus_permissions	38	{"role":null,"collection":"directus_sessions","action":"read"}	{"role":null,"collection":"directus_sessions","action":"read"}	\N
170	201	directus_permissions	38	{"id":38,"role":null,"collection":"directus_sessions","action":"read","permissions":{"_and":[{"user":{"role":{"name":{"_contains":"pharmacist"}}}}]},"validation":null,"presets":null,"fields":null}	{"role":null,"collection":"directus_sessions","action":"read","permissions":{"_and":[{"user":{"role":{"name":{"_contains":"pharmacist"}}}}]},"validation":null,"presets":null,"fields":null}	\N
171	203	directus_collections	prescriptions	{"collection":"prescriptions","icon":null,"note":null,"display_template":"{{patient_id}}","hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":["patient_id"],"sort":null,"group":null,"collapse":"open"}	{"display_template":"{{patient_id}}","item_duplication_fields":["patient_id"]}	\N
172	204	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} "},"display":"related-values","display_options":{"template":"{{name}}  {{gender}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} "},"display":"related-values","display_options":{"template":"{{name}}  {{gender}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
173	205	directus_collections	prescriptions	{"collection":"prescriptions","icon":null,"note":null,"display_template":"{{patient_id}}{{prescription_id}}","hidden":false,"singleton":false,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":["patient_id"],"sort":null,"group":null,"collapse":"open"}	{"display_template":"{{patient_id}}{{prescription_id}}"}	\N
174	206	prescriptions	1	{"prescription_id":1,"patient_id":2,"drug_name":"安眠藥","dosage":4,"frequency":"一週一次","date_created":"2022-12-25T04:00:00.000Z"}	{"dosage":4,"date_created":"2022-12-25T04:00:00.000Z"}	\N
175	207	directus_settings	1	{"id":1,"project_name":"DBMS","project_url":null,"project_color":null,"project_logo":"ba3f1be0-8670-434e-81cd-c4718443b45f","public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}],"project_descriptor":null,"translation_strings":null,"default_language":"en-US","custom_aspect_ratios":null}	{"module_bar":[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}]}	\N
176	208	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} "},"display":"related-values","display_options":{"template":"{{name}}  {{gender}}"},"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","width":"half"}	\N
177	209	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} "},"display":"related-values","display_options":{"template":"{{name}}  {{gender}}"},"readonly":false,"hidden":false,"sort":null,"width":"fill","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","width":"fill"}	\N
179	211	directus_fields	49	{"id":49,"collection":"prescriptions","field":"drug_name","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"drug_name","width":"half"}	\N
178	210	directus_fields	46	{"id":46,"collection":"prescriptions","field":"prescription_id","special":null,"interface":null,"options":null,"display":null,"display_options":null,"readonly":true,"hidden":true,"sort":null,"width":"half","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"prescription_id","width":"half"}	\N
180	212	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} "},"display":"related-values","display_options":{"template":"{{name}}  {{gender}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","width":"full"}	\N
181	213	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} {{contact_info}}"},"display":"related-values","display_options":{"template":"{{name}}  {{gender}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} {{contact_info}}"},"display":"related-values","display_options":{"template":"{{name}}  {{gender}}"},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
182	214	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} {{contact_info}}"},"display":"related-values","display_options":{"template":"{{name}} {{contact_info}} "},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":"{{patient_id}} {{name}} {{contact_info}}"},"display":"related-values","display_options":{"template":"{{name}} {{contact_info}} "},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
183	215	directus_fields	47	{"id":47,"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":" {{name}} {{contact_info}}"},"display":"related-values","display_options":{"template":"{{name}} {{contact_info}} "},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"prescriptions","field":"patient_id","special":null,"interface":"select-dropdown-m2o","options":{"template":" {{name}} {{contact_info}}"},"display":"related-values","display_options":{"template":"{{name}} {{contact_info}} "},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
184	216	directus_fields	39	{"id":39,"collection":"patients","field":"gender","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}]},"display":"labels","display_options":{"choices":[{"text":"aaa","value":"1"}]},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"patients","field":"gender","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}]},"display":"labels","display_options":{"choices":[{"text":"aaa","value":"1"}]},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
185	217	directus_fields	39	{"id":39,"collection":"patients","field":"gender","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}]},"display":null,"display_options":{"choices":[{"text":"aaa","value":"1"}]},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"patients","field":"gender","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}]},"display":null,"display_options":{"choices":[{"text":"aaa","value":"1"}]},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
186	218	directus_fields	39	{"id":39,"collection":"patients","field":"gender","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}]},"display":"labels","display_options":{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}],"format":true},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"patients","field":"gender","special":null,"interface":"select-dropdown","options":{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}]},"display":"labels","display_options":{"choices":[{"text":"man","value":"0"},{"text":"woman","value":"1"},{"text":"other","value":"2"}],"format":true},"readonly":false,"hidden":false,"sort":null,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
f6170ecc-3150-468d-8dda-799b64af4e1b	Administrator	verified	$t:admin_description	\N	f	t	t
d6c8e3e4-8750-4a8f-a459-3a3294f06361	Pharmacist	accessibility_new	\N	\N	f	f	t
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) FROM stdin;
IAsE6rRloZ_c26rgGAff4LSJQYrmUkv-z2hOsqeavQ32UQ2i2PJSbRGRPSQ2hwSQ	b76f063d-86b5-421a-b985-6f4e0885eb66	2023-01-01 12:39:22.295+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	http://localhost:8055
BQ9EenP8o5GCb64-2ANPwGBaXNBIAIUlocGq7SE259YWjxogKr7Q0-fBhzg9CnO-	b76f063d-86b5-421a-b985-6f4e0885eb66	2023-01-01 12:49:23.355+00	127.0.0.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36	\N	http://0.0.0.0:8055
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, translation_strings, default_language, custom_aspect_ratios) FROM stdin;
1	DBMS	\N	\N	ba3f1be0-8670-434e-81cd-c4718443b45f	\N	\N	\N	25	\N	all	\N	\N	\N	\N	\N	[{"type":"module","id":"content","enabled":true},{"type":"module","id":"users","enabled":true},{"type":"module","id":"files","enabled":true},{"type":"module","id":"insights","enabled":true},{"type":"module","id":"docs","enabled":false},{"type":"module","id":"settings","enabled":true,"locked":true}]	\N	\N	en-US	\N
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, theme, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications) FROM stdin;
36329cc9-42f6-4f3c-b316-f55d29bec75b	Aiden	B	aiden@oly.com	$argon2id$v=19$m=65536,t=3,p=4$fve/QgDi7rXc0vRH1K7M/Q$YWQdHGlQzxMuvtpRnW5X9elw8i9cpobzWicz2tysiIw	\N	\N	\N	\N	\N	zh-TW	light	\N	active	d6c8e3e4-8750-4a8f-a459-3a3294f06361	\N	2022-12-25 11:40:47.288+00	/users/roles/f6170ecc-3150-468d-8dda-799b64af4e1b	default	\N	\N	f
b76f063d-86b5-421a-b985-6f4e0885eb66	Admin	User	aidenzich0221@gmail.com	$argon2id$v=19$m=65536,t=3,p=4$8tZVQW26rXlNt0aoeLNbag$RxJqxaC+XukKaUYqVLJLGuhH8cBYL4rKtU7yd3Umvyc	\N	\N	\N	\N	\N	\N	auto	\N	active	f6170ecc-3150-468d-8dda-799b64af4e1b	\N	2022-12-25 12:49:23.375+00	/settings/data-model	default	\N	\N	t
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM stdin;
\.


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctors (doctor_id, status, user_created, date_created, user_updated, date_updated, age, contact_info, name, gender, profile) FROM stdin;
2	draft	\N	2022-12-25 09:24:42.738+00	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:26:36.495+00	30	\N	abc	1	\N
1	published	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:22:01.331+00	b76f063d-86b5-421a-b985-6f4e0885eb66	2022-12-25 09:29:37.312+00	34	https://zh.m.wikipedia.org/zh-tw/%E9%BB%91%E5%82%91%E5%85%8B	Black Jack	0	867bceb2-8601-42a5-9688-965ee6c9f0bc
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patients (patient_id, name, gender, age, contact_info) FROM stdin;
2	ピノコ	1	18	https://zh.m.wikipedia.org/zh-tw/%E7%9A%AE%E8%AB%BE%E5%8F%AF
\.


--
-- Data for Name: pharmacist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pharmacist (pharmacist_id, name, gender, age, contact_info, pp) FROM stdin;
1	藥師一號	0	30	\N	36329cc9-42f6-4f3c-b316-f55d29bec75b
\.


--
-- Data for Name: prescriptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prescriptions (prescription_id, patient_id, drug_name, dosage, frequency, date_created) FROM stdin;
1	2	安眠藥	4	一週一次	2022-12-25 04:00:00+00
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 218, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 53, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 38, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 15, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 6, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 186, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: doctors_doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.doctors_doctor_id_seq', 2, true);


--
-- Name: patients_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patients_patient_id_seq', 2, true);


--
-- Name: pharmacist_pharmacist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pharmacist_pharmacist_id_seq', 1, true);


--
-- Name: prescriptions_prescription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prescriptions_prescription_id_seq', 1, true);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: doctors doctors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_pkey PRIMARY KEY (doctor_id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);


--
-- Name: pharmacist pharmacist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacist
    ADD CONSTRAINT pharmacist_pkey PRIMARY KEY (pharmacist_id);


--
-- Name: prescriptions prescriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_pkey PRIMARY KEY (prescription_id);


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: doctors doctors_profile_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_profile_foreign FOREIGN KEY (profile) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: doctors doctors_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: doctors doctors_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctors_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: pharmacist pharmacist_pp_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pharmacist
    ADD CONSTRAINT pharmacist_pp_foreign FOREIGN KEY (pp) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: prescriptions prescriptions_patient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prescriptions
    ADD CONSTRAINT prescriptions_patient_id_fkey FOREIGN KEY (patient_id) REFERENCES public.patients(patient_id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5
-- Dumped by pg_dump version 13.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "template_postgis" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5
-- Dumped by pg_dump version 13.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: template_postgis; Type: DATABASE; Schema: -; Owner: postgres
--

-- CREATE DATABASE template_postgis WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


-- ALTER DATABASE template_postgis OWNER TO postgres;

-- \connect template_postgis

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: template_postgis; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

-- ALTER DATABASE template_postgis IS_TEMPLATE = true;
-- ALTER DATABASE template_postgis SET search_path TO '$user', 'public', 'tiger';


-- \connect template_postgis

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

