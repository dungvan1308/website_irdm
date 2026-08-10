--
-- PostgreSQL database dump
--

\restrict eZPyftJAJWyeO79N0bMyzhlRsHnP0gIudQIOgCT2VVfEmxeDjbzsPEfPwDz5XbD

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-08-10 23:13:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 311529)
-- Name: public; Type: SCHEMA; Schema: -; Owner: irdm_user
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO irdm_user;

--
-- TOC entry 6492 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: irdm_user
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 311531)
-- Name: about_aboutcapabilityecosystem; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutcapabilityecosystem (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    diagram_image character varying(100) NOT NULL,
    diagram_alt character varying(300) NOT NULL,
    background_image character varying(100) NOT NULL,
    hub_label character varying(100) NOT NULL,
    primary_cta_label character varying(100) NOT NULL,
    primary_cta_url character varying(500) NOT NULL,
    secondary_cta_label character varying(100) NOT NULL,
    secondary_cta_url character varying(500) NOT NULL,
    CONSTRAINT about_aboutcapabilityecosystem_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutcapabilityecosystem OWNER TO irdm_user;

--
-- TOC entry 220 (class 1259 OID 311553)
-- Name: about_aboutcontactbanner; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutcontactbanner (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    hotline character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    facebook_url character varying(500) NOT NULL,
    linkedin_url character varying(500) NOT NULL,
    youtube_url character varying(500) NOT NULL,
    background_image character varying(100) NOT NULL,
    cta1_label character varying(100) NOT NULL,
    cta1_url character varying(500) NOT NULL,
    cta2_label character varying(100) NOT NULL,
    cta2_url character varying(500) NOT NULL,
    cta3_label character varying(100) NOT NULL,
    cta3_url character varying(500) NOT NULL,
    quote_text character varying(500) NOT NULL,
    CONSTRAINT about_aboutcontactbanner_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutcontactbanner OWNER TO irdm_user;

--
-- TOC entry 221 (class 1259 OID 311579)
-- Name: about_aboutcontactbannerstat; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutcontactbannerstat (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    number character varying(20) NOT NULL,
    label character varying(100) NOT NULL,
    icon_key character varying(50) NOT NULL,
    banner_id uuid NOT NULL,
    CONSTRAINT about_aboutcontactbannerstat_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutcontactbannerstat OWNER TO irdm_user;

--
-- TOC entry 222 (class 1259 OID 311592)
-- Name: about_aboutcorevalue; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutcorevalue (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    icon character varying(100) NOT NULL,
    icon_image character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    color_theme character varying(100) NOT NULL,
    CONSTRAINT about_aboutcorevalue_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutcorevalue OWNER TO irdm_user;

--
-- TOC entry 223 (class 1259 OID 311608)
-- Name: about_aboutcorevaluesection; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutcorevaluesection (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    background_image character varying(100) NOT NULL,
    CONSTRAINT about_aboutcorevaluesection_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutcorevaluesection OWNER TO irdm_user;

--
-- TOC entry 224 (class 1259 OID 311623)
-- Name: about_aboutctabanner; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutctabanner (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    background_image character varying(100) NOT NULL,
    primary_cta_label character varying(100) NOT NULL,
    primary_cta_url character varying(500) NOT NULL,
    secondary_cta_label character varying(100) NOT NULL,
    secondary_cta_url character varying(500) NOT NULL,
    CONSTRAINT about_aboutctabanner_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutctabanner OWNER TO irdm_user;

--
-- TOC entry 225 (class 1259 OID 311641)
-- Name: about_aboutecosystempartnergroup; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutecosystempartnergroup (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(200) NOT NULL,
    color character varying(100) NOT NULL,
    ecosystem_id uuid NOT NULL,
    CONSTRAINT about_aboutecosystempartnergroup_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutecosystempartnergroup OWNER TO irdm_user;

--
-- TOC entry 226 (class 1259 OID 311653)
-- Name: about_aboutecosystempartneritem; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutecosystempartneritem (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    logo character varying(100) NOT NULL,
    group_id uuid NOT NULL,
    CONSTRAINT about_aboutecosystempartneritem_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutecosystempartneritem OWNER TO irdm_user;

--
-- TOC entry 227 (class 1259 OID 311665)
-- Name: about_aboutecosystemstatistic; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutecosystemstatistic (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    number character varying(50) NOT NULL,
    label character varying(150) NOT NULL,
    ecosystem_id uuid NOT NULL,
    CONSTRAINT about_aboutecosystemstatistic_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutecosystemstatistic OWNER TO irdm_user;

--
-- TOC entry 228 (class 1259 OID 311677)
-- Name: about_abouthero; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_abouthero (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    eyebrow character varying(200) NOT NULL,
    title character varying(300) NOT NULL,
    subtitle character varying(400) NOT NULL,
    description text NOT NULL,
    background_image character varying(100) NOT NULL,
    foreground_image character varying(100) NOT NULL,
    primary_cta_label character varying(100) NOT NULL,
    primary_cta_url character varying(500) NOT NULL,
    secondary_cta_label character varying(100) NOT NULL,
    secondary_cta_url character varying(500) NOT NULL,
    quote_show boolean NOT NULL,
    quote_text character varying(500) NOT NULL,
    quote_icon character varying(100) NOT NULL,
    CONSTRAINT about_abouthero_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_abouthero OWNER TO irdm_user;

--
-- TOC entry 229 (class 1259 OID 311701)
-- Name: about_aboutherostatistic; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutherostatistic (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    number character varying(50) NOT NULL,
    label character varying(150) NOT NULL,
    animation_enabled boolean NOT NULL,
    hero_id uuid NOT NULL,
    CONSTRAINT about_aboutherostatistic_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutherostatistic OWNER TO irdm_user;

--
-- TOC entry 230 (class 1259 OID 311714)
-- Name: about_abouthighlightcard; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_abouthighlightcard (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    icon character varying(100) NOT NULL,
    icon_image character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    color character varying(50) NOT NULL,
    intro_id uuid NOT NULL,
    CONSTRAINT about_abouthighlightcard_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_abouthighlightcard OWNER TO irdm_user;

--
-- TOC entry 231 (class 1259 OID 311731)
-- Name: about_aboutintroduction; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutintroduction (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    title character varying(300) NOT NULL,
    subtitle character varying(400) NOT NULL,
    description text NOT NULL,
    image character varying(100) NOT NULL,
    image_alt character varying(300) NOT NULL,
    background_image character varying(100) NOT NULL,
    CONSTRAINT about_aboutintroduction_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutintroduction OWNER TO irdm_user;

--
-- TOC entry 232 (class 1259 OID 311749)
-- Name: about_aboutlegalbadge; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutlegalbadge (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    label character varying(100) NOT NULL,
    legal_info_id uuid NOT NULL,
    CONSTRAINT about_aboutlegalbadge_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutlegalbadge OWNER TO irdm_user;

--
-- TOC entry 233 (class 1259 OID 311760)
-- Name: about_aboutlegalinfo; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutlegalinfo (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    image character varying(100) NOT NULL,
    image_alt character varying(300) NOT NULL,
    background_image character varying(100) NOT NULL,
    footer_note text NOT NULL,
    footer_note_show boolean NOT NULL,
    org_card_label character varying(100) NOT NULL,
    org_name character varying(300) NOT NULL,
    timeline_card_title character varying(200) NOT NULL,
    CONSTRAINT about_aboutlegalinfo_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutlegalinfo OWNER TO irdm_user;

--
-- TOC entry 234 (class 1259 OID 311782)
-- Name: about_aboutlegalorgattribute; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutlegalorgattribute (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    key character varying(200) NOT NULL,
    value character varying(500) NOT NULL,
    legal_info_id uuid NOT NULL,
    CONSTRAINT about_aboutlegalorgattribute_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutlegalorgattribute OWNER TO irdm_user;

--
-- TOC entry 235 (class 1259 OID 311796)
-- Name: about_aboutlegaltimelineitem; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutlegaltimelineitem (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    year character varying(20) NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    document_url character varying(500) NOT NULL,
    document_label character varying(100) NOT NULL,
    legal_info_id uuid NOT NULL,
    icon_image character varying(100) NOT NULL,
    CONSTRAINT about_aboutlegaltimelineitem_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutlegaltimelineitem OWNER TO irdm_user;

--
-- TOC entry 236 (class 1259 OID 311814)
-- Name: about_aboutnetworksectionheader; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutnetworksectionheader (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    CONSTRAINT about_aboutnetworksectionheader_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutnetworksectionheader OWNER TO irdm_user;

--
-- TOC entry 237 (class 1259 OID 311830)
-- Name: about_aboutorgstructurebulletitem; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutorgstructurebulletitem (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    card_id uuid NOT NULL,
    text character varying(300) NOT NULL,
    CONSTRAINT about_aboutorgstructurebulletitem_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutorgstructurebulletitem OWNER TO irdm_user;

--
-- TOC entry 238 (class 1259 OID 311841)
-- Name: about_aboutorgstructurecard; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutorgstructurecard (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_id uuid NOT NULL,
    icon character varying(100) NOT NULL,
    icon_image character varying(100) NOT NULL,
    color_theme character varying(50) NOT NULL,
    title character varying(200) NOT NULL,
    view_more_label character varying(100) NOT NULL,
    view_more_url character varying(500) NOT NULL,
    CONSTRAINT about_aboutorgstructurecard_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutorgstructurecard OWNER TO irdm_user;

--
-- TOC entry 239 (class 1259 OID 311859)
-- Name: about_aboutorgstructuresection; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutorgstructuresection (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    primary_cta_label character varying(100) NOT NULL,
    primary_cta_url character varying(500) NOT NULL,
    secondary_cta_label character varying(100) NOT NULL,
    secondary_cta_url character varying(500) NOT NULL,
    background_image character varying(100) NOT NULL,
    CONSTRAINT about_aboutorgstructuresection_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutorgstructuresection OWNER TO irdm_user;

--
-- TOC entry 240 (class 1259 OID 311878)
-- Name: about_aboutpageseo; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutpageseo (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    meta_title character varying(200) NOT NULL,
    meta_description text NOT NULL,
    meta_keywords character varying(500) NOT NULL,
    og_title character varying(200) NOT NULL,
    og_description text NOT NULL,
    og_image character varying(100) NOT NULL,
    CONSTRAINT about_aboutpageseo_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutpageseo OWNER TO irdm_user;

--
-- TOC entry 241 (class 1259 OID 311895)
-- Name: about_aboutpartnerbenefit; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutpartnerbenefit (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    icon character varying(100) NOT NULL,
    icon_image character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    section_id uuid NOT NULL,
    color_theme character varying(50) NOT NULL,
    link_url character varying(500) NOT NULL,
    CONSTRAINT about_aboutpartnerbenefit_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutpartnerbenefit OWNER TO irdm_user;

--
-- TOC entry 242 (class 1259 OID 311913)
-- Name: about_aboutpartnerbenefitsection; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutpartnerbenefitsection (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    banner_badge character varying(100) NOT NULL,
    banner_quote text NOT NULL,
    kpi_label character varying(100) NOT NULL,
    kpi_value character varying(200) NOT NULL,
    background_image character varying(100) NOT NULL,
    CONSTRAINT about_aboutpartnerbenefitsection_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutpartnerbenefitsection OWNER TO irdm_user;

--
-- TOC entry 243 (class 1259 OID 311932)
-- Name: about_aboutprofessionalnetwork; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutprofessionalnetwork (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    logo character varying(100) NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(300) NOT NULL,
    link_url character varying(500) NOT NULL,
    link_label character varying(100) NOT NULL,
    CONSTRAINT about_aboutprofessionalnetwork_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutprofessionalnetwork OWNER TO irdm_user;

--
-- TOC entry 244 (class 1259 OID 311949)
-- Name: about_aboutpurpose; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutpurpose (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    title character varying(300) NOT NULL,
    highlight_box_text text NOT NULL,
    description text NOT NULL,
    diagram_image character varying(100) NOT NULL,
    diagram_alt character varying(300) NOT NULL,
    background_image character varying(100) NOT NULL,
    diagram_caption character varying(400) NOT NULL,
    diagram_title character varying(200) NOT NULL,
    quote_body text NOT NULL,
    quote_icon character varying(100) NOT NULL,
    CONSTRAINT about_aboutpurpose_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutpurpose OWNER TO irdm_user;

--
-- TOC entry 245 (class 1259 OID 311971)
-- Name: about_abouttargetaudience; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_abouttargetaudience (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    icon character varying(100) NOT NULL,
    icon_image character varying(100) NOT NULL,
    image character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    section_id uuid NOT NULL,
    CONSTRAINT about_abouttargetaudience_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_abouttargetaudience OWNER TO irdm_user;

--
-- TOC entry 246 (class 1259 OID 311990)
-- Name: about_abouttargetaudiencesection; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_abouttargetaudiencesection (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    background_color character varying(100) NOT NULL,
    background_image character varying(100) NOT NULL,
    CONSTRAINT about_abouttargetaudiencesection_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_abouttargetaudiencesection OWNER TO irdm_user;

--
-- TOC entry 247 (class 1259 OID 312008)
-- Name: about_aboutvisionmission; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutvisionmission (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    bottom_panel_text text NOT NULL,
    bottom_panel_description text NOT NULL,
    bottom_panel_title character varying(200) NOT NULL,
    CONSTRAINT about_aboutvisionmission_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutvisionmission OWNER TO irdm_user;

--
-- TOC entry 248 (class 1259 OID 312025)
-- Name: about_aboutvisionmissioncard; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutvisionmissioncard (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    card_type character varying(20) NOT NULL,
    icon character varying(100) NOT NULL,
    icon_image character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    body text NOT NULL,
    bg_color character varying(100) NOT NULL,
    section_id uuid NOT NULL,
    highlight_label character varying(200) NOT NULL,
    CONSTRAINT about_aboutvisionmissioncard_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutvisionmissioncard OWNER TO irdm_user;

--
-- TOC entry 249 (class 1259 OID 312044)
-- Name: about_aboutvisionmissionicon; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.about_aboutvisionmissionicon (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    icon_image character varying(100) NOT NULL,
    icon_alt character varying(200) NOT NULL,
    section_id uuid NOT NULL,
    CONSTRAINT about_aboutvisionmissionicon_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.about_aboutvisionmissionicon OWNER TO irdm_user;

--
-- TOC entry 250 (class 1259 OID 312056)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO irdm_user;

--
-- TOC entry 251 (class 1259 OID 312061)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 252 (class 1259 OID 312062)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO irdm_user;

--
-- TOC entry 253 (class 1259 OID 312068)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 254 (class 1259 OID 312069)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO irdm_user;

--
-- TOC entry 255 (class 1259 OID 312076)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 256 (class 1259 OID 312077)
-- Name: auth_user; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO irdm_user;

--
-- TOC entry 257 (class 1259 OID 312092)
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO irdm_user;

--
-- TOC entry 258 (class 1259 OID 312098)
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 259 (class 1259 OID 312099)
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 260 (class 1259 OID 312100)
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO irdm_user;

--
-- TOC entry 261 (class 1259 OID 312106)
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 262 (class 1259 OID 312107)
-- Name: capability_capability; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.capability_capability (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(300) NOT NULL,
    slug character varying(300) NOT NULL,
    summary text NOT NULL,
    thumbnail character varying(100) NOT NULL,
    hero_image character varying(100) NOT NULL,
    section_label character varying(200) NOT NULL,
    description text NOT NULL,
    what_is_label character varying(200) NOT NULL,
    what_is_description text NOT NULL,
    need_section_label character varying(200) NOT NULL,
    how_label character varying(200) NOT NULL,
    output_label character varying(200) NOT NULL,
    cta_primary_label character varying(100) NOT NULL,
    cta_primary_url character varying(500) NOT NULL,
    cta_secondary_label character varying(100) NOT NULL,
    cta_secondary_url character varying(500) NOT NULL,
    is_published boolean NOT NULL,
    meta_title character varying(200) NOT NULL,
    meta_description character varying(300) NOT NULL,
    meta_keywords character varying(300) NOT NULL,
    card_icon character varying(100) NOT NULL,
    need_section_intro text NOT NULL,
    what_is_image character varying(100) NOT NULL,
    icon_name character varying(50) NOT NULL,
    CONSTRAINT capability_capability_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.capability_capability OWNER TO irdm_user;

--
-- TOC entry 263 (class 1259 OID 312142)
-- Name: capability_capabilitycasestudy; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.capability_capabilitycasestudy (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    number smallint NOT NULL,
    category_label character varying(200) NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    cta_primary_label character varying(100) NOT NULL,
    cta_primary_url character varying(500) NOT NULL,
    cta_secondary_label character varying(100) NOT NULL,
    cta_secondary_url character varying(500) NOT NULL,
    capability_id uuid NOT NULL,
    image character varying(100) NOT NULL,
    CONSTRAINT capability_capabilitycasestudy_display_order_check CHECK ((display_order >= 0)),
    CONSTRAINT capability_capabilitycasestudy_number_check CHECK ((number >= 0))
);


ALTER TABLE public.capability_capabilitycasestudy OWNER TO irdm_user;

--
-- TOC entry 264 (class 1259 OID 312164)
-- Name: capability_capabilitycasestudytag; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.capability_capabilitycasestudytag (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    label character varying(100) NOT NULL,
    case_study_id uuid NOT NULL,
    CONSTRAINT capability_capabilitycasestudytag_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.capability_capabilitycasestudytag OWNER TO irdm_user;

--
-- TOC entry 265 (class 1259 OID 312175)
-- Name: capability_capabilityfeature; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.capability_capabilityfeature (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    label character varying(100) NOT NULL,
    capability_id uuid NOT NULL,
    CONSTRAINT capability_capabilityfeature_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.capability_capabilityfeature OWNER TO irdm_user;

--
-- TOC entry 266 (class 1259 OID 312186)
-- Name: capability_capabilityhowstep; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.capability_capabilityhowstep (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(200) NOT NULL,
    icon character varying(100) NOT NULL,
    capability_id uuid NOT NULL,
    step_image character varying(100) NOT NULL,
    icon_image character varying(100) NOT NULL,
    CONSTRAINT capability_capabilityhowstep_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.capability_capabilityhowstep OWNER TO irdm_user;

--
-- TOC entry 267 (class 1259 OID 312202)
-- Name: capability_capabilitylistingpage; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.capability_capabilitylistingpage (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    heading character varying(300) NOT NULL,
    description text NOT NULL,
    overview_heading character varying(300) NOT NULL,
    overview_description text NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    hero_image character varying(100) NOT NULL,
    cta_show boolean NOT NULL,
    cta_bg_image character varying(100) NOT NULL,
    cta_eyebrow character varying(200) NOT NULL,
    cta_heading character varying(400) NOT NULL,
    cta_description text NOT NULL,
    cta_overlay_color character varying(30) NOT NULL,
    cta_overlay_opacity smallint NOT NULL,
    CONSTRAINT capability_capabilitylistingpage_cta_overlay_opacity_check CHECK ((cta_overlay_opacity >= 0)),
    CONSTRAINT capability_capabilitylistingpage_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.capability_capabilitylistingpage OWNER TO irdm_user;

--
-- TOC entry 268 (class 1259 OID 312229)
-- Name: capability_capabilityneeditem; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.capability_capabilityneeditem (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    number smallint NOT NULL,
    content text NOT NULL,
    capability_id uuid NOT NULL,
    CONSTRAINT capability_capabilityneeditem_display_order_check CHECK ((display_order >= 0)),
    CONSTRAINT capability_capabilityneeditem_number_check CHECK ((number >= 0))
);


ALTER TABLE public.capability_capabilityneeditem OWNER TO irdm_user;

--
-- TOC entry 269 (class 1259 OID 312244)
-- Name: capability_capabilityoutput; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.capability_capabilityoutput (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    number smallint NOT NULL,
    content text NOT NULL,
    capability_id uuid NOT NULL,
    CONSTRAINT capability_capabilityoutput_display_order_check CHECK ((display_order >= 0)),
    CONSTRAINT capability_capabilityoutput_number_check CHECK ((number >= 0))
);


ALTER TABLE public.capability_capabilityoutput OWNER TO irdm_user;

--
-- TOC entry 362 (class 1259 OID 334694)
-- Name: contact_contactrequest; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.contact_contactrequest (
    id bigint NOT NULL,
    full_name character varying(200) NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(50) NOT NULL,
    organization character varying(300) NOT NULL,
    inquiry_type character varying(30) NOT NULL,
    message text NOT NULL,
    status character varying(20) NOT NULL,
    source_url character varying(500) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.contact_contactrequest OWNER TO irdm_user;

--
-- TOC entry 361 (class 1259 OID 334693)
-- Name: contact_contactrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.contact_contactrequest ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.contact_contactrequest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 270 (class 1259 OID 312259)
-- Name: core_footerlink; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.core_footerlink (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    label character varying(100) NOT NULL,
    url character varying(500) NOT NULL,
    open_in_new_tab boolean NOT NULL,
    section_id uuid NOT NULL,
    CONSTRAINT core_footerlink_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.core_footerlink OWNER TO irdm_user;

--
-- TOC entry 271 (class 1259 OID 312274)
-- Name: core_footersection; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.core_footersection (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(100) NOT NULL,
    CONSTRAINT core_footersection_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.core_footersection OWNER TO irdm_user;

--
-- TOC entry 272 (class 1259 OID 312284)
-- Name: core_menuitem; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.core_menuitem (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    menu character varying(20) NOT NULL,
    label character varying(100) NOT NULL,
    url character varying(500) NOT NULL,
    open_in_new_tab boolean NOT NULL,
    parent_id uuid,
    CONSTRAINT core_menuitem_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.core_menuitem OWNER TO irdm_user;

--
-- TOC entry 273 (class 1259 OID 312299)
-- Name: core_sitesettings; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.core_sitesettings (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    site_name character varying(200) NOT NULL,
    site_tagline character varying(400) NOT NULL,
    site_description text NOT NULL,
    logo character varying(100) NOT NULL,
    logo_white character varying(100) NOT NULL,
    favicon character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(50) NOT NULL,
    address character varying(400) NOT NULL,
    linkedin_url character varying(200) NOT NULL,
    twitter_url character varying(200) NOT NULL,
    facebook_url character varying(200) NOT NULL,
    youtube_url character varying(200) NOT NULL,
    map_embed_url character varying(1000) NOT NULL,
    operating_hours character varying(200) NOT NULL,
    CONSTRAINT core_sitesettings_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.core_sitesettings OWNER TO irdm_user;

--
-- TOC entry 274 (class 1259 OID 312325)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO irdm_user;

--
-- TOC entry 275 (class 1259 OID 312337)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 276 (class 1259 OID 312338)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO irdm_user;

--
-- TOC entry 277 (class 1259 OID 312344)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 278 (class 1259 OID 312345)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO irdm_user;

--
-- TOC entry 279 (class 1259 OID 312354)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 280 (class 1259 OID 312355)
-- Name: django_session; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO irdm_user;

--
-- TOC entry 281 (class 1259 OID 312363)
-- Name: expert_association; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_association (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    logo character varying(100) NOT NULL,
    icon character varying(50) NOT NULL,
    icon_bg_color character varying(30) NOT NULL,
    badge_label character varying(200) NOT NULL,
    badge_color character varying(30) NOT NULL,
    title character varying(500) NOT NULL,
    description text NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    cta_target character varying(10) NOT NULL,
    info_group_id uuid NOT NULL,
    CONSTRAINT expert_association_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.expert_association OWNER TO irdm_user;

--
-- TOC entry 282 (class 1259 OID 312385)
-- Name: expert_engagementtype; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_engagementtype (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    description text NOT NULL,
    CONSTRAINT expert_engagementtype_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.expert_engagementtype OWNER TO irdm_user;

--
-- TOC entry 283 (class 1259 OID 312399)
-- Name: expert_expert; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_expert (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    academic_title character varying(100) NOT NULL,
    "position" character varying(300) NOT NULL,
    organization character varying(300) NOT NULL,
    avatar character varying(100) NOT NULL,
    short_bio text NOT NULL,
    full_bio text NOT NULL,
    email character varying(254) NOT NULL,
    profile_url character varying(200) NOT NULL,
    is_published boolean NOT NULL,
    is_featured boolean NOT NULL,
    is_senior boolean NOT NULL,
    group_id uuid,
    card_specialty character varying(200) NOT NULL,
    contact_cta_url character varying(500) NOT NULL,
    discussion_topics text NOT NULL,
    experience_highlights text NOT NULL,
    hero_tagline text NOT NULL,
    notable_projects text NOT NULL,
    role_badges text NOT NULL,
    stat_1_label character varying(200) NOT NULL,
    stat_1_value character varying(50) NOT NULL,
    stat_2_label character varying(200) NOT NULL,
    stat_2_value character varying(50) NOT NULL,
    stat_3_label character varying(200) NOT NULL,
    stat_3_value character varying(50) NOT NULL,
    ticker_text character varying(500) NOT NULL,
    hero_cta_label character varying(100) NOT NULL,
    hero_avatar character varying(100) NOT NULL,
    profile_tagline text NOT NULL,
    CONSTRAINT expert_expert_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.expert_expert OWNER TO irdm_user;

--
-- TOC entry 284 (class 1259 OID 312440)
-- Name: expert_expert_engagement_types; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_expert_engagement_types (
    id bigint NOT NULL,
    expert_id uuid NOT NULL,
    engagementtype_id uuid NOT NULL
);


ALTER TABLE public.expert_expert_engagement_types OWNER TO irdm_user;

--
-- TOC entry 285 (class 1259 OID 312446)
-- Name: expert_expert_engagement_types_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.expert_expert_engagement_types ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.expert_expert_engagement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 286 (class 1259 OID 312447)
-- Name: expert_expert_knowledge_topics; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_expert_knowledge_topics (
    id bigint NOT NULL,
    expert_id uuid NOT NULL,
    knowledgetopic_id uuid NOT NULL
);


ALTER TABLE public.expert_expert_knowledge_topics OWNER TO irdm_user;

--
-- TOC entry 287 (class 1259 OID 312453)
-- Name: expert_expert_knowledge_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.expert_expert_knowledge_topics ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.expert_expert_knowledge_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 288 (class 1259 OID 312454)
-- Name: expert_expert_research_areas; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_expert_research_areas (
    id bigint NOT NULL,
    expert_id uuid NOT NULL,
    researcharea_id uuid NOT NULL
);


ALTER TABLE public.expert_expert_research_areas OWNER TO irdm_user;

--
-- TOC entry 289 (class 1259 OID 312460)
-- Name: expert_expert_research_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.expert_expert_research_areas ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.expert_expert_research_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 290 (class 1259 OID 312461)
-- Name: expert_expertgroup; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_expertgroup (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    description text NOT NULL,
    CONSTRAINT expert_expertgroup_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.expert_expertgroup OWNER TO irdm_user;

--
-- TOC entry 291 (class 1259 OID 312475)
-- Name: expert_expertlistingpage; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_expertlistingpage (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    hero_eyebrow character varying(200) NOT NULL,
    hero_heading text NOT NULL,
    hero_description text NOT NULL,
    hero_image character varying(100) NOT NULL,
    hero_btn1_label character varying(100) NOT NULL,
    hero_btn1_url character varying(500) NOT NULL,
    hero_btn2_label character varying(100) NOT NULL,
    hero_btn2_url character varying(500) NOT NULL,
    process_heading text NOT NULL,
    process_description text NOT NULL,
    senior_heading character varying(300) NOT NULL,
    senior_cta_label character varying(100) NOT NULL,
    senior_cta_url character varying(500) NOT NULL,
    map_heading character varying(300) NOT NULL,
    map_description text NOT NULL,
    directory_heading character varying(300) NOT NULL,
    topic_heading character varying(300) NOT NULL,
    topic_description text NOT NULL,
    cta_eyebrow character varying(200) NOT NULL,
    cta_heading character varying(400) NOT NULL,
    cta_description text NOT NULL,
    cta_bg_image character varying(100) NOT NULL,
    cta_btn1_label character varying(100) NOT NULL,
    cta_btn1_url character varying(500) NOT NULL,
    cta_btn2_label character varying(100) NOT NULL,
    cta_btn2_url character varying(500) NOT NULL,
    meta_title character varying(200) NOT NULL,
    meta_description character varying(300) NOT NULL,
    hero_badge_color character varying(30) NOT NULL,
    hero_badge_icon character varying(50) NOT NULL,
    hero_badge_show boolean NOT NULL,
    hero_badge_text character varying(200) NOT NULL,
    hero_bottom_badge_bg character varying(30) NOT NULL,
    hero_bottom_badge_icon character varying(50) NOT NULL,
    hero_bottom_badge_show boolean NOT NULL,
    hero_bottom_badge_text character varying(300) NOT NULL,
    hero_btn1_icon character varying(50) NOT NULL,
    hero_btn1_target character varying(10) NOT NULL,
    hero_btn2_icon character varying(50) NOT NULL,
    hero_btn2_target character varying(10) NOT NULL,
    hero_bottom_badge_logo character varying(100) NOT NULL,
    process_section_label character varying(100) NOT NULL,
    senior_description text NOT NULL,
    senior_section_label character varying(100) NOT NULL,
    map_cta1_label character varying(100) NOT NULL,
    map_cta1_url character varying(500) NOT NULL,
    map_cta2_label character varying(100) NOT NULL,
    map_cta2_url character varying(500) NOT NULL,
    map_section_label character varying(100) NOT NULL,
    directory_description text NOT NULL,
    directory_section_label character varying(100) NOT NULL,
    info_group_section_description text CONSTRAINT expert_expertlistingpage_info_group_section_descriptio_not_null NOT NULL,
    info_group_section_heading character varying(300) NOT NULL,
    info_group_section_label character varying(100) NOT NULL,
    CONSTRAINT expert_expertlistingpage_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.expert_expertlistingpage OWNER TO irdm_user;

--
-- TOC entry 292 (class 1259 OID 312540)
-- Name: expert_infogroup; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_infogroup (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    icon character varying(50) NOT NULL,
    icon_bg_color character varying(30) NOT NULL,
    header_description text NOT NULL,
    section_label character varying(100) NOT NULL,
    section_heading text NOT NULL,
    section_description text NOT NULL,
    expert_grid_cta_label character varying(100) NOT NULL,
    show_expert_grid boolean NOT NULL,
    expert_grid_flat boolean NOT NULL,
    show_association_grid boolean NOT NULL,
    CONSTRAINT expert_infogroup_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.expert_infogroup OWNER TO irdm_user;

--
-- TOC entry 293 (class 1259 OID 312563)
-- Name: expert_infogroup_expert_direct_members; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_infogroup_expert_direct_members (
    id bigint NOT NULL,
    infogroup_id uuid NOT NULL,
    expert_id uuid NOT NULL
);


ALTER TABLE public.expert_infogroup_expert_direct_members OWNER TO irdm_user;

--
-- TOC entry 294 (class 1259 OID 312569)
-- Name: expert_infogroup_expert_direct_members_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.expert_infogroup_expert_direct_members ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.expert_infogroup_expert_direct_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 295 (class 1259 OID 312570)
-- Name: expert_infogroup_expert_research_areas; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_infogroup_expert_research_areas (
    id bigint NOT NULL,
    infogroup_id uuid NOT NULL,
    researcharea_id uuid NOT NULL
);


ALTER TABLE public.expert_infogroup_expert_research_areas OWNER TO irdm_user;

--
-- TOC entry 296 (class 1259 OID 312576)
-- Name: expert_infogroup_expert_research_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.expert_infogroup_expert_research_areas ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.expert_infogroup_expert_research_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 297 (class 1259 OID 312577)
-- Name: expert_infogroupblock; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_infogroupblock (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(200) NOT NULL,
    function_label character varying(100) NOT NULL,
    function_text text NOT NULL,
    duties_label character varying(100) NOT NULL,
    duties text NOT NULL,
    icon character varying(50) NOT NULL,
    info_group_id uuid NOT NULL,
    CONSTRAINT expert_infogroupblock_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.expert_infogroupblock OWNER TO irdm_user;

--
-- TOC entry 298 (class 1259 OID 312595)
-- Name: expert_infogroupmember; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_infogroupmember (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    role_label character varying(100) NOT NULL,
    academic_title character varying(100) NOT NULL,
    name character varying(200) NOT NULL,
    "position" character varying(300) NOT NULL,
    email character varying(254) NOT NULL,
    avatar character varying(100) NOT NULL,
    cta_text character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    info_group_id uuid NOT NULL,
    CONSTRAINT expert_infogroupmember_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.expert_infogroupmember OWNER TO irdm_user;

--
-- TOC entry 299 (class 1259 OID 312615)
-- Name: expert_knowledgetopic; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_knowledgetopic (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    description text NOT NULL,
    color character varying(30) NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    icon character varying(50) NOT NULL,
    CONSTRAINT expert_knowledgetopic_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.expert_knowledgetopic OWNER TO irdm_user;

--
-- TOC entry 300 (class 1259 OID 312633)
-- Name: expert_orgnode; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_orgnode (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    level smallint NOT NULL,
    style character varying(20) NOT NULL,
    color character varying(30) NOT NULL,
    url character varying(500) NOT NULL,
    info_group_id uuid NOT NULL,
    parent_id uuid,
    CONSTRAINT expert_orgnode_display_order_check CHECK ((display_order >= 0)),
    CONSTRAINT expert_orgnode_level_check CHECK ((level >= 0))
);


ALTER TABLE public.expert_orgnode OWNER TO irdm_user;

--
-- TOC entry 301 (class 1259 OID 312651)
-- Name: expert_processstep; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_processstep (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    step_number smallint NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    icon character varying(100) NOT NULL,
    CONSTRAINT expert_processstep_display_order_check CHECK ((display_order >= 0)),
    CONSTRAINT expert_processstep_step_number_check CHECK ((step_number >= 0))
);


ALTER TABLE public.expert_processstep OWNER TO irdm_user;

--
-- TOC entry 302 (class 1259 OID 312667)
-- Name: expert_researcharea; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.expert_researcharea (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    icon character varying(100) NOT NULL,
    color character varying(20) NOT NULL,
    card_tags text NOT NULL,
    description text NOT NULL,
    card_cta_label character varying(200) NOT NULL,
    card_cta_url character varying(500) NOT NULL,
    card_icon character varying(100) NOT NULL,
    CONSTRAINT expert_researcharea_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.expert_researcharea OWNER TO irdm_user;

--
-- TOC entry 303 (class 1259 OID 312687)
-- Name: home_audiencesectionheader; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_audiencesectionheader (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    heading character varying(300) NOT NULL,
    description text NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    CONSTRAINT home_audiencesectionheader_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_audiencesectionheader OWNER TO irdm_user;

--
-- TOC entry 304 (class 1259 OID 312703)
-- Name: home_audiencesegment; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_audiencesegment (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    icon character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    image character varying(100) NOT NULL,
    icon_image character varying(100) NOT NULL,
    CONSTRAINT home_audiencesegment_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_audiencesegment OWNER TO irdm_user;

--
-- TOC entry 305 (class 1259 OID 312721)
-- Name: home_audiencetag; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_audiencetag (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    label character varying(100) NOT NULL,
    segment_id uuid NOT NULL,
    CONSTRAINT home_audiencetag_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_audiencetag OWNER TO irdm_user;

--
-- TOC entry 306 (class 1259 OID 312732)
-- Name: home_capabilitiessectionheader; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_capabilitiessectionheader (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    heading character varying(300) NOT NULL,
    description text NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    CONSTRAINT home_capabilitiessectionheader_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_capabilitiessectionheader OWNER TO irdm_user;

--
-- TOC entry 307 (class 1259 OID 312748)
-- Name: home_corecapability; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_corecapability (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    icon character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    background_image character varying(100) NOT NULL,
    link_url character varying(500) NOT NULL,
    icon_image character varying(100) NOT NULL,
    CONSTRAINT home_corecapability_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_corecapability OWNER TO irdm_user;

--
-- TOC entry 308 (class 1259 OID 312765)
-- Name: home_ctabanner; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_ctabanner (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    heading character varying(400) NOT NULL,
    description text NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    background_image character varying(100) NOT NULL,
    CONSTRAINT home_ctabanner_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_ctabanner OWNER TO irdm_user;

--
-- TOC entry 309 (class 1259 OID 312782)
-- Name: home_evidencesectionheader; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_evidencesectionheader (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    heading character varying(300) NOT NULL,
    description text NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    partners_label character varying(100) NOT NULL,
    CONSTRAINT home_evidencesectionheader_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_evidencesectionheader OWNER TO irdm_user;

--
-- TOC entry 310 (class 1259 OID 312799)
-- Name: home_featuredsectionconfig; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_featuredsectionconfig (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_key character varying(30) NOT NULL,
    title character varying(200) NOT NULL,
    subtitle character varying(400) NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    is_visible boolean NOT NULL,
    CONSTRAINT home_featuredsectionconfig_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_featuredsectionconfig OWNER TO irdm_user;

--
-- TOC entry 311 (class 1259 OID 312816)
-- Name: home_heropilltag; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_heropilltag (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    label character varying(100) NOT NULL,
    hero_id uuid NOT NULL,
    CONSTRAINT home_heropilltag_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_heropilltag OWNER TO irdm_user;

--
-- TOC entry 312 (class 1259 OID 312827)
-- Name: home_herosection; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_herosection (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    heading character varying(300) NOT NULL,
    subheading character varying(300) NOT NULL,
    description text NOT NULL,
    primary_cta_label character varying(100) NOT NULL,
    primary_cta_url character varying(500) NOT NULL,
    secondary_cta_label character varying(100) NOT NULL,
    secondary_cta_url character varying(500) NOT NULL,
    background_image character varying(100) NOT NULL,
    eyebrow_text character varying(300) NOT NULL,
    quote_strip_text character varying(300) NOT NULL,
    heading_accent character varying(300) NOT NULL,
    hero_image character varying(100) NOT NULL,
    quote_icon character varying(100) NOT NULL,
    CONSTRAINT home_herosection_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_herosection OWNER TO irdm_user;

--
-- TOC entry 313 (class 1259 OID 312851)
-- Name: home_knowledgecategory; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_knowledgecategory (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    icon character varying(100) NOT NULL,
    category_label character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    image character varying(100) NOT NULL,
    CONSTRAINT home_knowledgecategory_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_knowledgecategory OWNER TO irdm_user;

--
-- TOC entry 314 (class 1259 OID 312868)
-- Name: home_knowledgesectionheader; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_knowledgesectionheader (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    heading character varying(300) NOT NULL,
    description text NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    CONSTRAINT home_knowledgesectionheader_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_knowledgesectionheader OWNER TO irdm_user;

--
-- TOC entry 315 (class 1259 OID 312884)
-- Name: home_methodologysectionheader; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_methodologysectionheader (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    heading character varying(300) NOT NULL,
    description text NOT NULL,
    cta_label character varying(100) NOT NULL,
    cta_url character varying(500) NOT NULL,
    CONSTRAINT home_methodologysectionheader_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_methodologysectionheader OWNER TO irdm_user;

--
-- TOC entry 316 (class 1259 OID 312900)
-- Name: home_methodologystep; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_methodologystep (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    step_number smallint NOT NULL,
    icon character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    body text NOT NULL,
    CONSTRAINT home_methodologystep_display_order_check CHECK ((display_order >= 0)),
    CONSTRAINT home_methodologystep_step_number_check CHECK ((step_number >= 0))
);


ALTER TABLE public.home_methodologystep OWNER TO irdm_user;

--
-- TOC entry 317 (class 1259 OID 312916)
-- Name: home_partnerlogo; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_partnerlogo (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(200) NOT NULL,
    logo character varying(100) NOT NULL,
    website_url character varying(200) NOT NULL,
    CONSTRAINT home_partnerlogo_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_partnerlogo OWNER TO irdm_user;

--
-- TOC entry 318 (class 1259 OID 312930)
-- Name: home_philosophyprinciple; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_philosophyprinciple (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    number smallint NOT NULL,
    icon character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    body text NOT NULL,
    CONSTRAINT home_philosophyprinciple_display_order_check CHECK ((display_order >= 0)),
    CONSTRAINT home_philosophyprinciple_number_check CHECK ((number >= 0))
);


ALTER TABLE public.home_philosophyprinciple OWNER TO irdm_user;

--
-- TOC entry 319 (class 1259 OID 312946)
-- Name: home_philosophysectionheader; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_philosophysectionheader (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    heading character varying(300) NOT NULL,
    description text NOT NULL,
    CONSTRAINT home_philosophysectionheader_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_philosophysectionheader OWNER TO irdm_user;

--
-- TOC entry 320 (class 1259 OID 312960)
-- Name: home_statisticitem; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.home_statisticitem (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    value character varying(50) NOT NULL,
    label character varying(150) NOT NULL,
    description character varying(300) NOT NULL,
    icon character varying(100) NOT NULL,
    CONSTRAINT home_statisticitem_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.home_statisticitem OWNER TO irdm_user;

--
-- TOC entry 321 (class 1259 OID 312975)
-- Name: knowledge_knowledgeaccordionitem; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgeaccordionitem (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    accordion_type character varying(20) NOT NULL,
    title character varying(300) NOT NULL,
    content text NOT NULL,
    is_published boolean NOT NULL,
    CONSTRAINT knowledge_knowledgeaccordionitem_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgeaccordionitem OWNER TO irdm_user;

--
-- TOC entry 322 (class 1259 OID 312990)
-- Name: knowledge_knowledgeactivitynews; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgeactivitynews (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    thumbnail character varying(100) NOT NULL,
    title character varying(300) NOT NULL,
    summary text NOT NULL,
    published_date date,
    cta_text character varying(100) NOT NULL,
    cta_icon character varying(50) NOT NULL,
    cta_url character varying(500) NOT NULL,
    is_published boolean NOT NULL,
    category_id uuid,
    cta_target character varying(20) NOT NULL,
    CONSTRAINT knowledge_knowledgeactivitynews_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgeactivitynews OWNER TO irdm_user;

--
-- TOC entry 323 (class 1259 OID 313009)
-- Name: knowledge_knowledgearticle; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgearticle (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(300) NOT NULL,
    slug character varying(300) NOT NULL,
    summary text NOT NULL,
    body text NOT NULL,
    thumbnail character varying(100) NOT NULL,
    hero_image character varying(100) NOT NULL,
    author_name character varying(200) NOT NULL,
    published_date date,
    read_time integer NOT NULL,
    is_featured boolean NOT NULL,
    is_published boolean NOT NULL,
    meta_title character varying(200) NOT NULL,
    meta_description character varying(300) NOT NULL,
    meta_keywords character varying(300) NOT NULL,
    category_id uuid,
    CONSTRAINT knowledge_knowledgearticle_display_order_check CHECK ((display_order >= 0)),
    CONSTRAINT knowledge_knowledgearticle_read_time_check CHECK ((read_time >= 0))
);


ALTER TABLE public.knowledge_knowledgearticle OWNER TO irdm_user;

--
-- TOC entry 324 (class 1259 OID 313034)
-- Name: knowledge_knowledgearticle_related_capabilities; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgearticle_related_capabilities (
    id bigint NOT NULL,
    knowledgearticle_id uuid CONSTRAINT knowledge_knowledgearticle_related_knowledgearticle_id_not_null NOT NULL,
    capability_id uuid CONSTRAINT knowledge_knowledgearticle_related_capab_capability_id_not_null NOT NULL
);


ALTER TABLE public.knowledge_knowledgearticle_related_capabilities OWNER TO irdm_user;

--
-- TOC entry 325 (class 1259 OID 313040)
-- Name: knowledge_knowledgearticle_related_capabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.knowledge_knowledgearticle_related_capabilities ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.knowledge_knowledgearticle_related_capabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 326 (class 1259 OID 313041)
-- Name: knowledge_knowledgearticle_topics; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgearticle_topics (
    id bigint NOT NULL,
    knowledgearticle_id uuid NOT NULL,
    knowledgetopic_id uuid NOT NULL
);


ALTER TABLE public.knowledge_knowledgearticle_topics OWNER TO irdm_user;

--
-- TOC entry 327 (class 1259 OID 313047)
-- Name: knowledge_knowledgearticle_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.knowledge_knowledgearticle_topics ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.knowledge_knowledgearticle_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 328 (class 1259 OID 313048)
-- Name: knowledge_knowledgecategory; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgecategory (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    label character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    heading character varying(300) NOT NULL,
    description text NOT NULL,
    icon character varying(100) NOT NULL,
    cover_image character varying(100) NOT NULL,
    is_published boolean NOT NULL,
    CONSTRAINT knowledge_knowledgecategory_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgecategory OWNER TO irdm_user;

--
-- TOC entry 329 (class 1259 OID 313066)
-- Name: knowledge_knowledgecontenttypecard; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgecontenttypecard (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    cover_image character varying(100) NOT NULL,
    title character varying(300) NOT NULL,
    summary text NOT NULL,
    cta_text character varying(200) NOT NULL,
    cta_icon character varying(50) NOT NULL,
    cta_url character varying(500) NOT NULL,
    is_published boolean NOT NULL,
    category_id uuid,
    listing_page_id uuid NOT NULL,
    CONSTRAINT knowledge_knowledgecontenttypecard_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgecontenttypecard OWNER TO irdm_user;

--
-- TOC entry 330 (class 1259 OID 313085)
-- Name: knowledge_knowledgecontenttypecard_tags; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgecontenttypecard_tags (
    id bigint NOT NULL,
    knowledgecontenttypecard_id uuid CONSTRAINT knowledge_knowledgecontentt_knowledgecontenttypecard_i_not_null NOT NULL,
    knowledgetopic_id uuid CONSTRAINT knowledge_knowledgecontenttypecard_t_knowledgetopic_id_not_null NOT NULL
);


ALTER TABLE public.knowledge_knowledgecontenttypecard_tags OWNER TO irdm_user;

--
-- TOC entry 331 (class 1259 OID 313091)
-- Name: knowledge_knowledgecontenttypecard_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.knowledge_knowledgecontenttypecard_tags ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.knowledge_knowledgecontenttypecard_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 332 (class 1259 OID 313092)
-- Name: knowledge_knowledgectabutton; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgectabutton (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    text character varying(200) NOT NULL,
    url character varying(500) NOT NULL,
    target character varying(20) NOT NULL,
    style character varying(20) NOT NULL,
    icon character varying(50) NOT NULL,
    is_published boolean NOT NULL,
    listing_page_id uuid NOT NULL,
    CONSTRAINT knowledge_knowledgectabutton_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgectabutton OWNER TO irdm_user;

--
-- TOC entry 333 (class 1259 OID 313110)
-- Name: knowledge_knowledgedownload; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgedownload (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(300) NOT NULL,
    slug character varying(300) NOT NULL,
    summary text NOT NULL,
    cover_image character varying(100) NOT NULL,
    file character varying(100) NOT NULL,
    file_type_label character varying(50) NOT NULL,
    file_size_label character varying(50) NOT NULL,
    published_date date,
    is_published boolean NOT NULL,
    category_id uuid,
    CONSTRAINT knowledge_knowledgedownload_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgedownload OWNER TO irdm_user;

--
-- TOC entry 334 (class 1259 OID 313129)
-- Name: knowledge_knowledgedownloadrequest; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgedownloadrequest (
    id bigint NOT NULL,
    full_name character varying(200) NOT NULL,
    organization character varying(300) NOT NULL,
    email character varying(254) NOT NULL,
    note text NOT NULL,
    submitted_at timestamp with time zone NOT NULL
);


ALTER TABLE public.knowledge_knowledgedownloadrequest OWNER TO irdm_user;

--
-- TOC entry 335 (class 1259 OID 313140)
-- Name: knowledge_knowledgedownloadrequest_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.knowledge_knowledgedownloadrequest ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.knowledge_knowledgedownloadrequest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 336 (class 1259 OID 313141)
-- Name: knowledge_knowledgeevent; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgeevent (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    cover_image character varying(100) NOT NULL,
    event_date character varying(200) NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    location character varying(300) NOT NULL,
    cta_text character varying(100) NOT NULL,
    cta_icon character varying(50) NOT NULL,
    cta_url character varying(500) NOT NULL,
    is_published boolean NOT NULL,
    category_id uuid,
    cta_target character varying(20) NOT NULL,
    CONSTRAINT knowledge_knowledgeevent_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgeevent OWNER TO irdm_user;

--
-- TOC entry 337 (class 1259 OID 313162)
-- Name: knowledge_knowledgeevent_tags; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgeevent_tags (
    id bigint NOT NULL,
    knowledgeevent_id uuid NOT NULL,
    knowledgeeventtag_id uuid NOT NULL
);


ALTER TABLE public.knowledge_knowledgeevent_tags OWNER TO irdm_user;

--
-- TOC entry 338 (class 1259 OID 313168)
-- Name: knowledge_knowledgeevent_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.knowledge_knowledgeevent_tags ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.knowledge_knowledgeevent_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 339 (class 1259 OID 313169)
-- Name: knowledge_knowledgeeventtag; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgeeventtag (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    label character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(30) NOT NULL,
    CONSTRAINT knowledge_knowledgeeventtag_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgeeventtag OWNER TO irdm_user;

--
-- TOC entry 340 (class 1259 OID 313181)
-- Name: knowledge_knowledgefeaturedarticle; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgefeaturedarticle (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    article_id uuid NOT NULL,
    listing_page_id uuid NOT NULL,
    badge_text character varying(100) NOT NULL,
    cta_icon character varying(50) NOT NULL,
    cta_text character varying(200) NOT NULL,
    cta_url character varying(500) NOT NULL,
    CONSTRAINT knowledge_knowledgefeaturedarticle_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgefeaturedarticle OWNER TO irdm_user;

--
-- TOC entry 341 (class 1259 OID 313198)
-- Name: knowledge_knowledgefiltergroup; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgefiltergroup (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(200) NOT NULL,
    param_key character varying(50) NOT NULL,
    CONSTRAINT knowledge_knowledgefiltergroup_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgefiltergroup OWNER TO irdm_user;

--
-- TOC entry 342 (class 1259 OID 313209)
-- Name: knowledge_knowledgefilteritem; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgefilteritem (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    label character varying(200) NOT NULL,
    value character varying(200) NOT NULL,
    color_default character varying(30) NOT NULL,
    color_active character varying(30) NOT NULL,
    group_id uuid NOT NULL,
    CONSTRAINT knowledge_knowledgefilteritem_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgefilteritem OWNER TO irdm_user;

--
-- TOC entry 343 (class 1259 OID 313223)
-- Name: knowledge_knowledgelistingpage; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgelistingpage (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    heading character varying(300) NOT NULL,
    description text NOT NULL,
    hero_image character varying(100) NOT NULL,
    search_enabled boolean NOT NULL,
    featured_section_label character varying(200) NOT NULL,
    featured_section_heading character varying(300) CONSTRAINT knowledge_knowledgelistingpag_featured_section_heading_not_null NOT NULL,
    cta_sub character varying(200) NOT NULL,
    cta_heading character varying(300) NOT NULL,
    cta_background_image character varying(100) NOT NULL,
    cta_primary_label character varying(100) NOT NULL,
    cta_primary_url character varying(500) NOT NULL,
    cta_secondary_label character varying(100) NOT NULL,
    cta_secondary_url character varying(500) NOT NULL,
    meta_title character varying(200) NOT NULL,
    meta_description character varying(300) NOT NULL,
    filter_section_description text CONSTRAINT knowledge_knowledgelistingp_filter_section_description_not_null NOT NULL,
    filter_section_heading character varying(300) NOT NULL,
    hero_cta_primary_label character varying(100) NOT NULL,
    hero_cta_primary_url character varying(500) NOT NULL,
    hero_cta_secondary_label character varying(100) CONSTRAINT knowledge_knowledgelistingpag_hero_cta_secondary_label_not_null NOT NULL,
    hero_cta_secondary_url character varying(500) NOT NULL,
    search_placeholder character varying(200) NOT NULL,
    featured_bg_decoration character varying(100) NOT NULL,
    featured_bg_image character varying(100) NOT NULL,
    featured_section_description text CONSTRAINT knowledge_knowledgelistingp_featured_section_descripti_not_null NOT NULL,
    content_type_section_bg_decoration character varying(100) CONSTRAINT knowledge_knowledgelistingp_content_type_section_bg_de_not_null NOT NULL,
    content_type_section_bg_image character varying(100) CONSTRAINT knowledge_knowledgelistingp_content_type_section_bg_im_not_null NOT NULL,
    content_type_section_cta_icon character varying(50) CONSTRAINT knowledge_knowledgelistingp_content_type_section_cta_i_not_null NOT NULL,
    content_type_section_cta_text character varying(100) CONSTRAINT knowledge_knowledgelistingp_content_type_section_cta_t_not_null NOT NULL,
    content_type_section_cta_url character varying(500) CONSTRAINT knowledge_knowledgelistingp_content_type_section_cta_u_not_null NOT NULL,
    content_type_section_description text CONSTRAINT knowledge_knowledgelistingp_content_type_section_descr_not_null NOT NULL,
    content_type_section_heading character varying(300) CONSTRAINT knowledge_knowledgelistingp_content_type_section_headi_not_null NOT NULL,
    content_type_section_label character varying(200) CONSTRAINT knowledge_knowledgelistingp_content_type_section_label_not_null NOT NULL,
    topic_section_bg_decoration character varying(100) CONSTRAINT knowledge_knowledgelistingp_topic_section_bg_decoratio_not_null NOT NULL,
    topic_section_bg_image character varying(100) NOT NULL,
    topic_section_description text CONSTRAINT knowledge_knowledgelistingpa_topic_section_description_not_null NOT NULL,
    topic_section_heading character varying(300) NOT NULL,
    topic_section_label character varying(200) NOT NULL,
    pub_contact_address text NOT NULL,
    pub_contact_city_image character varying(100) NOT NULL,
    pub_contact_cta_icon character varying(50) NOT NULL,
    pub_contact_cta_text character varying(200) NOT NULL,
    pub_contact_cta_url character varying(500) NOT NULL,
    pub_contact_description text NOT NULL,
    pub_contact_email character varying(200) NOT NULL,
    pub_contact_phone character varying(100) NOT NULL,
    pub_contact_title character varying(300) NOT NULL,
    pub_form_button_icon character varying(50) NOT NULL,
    pub_form_button_text character varying(100) NOT NULL,
    pub_form_description text NOT NULL,
    pub_form_email_label character varying(100) NOT NULL,
    pub_form_email_placeholder character varying(200) CONSTRAINT knowledge_knowledgelistingp_pub_form_email_placeholder_not_null NOT NULL,
    pub_form_name_label character varying(100) NOT NULL,
    pub_form_name_placeholder character varying(200) CONSTRAINT knowledge_knowledgelistingpa_pub_form_name_placeholder_not_null NOT NULL,
    pub_form_note_label character varying(100) NOT NULL,
    pub_form_note_placeholder text CONSTRAINT knowledge_knowledgelistingpa_pub_form_note_placeholder_not_null NOT NULL,
    pub_form_org_label character varying(100) NOT NULL,
    pub_form_org_placeholder character varying(200) CONSTRAINT knowledge_knowledgelistingpag_pub_form_org_placeholder_not_null NOT NULL,
    pub_form_privacy_note text NOT NULL,
    pub_form_success_message text CONSTRAINT knowledge_knowledgelistingpag_pub_form_success_message_not_null NOT NULL,
    pub_form_title character varying(300) NOT NULL,
    pub_section_bg_decoration character varying(100) CONSTRAINT knowledge_knowledgelistingpa_pub_section_bg_decoration_not_null NOT NULL,
    pub_section_bg_image character varying(100) NOT NULL,
    pub_section_description text NOT NULL,
    pub_section_heading character varying(300) NOT NULL,
    pub_section_label character varying(200) NOT NULL,
    news_activity_heading character varying(200) NOT NULL,
    news_events_heading character varying(200) NOT NULL,
    news_section_bg_decoration character varying(100) CONSTRAINT knowledge_knowledgelistingp_news_section_bg_decoration_not_null NOT NULL,
    news_section_bg_image character varying(100) NOT NULL,
    news_section_description text CONSTRAINT knowledge_knowledgelistingpag_news_section_description_not_null NOT NULL,
    news_section_heading character varying(300) NOT NULL,
    news_section_label character varying(200) NOT NULL,
    press_section_bg_image character varying(100) NOT NULL,
    press_section_description text CONSTRAINT knowledge_knowledgelistingpa_press_section_description_not_null NOT NULL,
    press_section_heading character varying(300) NOT NULL,
    press_section_label character varying(200) NOT NULL,
    ready_section_bg_image character varying(100) DEFAULT ''::character varying NOT NULL,
    ready_section_description text DEFAULT ''::text CONSTRAINT knowledge_knowledgelistingpa_ready_section_description_not_null NOT NULL,
    ready_section_is_active boolean DEFAULT true NOT NULL,
    ready_section_overlay_color character varying(30) DEFAULT '#0d1e4a'::character varying CONSTRAINT knowledge_knowledgelistingp_ready_section_overlay_colo_not_null NOT NULL,
    ready_section_overlay_opacity double precision DEFAULT 0.82 CONSTRAINT knowledge_knowledgelistingp_ready_section_overlay_opac_not_null NOT NULL,
    ready_section_subtitle character varying(200) DEFAULT ''::character varying NOT NULL,
    ready_section_text_color character varying(20) DEFAULT 'light'::character varying CONSTRAINT knowledge_knowledgelistingpag_ready_section_text_color_not_null NOT NULL,
    ready_section_title character varying(500) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT knowledge_knowledgelistingpage_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgelistingpage OWNER TO irdm_user;

--
-- TOC entry 344 (class 1259 OID 313328)
-- Name: knowledge_knowledgenewsitem; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgenewsitem (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(300) NOT NULL,
    slug character varying(300) NOT NULL,
    summary text NOT NULL,
    thumbnail character varying(100) NOT NULL,
    published_date date,
    source_url character varying(200) NOT NULL,
    is_published boolean NOT NULL,
    category_id uuid,
    cta_target character varying(20) NOT NULL,
    cta_text character varying(100) NOT NULL,
    is_press_article boolean NOT NULL,
    CONSTRAINT knowledge_knowledgenewsitem_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgenewsitem OWNER TO irdm_user;

--
-- TOC entry 345 (class 1259 OID 313348)
-- Name: knowledge_knowledgenewsitem_topics; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgenewsitem_topics (
    id bigint NOT NULL,
    knowledgenewsitem_id uuid CONSTRAINT knowledge_knowledgenewsitem_topic_knowledgenewsitem_id_not_null NOT NULL,
    knowledgetopic_id uuid NOT NULL
);


ALTER TABLE public.knowledge_knowledgenewsitem_topics OWNER TO irdm_user;

--
-- TOC entry 346 (class 1259 OID 313354)
-- Name: knowledge_knowledgenewsitem_topics_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.knowledge_knowledgenewsitem_topics ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.knowledge_knowledgenewsitem_topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 347 (class 1259 OID 313355)
-- Name: knowledge_knowledgetopic; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgetopic (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    label character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    description text NOT NULL,
    icon character varying(100) NOT NULL,
    is_published boolean NOT NULL,
    cover_image character varying(100) NOT NULL,
    CONSTRAINT knowledge_knowledgetopic_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgetopic OWNER TO irdm_user;

--
-- TOC entry 348 (class 1259 OID 313372)
-- Name: knowledge_knowledgetopiccard; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgetopiccard (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    cover_image character varying(100) NOT NULL,
    icon character varying(100) NOT NULL,
    title character varying(300) NOT NULL,
    description text NOT NULL,
    cta_text character varying(200) NOT NULL,
    cta_icon character varying(50) NOT NULL,
    cta_url character varying(500) NOT NULL,
    is_published boolean NOT NULL,
    listing_page_id uuid NOT NULL,
    topic_id uuid,
    CONSTRAINT knowledge_knowledgetopiccard_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgetopiccard OWNER TO irdm_user;

--
-- TOC entry 349 (class 1259 OID 313392)
-- Name: knowledge_knowledgetopiccard_tags; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgetopiccard_tags (
    id bigint NOT NULL,
    knowledgetopiccard_id uuid CONSTRAINT knowledge_knowledgetopiccard_tag_knowledgetopiccard_id_not_null NOT NULL,
    knowledgetopiccardtag_id uuid CONSTRAINT knowledge_knowledgetopiccard__knowledgetopiccardtag_id_not_null NOT NULL
);


ALTER TABLE public.knowledge_knowledgetopiccard_tags OWNER TO irdm_user;

--
-- TOC entry 350 (class 1259 OID 313398)
-- Name: knowledge_knowledgetopiccard_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.knowledge_knowledgetopiccard_tags ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.knowledge_knowledgetopiccard_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 351 (class 1259 OID 313399)
-- Name: knowledge_knowledgetopiccardtag; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.knowledge_knowledgetopiccardtag (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    label character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    color character varying(30) NOT NULL,
    CONSTRAINT knowledge_knowledgetopiccardtag_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.knowledge_knowledgetopiccardtag OWNER TO irdm_user;

--
-- TOC entry 352 (class 1259 OID 313411)
-- Name: solution_solution; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.solution_solution (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(300) NOT NULL,
    slug character varying(300) NOT NULL,
    section_label character varying(200) NOT NULL,
    summary text NOT NULL,
    thumbnail character varying(100) NOT NULL,
    hero_image character varying(100) NOT NULL,
    description text NOT NULL,
    challenge_label character varying(200) NOT NULL,
    methodology_label character varying(200) NOT NULL,
    output_label character varying(200) NOT NULL,
    capability_label character varying(200) NOT NULL,
    cta_heading character varying(200) NOT NULL,
    cta_sub character varying(200) NOT NULL,
    cta_primary_label character varying(100) NOT NULL,
    cta_primary_url character varying(500) NOT NULL,
    cta_secondary_label character varying(100) NOT NULL,
    cta_secondary_url character varying(500) NOT NULL,
    is_published boolean NOT NULL,
    meta_title character varying(200) NOT NULL,
    meta_description character varying(300) NOT NULL,
    meta_keywords character varying(300) NOT NULL,
    cta_image character varying(100) NOT NULL,
    card_color character varying(200) NOT NULL,
    CONSTRAINT solution_solution_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.solution_solution OWNER TO irdm_user;

--
-- TOC entry 353 (class 1259 OID 313445)
-- Name: solution_solution_related_capabilities; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.solution_solution_related_capabilities (
    id bigint NOT NULL,
    solution_id uuid NOT NULL,
    capability_id uuid NOT NULL
);


ALTER TABLE public.solution_solution_related_capabilities OWNER TO irdm_user;

--
-- TOC entry 354 (class 1259 OID 313451)
-- Name: solution_solution_related_capabilities_id_seq; Type: SEQUENCE; Schema: public; Owner: irdm_user
--

ALTER TABLE public.solution_solution_related_capabilities ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.solution_solution_related_capabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 355 (class 1259 OID 313452)
-- Name: solution_solutionapproachstep; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.solution_solutionapproachstep (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    number smallint NOT NULL,
    title character varying(200) NOT NULL,
    description text NOT NULL,
    icon character varying(100) NOT NULL,
    CONSTRAINT solution_solutionapproachstep_display_order_check CHECK ((display_order >= 0)),
    CONSTRAINT solution_solutionapproachstep_number_check CHECK ((number >= 0))
);


ALTER TABLE public.solution_solutionapproachstep OWNER TO irdm_user;

--
-- TOC entry 356 (class 1259 OID 313468)
-- Name: solution_solutionchallenge; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.solution_solutionchallenge (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    number smallint NOT NULL,
    content text NOT NULL,
    solution_id uuid NOT NULL,
    CONSTRAINT solution_solutionchallenge_display_order_check CHECK ((display_order >= 0)),
    CONSTRAINT solution_solutionchallenge_number_check CHECK ((number >= 0))
);


ALTER TABLE public.solution_solutionchallenge OWNER TO irdm_user;

--
-- TOC entry 357 (class 1259 OID 313483)
-- Name: solution_solutionfeature; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.solution_solutionfeature (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    label character varying(100) NOT NULL,
    solution_id uuid NOT NULL,
    CONSTRAINT solution_solutionfeature_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.solution_solutionfeature OWNER TO irdm_user;

--
-- TOC entry 358 (class 1259 OID 313494)
-- Name: solution_solutionlistingpage; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.solution_solutionlistingpage (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    section_label character varying(200) NOT NULL,
    heading character varying(300) NOT NULL,
    description text NOT NULL,
    cta_primary_label character varying(100) NOT NULL,
    cta_primary_url character varying(500) NOT NULL,
    cta_secondary_label character varying(100) NOT NULL,
    cta_secondary_url character varying(500) NOT NULL,
    quicknav_heading character varying(300) NOT NULL,
    approach_label character varying(200) NOT NULL,
    approach_heading character varying(300) NOT NULL,
    approach_description text NOT NULL,
    hero_image character varying(100) NOT NULL,
    meta_description character varying(300) NOT NULL,
    meta_keywords character varying(300) NOT NULL,
    meta_title character varying(200) NOT NULL,
    CONSTRAINT solution_solutionlistingpage_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.solution_solutionlistingpage OWNER TO irdm_user;

--
-- TOC entry 359 (class 1259 OID 313520)
-- Name: solution_solutionmethodologystep; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.solution_solutionmethodologystep (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(200) NOT NULL,
    icon character varying(100) NOT NULL,
    solution_id uuid NOT NULL,
    description text NOT NULL,
    CONSTRAINT solution_solutionmethodologystep_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.solution_solutionmethodologystep OWNER TO irdm_user;

--
-- TOC entry 360 (class 1259 OID 313535)
-- Name: solution_solutionoutput; Type: TABLE; Schema: public; Owner: irdm_user
--

CREATE TABLE public.solution_solutionoutput (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    number smallint NOT NULL,
    content text NOT NULL,
    solution_id uuid NOT NULL,
    image character varying(100) NOT NULL,
    CONSTRAINT solution_solutionoutput_display_order_check CHECK ((display_order >= 0)),
    CONSTRAINT solution_solutionoutput_number_check CHECK ((number >= 0))
);


ALTER TABLE public.solution_solutionoutput OWNER TO irdm_user;

--
-- TOC entry 6343 (class 0 OID 311531)
-- Dependencies: 219
-- Data for Name: about_aboutcapabilityecosystem; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutcapabilityecosystem (id, is_active, display_order, created_at, updated_at, section_label, title, description, diagram_image, diagram_alt, background_image, hub_label, primary_cta_label, primary_cta_url, secondary_cta_label, secondary_cta_url) FROM stdin;
355d8657-e5be-4ec8-a3e5-6e4a7f106f7b	t	0	2026-08-02 22:58:23.454147+07	2026-08-02 22:58:23.454156+07	HỆ SINH THÁI HỢP TÁC	BẰNG CHỨNG NĂNG LỰC\nVÀ HỆ SINH THÁI HỢP TÁC	IRDM đã đồng hành cùng cơ quan quản lý, tổ chức y tế, trường đại học, doanh nghiệp và đối tác trong các bài toán liên quan đến dữ liệu, chuyển đổi số, sức khỏe tâm thần, phát triển năng lực và đổi mới hệ thống.				IRDM\nHub	Xem Tin IRDM	/tin-tuc/	Xem Tri thức & Góc nhìn	/tri-thuc/
\.


--
-- TOC entry 6344 (class 0 OID 311553)
-- Dependencies: 220
-- Data for Name: about_aboutcontactbanner; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutcontactbanner (id, is_active, display_order, created_at, updated_at, title, description, hotline, email, facebook_url, linkedin_url, youtube_url, background_image, cta1_label, cta1_url, cta2_label, cta2_url, cta3_label, cta3_url, quote_text) FROM stdin;
347c185d-60b7-42e7-9ef9-c321af3b968b	t	0	2026-08-01 22:39:29.889879+07	2026-08-02 23:55:06.068568+07	KẾT NỐI VỚI IRDM	Cùng IRDM thiết kế giải pháp phù hợp với bối cảnh, dữ liệu và mục tiêu phát triển của tổ chức của bạn.	024 3826 xxxx	contact@irdm.vn	https://facebook.com/irdm.vn	https://linkedin.com/company/irdm	https://youtube.com/@irdmvn	about/contact/HinhNen_KetNoi.png	Liên hệ hợp tác	/lien-he/	Xem Năng lực IRDM	/ve-irdm/	Khám phá Giải pháp	/giai-phap/	“TỪ NGHIÊN CỨU ĐẾN TÁC ĐỘNG Ờ TẦM HỆ THỐNG”
\.


--
-- TOC entry 6345 (class 0 OID 311579)
-- Dependencies: 221
-- Data for Name: about_aboutcontactbannerstat; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutcontactbannerstat (id, is_active, display_order, created_at, updated_at, number, label, icon_key, banner_id) FROM stdin;
cc25f6ef-5d58-4166-95a4-2e46b28b99db	t	0	2026-08-02 23:50:44.551212+07	2026-08-02 23:50:44.551221+07	500+	Chuyên gia	users	347c185d-60b7-42e7-9ef9-c321af3b968b
4d1c5843-ac4e-4400-98e8-464276bbebf7	t	1	2026-08-02 23:50:44.552762+07	2026-08-02 23:50:44.55277+07	50+	Dự án	building	347c185d-60b7-42e7-9ef9-c321af3b968b
45dee8b7-2ce4-43f7-837f-b11c3c22d698	t	2	2026-08-02 23:50:44.553864+07	2026-08-02 23:50:44.55387+07	20+	Đối tác	clipboard	347c185d-60b7-42e7-9ef9-c321af3b968b
45ab47c7-40e9-4d20-b008-3a0370666d56	t	3	2026-08-02 23:50:44.555032+07	2026-08-02 23:50:44.555037+07	10+	Năm	clock	347c185d-60b7-42e7-9ef9-c321af3b968b
\.


--
-- TOC entry 6346 (class 0 OID 311592)
-- Dependencies: 222
-- Data for Name: about_aboutcorevalue; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutcorevalue (id, is_active, display_order, created_at, updated_at, icon, icon_image, title, description, color_theme) FROM stdin;
01a85ca9-4236-4327-8be8-226eab5afb6b	f	0	2026-08-01 22:39:29.809375+07	2026-08-01 22:39:29.80938+07			Độc lập & Khách quan	Nghiên cứu không bị ảnh hưởng bởi lợi ích nhóm. Kết quả phản ánh thực tế.	blue
511244d6-2d93-4a6e-8529-b4fe73782d10	f	1	2026-08-01 22:39:29.810409+07	2026-08-01 22:39:29.810413+07			Liêm chính khoa học	Tuân thủ nghiêm ngặt các chuẩn mực đạo đức nghiên cứu quốc tế.	green
f994c73f-de6f-43fd-8f8b-1816ba9d93e5	f	2	2026-08-01 22:39:29.811048+07	2026-08-01 22:39:29.811052+07			Tác động xã hội	Mọi hoạt động hướng đến lợi ích cộng đồng và phát triển bền vững.	orange
90c23be5-b5b4-4b40-8816-4ddb5d819be9	f	3	2026-08-01 22:39:29.811674+07	2026-08-01 22:39:29.811677+07			Hợp tác liên ngành	Phá vỡ rào cản giữa các ngành, kết nối tri thức đa lĩnh vực.	purple
5ff8b0b5-e669-4225-8f58-3e5c6af85e5f	f	4	2026-08-01 22:39:29.812263+07	2026-08-01 22:39:29.812266+07			Đổi mới sáng tạo	Luôn tìm kiếm phương pháp và cách tiếp cận mới, hiệu quả hơn.	teal
80d80b70-2469-4f22-89a5-9cf37a68ca62	f	5	2026-08-01 22:39:29.81289+07	2026-08-01 22:39:29.812894+07			Minh bạch & Trách nhiệm	Công khai quy trình, phương pháp và kết quả với tất cả các bên liên quan.	slate
53828d8c-6a19-4fc9-b6f9-112b2137cf08	t	0	2026-08-02 11:22:36.642056+07	2026-08-02 23:50:44.477527+07		about/values/icons/ChinhTruc.png	Chính trực	IRDM đặt trung thực học thuật, minh bạch chuyên môn và trách nhiệm với dữ liệu, đối tác, cộng đồng thụ hưởng làm nền tảng cho mọi hoạt động.	blue
9ab1f034-fa9f-4c7f-8077-54ba27064736	t	1	2026-08-02 11:22:36.643022+07	2026-08-02 23:50:44.478318+07		about/values/icons/heart.png	Thấu cảm	IRDM bắt đầu từ việc lắng nghe bối cảnh, con người và nhu cầu thực tế của từng tổ chức.	teal
acaf91a2-ebb4-4310-8585-e8a6b1e7e08c	t	2	2026-08-02 11:22:36.643654+07	2026-08-02 23:50:44.47907+07		about/values/icons/leaf.png	Cam kết phát triển bền vững	IRDM hướng tới các giải pháp có giá trị dài hạn, sử dụng nguồn lực hiệu quả và có khả năng duy trì sau giai đoạn dự án.	amber
b532db23-20e1-4ab4-ac5b-809c762ef650	t	3	2026-08-02 11:22:36.644348+07	2026-08-02 23:50:44.479797+07		about/values/icons/Z.png	Chuyển hóa	IRDM không dừng ở tri thức, báo cáo hoặc ý tưởng. Trọng tâm là chuyển hóa nghiên cứu thành bằng chứng, bằng chứng thành giải pháp và giải pháp thành thay đổi quan sát được.	orange
\.


--
-- TOC entry 6347 (class 0 OID 311608)
-- Dependencies: 223
-- Data for Name: about_aboutcorevaluesection; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutcorevaluesection (id, is_active, display_order, created_at, updated_at, section_label, title, description, background_image) FROM stdin;
15c8ec37-20c8-466e-8399-1ee3c1f52e7c	t	0	2026-08-01 22:39:29.807171+07	2026-08-02 23:50:44.474921+07	Giá trị	GIÁ TRỊ CỐT LÕI	Các giá trị cốt lõi định hướng cách IRDM nghiên cứu, tư vấn, đào tạo và đồng hành cùng đối tác. Với IRDM, giá trị không chỉ là nguyên tắc vận hành tổ chức, mà còn là nền tảng để phát triển con người một cách chính trực, nhân văn, bền vững và có khả năng chuyển hóa.	
\.


--
-- TOC entry 6348 (class 0 OID 311623)
-- Dependencies: 224
-- Data for Name: about_aboutctabanner; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutctabanner (id, is_active, display_order, created_at, updated_at, title, description, background_image, primary_cta_label, primary_cta_url, secondary_cta_label, secondary_cta_url) FROM stdin;
4aea0a7d-4e70-4484-b0b8-54731a79e5e7	t	0	2026-08-01 22:39:29.827734+07	2026-08-01 22:39:29.827741+07	SẴN SÀNG HỢP TÁC CÙNG IRDM?	Hãy kết nối với chúng tôi để cùng xây dựng các giải pháp nghiên cứu và phát triển bền vững cho tổ chức của bạn.		Liên hệ ngay	/lien-he/	Xem năng lực của IRDM	/capabilities/
\.


--
-- TOC entry 6349 (class 0 OID 311641)
-- Dependencies: 225
-- Data for Name: about_aboutecosystempartnergroup; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutecosystempartnergroup (id, is_active, display_order, created_at, updated_at, title, color, ecosystem_id) FROM stdin;
cd94b54c-894c-433f-a205-fa8ad990a13f	t	0	2026-08-02 22:58:23.457141+07	2026-08-02 22:58:23.45715+07	Cơ quan quản lý	navy	355d8657-e5be-4ec8-a3e5-6e4a7f106f7b
dcb77959-a664-470e-9115-c488fbb75f30	t	1	2026-08-02 22:58:23.461576+07	2026-08-02 22:58:23.46158+07	Trường đại học	blue	355d8657-e5be-4ec8-a3e5-6e4a7f106f7b
040ecc2e-8c1e-4a76-9a38-79f0348d892e	t	2	2026-08-02 22:58:23.464395+07	2026-08-02 22:58:23.464399+07	Bệnh viện	orange	355d8657-e5be-4ec8-a3e5-6e4a7f106f7b
f9e8667f-a1eb-4ccb-b612-6ac5f65ab4d1	t	3	2026-08-02 22:58:23.472166+07	2026-08-02 22:58:23.472171+07	Doanh nghiệp	indigo	355d8657-e5be-4ec8-a3e5-6e4a7f106f7b
\.


--
-- TOC entry 6350 (class 0 OID 311653)
-- Dependencies: 226
-- Data for Name: about_aboutecosystempartneritem; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutecosystempartneritem (id, is_active, display_order, created_at, updated_at, name, logo, group_id) FROM stdin;
832b1981-0c63-4af1-89ca-473eec1ac2ac	t	0	2026-08-02 22:58:23.459684+07	2026-08-02 22:58:23.45969+07	Sở Khoa học và Công nghệ TP.HCM		cd94b54c-894c-433f-a205-fa8ad990a13f
77ea16d7-241d-4306-a24d-3e7e291da0a4	t	1	2026-08-02 22:58:23.460829+07	2026-08-02 22:58:23.460834+07	Sở Y tế TP.HCM		cd94b54c-894c-433f-a205-fa8ad990a13f
5f28d76f-ab8a-4070-a492-50196e13b31c	t	0	2026-08-02 22:58:23.462274+07	2026-08-02 22:58:23.462278+07	Đại học Bách Khoa TP.HCM		dcb77959-a664-470e-9115-c488fbb75f30
71c8a46e-1630-4e18-ae09-28f4216bd085	t	1	2026-08-02 22:58:23.462978+07	2026-08-02 22:58:23.462981+07	Đại học Y Dược TP.HCM		dcb77959-a664-470e-9115-c488fbb75f30
3f0ce638-e318-4e39-b05a-f1f5107d376d	t	2	2026-08-02 22:58:23.463659+07	2026-08-02 22:58:23.463662+07	Đại học Y khoa Phạm Ngọc Thạch		dcb77959-a664-470e-9115-c488fbb75f30
3bcc75f2-7b07-4dd4-8492-e6f72049f32f	t	0	2026-08-02 22:58:23.465073+07	2026-08-02 22:58:23.465077+07	Bệnh viện Nguyễn Tri Phương		040ecc2e-8c1e-4a76-9a38-79f0348d892e
a84e7d9d-74a3-4ef4-a3be-691c7069112d	t	1	2026-08-02 22:58:23.465845+07	2026-08-02 22:58:23.465848+07	Bệnh viện Chấn thương Chỉnh hình		040ecc2e-8c1e-4a76-9a38-79f0348d892e
354f1374-f4eb-4b93-931b-cb401af26ad3	t	2	2026-08-02 22:58:23.466587+07	2026-08-02 22:58:23.466591+07	Bệnh viện Bệnh Nhiệt đới		040ecc2e-8c1e-4a76-9a38-79f0348d892e
b22be955-4bf4-44d3-99af-6714d04e34b2	t	3	2026-08-02 22:58:23.4675+07	2026-08-02 22:58:23.467504+07	Bệnh viện Răng Hàm Mặt TP.HCM		040ecc2e-8c1e-4a76-9a38-79f0348d892e
e0cc91d4-7da3-4a19-8dc1-9f43dfc8efc7	t	4	2026-08-02 22:58:23.46828+07	2026-08-02 22:58:23.468284+07	Bệnh viện Da liễu		040ecc2e-8c1e-4a76-9a38-79f0348d892e
9c75c750-38dc-4d7b-8d16-b8147b599636	t	5	2026-08-02 22:58:23.469505+07	2026-08-02 22:58:23.469512+07	Bệnh viện Răng Hàm Mặt Trung Ương		040ecc2e-8c1e-4a76-9a38-79f0348d892e
df1dff38-d262-4cfe-936a-f072fc62fc6a	t	6	2026-08-02 22:58:23.470568+07	2026-08-02 22:58:23.470574+07	Bệnh viện Mắt TP.HCM		040ecc2e-8c1e-4a76-9a38-79f0348d892e
737c4574-85da-4c2a-ba99-631a8eb17e55	t	7	2026-08-02 22:58:23.471347+07	2026-08-02 22:58:23.47135+07	Bệnh viện Ung bướu TP.HCM		040ecc2e-8c1e-4a76-9a38-79f0348d892e
6e9c2299-d07e-40aa-809c-782c5850c68e	t	0	2026-08-02 22:58:23.473235+07	2026-08-02 22:58:23.47324+07	TalentNet		f9e8667f-a1eb-4ccb-b612-6ac5f65ab4d1
b74598f3-840a-403f-a8fd-ca1ba5e0f2cd	t	1	2026-08-02 22:58:23.473939+07	2026-08-02 22:58:23.473942+07	Sanofi		f9e8667f-a1eb-4ccb-b612-6ac5f65ab4d1
c2e710fb-ab00-4e31-8574-3b164c41d65e	t	2	2026-08-02 22:58:23.4746+07	2026-08-02 22:58:23.474603+07	Merit Medical Asia Co Ltd		f9e8667f-a1eb-4ccb-b612-6ac5f65ab4d1
\.


--
-- TOC entry 6351 (class 0 OID 311665)
-- Dependencies: 227
-- Data for Name: about_aboutecosystemstatistic; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutecosystemstatistic (id, is_active, display_order, created_at, updated_at, number, label, ecosystem_id) FROM stdin;
39c10bc6-fc4e-4185-a156-5813ef014c31	t	0	2026-08-02 22:58:23.476911+07	2026-08-02 22:58:23.476916+07	2	Cơ quan	355d8657-e5be-4ec8-a3e5-6e4a7f106f7b
2ff3f884-4dee-4dae-87a3-118f29fd6bfa	t	1	2026-08-02 22:58:23.477851+07	2026-08-02 22:58:23.477854+07	4	Trường	355d8657-e5be-4ec8-a3e5-6e4a7f106f7b
518c8bf6-ce87-4106-b2e1-5c094356c2f6	t	2	2026-08-02 22:58:23.478554+07	2026-08-02 22:58:23.478558+07	6	Bệnh viện	355d8657-e5be-4ec8-a3e5-6e4a7f106f7b
a1acd40d-d5c9-4e06-b3c0-7ae4f8934975	t	3	2026-08-02 22:58:23.479245+07	2026-08-02 22:58:23.479248+07	3	DN	355d8657-e5be-4ec8-a3e5-6e4a7f106f7b
\.


--
-- TOC entry 6352 (class 0 OID 311677)
-- Dependencies: 228
-- Data for Name: about_abouthero; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_abouthero (id, is_active, display_order, created_at, updated_at, eyebrow, title, subtitle, description, background_image, foreground_image, primary_cta_label, primary_cta_url, secondary_cta_label, secondary_cta_url, quote_show, quote_text, quote_icon) FROM stdin;
52922ea4-afcd-4a8b-9103-c39885043dfc	t	0	2026-08-01 22:57:52.911285+07	2026-08-02 23:50:44.456471+07	Viện nghiên cứu, khoa học, công nghệ và đổi mới sáng tạo định hướng ứng dụng	VỀ IRDM	Kết nối Tri thức — Kiến tạo Tác động	Kết nối nghiên cứu, dữ liệu, công nghệ và phát triển con người để kiến tạo giải pháp có thể triển khai.\n\nIRDM đồng hành cùng cơ quan quản lý, hệ thống y tế, cơ sở giáo dục, doanh nghiệp và tổ chức quốc tế trong các bài toán cần bằng chứng khoa học, dữ liệu đáng tin cậy, năng lực chuyên gia phù hợp và lộ trình triển khai sát bối cảnh thực tiễn.	about/hero/VeIRDM.png		Khám phá năng lực IRDM	/capabilities/	Xem Giải pháp	/giai-phap/	t	TỪ NGHIÊN CỨU ĐẾN TÁC ĐỘNG Ở TẦM HỆ THỐNG	about/hero/quote/Group.png
\.


--
-- TOC entry 6353 (class 0 OID 311701)
-- Dependencies: 229
-- Data for Name: about_aboutherostatistic; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutherostatistic (id, is_active, display_order, created_at, updated_at, number, label, animation_enabled, hero_id) FROM stdin;
ecd8d082-d485-4cfb-94a1-13450bc65519	t	0	2026-08-01 22:57:52.915631+07	2026-08-01 22:57:52.915636+07	500+	Chuyên gia	t	52922ea4-afcd-4a8b-9103-c39885043dfc
12bfd77f-560e-49c0-a683-ebbee939ab09	t	1	2026-08-01 22:57:52.917076+07	2026-08-01 22:57:52.917083+07	50+	Dự án	t	52922ea4-afcd-4a8b-9103-c39885043dfc
804b34dc-3399-4427-ae2d-1e6540d5c29b	t	2	2026-08-01 22:57:52.91831+07	2026-08-01 22:57:52.918315+07	10+	Năm	t	52922ea4-afcd-4a8b-9103-c39885043dfc
\.


--
-- TOC entry 6354 (class 0 OID 311714)
-- Dependencies: 230
-- Data for Name: about_abouthighlightcard; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_abouthighlightcard (id, is_active, display_order, created_at, updated_at, icon, icon_image, title, description, color, intro_id) FROM stdin;
f7ac35b5-2f6b-4159-865b-509b7e70e3b8	t	0	2026-08-01 23:39:16.099193+07	2026-08-01 23:43:28.068157+07		about/intro/icons/book-open.png	Kết nối tri thức khoa học	Huy động nhà khoa học, chuyên gia liên ngành và bằng chứng từ nghiên cứu ứng dụng để định hướng giải pháp.		9701925a-ecd4-4e3b-9ab1-719933bcdb6a
61d45b0a-a753-43f3-a6b6-52eb02851880	t	1	2026-08-01 23:39:16.100346+07	2026-08-01 23:43:28.071432+07		about/intro/icons/bar-chart-3.png	Tạo bằng chứng từ dữ liệu	Chuyển hoá dữ liệu, khảo sát và kinh nghiệm thực tiễn thành Insight rõ ràng, có thể được sử dụng cho quyết định và chính sách.		9701925a-ecd4-4e3b-9ab1-719933bcdb6a
2553f9ca-0706-47ae-9af5-15c7369ca945	t	2	2026-08-01 23:39:16.101479+07	2026-08-01 23:43:28.072373+07		about/intro/icons/layers.png	Đồng thiết kế giải pháp có thể triển khai	Thiết kế chương trình, công cụ và mô hình thí điểm phù hợp với bối cảnh, dữ liệu và năng lực con người của đối tác.		9701925a-ecd4-4e3b-9ab1-719933bcdb6a
\.


--
-- TOC entry 6355 (class 0 OID 311731)
-- Dependencies: 231
-- Data for Name: about_aboutintroduction; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutintroduction (id, is_active, display_order, created_at, updated_at, section_label, title, subtitle, description, image, image_alt, background_image) FROM stdin;
9701925a-ecd4-4e3b-9ab1-719933bcdb6a	t	0	2026-08-01 23:39:16.096167+07	2026-08-02 00:07:50.958338+07	NHẬN DIỆN TỔ CHỨC	IRDM LÀ AI?		Viện Nghiên cứu Phát triển Nguồn lực Việt (IRDM) là tổ chức khoa học, công nghệ và đổi mới sáng tạo định hướng ứng dụng, hoạt động trong các lĩnh vực y tế, giáo dục, môi trường và phát triển nguồn lực.	about/intro/IDRM_LA_AI.png		about/intro/bg/Hinhnen_IDRM_LAAI.png
\.


--
-- TOC entry 6356 (class 0 OID 311749)
-- Dependencies: 232
-- Data for Name: about_aboutlegalbadge; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutlegalbadge (id, is_active, display_order, created_at, updated_at, label, legal_info_id) FROM stdin;
fd6a4781-8266-41ca-b755-a3187b21b84c	t	0	2026-08-02 23:50:44.487435+07	2026-08-02 23:50:44.487445+07	#IRDM	db58ab1f-0c0b-4e80-9584-e606d9722293
fb28c168-7d17-4e6b-9656-e5ba352607da	t	1	2026-08-02 23:50:44.488179+07	2026-08-02 23:50:44.488187+07	A-2157	db58ab1f-0c0b-4e80-9584-e606d9722293
843f3140-a3f8-4c32-821f-440832a47362	t	2	2026-08-02 23:50:44.488701+07	2026-08-02 23:50:44.488707+07	0316181955	db58ab1f-0c0b-4e80-9584-e606d9722293
\.


--
-- TOC entry 6357 (class 0 OID 311760)
-- Dependencies: 233
-- Data for Name: about_aboutlegalinfo; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutlegalinfo (id, is_active, display_order, created_at, updated_at, section_label, title, description, image, image_alt, background_image, footer_note, footer_note_show, org_card_label, org_name, timeline_card_title) FROM stdin;
db58ab1f-0c0b-4e80-9584-e606d9722293	t	0	2026-08-02 11:46:34.108608+07	2026-08-02 23:50:44.482019+07	THÔNG TIN PHÁP LÝ	PHÁP LÝ VÀ PHẠM VI HOẠT ĐỘNG	IRDM là tổ chức khoa học và công nghệ được thành lập, đăng ký hoạt động và vận hành theo các quy định pháp luật hiện hành liên quan đến tổ chức khoa học và công nghệ tại Việt Nam.	about/legal/PhapLy.png			Lưu ý trước khi public: Đối chiếu lần cuối thông tin pháp lý với bản scan/hồ sơ gốc của IRDM và đồng bộ với footer/trang Liên hệ.	t	THÔNG TIN TỔ CHỨC	Viện Nghiên cứu Phát triển Nguồn lực Việt	CỘT MỐC PHÁP LÝ
\.


--
-- TOC entry 6358 (class 0 OID 311782)
-- Dependencies: 234
-- Data for Name: about_aboutlegalorgattribute; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutlegalorgattribute (id, is_active, display_order, created_at, updated_at, key, value, legal_info_id) FROM stdin;
a9d07ae5-9aa3-4ec0-9562-f7aae03fe013	t	0	2026-08-02 23:50:44.491369+07	2026-08-02 23:50:44.491375+07	Loại hình	Tổ chức khoa học và công nghệ định hướng ứng dụng	db58ab1f-0c0b-4e80-9584-e606d9722293
545d5768-37c6-4a74-81e3-33ebf304bb03	t	1	2026-08-02 23:50:44.49195+07	2026-08-02 23:50:44.491956+07	Mã số định danh	079211913489	db58ab1f-0c0b-4e80-9584-e606d9722293
\.


--
-- TOC entry 6359 (class 0 OID 311796)
-- Dependencies: 235
-- Data for Name: about_aboutlegaltimelineitem; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutlegaltimelineitem (id, is_active, display_order, created_at, updated_at, year, title, description, document_url, document_label, legal_info_id, icon_image) FROM stdin;
3f93f3d1-d633-49b1-aec9-a12cb8880f50	t	0	2026-08-02 23:50:44.492515+07	2026-08-02 23:50:44.49252+07	2019	Thành lập	Quyết định thành lập số 1111/QĐ-LHHVN do Liên hiệp các Hội Khoa học và Kỹ thuật Việt Nam cấp ngày 01/11/2019.			db58ab1f-0c0b-4e80-9584-e606d9722293	
397e7558-9c6a-4002-9d64-2e629b6de185	t	1	2026-08-02 23:50:44.493099+07	2026-08-02 23:50:44.493106+07	2019	Đăng ký hoạt động KHCN	Giấy chứng nhận đăng ký hoạt động KHCN số A-2157 do Bộ Khoa học và Công nghệ cấp ngày 29/11/2019.			db58ab1f-0c0b-4e80-9584-e606d9722293	
37051cdb-5609-4144-ad72-e384e6714c7c	t	2	2026-08-02 23:50:44.493491+07	2026-08-02 23:50:44.493495+07	2020	Đăng ký thuế	Mã số thuế 0316181955. Giấy chứng nhận đăng ký thuế do Bộ Tài chính cấp ngày 04/03/2020.			db58ab1f-0c0b-4e80-9584-e606d9722293	
838ea93f-6470-44a8-bd3e-de75f8b49edd	t	3	2026-08-02 23:50:44.493828+07	2026-08-02 23:50:44.493831+07	2020	Phạm vi hoạt động	Y tế, giáo dục, môi trường, phát triển nguồn lực, nghiên cứu ứng dụng, dữ liệu, công nghệ, phát triển năng lực và các sáng kiến KHCN&ĐMST phù hợp với chức năng của Viện.			db58ab1f-0c0b-4e80-9584-e606d9722293	
\.


--
-- TOC entry 6360 (class 0 OID 311814)
-- Dependencies: 236
-- Data for Name: about_aboutnetworksectionheader; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutnetworksectionheader (id, is_active, display_order, created_at, updated_at, section_label, title, description, cta_label, cta_url) FROM stdin;
04e714d6-d7af-49bf-9ca0-8c43a295bf8f	t	0	2026-08-01 22:39:29.838881+07	2026-08-01 22:39:29.838885+07	Hệ sinh thái	MẠNG LƯỚI ĐỐI TÁC & TỔ CHỨC	IRDM kết nối với các trường đại học, viện nghiên cứu, tổ chức quốc tế và doanh nghiệp hàng đầu	Trở thành đối tác	/lien-he/
\.


--
-- TOC entry 6361 (class 0 OID 311830)
-- Dependencies: 237
-- Data for Name: about_aboutorgstructurebulletitem; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutorgstructurebulletitem (id, is_active, display_order, created_at, updated_at, card_id, text) FROM stdin;
755014f5-c0cb-43fa-9e12-0bccc65082ad	t	0	2026-08-02 21:48:41.913929+07	2026-08-02 21:48:41.913936+07	a95d5674-6c4d-402a-ab03-c22767c98167	Định hướng học thuật
1fb46840-d459-4776-8bc2-cd9125ced3db	t	1	2026-08-02 21:48:41.91586+07	2026-08-02 21:48:41.915867+07	a95d5674-6c4d-402a-ab03-c22767c98167	Chất lượng chuyên môn
e29493f2-073a-40e7-a837-046b84e31eaf	t	2	2026-08-02 21:48:41.916985+07	2026-08-02 21:48:41.916991+07	a95d5674-6c4d-402a-ab03-c22767c98167	Chiều sâu chiến lược
aabca375-1c49-4bd6-9d28-08f9c65dced4	t	0	2026-08-02 21:48:41.918975+07	2026-08-02 21:48:41.918979+07	87523654-b0f3-4720-ae50-071906f1b5dc	Quản trị & điều phối
5285a669-e0f4-4d2c-b4d5-bb8e7f4d8c9c	t	1	2026-08-02 21:48:41.919849+07	2026-08-02 21:48:41.919853+07	87523654-b0f3-4720-ae50-071906f1b5dc	Vận hành & liên kết
a50d62d5-8937-4a38-b948-8f2e96825277	t	2	2026-08-02 21:48:41.920689+07	2026-08-02 21:48:41.920693+07	87523654-b0f3-4720-ae50-071906f1b5dc	Chiến lược & triển khai
5c2c3833-5e62-4d9f-802d-44d2cd2f17ae	t	0	2026-08-02 21:48:41.922542+07	2026-08-02 21:48:41.922546+07	6d951fcc-d982-4c0f-bed4-c7ef63801f68	Nền tảng bằng chứng
5b442970-8320-4cc4-84e4-22a6d5599044	t	1	2026-08-02 21:48:41.923359+07	2026-08-02 21:48:41.923363+07	6d951fcc-d982-4c0f-bed4-c7ef63801f68	Kinh nghiệm thực hành
2c6e7dc0-6ef3-4454-b0b1-74cb64884576	t	2	2026-08-02 21:48:41.924176+07	2026-08-02 21:48:41.92418+07	6d951fcc-d982-4c0f-bed4-c7ef63801f68	Liên ngành (y tế, AI…)
9dac9790-63b5-4955-8a72-3aac46ccbac8	t	0	2026-08-02 21:48:41.926279+07	2026-08-02 21:48:41.926284+07	d8e8142d-bdbd-4351-8c0e-64bf46a1b53d	Chuyển hóa tri thức
643dab9e-c8c1-4e54-83aa-c6040b2494cb	t	1	2026-08-02 21:48:41.927127+07	2026-08-02 21:48:41.927131+07	d8e8142d-bdbd-4351-8c0e-64bf46a1b53d	Workshop & coaching
2c72aa47-4d84-4c32-aeac-12fc2bf3c95d	t	2	2026-08-02 21:48:41.927903+07	2026-08-02 21:48:41.927907+07	d8e8142d-bdbd-4351-8c0e-64bf46a1b53d	E-Learning & microlearning
6fec0d45-9374-4fc7-ba45-a4fff9a98931	t	0	2026-08-02 21:48:41.929664+07	2026-08-02 21:48:41.929668+07	889beaf7-739a-4086-baf2-381166902ef0	Kết nối học thuật
9759d153-1600-41ce-bc3c-445e3e46cd48	t	1	2026-08-02 21:48:41.930701+07	2026-08-02 21:48:41.930707+07	889beaf7-739a-4086-baf2-381166902ef0	Cập nhật tri thức mới
add936fe-9205-41e1-b7a7-7db1f28a97d5	t	2	2026-08-02 21:48:41.932039+07	2026-08-02 21:48:41.932046+07	889beaf7-739a-4086-baf2-381166902ef0	Hợp tác liên ngành
\.


--
-- TOC entry 6362 (class 0 OID 311841)
-- Dependencies: 238
-- Data for Name: about_aboutorgstructurecard; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutorgstructurecard (id, is_active, display_order, created_at, updated_at, section_id, icon, icon_image, color_theme, title, view_more_label, view_more_url) FROM stdin;
6d951fcc-d982-4c0f-bed4-c7ef63801f68	t	2	2026-08-02 21:48:41.921589+07	2026-08-02 22:04:44.73541+07	a33d33cb-157c-4550-b82a-cfd0b62a3a4a		about/org_structure/icons/cross_3.png	orange	Nhà khoa học & chuyên gia	Xem thêm	/chuyen-gia/
889beaf7-739a-4086-baf2-381166902ef0	t	4	2026-08-02 21:48:41.928779+07	2026-08-02 22:04:44.739189+07	a33d33cb-157c-4550-b82a-cfd0b62a3a4a		about/org_structure/icons/globe_5.png	purple	Hiệp hội & Mạng lưới chuyên môn	Xem thêm	/nang-luc/#hiep-hoi
87523654-b0f3-4720-ae50-071906f1b5dc	t	1	2026-08-02 21:48:41.918043+07	2026-08-02 22:08:50.551711+07	a33d33cb-157c-4550-b82a-cfd0b62a3a4a		about/org_structure/icons/building-2.png	blue	Cơ cấu tổ chức	Xem thêm	/nang-luc/
d8e8142d-bdbd-4351-8c0e-64bf46a1b53d	t	3	2026-08-02 21:48:41.925326+07	2026-08-02 22:08:50.552113+07	a33d33cb-157c-4550-b82a-cfd0b62a3a4a		about/org_structure/icons/graduation-cap.png	amber	Giảng viên & Chuyên gia học tập	Xem thêm	/nang-luc/
a95d5674-6c4d-402a-ab03-c22767c98167	t	0	2026-08-02 21:48:41.911018+07	2026-08-02 22:09:20.772069+07	a33d33cb-157c-4550-b82a-cfd0b62a3a4a		about/org_structure/icons/flask-round_1.png	navy	Hội đồng khoa học	Xem thêm	/nang-luc/
\.


--
-- TOC entry 6363 (class 0 OID 311859)
-- Dependencies: 239
-- Data for Name: about_aboutorgstructuresection; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutorgstructuresection (id, is_active, display_order, created_at, updated_at, section_label, title, description, primary_cta_label, primary_cta_url, secondary_cta_label, secondary_cta_url, background_image) FROM stdin;
a33d33cb-157c-4550-b82a-cfd0b62a3a4a	t	0	2026-08-02 21:48:41.908222+07	2026-08-02 22:08:50.551023+07	CẤU TRÚC	TỔ CHỨC VÀ MẠNG LƯỚI CHUYÊN MÔN	Viện IRDM vận hành theo mô hình kết nối chuyên môn linh hoạt. Mỗi bài toán được tiếp cận từ nhu cầu thực tế, sau đó IRDM huy động tổ hợp nhà khoa học, chuyên gia thực hành, giảng viên, cố vấn và nhóm triển khai phù hợp.	Tìm chuyên gia	/chuyen-gia/	Xem lĩnh vực chuyên môn	/nang-luc/	
\.


--
-- TOC entry 6364 (class 0 OID 311878)
-- Dependencies: 240
-- Data for Name: about_aboutpageseo; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutpageseo (id, is_active, display_order, created_at, updated_at, meta_title, meta_description, meta_keywords, og_title, og_description, og_image) FROM stdin;
d78c52a0-a823-48eb-accb-2675d4bd2880	t	0	2026-08-01 22:39:29.776594+07	2026-08-01 22:39:29.776606+07	Về IRDM — Viện Nghiên cứu Phát triển Liên ngành	Tìm hiểu về sứ mệnh, tầm nhìn, giá trị cốt lõi và đội ngũ của Viện Nghiên cứu & Phát triển Liên ngành (IRDM).	IRDM, viện nghiên cứu, phát triển liên ngành, về IRDM	Về IRDM — Viện Nghiên cứu Phát triển Liên ngành	Khám phá sứ mệnh, tầm nhìn và hệ sinh thái tri thức của IRDM.	
\.


--
-- TOC entry 6365 (class 0 OID 311895)
-- Dependencies: 241
-- Data for Name: about_aboutpartnerbenefit; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutpartnerbenefit (id, is_active, display_order, created_at, updated_at, icon, icon_image, title, description, section_id, color_theme, link_url) FROM stdin;
f78cd476-ff31-4307-aa9c-570e4a906b8e	t	0	2026-08-02 14:10:49.901872+07	2026-08-02 23:50:44.500414+07		about/benefits/icons/database-search_BrBHV1h.png	Vấn đề được làm rõ trước khi đề xuất giải pháp	Khảo sát, dữ liệu và thực tiễn được tổng hợp thành bằng chứng có thể sử dụng.	ff301a18-4464-49bd-ad62-cfae30c0b2a9	teal	
3aea4be1-447f-4a38-a8c6-1c8b3ca39d33	t	1	2026-08-02 14:10:49.902918+07	2026-08-02 23:50:44.501436+07		about/benefits/icons/pen-tool_8xINh3I.png	Dữ liệu, khảo sát và kinh nghiệm thực tiễn được tổ chức thành bằng chứng	Tổng hợp thông tin một cách có hệ thống để tạo nền tảng cho quyết định.	ff301a18-4464-49bd-ad62-cfae30c0b2a9	blue	
6bae3e22-4dc9-4ed3-8bec-59ad4b2071ba	t	2	2026-08-02 14:10:49.903774+07	2026-08-02 23:50:44.502217+07		about/benefits/icons/handshake_CLFwmvX.png	Giải pháp được đóng thiết kế theo bối cảnh vận hành	Phù hợp năng lực dữ liệu và năng lực con người của từng tổ chức.	ff301a18-4464-49bd-ad62-cfae30c0b2a9	orange	
812f62fe-f8f5-485a-91b3-1480e68fff56	t	3	2026-08-02 14:10:49.90463+07	2026-08-02 23:50:44.503342+07		about/benefits/icons/graduation-cap_dIqIt6F.png	Tổ hợp chuyên gia được huy động theo đúng bài toán	Thay vì theo danh sách chuyên môn có sẵn – IRDM tập hợp đúng người cho vấn đề.	ff301a18-4464-49bd-ad62-cfae30c0b2a9	blue	
f6fb2ec8-f79e-4115-823c-f790291e83dd	t	4	2026-08-02 14:10:49.905529+07	2026-08-02 23:50:44.504403+07		about/benefits/icons/users_2.png	Kết quả được theo dõi, đánh giá và chuyển hóa thành giá trị	Đánh giá tác động và chuyển hóa thành giá trị sử dụng trong thực tế.	ff301a18-4464-49bd-ad62-cfae30c0b2a9	blue	
0b2cb74e-ff03-4ceb-9a3e-33ba248d41eb	t	5	2026-08-02 14:10:49.906384+07	2026-08-02 23:50:44.505355+07		about/benefits/icons/lightbulb.png	Tư vấn chiến lược với góc nhìn thực tiễn	Đề xuất dựa trên dữ liệu và kinh nghiệm triển khai – giúp quyết định nhanh và chắc chắn.	ff301a18-4464-49bd-ad62-cfae30c0b2a9	amber	
29bb268c-ea32-4425-8e47-f3954869efe5	f	0	2026-08-01 22:39:29.832461+07	2026-08-02 14:28:23.518658+07		about/benefits/icons/database-search.png	Nghiên cứu chuyên sâu	Báo cáo và phân tích chuyên sâu dựa trên dữ liệu và phương pháp khoa học chuẩn mực.	ff301a18-4464-49bd-ad62-cfae30c0b2a9		
c72f5eff-359f-4902-a5b6-a4ee60ba7edd	f	1	2026-08-01 22:39:29.834238+07	2026-08-02 14:28:23.521107+07		about/benefits/icons/handshake.png	Mạng lưới chuyên gia	Kết nối với hơn 500 chuyên gia và nhà khoa học đầu ngành trên toàn quốc.	ff301a18-4464-49bd-ad62-cfae30c0b2a9		
eb3241b8-650d-485c-a440-7ce78601d558	f	2	2026-08-01 22:39:29.835556+07	2026-08-01 22:39:29.835562+07			Giải pháp tùy chỉnh	Thiết kế các giải pháp phù hợp với nhu cầu và bối cảnh đặc thù của từng đối tác.	ff301a18-4464-49bd-ad62-cfae30c0b2a9		
c1c44cdb-d752-43ef-9627-2e9ac51f3b25	f	3	2026-08-01 22:39:29.836634+07	2026-08-01 22:39:29.836639+07			Tác động đo lường được	Hệ thống theo dõi và đánh giá tác động minh bạch, rõ ràng và có thể kiểm chứng.	ff301a18-4464-49bd-ad62-cfae30c0b2a9		
\.


--
-- TOC entry 6366 (class 0 OID 311913)
-- Dependencies: 242
-- Data for Name: about_aboutpartnerbenefitsection; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutpartnerbenefitsection (id, is_active, display_order, created_at, updated_at, section_label, title, description, banner_badge, banner_quote, kpi_label, kpi_value, background_image) FROM stdin;
ff301a18-4464-49bd-ad62-cfae30c0b2a9	t	0	2026-08-01 22:39:29.829997+07	2026-08-02 23:50:44.497493+07	THÔNG TIN PHÁP LÝ	ĐỐI TÁC NHẬN ĐƯỢC GÌ KHI LÀM VIỆC VỚI IRDM?	Viện IRDM đồng hành với đối tác theo hướng thực tế, có căn cứ và có thể kiểm chứng. Thay vì đưa ra một giải pháp chung cho mọi tổ chức, IRDM giúp mỗi đơn vị xác định đúng vấn đề, lựa chọn cách tiếp cận phù hợp và chuẩn bị điều kiện triển khai.	GIÁ TRỊ ĐỐI TÁC	Hợp tác với IRDM giúp chúng tôi chuyển dữ liệu thành quyết định - với bằng chứng, lộ trình và năng lực thực thi.	KPI	6 giá trị cốt lõi	about/benefits/bg/Hinhnen_HopTacDuocLoiGi.png
\.


--
-- TOC entry 6367 (class 0 OID 311932)
-- Dependencies: 243
-- Data for Name: about_aboutprofessionalnetwork; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutprofessionalnetwork (id, is_active, display_order, created_at, updated_at, section_label, logo, name, description, link_url, link_label) FROM stdin;
d3d791ed-6b7e-4ed8-b74a-7c5ee715bded	t	0	2026-08-01 22:39:29.84136+07	2026-08-01 22:39:29.841367+07			Đại học Quốc gia Hà Nội		/	
9a3ca189-c75b-4b1f-9164-9edc48264d7b	t	1	2026-08-01 22:39:29.842605+07	2026-08-01 22:39:29.842609+07			Đại học Quốc gia TP.HCM		/	
3bf26ed0-a9d3-4989-b051-d2a6ce28fe63	t	2	2026-08-01 22:39:29.843264+07	2026-08-01 22:39:29.843267+07			Viện Hàn lâm KH&CN Việt Nam		/	
2c18ba0e-e23c-4256-a276-6c81932063f0	t	3	2026-08-01 22:39:29.843865+07	2026-08-01 22:39:29.843868+07			Bộ Khoa học & Công nghệ		/	
b0a9de1a-658c-458f-8c62-6424a303810b	t	4	2026-08-01 22:39:29.844468+07	2026-08-01 22:39:29.844472+07			UNDP Việt Nam		/	
f488fa10-f33e-4398-b769-073302b80af5	t	5	2026-08-01 22:39:29.845079+07	2026-08-01 22:39:29.845082+07			World Bank Vietnam		/	
1e5c9aa7-f738-453e-8495-8789a8e5de64	t	6	2026-08-01 22:39:29.845677+07	2026-08-01 22:39:29.84568+07			ADB		/	
d57c7287-ef0c-4f4f-8ca6-f55c040ddd7e	t	7	2026-08-01 22:39:29.846249+07	2026-08-01 22:39:29.846253+07			NUS Singapore		/	
\.


--
-- TOC entry 6368 (class 0 OID 311949)
-- Dependencies: 244
-- Data for Name: about_aboutpurpose; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutpurpose (id, is_active, display_order, created_at, updated_at, section_label, title, highlight_box_text, description, diagram_image, diagram_alt, background_image, diagram_caption, diagram_title, quote_body, quote_icon) FROM stdin;
854d259f-9009-4c62-9586-c0b48993357e	t	0	2026-08-02 00:19:00.284657+07	2026-08-02 10:19:55.802671+07	LÝ DO TỒN TẠI	VÌ SAO IRDM TỒN TẠI?	"IRDM tin rằng mọi chuyển đổi bền vững đều bắt đầu từ con người."	IRDM tồn tại để kết nối nghiên cứu, dữ liệu, công nghệ và phát triển con người trong việc giải quyết những vấn đề thực tiễn ngày càng phức hợp của tổ chức và xã hội.\r\n\r\nNhiều tổ chức đã có dữ liệu, kinh nghiệm và nhu cầu đổi mới, nhưng chưa dễ chuyển hóa thành bằng chứng, quyết định hoặc chương trình hành động rõ ràng. Nhiều sáng kiến về công nghệ, AI, đào tạo, wellbeing hoặc phát triển bền vững có ý tưởng tốt, nhưng cần được thiết kế sát hơn với bối cảnh vận hành, năng lực dữ liệu, năng lực con người và khả năng duy trì sau giai đoạn dự án.	about/purpose/3_ThanhTo.png			Ba thành tố này giao thoa để tạo ra giá trị bền vững.	3 Thành tố kết nối	Công nghệ, dữ liệu hay mô hình quản trị chỉ tạo ra tác động khi con người có đủ năng lực để hiểu, sử dụng, thích ứng và chuyển hóa chúng thành hành động.	about/purpose/icons/quote.png
\.


--
-- TOC entry 6369 (class 0 OID 311971)
-- Dependencies: 245
-- Data for Name: about_abouttargetaudience; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_abouttargetaudience (id, is_active, display_order, created_at, updated_at, icon, icon_image, image, title, description, cta_label, cta_url, section_id) FROM stdin;
d93d4b30-82b6-42ef-a564-7c9d94d51890	t	0	2026-08-02 22:33:53.776949+07	2026-08-02 22:38:36.749307+07		about/audience/icons/DongHanh_1.png		Cơ quan quản lý	Củng cố căn cứ khoa học, dữ liệu và cơ chế phối hợp cho chương trình, đề án và nhiệm vụ KHCN&ĐMST.	Xem giải pháp	/giai-phap/	8ad2e13a-afda-4a41-bc4c-c9f044838025
ce3008f3-7217-480f-95a1-cea55dae79a0	t	1	2026-08-02 22:33:53.778378+07	2026-08-02 22:38:36.751052+07		about/audience/icons/cross_3.png		Hệ thống y tế	Làm rõ bài toán ưu tiên, dữ liệu sẵn có và lộ trình thí điểm để hỗ trợ quản trị, chất lượng dịch vụ và đổi mới hệ thống.	Xem giải pháp	/giai-phap/	8ad2e13a-afda-4a41-bc4c-c9f044838025
d3133d39-762d-48ab-ae7f-541d34336da7	t	2	2026-08-02 22:33:53.77928+07	2026-08-02 22:38:36.751996+07		about/audience/icons/graduation-cap.png		Trường đại học	Hỗ trợ đổi mới chương trình, phát triển người học, khai thác dữ liệu giáo dục và xây dựng môi trường học thuật lành mạnh.	Xem giải pháp	/giai-phap/	8ad2e13a-afda-4a41-bc4c-c9f044838025
42019027-325b-446e-8886-75db78c37cac	t	3	2026-08-02 22:33:53.780202+07	2026-08-02 22:38:36.7528+07		about/audience/icons/building-2.png		Doanh nghiệp	Thiết kế sáng kiến phát triển con người, wellbeing và trách nhiệm xã hội gắn với mục tiêu tổ chức.	Xem giải pháp	/giai-phap/	8ad2e13a-afda-4a41-bc4c-c9f044838025
da3194d8-0e2a-4073-a9ae-c950aa28941b	t	4	2026-08-02 22:33:53.78098+07	2026-08-02 22:38:36.75359+07		about/audience/icons/globe_5.png		Tổ chức quốc tế	Kết nối tri thức quốc tế với bối cảnh Việt Nam để thiết kế, triển khai và đánh giá các sáng kiến liên ngành có khả năng duy trì.	Xem giải pháp	/giai-phap/	8ad2e13a-afda-4a41-bc4c-c9f044838025
\.


--
-- TOC entry 6370 (class 0 OID 311990)
-- Dependencies: 246
-- Data for Name: about_abouttargetaudiencesection; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_abouttargetaudiencesection (id, is_active, display_order, created_at, updated_at, section_label, title, description, cta_label, cta_url, background_color, background_image) FROM stdin;
8ad2e13a-afda-4a41-bc4c-c9f044838025	t	0	2026-08-02 22:33:53.767544+07	2026-08-02 22:38:36.748527+07	ĐỐI TÁC HỢP TÁC	IRDM ĐỒNG HÀNH VỚI NHỮNG AI?	Viện IRDM vận hành theo mô hình kết nối chuyên môn linh hoạt. Mỗi bài toán được tiếp cận từ nhu cầu thực tế, sau đó IRDM huy động tổ hợp nhà khoa học, chuyên gia thực hành, giảng viên, cố vấn và nhóm triển khai phù hợp.	Khám phá giải pháp	/giai-phap/	#0b3d6b	
\.


--
-- TOC entry 6371 (class 0 OID 312008)
-- Dependencies: 247
-- Data for Name: about_aboutvisionmission; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutvisionmission (id, is_active, display_order, created_at, updated_at, section_label, title, description, bottom_panel_text, bottom_panel_description, bottom_panel_title) FROM stdin;
b07dcc08-76e9-4243-9ed5-740590fa1e95	t	0	2026-08-02 10:34:19.457024+07	2026-08-02 23:50:44.467749+07	NỀN TẢNG CHIẾN LƯỢC	TẦM NHÌN - SỨ MỆNH - TRIẾT LÝ PHÁT TRIỂN	Ba trụ cột định hướng mọi hoạt động của IRDM		Mọi hoạt động của IRDM hướng đến những thay đổi bền vững, có thể quan sát được ở cấp độ tổ chức và hệ thống.	Định hướng giá trị
\.


--
-- TOC entry 6372 (class 0 OID 312025)
-- Dependencies: 248
-- Data for Name: about_aboutvisionmissioncard; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutvisionmissioncard (id, is_active, display_order, created_at, updated_at, card_type, icon, icon_image, title, body, bg_color, section_id, highlight_label) FROM stdin;
8c38e8d2-e46e-4b68-990f-639fbe909c56	t	0	2026-08-02 10:34:19.459314+07	2026-08-02 23:50:44.470758+07	vision		about/vision/icons/icon_tamnhin.png	Tầm nhìn	Trở thành tổ chức khoa học, công nghệ và đổi mới sáng tạo định hướng ứng dụng có năng lực kết nối tri thức liên ngành, dữ liệu, công nghệ và phát triển con người; góp phần kiến tạo nguồn lực bền vững và các mô hình phát triển có tác động cho Việt Nam.	bg-primary-900	b07dcc08-76e9-4243-9ed5-740590fa1e95	Định hướng tương lai
0c2582a8-b05f-4b6d-ae48-8356793193fe	t	1	2026-08-02 10:34:19.460354+07	2026-08-02 23:50:44.471977+07	mission		about/vision/icons/compass.png	Sứ mệnh	Đồng hành cùng các tổ chức trong việc chuyển hóa vấn đề thực tiễn thành bằng chứng, chương trình, công cụ, mô hình thí điểm và giải pháp có thể triển khai; qua đó nâng cao năng lực con người, cải thiện vận hành tổ chức và thúc đẩy phát triển bền vững.	bg-primary-900	b07dcc08-76e9-4243-9ed5-740590fa1e95	Hướng dẫn hành động
2ae6fad6-e340-4fd9-8cff-916ff3d07842	t	2	2026-08-02 10:34:19.461692+07	2026-08-02 23:50:44.472743+07	philosophy		about/vision/icons/diamond.png	Triết lý phát triển	Định hình giá trị cốt lõi - Chuyển hóa hành vi - Khai phóng tiềm năng con người.	bg-primary-900	b07dcc08-76e9-4243-9ed5-740590fa1e95	Giá trị cốt lõi
\.


--
-- TOC entry 6373 (class 0 OID 312044)
-- Dependencies: 249
-- Data for Name: about_aboutvisionmissionicon; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.about_aboutvisionmissionicon (id, is_active, display_order, created_at, updated_at, icon_image, icon_alt, section_id) FROM stdin;
8f28369b-72fe-4bfa-bc06-7f70e736906a	t	0	2026-08-02 10:42:19.474013+07	2026-08-02 10:42:19.474025+07	about/vision/panel_icons/target.png		b07dcc08-76e9-4243-9ed5-740590fa1e95
885477ae-cf72-496a-9856-1885ef1d746c	t	0	2026-08-02 10:45:31.518203+07	2026-08-02 10:45:31.518211+07	about/vision/panel_icons/layers_sumenh_2.png		b07dcc08-76e9-4243-9ed5-740590fa1e95
435e3b6c-175f-4094-9dc2-c5d4849149c9	t	0	2026-08-02 10:45:31.519523+07	2026-08-02 10:45:31.519532+07	about/vision/panel_icons/users.png		b07dcc08-76e9-4243-9ed5-740590fa1e95
30f0b783-05ec-4a9b-8a4e-ab28532f6e48	t	0	2026-08-02 10:45:31.5205+07	2026-08-02 10:45:31.520506+07	about/vision/panel_icons/sumenh_4.png		b07dcc08-76e9-4243-9ed5-740590fa1e95
\.


--
-- TOC entry 6374 (class 0 OID 312056)
-- Dependencies: 250
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 6376 (class 0 OID 312062)
-- Dependencies: 252
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 6378 (class 0 OID 312069)
-- Dependencies: 254
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add site settings	7	add_sitesettings
26	Can change site settings	7	change_sitesettings
27	Can delete site settings	7	delete_sitesettings
28	Can view site settings	7	view_sitesettings
29	Can add footer link	8	add_footerlink
30	Can change footer link	8	change_footerlink
31	Can delete footer link	8	delete_footerlink
32	Can view footer link	8	view_footerlink
33	Can add footer section	9	add_footersection
34	Can change footer section	9	change_footersection
35	Can delete footer section	9	delete_footersection
36	Can view footer section	9	view_footersection
37	Can add menu item	10	add_menuitem
38	Can change menu item	10	change_menuitem
39	Can delete menu item	10	delete_menuitem
40	Can view menu item	10	view_menuitem
41	Can add featured section config	11	add_featuredsectionconfig
42	Can change featured section config	11	change_featuredsectionconfig
43	Can delete featured section config	11	delete_featuredsectionconfig
44	Can view featured section config	11	view_featuredsectionconfig
45	Can add hero section	12	add_herosection
46	Can change hero section	12	change_herosection
47	Can delete hero section	12	delete_herosection
48	Can view hero section	12	view_herosection
49	Can add partner logo	13	add_partnerlogo
50	Can change partner logo	13	change_partnerlogo
51	Can delete partner logo	13	delete_partnerlogo
52	Can view partner logo	13	view_partnerlogo
53	Can add statistic item	14	add_statisticitem
54	Can change statistic item	14	change_statisticitem
55	Can delete statistic item	14	delete_statisticitem
56	Can view statistic item	14	view_statisticitem
57	Can add audience section header	15	add_audiencesectionheader
58	Can change audience section header	15	change_audiencesectionheader
59	Can delete audience section header	15	delete_audiencesectionheader
60	Can view audience section header	15	view_audiencesectionheader
61	Can add audience segment	16	add_audiencesegment
62	Can change audience segment	16	change_audiencesegment
63	Can delete audience segment	16	delete_audiencesegment
64	Can view audience segment	16	view_audiencesegment
65	Can add capabilities section header	17	add_capabilitiessectionheader
66	Can change capabilities section header	17	change_capabilitiessectionheader
67	Can delete capabilities section header	17	delete_capabilitiessectionheader
68	Can view capabilities section header	17	view_capabilitiessectionheader
69	Can add core capability	18	add_corecapability
70	Can change core capability	18	change_corecapability
71	Can delete core capability	18	delete_corecapability
72	Can view core capability	18	view_corecapability
73	Can add CTA banner	19	add_ctabanner
74	Can change CTA banner	19	change_ctabanner
75	Can delete CTA banner	19	delete_ctabanner
76	Can view CTA banner	19	view_ctabanner
77	Can add evidence section header	20	add_evidencesectionheader
78	Can change evidence section header	20	change_evidencesectionheader
79	Can delete evidence section header	20	delete_evidencesectionheader
80	Can view evidence section header	20	view_evidencesectionheader
81	Can add knowledge category	21	add_knowledgecategory
82	Can change knowledge category	21	change_knowledgecategory
83	Can delete knowledge category	21	delete_knowledgecategory
84	Can view knowledge category	21	view_knowledgecategory
85	Can add knowledge section header	22	add_knowledgesectionheader
86	Can change knowledge section header	22	change_knowledgesectionheader
87	Can delete knowledge section header	22	delete_knowledgesectionheader
88	Can view knowledge section header	22	view_knowledgesectionheader
89	Can add methodology section header	23	add_methodologysectionheader
90	Can change methodology section header	23	change_methodologysectionheader
91	Can delete methodology section header	23	delete_methodologysectionheader
92	Can view methodology section header	23	view_methodologysectionheader
93	Can add methodology step	24	add_methodologystep
94	Can change methodology step	24	change_methodologystep
95	Can delete methodology step	24	delete_methodologystep
96	Can view methodology step	24	view_methodologystep
97	Can add philosophy principle	25	add_philosophyprinciple
98	Can change philosophy principle	25	change_philosophyprinciple
99	Can delete philosophy principle	25	delete_philosophyprinciple
100	Can view philosophy principle	25	view_philosophyprinciple
101	Can add philosophy section header	26	add_philosophysectionheader
102	Can change philosophy section header	26	change_philosophysectionheader
103	Can delete philosophy section header	26	delete_philosophysectionheader
104	Can view philosophy section header	26	view_philosophysectionheader
105	Can add audience tag	27	add_audiencetag
106	Can change audience tag	27	change_audiencetag
107	Can delete audience tag	27	delete_audiencetag
108	Can view audience tag	27	view_audiencetag
109	Can add hero pill tag	28	add_heropilltag
110	Can change hero pill tag	28	change_heropilltag
111	Can delete hero pill tag	28	delete_heropilltag
112	Can view hero pill tag	28	view_heropilltag
113	Can add capability listing page	29	add_capabilitylistingpage
114	Can change capability listing page	29	change_capabilitylistingpage
115	Can delete capability listing page	29	delete_capabilitylistingpage
116	Can view capability listing page	29	view_capabilitylistingpage
117	Can add capability output	30	add_capabilityoutput
118	Can change capability output	30	change_capabilityoutput
119	Can delete capability output	30	delete_capabilityoutput
120	Can view capability output	30	view_capabilityoutput
121	Can add capability	31	add_capability
122	Can change capability	31	change_capability
123	Can delete capability	31	delete_capability
124	Can view capability	31	view_capability
125	Can add capability feature	32	add_capabilityfeature
126	Can change capability feature	32	change_capabilityfeature
127	Can delete capability feature	32	delete_capabilityfeature
128	Can view capability feature	32	view_capabilityfeature
129	Can add case study tag	33	add_capabilitycasestudytag
130	Can change case study tag	33	change_capabilitycasestudytag
131	Can delete case study tag	33	delete_capabilitycasestudytag
132	Can view case study tag	33	view_capabilitycasestudytag
133	Can add capability case study	34	add_capabilitycasestudy
134	Can change capability case study	34	change_capabilitycasestudy
135	Can delete capability case study	34	delete_capabilitycasestudy
136	Can view capability case study	34	view_capabilitycasestudy
137	Can add capability need item	35	add_capabilityneeditem
138	Can change capability need item	35	change_capabilityneeditem
139	Can delete capability need item	35	delete_capabilityneeditem
140	Can view capability need item	35	view_capabilityneeditem
141	Can add capability how step	36	add_capabilityhowstep
142	Can change capability how step	36	change_capabilityhowstep
143	Can delete capability how step	36	delete_capabilityhowstep
144	Can view capability how step	36	view_capabilityhowstep
145	Can add solution approach step	37	add_solutionapproachstep
146	Can change solution approach step	37	change_solutionapproachstep
147	Can delete solution approach step	37	delete_solutionapproachstep
148	Can view solution approach step	37	view_solutionapproachstep
149	Can add solution listing page	38	add_solutionlistingpage
150	Can change solution listing page	38	change_solutionlistingpage
151	Can delete solution listing page	38	delete_solutionlistingpage
152	Can view solution listing page	38	view_solutionlistingpage
153	Can add solution	39	add_solution
154	Can change solution	39	change_solution
155	Can delete solution	39	delete_solution
156	Can view solution	39	view_solution
157	Can add solution challenge	40	add_solutionchallenge
158	Can change solution challenge	40	change_solutionchallenge
159	Can delete solution challenge	40	delete_solutionchallenge
160	Can view solution challenge	40	view_solutionchallenge
161	Can add solution output	41	add_solutionoutput
162	Can change solution output	41	change_solutionoutput
163	Can delete solution output	41	delete_solutionoutput
164	Can view solution output	41	view_solutionoutput
165	Can add solution feature	42	add_solutionfeature
166	Can change solution feature	42	change_solutionfeature
167	Can delete solution feature	42	delete_solutionfeature
168	Can view solution feature	42	view_solutionfeature
169	Can add solution methodology step	43	add_solutionmethodologystep
170	Can change solution methodology step	43	change_solutionmethodologystep
171	Can delete solution methodology step	43	delete_solutionmethodologystep
172	Can view solution methodology step	43	view_solutionmethodologystep
173	Can add knowledge category	44	add_knowledgecategory
174	Can change knowledge category	44	change_knowledgecategory
175	Can delete knowledge category	44	delete_knowledgecategory
176	Can view knowledge category	44	view_knowledgecategory
177	Can add knowledge listing page	45	add_knowledgelistingpage
178	Can change knowledge listing page	45	change_knowledgelistingpage
179	Can delete knowledge listing page	45	delete_knowledgelistingpage
180	Can view knowledge listing page	45	view_knowledgelistingpage
181	Can add knowledge topic	46	add_knowledgetopic
182	Can change knowledge topic	46	change_knowledgetopic
183	Can delete knowledge topic	46	delete_knowledgetopic
184	Can view knowledge topic	46	view_knowledgetopic
185	Can add knowledge article	47	add_knowledgearticle
186	Can change knowledge article	47	change_knowledgearticle
187	Can delete knowledge article	47	delete_knowledgearticle
188	Can view knowledge article	47	view_knowledgearticle
189	Can add knowledge download	48	add_knowledgedownload
190	Can change knowledge download	48	change_knowledgedownload
191	Can delete knowledge download	48	delete_knowledgedownload
192	Can view knowledge download	48	view_knowledgedownload
193	Can add knowledge news item	49	add_knowledgenewsitem
194	Can change knowledge news item	49	change_knowledgenewsitem
195	Can delete knowledge news item	49	delete_knowledgenewsitem
196	Can view knowledge news item	49	view_knowledgenewsitem
197	Can add featured article	50	add_knowledgefeaturedarticle
198	Can change featured article	50	change_knowledgefeaturedarticle
199	Can delete featured article	50	delete_knowledgefeaturedarticle
200	Can view featured article	50	view_knowledgefeaturedarticle
201	Can add filter group	51	add_knowledgefiltergroup
202	Can change filter group	51	change_knowledgefiltergroup
203	Can delete filter group	51	delete_knowledgefiltergroup
204	Can view filter group	51	view_knowledgefiltergroup
205	Can add filter item	52	add_knowledgefilteritem
206	Can change filter item	52	change_knowledgefilteritem
207	Can delete filter item	52	delete_knowledgefilteritem
208	Can view filter item	52	view_knowledgefilteritem
209	Can add content type card	53	add_knowledgecontenttypecard
210	Can change content type card	53	change_knowledgecontenttypecard
211	Can delete content type card	53	delete_knowledgecontenttypecard
212	Can view content type card	53	view_knowledgecontenttypecard
213	Can add topic card tag	54	add_knowledgetopiccardtag
214	Can change topic card tag	54	change_knowledgetopiccardtag
215	Can delete topic card tag	54	delete_knowledgetopiccardtag
216	Can view topic card tag	54	view_knowledgetopiccardtag
217	Can add topic card	55	add_knowledgetopiccard
218	Can change topic card	55	change_knowledgetopiccard
219	Can delete topic card	55	delete_knowledgetopiccard
220	Can view topic card	55	view_knowledgetopiccard
221	Can add download request	56	add_knowledgedownloadrequest
222	Can change download request	56	change_knowledgedownloadrequest
223	Can delete download request	56	delete_knowledgedownloadrequest
224	Can view download request	56	view_knowledgedownloadrequest
225	Can add accordion item	57	add_knowledgeaccordionitem
226	Can change accordion item	57	change_knowledgeaccordionitem
227	Can delete accordion item	57	delete_knowledgeaccordionitem
228	Can view accordion item	57	view_knowledgeaccordionitem
229	Can add event tag	58	add_knowledgeeventtag
230	Can change event tag	58	change_knowledgeeventtag
231	Can delete event tag	58	delete_knowledgeeventtag
232	Can view event tag	58	view_knowledgeeventtag
233	Can add activity news item	59	add_knowledgeactivitynews
234	Can change activity news item	59	change_knowledgeactivitynews
235	Can delete activity news item	59	delete_knowledgeactivitynews
236	Can view activity news item	59	view_knowledgeactivitynews
237	Can add knowledge event	60	add_knowledgeevent
238	Can change knowledge event	60	change_knowledgeevent
239	Can delete knowledge event	60	delete_knowledgeevent
240	Can view knowledge event	60	view_knowledgeevent
245	Can add expert listing page	62	add_expertlistingpage
246	Can change expert listing page	62	change_expertlistingpage
247	Can delete expert listing page	62	delete_expertlistingpage
248	Can view expert listing page	62	view_expertlistingpage
249	Can add process step	63	add_processstep
250	Can change process step	63	change_processstep
251	Can delete process step	63	delete_processstep
252	Can view process step	63	view_processstep
253	Can add expert	64	add_expert
254	Can change expert	64	change_expert
255	Can delete expert	64	delete_expert
256	Can view expert	64	view_expert
257	Can add expert group	65	add_expertgroup
258	Can change expert group	65	change_expertgroup
259	Can delete expert group	65	delete_expertgroup
260	Can view expert group	65	view_expertgroup
261	Can add research area	66	add_researcharea
262	Can change research area	66	change_researcharea
263	Can delete research area	66	delete_researcharea
264	Can view research area	66	view_researcharea
265	Can add knowledge topic	67	add_knowledgetopic
266	Can change knowledge topic	67	change_knowledgetopic
267	Can delete knowledge topic	67	delete_knowledgetopic
268	Can view knowledge topic	67	view_knowledgetopic
269	Can add CTA button	68	add_knowledgectabutton
270	Can change CTA button	68	change_knowledgectabutton
271	Can delete CTA button	68	delete_knowledgectabutton
272	Can view CTA button	68	view_knowledgectabutton
273	Can add engagement type	69	add_engagementtype
274	Can change engagement type	69	change_engagementtype
275	Can delete engagement type	69	delete_engagementtype
276	Can view engagement type	69	view_engagementtype
277	Can add org unit	70	add_orgunit
278	Can change org unit	70	change_orgunit
279	Can delete org unit	70	delete_orgunit
280	Can view org unit	70	view_orgunit
281	Can add info group	71	add_infogroup
282	Can change info group	71	change_infogroup
283	Can delete info group	71	delete_infogroup
284	Can view info group	71	view_infogroup
285	Can add info group block	72	add_infogroupblock
286	Can change info group block	72	change_infogroupblock
287	Can delete info group block	72	delete_infogroupblock
288	Can view info group block	72	view_infogroupblock
289	Can add org node	73	add_orgnode
290	Can change org node	73	change_orgnode
291	Can delete org node	73	delete_orgnode
292	Can view org node	73	view_orgnode
293	Can add info group member	74	add_infogroupmember
294	Can change info group member	74	change_infogroupmember
295	Can delete info group member	74	delete_infogroupmember
296	Can view info group member	74	view_infogroupmember
297	Can add association	75	add_association
298	Can change association	75	change_association
299	Can delete association	75	delete_association
300	Can view association	75	view_association
301	Can add contact banner	76	add_aboutcontactbanner
302	Can change contact banner	76	change_aboutcontactbanner
303	Can delete contact banner	76	delete_aboutcontactbanner
304	Can view contact banner	76	view_aboutcontactbanner
305	Can add core value	77	add_aboutcorevalue
306	Can change core value	77	change_aboutcorevalue
307	Can delete core value	77	delete_aboutcorevalue
308	Can view core value	77	view_aboutcorevalue
309	Can add core values section	78	add_aboutcorevaluesection
310	Can change core values section	78	change_aboutcorevaluesection
311	Can delete core values section	78	delete_aboutcorevaluesection
312	Can view core values section	78	view_aboutcorevaluesection
313	Can add CTA banner	79	add_aboutctabanner
314	Can change CTA banner	79	change_aboutctabanner
315	Can delete CTA banner	79	delete_aboutctabanner
316	Can view CTA banner	79	view_aboutctabanner
317	Can add network section header	80	add_aboutnetworksectionheader
318	Can change network section header	80	change_aboutnetworksectionheader
319	Can delete network section header	80	delete_aboutnetworksectionheader
320	Can view network section header	80	view_aboutnetworksectionheader
321	Can add About Page SEO	81	add_aboutpageseo
322	Can change About Page SEO	81	change_aboutpageseo
323	Can delete About Page SEO	81	delete_aboutpageseo
324	Can view About Page SEO	81	view_aboutpageseo
325	Can add professional network	82	add_aboutprofessionalnetwork
326	Can change professional network	82	change_aboutprofessionalnetwork
327	Can delete professional network	82	delete_aboutprofessionalnetwork
328	Can view professional network	82	view_aboutprofessionalnetwork
329	Can add purpose section	83	add_aboutpurpose
330	Can change purpose section	83	change_aboutpurpose
331	Can delete purpose section	83	delete_aboutpurpose
332	Can view purpose section	83	view_aboutpurpose
333	Can add capability & ecosystem section	84	add_aboutcapabilityecosystem
334	Can change capability & ecosystem section	84	change_aboutcapabilityecosystem
335	Can delete capability & ecosystem section	84	delete_aboutcapabilityecosystem
336	Can view capability & ecosystem section	84	view_aboutcapabilityecosystem
337	Can add ecosystem partner group	85	add_aboutecosystempartnergroup
338	Can change ecosystem partner group	85	change_aboutecosystempartnergroup
339	Can delete ecosystem partner group	85	delete_aboutecosystempartnergroup
340	Can view ecosystem partner group	85	view_aboutecosystempartnergroup
341	Can add ecosystem partner item	86	add_aboutecosystempartneritem
342	Can change ecosystem partner item	86	change_aboutecosystempartneritem
343	Can delete ecosystem partner item	86	delete_aboutecosystempartneritem
344	Can view ecosystem partner item	86	view_aboutecosystempartneritem
345	Can add ecosystem statistic	87	add_aboutecosystemstatistic
346	Can change ecosystem statistic	87	change_aboutecosystemstatistic
347	Can delete ecosystem statistic	87	delete_aboutecosystemstatistic
348	Can view ecosystem statistic	87	view_aboutecosystemstatistic
349	Can add hero banner	88	add_abouthero
350	Can change hero banner	88	change_abouthero
351	Can delete hero banner	88	delete_abouthero
352	Can view hero banner	88	view_abouthero
353	Can add hero statistic	89	add_aboutherostatistic
354	Can change hero statistic	89	change_aboutherostatistic
355	Can delete hero statistic	89	delete_aboutherostatistic
356	Can view hero statistic	89	view_aboutherostatistic
357	Can add highlight card	90	add_abouthighlightcard
358	Can change highlight card	90	change_abouthighlightcard
359	Can delete highlight card	90	delete_abouthighlightcard
360	Can view highlight card	90	view_abouthighlightcard
361	Can add introduction section	91	add_aboutintroduction
362	Can change introduction section	91	change_aboutintroduction
363	Can delete introduction section	91	delete_aboutintroduction
364	Can view introduction section	91	view_aboutintroduction
365	Can add legal foundation section	92	add_aboutlegalinfo
366	Can change legal foundation section	92	change_aboutlegalinfo
367	Can delete legal foundation section	92	delete_aboutlegalinfo
368	Can view legal foundation section	92	view_aboutlegalinfo
369	Can add legal timeline item	93	add_aboutlegaltimelineitem
370	Can change legal timeline item	93	change_aboutlegaltimelineitem
371	Can delete legal timeline item	93	delete_aboutlegaltimelineitem
372	Can view legal timeline item	93	view_aboutlegaltimelineitem
373	Can add partner benefit	94	add_aboutpartnerbenefit
374	Can change partner benefit	94	change_aboutpartnerbenefit
375	Can delete partner benefit	94	delete_aboutpartnerbenefit
376	Can view partner benefit	94	view_aboutpartnerbenefit
377	Can add partner benefit section	95	add_aboutpartnerbenefitsection
378	Can change partner benefit section	95	change_aboutpartnerbenefitsection
379	Can delete partner benefit section	95	delete_aboutpartnerbenefitsection
380	Can view partner benefit section	95	view_aboutpartnerbenefitsection
381	Can add target audience	96	add_abouttargetaudience
382	Can change target audience	96	change_abouttargetaudience
383	Can delete target audience	96	delete_abouttargetaudience
384	Can view target audience	96	view_abouttargetaudience
385	Can add target audience section	97	add_abouttargetaudiencesection
386	Can change target audience section	97	change_abouttargetaudiencesection
387	Can delete target audience section	97	delete_abouttargetaudiencesection
388	Can view target audience section	97	view_abouttargetaudiencesection
389	Can add vision/mission card	98	add_aboutvisionmissioncard
390	Can change vision/mission card	98	change_aboutvisionmissioncard
391	Can delete vision/mission card	98	delete_aboutvisionmissioncard
392	Can view vision/mission card	98	view_aboutvisionmissioncard
393	Can add vision & mission section	99	add_aboutvisionmission
394	Can change vision & mission section	99	change_aboutvisionmission
395	Can delete vision & mission section	99	delete_aboutvisionmission
396	Can view vision & mission section	99	view_aboutvisionmission
397	Can add vision/mission panel icon	100	add_aboutvisionmissionicon
398	Can change vision/mission panel icon	100	change_aboutvisionmissionicon
399	Can delete vision/mission panel icon	100	delete_aboutvisionmissionicon
400	Can view vision/mission panel icon	100	view_aboutvisionmissionicon
401	Can add org badge	101	add_aboutlegalbadge
402	Can change org badge	101	change_aboutlegalbadge
403	Can delete org badge	101	delete_aboutlegalbadge
404	Can view org badge	101	view_aboutlegalbadge
405	Can add org attribute	102	add_aboutlegalorgattribute
406	Can change org attribute	102	change_aboutlegalorgattribute
407	Can delete org attribute	102	delete_aboutlegalorgattribute
408	Can view org attribute	102	view_aboutlegalorgattribute
409	Can add org structure card	103	add_aboutorgstructurecard
410	Can change org structure card	103	change_aboutorgstructurecard
411	Can delete org structure card	103	delete_aboutorgstructurecard
412	Can view org structure card	103	view_aboutorgstructurecard
413	Can add org structure section	104	add_aboutorgstructuresection
414	Can change org structure section	104	change_aboutorgstructuresection
415	Can delete org structure section	104	delete_aboutorgstructuresection
416	Can view org structure section	104	view_aboutorgstructuresection
417	Can add org structure bullet item	105	add_aboutorgstructurebulletitem
418	Can change org structure bullet item	105	change_aboutorgstructurebulletitem
419	Can delete org structure bullet item	105	delete_aboutorgstructurebulletitem
420	Can view org structure bullet item	105	view_aboutorgstructurebulletitem
421	Can add contact banner stat	106	add_aboutcontactbannerstat
422	Can change contact banner stat	106	change_aboutcontactbannerstat
423	Can delete contact banner stat	106	delete_aboutcontactbannerstat
424	Can view contact banner stat	106	view_aboutcontactbannerstat
425	Can add contact request	107	add_contactrequest
426	Can change contact request	107	change_contactrequest
427	Can delete contact request	107	delete_contactrequest
428	Can view contact request	107	view_contactrequest
\.


--
-- TOC entry 6380 (class 0 OID 312077)
-- Dependencies: 256
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$1000000$a558al4x3g4iBdJfyfjtpp$QfsH1eBfHDrVgsytW4KPbC6aTDBR3HO8zN2M96ZnA1s=	2026-08-09 23:40:51.269671+07	t	admin			admin@gmail.com	t	t	2026-07-02 21:42:09.329047+07
\.


--
-- TOC entry 6381 (class 0 OID 312092)
-- Dependencies: 257
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 6384 (class 0 OID 312100)
-- Dependencies: 260
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 6386 (class 0 OID 312107)
-- Dependencies: 262
-- Data for Name: capability_capability; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.capability_capability (id, is_active, display_order, created_at, updated_at, title, slug, summary, thumbnail, hero_image, section_label, description, what_is_label, what_is_description, need_section_label, how_label, output_label, cta_primary_label, cta_primary_url, cta_secondary_label, cta_secondary_url, is_published, meta_title, meta_description, meta_keywords, card_icon, need_section_intro, what_is_image, icon_name) FROM stdin;
5ab16d24-513c-49d2-b2d8-4e63575d6ca5	t	4	2026-07-04 22:17:18.703826+07	2026-07-18 09:23:58.570851+07	Sức khỏe tâm thần & wellbeing	suc-khoe-tam-than-va-wellbeing	Phát triển các sáng kiến phòng ngừa, nâng đỡ tâm lý - xã hội, năng lực phục hồi và môi trường học tập - làm việc lành mạnh.	capability/thumbnails/Homepage_SucKhoe_TamThan.png		Nền tảng chuyên môn	Phát triển các sáng kiến phòng ngừa, nâng đỡ tâm lý - xã hội, năng lực phục hồi và môi trường học tập - làm việc lành mạnh.	Năng lực này là gì?	Đây là năng lực giúp tổ chức xây dựng môi trường học tập và làm việc hỗ trợ sức khỏe tâm thần, thông qua các chương trình phòng ngừa, can thiệp sớm và nâng cao năng lực phục hồi cho cá nhân và tập thể.	Khi nào tổ chức cần năng lực này?	Viện IRDM đồng hành như thế nào?	Đầu ra có thể bao gồm	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	t	Sức khỏe tâm thần & wellbeing — IRDM	Phát triển sáng kiến phòng ngừa, nâng đỡ tâm lý - xã hội và năng lực phục hồi cho tổ chức và cộng đồng.		capability/icons/heart-hand-icon.png		capability/what-is/Capality_NangLucNayLaGi_mDA2yFb.png	
6be3c227-fe07-4f5d-94cc-d5e2332ecf02	t	5	2026-07-04 22:17:18.714269+07	2026-07-18 09:36:32.789197+07	ESG, Green University & Green Hospital	esg-green-university-va-green-hospital	Đồng hành cùng tổ chức xây dựng lộ trình phát triển bền vững, kết nối quản trị, con người, môi trường và trách nhiệm xã hội.	capability/thumbnails/Homepage_DaiHoc.png		Nền tảng chuyên môn	Đồng hành cùng tổ chức xây dựng lộ trình phát triển bền vững, kết nối quản trị, con người, môi trường và trách nhiệm xã hội.	Năng lực này là gì?	Đây là năng lực hỗ trợ tổ chức thiết kế và triển khai chiến lược phát triển bền vững theo tiêu chuẩn ESG (Môi trường - Xã hội - Quản trị), tích hợp các mục tiêu bền vững vào hoạt động vận hành và quản lý tổ chức.	Khi nào tổ chức cần năng lực này?	Viện IRDM đồng hành như thế nào?	Đầu ra có thể bao gồm	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	t	ESG, Green University & Green Hospital — IRDM	Đồng hành xây dựng lộ trình ESG, phát triển bền vững cho bệnh viện và cơ sở giáo dục đại học.		capability/icons/univer_icon.png		capability/what-is/ESG_Nanglucnaylagi.png	
303c00b4-4917-41d4-8fa4-c014a9c0da18	t	6	2026-07-04 22:17:18.723117+07	2026-07-18 22:09:14.491068+07	Phổ biến tri thức & truyền thông cộng đồng	pho-bien-tri-thuc-va-truyen-thong-cong-dong	Chuyển hóa nghiên cứu, dữ liệu và hiểu biết chuyên môn thành nội dung dễ tiếp cận, có giá trị ứng dụng cho cộng đồng và đối tác.	capability/thumbnails/Homepage_PhoBienKienThuc.png		Nền tảng chuyên môn	Chuyển hóa nghiên cứu, dữ liệu và hiểu biết chuyên môn thành nội dung dễ tiếp cận, có giá trị ứng dụng cho cộng đồng và đối tác.	Năng lực này là gì?	Đây là năng lực biên dịch tri thức khoa học và chuyên môn thành ngôn ngữ phù hợp với từng nhóm đối tượng, kết hợp truyền thông chiến lược để tạo tác động xã hội và thay đổi hành vi trong cộng đồng.	Khi nào tổ chức cần năng lực này?	Viện IRDM đồng hành như thế nào?	Đầu ra có thể bao gồm	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	t	Phổ biến tri thức & truyền thông cộng đồng — IRDM	Chuyển hóa nghiên cứu và dữ liệu thành nội dung dễ tiếp cận, có tác động xã hội cho cộng đồng và đối tác.		capability/icons/heroicons_book-open.png		capability/what-is/Capality_NangLucNayLaGi_beObLws.png	
7e373022-f6d5-4fe4-8011-b2a84b1e0126	t	1	2026-07-04 22:17:18.649633+07	2026-07-18 08:49:31.071298+07	Nghiên cứu ứng dụng & khoa học dữ liệu	nghien-cuu-ung-dung-va-khoa-hoc-du-lieu	Chuyển hóa vấn đề thực tiễn thành câu hỏi nghiên cứu, dữ liệu thành tri thức, và kết quả phân tích thành căn cứ cho quản trị, chính sách và hành động.	capability/thumbnails/Nghiên_cứu_ứng_dụng__khoa_học_dữ_liệu.png	capability/hero/Homepage_nghiencuu_khoahoa.png	Nền tảng chuyên môn	Chuyển hóa vấn đề thực tiễn thành câu hỏi nghiên cứu, dữ liệu thành tri thức và kết quả phân tích thành căn cứ cho quản trị, chính sách và hành động.	Năng lực này là gì?	Đây là năng lực giúp tổ chức hiểu đúng vấn đề, tổ chức dữ liệu có ý nghĩa và tạo bằng chứng đủ tin cậy để định hướng quyết định, cải tiến chương trình hoặc xây dựng nhiệm vụ khoa học, công nghệ và đổi mới sáng tạo.	Khi nào tổ chức cần năng lực này?	Viện IRDM đồng hành như thế nào?	Đầu ra có thể bao gồm	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	t	Nghiên cứu ứng dụng & khoa học dữ liệu — IRDM	Chuyển hóa vấn đề thực tiễn thành câu hỏi nghiên cứu và bằng chứng cho quản trị, chính sách và hành động.		capability/icons/light-bulb-icon.png	Viện IRDM tiếp cận mỗi dự án như một tiến trình đi từ bằng chứng, đồng thiết kế và chuyển hóa thành giải pháp có thể triển khai. Logic này giúp các sáng kiến không dừng ở ý tưởng hoặc báo cáo, mà có khả năng đi vào thực tế vận hành.	capability/what-is/Capality_NangLucNayLaGi.png	
5c66a894-c096-431f-812d-5700d3c94cc7	t	2	2026-07-04 22:17:18.6832+07	2026-07-18 09:03:31.898938+07	AI, y tế số & hỗ trợ ra quyết định	ai-y-te-so-va-ho-tro-ra-quyet-dinh	Hỗ trợ tổ chức nhận diện use case, đánh giá dữ liệu, thiết kế lộ trình thí điểm và phối hợp phát triển công cụ số hoặc AI phù hợp với bối cảnh triển khai.	capability/thumbnails/ChatGPT_AI_YTe_So.png	capability/hero/homepage_AI.png	Nền tảng chuyên môn	Hỗ trợ tổ chức nhận diện các bài toán ứng dụng cụ thể, đánh giá dữ liệu, thiết kế lộ trình thí điểm và phối hợp phát triển công cụ số hoặc AI phù hợp với bối cảnh triển khai.	Năng lực này là gì?	Đây là năng lực kết nối dữ liệu, công nghệ số và hiểu biết về hệ thống để giúp tổ chức tiếp cận chuyển đổi số hoặc AI theo hướng có kiểm soát, có căn cứ và phù hợp với năng lực triển khai.	Khi nào tổ chức cần năng lực này?	Viện IRDM đồng hành như thế nào?	Đầu ra có thể bao gồm	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	t	AI, y tế số & hỗ trợ ra quyết định — IRDM	Hỗ trợ tổ chức nhận diện use case AI, đánh giá dữ liệu và thiết kế lộ trình thí điểm chuyển đổi số phù hợp.		capability/icons/brain-icon.png		capability/what-is/Capality_NangLucNayLaGi_vSM0qVY.png	
692ac4e1-bc3d-4186-a610-92fe26fa7638	t	3	2026-07-04 22:17:18.693107+07	2026-07-18 09:13:07.764787+07	Giáo dục & phát triển năng lực	giao-duc-va-phat-trien-nang-luc	Thiết kế chương trình học tập, tập huấn và phát triển năng lực theo hướng ứng dụng, gắn với thay đổi hành vi và mục tiêu phát triển dài hạn.	capability/thumbnails/Homepage_GiaoDuc.png	capability/hero/Homepage_GiaoDuc.png	Nền tảng chuyên môn	Thiết kế chương trình học tập, tập huấn và phát triển năng lực theo hướng ứng dụng, cá nhân hóa, gắn với thay đổi hành vi và mục tiêu phát triển dài hạn.	Năng lực này là gì?	Đây là năng lực giúp tổ chức chuyển nhu cầu phát triển con người thành chương trình học tập có cấu trúc, phù hợp bối cảnh và hướng tới thay đổi hành vi trong công việc, học tập hoặc quản trị.	Khi nào tổ chức cần năng lực này?	Viện IRDM đồng hành như thế nào?	Đầu ra có thể bao gồm	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	t	Giáo dục & phát triển năng lực — IRDM	Thiết kế chương trình học tập, tập huấn và phát triển năng lực theo hướng ứng dụng, gắn với thay đổi hành vi.		capability/icons/Vector.png		capability/what-is/Capality_NangLucNayLaGi_wnnco8A.png	
2c2afc67-a579-4f42-ab1c-53491b6e6666	t	7	2026-07-04 22:17:18.734899+07	2026-07-18 22:18:22.826641+07	Sức khỏe môi trường & mô hình can thiệp phục hồi	suc-khoe-moi-truong-va-mo-hinh-can-thiep-phuc-hoi	Kết nối môi trường sống, sức khỏe thể chất, sức khỏe tâm thần và trải nghiệm phục hồi để phát triển các chương trình phù hợp với bối cảnh tổ chức.	capability/thumbnails/Homepage_SucKhoe_MoiTruong.png		Nền tảng chuyên môn	Kết nối môi trường sống, sức khỏe thể chất, sức khỏe tâm thần và trải nghiệm phục hồi để phát triển các chương trình phù hợp với bối cảnh tổ chức.	Năng lực này là gì?	Đây là năng lực tích hợp các yếu tố môi trường vật lý, xã hội và tâm lý để thiết kế các mô hình can thiệp phục hồi toàn diện, phù hợp với đặc thù từng tổ chức và cộng đồng.	Khi nào tổ chức cần năng lực này?	Viện IRDM đồng hành như thế nào?	Đầu ra có thể bao gồm	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	t	Sức khỏe môi trường & mô hình can thiệp phục hồi — IRDM	Kết nối môi trường sống, sức khỏe và trải nghiệm phục hồi để phát triển chương trình can thiệp phù hợp.		capability/icons/Wind.png		capability/what-is/Capality_NangLucNayLaGi_Kec2QZ4.png	
\.


--
-- TOC entry 6387 (class 0 OID 312142)
-- Dependencies: 263
-- Data for Name: capability_capabilitycasestudy; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.capability_capabilitycasestudy (id, is_active, display_order, created_at, updated_at, number, category_label, title, description, cta_primary_label, cta_primary_url, cta_secondary_label, cta_secondary_url, capability_id, image) FROM stdin;
33007cdb-0f5b-4a08-b24e-3d5ee8a36921	t	0	2026-07-04 22:17:18.676975+07	2026-07-14 17:22:08.174686+07	1	Bệnh viện & KHCN	Chuyển hóa dữ liệu bệnh viện thành định hướng nhiệm vụ KHCN & ĐMST	Viện IRDM hỗ trợ đơn vị y tế rà soát dữ liệu, làm rõ bài toán ưu tiên và định hình hướng nghiên cứu ứng dụng phù hợp với năng lực chuyên môn, dữ liệu sẵn có và điều kiện triển khai; đồng thời phối hợp chủ trì, triển khai và cung cấp dịch vụ thư ký khoa học cho các nhiệm vụ KHCN & ĐMST.	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	7e373022-f6d5-4fe4-8011-b2a84b1e0126	capability/case-studies/Capa_NghienCuuUngDung_MiniCase_wE9xxNN.png
653f4f82-6b7a-4d8b-a0fc-8fdba26dc788	t	0	2026-07-04 22:17:18.690253+07	2026-07-18 09:06:59.071392+07	1	Bệnh viện & AI	Định hình bài toán AI từ dữ liệu bệnh viện	Viện IRDM hỗ trợ bệnh viện đánh giá hiện trạng dữ liệu, xác định use case AI khả thi và thiết kế hướng nghiên cứu / thí điểm phù hợp. Viện IRDM giữ vai trò kết nối bài toán thực tiễn, dữ liệu bệnh viện và chuyên gia, trên nguyên tắc AI chỉ hỗ trợ phân tích và ra quyết định, không thay thế chuyên môn y khoa.	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	5c66a894-c096-431f-812d-5700d3c94cc7	capability/case-studies/capa_minicase_ai.png
2768528d-d44b-4232-b488-d8ab4792b2a9	t	0	2026-07-04 22:17:18.701337+07	2026-07-18 09:12:30.972309+07	1	Y tế & Giáo dục	Chương trình phát triển năng lực cho nhân sự y tế và người học trẻ	Viện IRDM thiết kế và triển khai các chương trình đào tạo về tư duy, giao tiếp, quản trị cảm xúc, xử lý xung đột, lãnh đạo thấu cảm, phương pháp học tập và kỹ năng nghề nghiệp cho các nhóm đối tượng trong y tế, giáo dục và doanh nghiệp.	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	692ac4e1-bc3d-4186-a610-92fe26fa7638	capability/case-studies/capa_minicase_giaoduc.png
6fe08cc4-41b9-49fa-8c55-0878544c3767	t	0	2026-07-04 22:17:18.712182+07	2026-07-18 09:24:18.806454+07	1	Y tế & Cộng đồng	Chương trình wellbeing cho nhân viên y tế tuyến đầu	Viện IRDM phối hợp với cơ sở y tế thiết kế và triển khai chương trình hỗ trợ sức khỏe tâm thần cho nhân viên y tế, tập trung vào phòng ngừa kiệt sức, xây dựng năng lực phục hồi và tạo môi trường làm việc hỗ trợ về mặt tâm lý.	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	5ab16d24-513c-49d2-b2d8-4e63575d6ca5	capability/case-studies/minicase_suckhoetamthan.png
82363111-7a1e-40fa-b49d-5b8814c26d1e	t	0	2026-07-04 22:17:18.721243+07	2026-07-18 09:30:26.938236+07	1	Bệnh viện & Bền vững	Lộ trình Green Hospital cho cơ sở y tế	Viện IRDM đồng hành cùng bệnh viện đánh giá hiện trạng các tiêu chí ESG, xây dựng lộ trình và kế hoạch hành động hướng tới chứng nhận Green Hospital, kết nối các mục tiêu bền vững với chiến lược phát triển và vận hành của cơ sở y tế.	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	6be3c227-fe07-4f5d-94cc-d5e2332ecf02	capability/case-studies/Minicase_ESG.png
297dcd6f-928a-4bf2-b33b-23e4158bf6a0	t	0	2026-07-04 22:17:18.732101+07	2026-07-18 22:09:36.591063+07	1	Y tế Cộng đồng	Chiến dịch truyền thông sức khỏe tâm thần cho sinh viên	Viện IRDM phối hợp thiết kế và triển khai chiến dịch truyền thông nâng cao nhận thức về sức khỏe tâm thần tại các trường đại học, kết hợp nội dung số, hội thảo và tài liệu phổ biến kiến thức nhằm giảm kỳ thị và tăng khả năng tiếp cận dịch vụ hỗ trợ.	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	303c00b4-4917-41d4-8fa4-c014a9c0da18	capability/case-studies/PhoBienTriThuc_Minicase.png
459e17ce-afce-4632-b14f-5e50e92cc94d	t	0	2026-07-04 22:17:18.743739+07	2026-07-18 22:19:47.656166+07	1	Bệnh viện & Môi trường	Mô hình môi trường hỗ trợ phục hồi bệnh nhân tại bệnh viện	Viện IRDM đồng hành với bệnh viện đánh giá các yếu tố môi trường ảnh hưởng đến trải nghiệm và kết quả phục hồi của bệnh nhân, từ đó đề xuất các can thiệp tích hợp nhằm cải thiện môi trường vật lý, hỗ trợ tâm lý và tăng cường wellbeing cho cả bệnh nhân và nhân viên y tế.	Khám phá thêm Giải pháp	/giai-phap/	Xem thêm tin IRDM	/tin-tuc/	2c2afc67-a579-4f42-ab1c-53491b6e6666	capability/case-studies/Suckhoe_Minicase_tnp4oDr.png
\.


--
-- TOC entry 6388 (class 0 OID 312164)
-- Dependencies: 264
-- Data for Name: capability_capabilitycasestudytag; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.capability_capabilitycasestudytag (id, is_active, display_order, created_at, updated_at, label, case_study_id) FROM stdin;
05a84870-7d40-4eee-8564-d0f36fda41c0	t	1	2026-07-11 15:18:18.777708+07	2026-07-11 15:18:18.777714+07	Dữ liệu y tế	33007cdb-0f5b-4a08-b24e-3d5ee8a36921
ed273228-1aff-4002-a02a-d3880b6641e8	t	2	2026-07-11 15:18:18.783788+07	2026-07-11 15:18:18.783794+07	KHCN & ĐMST	33007cdb-0f5b-4a08-b24e-3d5ee8a36921
b8a223f7-e818-485e-a0b3-b14579428e41	t	3	2026-07-11 15:18:18.784405+07	2026-07-11 15:18:18.78441+07	Bệnh viện	33007cdb-0f5b-4a08-b24e-3d5ee8a36921
d2a71400-340b-4474-b7ce-484c500906da	t	1	2026-07-11 15:18:18.796916+07	2026-07-11 15:18:18.79692+07	AI	653f4f82-6b7a-4d8b-a0fc-8fdba26dc788
abe9c760-864d-4a11-be8a-573fdee73844	t	2	2026-07-11 15:18:18.797336+07	2026-07-11 15:18:18.79734+07	Y tế số	653f4f82-6b7a-4d8b-a0fc-8fdba26dc788
ea96db18-94f7-485d-95d5-ef08b61c9daa	t	3	2026-07-11 15:18:18.797729+07	2026-07-11 15:18:18.797733+07	KHCN & ĐMST	653f4f82-6b7a-4d8b-a0fc-8fdba26dc788
d0fcaa7b-eec1-479a-a95a-6240e9da9fd7	t	1	2026-07-11 15:18:18.809773+07	2026-07-11 15:18:18.809779+07	Đào tạo	2768528d-d44b-4232-b488-d8ab4792b2a9
0ffa48f0-5542-4f6c-9230-34771c6282ed	t	2	2026-07-11 15:18:18.810238+07	2026-07-11 15:18:18.810242+07	Năng lực	2768528d-d44b-4232-b488-d8ab4792b2a9
55077446-9c96-4130-b593-f3e8a9f6ce9e	t	3	2026-07-11 15:18:18.810621+07	2026-07-11 15:18:18.810624+07	E-Learning	2768528d-d44b-4232-b488-d8ab4792b2a9
aa8f440a-1f2f-46e6-bc2d-c31c4ce13c5e	t	1	2026-07-11 15:18:18.822312+07	2026-07-11 15:18:18.822316+07	Sức khỏe tâm thần	6fe08cc4-41b9-49fa-8c55-0878544c3767
1b79d2a4-e146-4983-b060-fd780bd3f7cc	t	2	2026-07-11 15:18:18.82266+07	2026-07-11 15:18:18.822663+07	Y tế	6fe08cc4-41b9-49fa-8c55-0878544c3767
84054345-9c91-4766-9ec1-f37c5b276fe1	t	3	2026-07-11 15:18:18.823022+07	2026-07-11 15:18:18.823027+07	Wellbeing	6fe08cc4-41b9-49fa-8c55-0878544c3767
c23f5b58-a54c-429a-b0a7-0f58a1c3a35d	t	1	2026-07-11 15:18:18.836548+07	2026-07-11 15:18:18.836552+07	ESG	82363111-7a1e-40fa-b49d-5b8814c26d1e
0854ba88-9c7d-454d-8e64-205dbfe26311	t	2	2026-07-11 15:18:18.836857+07	2026-07-11 15:18:18.836861+07	Green Hospital	82363111-7a1e-40fa-b49d-5b8814c26d1e
4c4b2a83-c7a9-4828-b06e-8dff941f7cf0	t	3	2026-07-11 15:18:18.837146+07	2026-07-11 15:18:18.837149+07	Bệnh viện	82363111-7a1e-40fa-b49d-5b8814c26d1e
428abc99-20a4-4c10-b38a-db22cec7b935	t	1	2026-07-11 15:18:18.847482+07	2026-07-11 15:18:18.847488+07	Truyền thông	297dcd6f-928a-4bf2-b33b-23e4158bf6a0
a4c0ef7d-48c5-4875-b6de-fc53e9c16dfb	t	2	2026-07-11 15:18:18.847969+07	2026-07-11 15:18:18.847974+07	Sức khỏe tâm thần	297dcd6f-928a-4bf2-b33b-23e4158bf6a0
02f1a0d5-8b4b-4e80-9d6b-2d3bd1974c24	t	3	2026-07-11 15:18:18.848389+07	2026-07-11 15:18:18.848396+07	Sinh viên	297dcd6f-928a-4bf2-b33b-23e4158bf6a0
eee00196-12b4-49b0-bfd4-521c3c6b7f47	t	1	2026-07-11 15:18:18.858888+07	2026-07-11 15:18:18.858892+07	Môi trường	459e17ce-afce-4632-b14f-5e50e92cc94d
8c065bee-04ba-48ba-8317-2c24bccbd0cb	t	2	2026-07-11 15:18:18.859209+07	2026-07-11 15:18:18.859212+07	Phục hồi	459e17ce-afce-4632-b14f-5e50e92cc94d
91eb4cf9-6ac4-443e-a269-5bde408d970d	t	3	2026-07-11 15:18:18.859475+07	2026-07-11 15:18:18.859479+07	Bệnh viện	459e17ce-afce-4632-b14f-5e50e92cc94d
\.


--
-- TOC entry 6389 (class 0 OID 312175)
-- Dependencies: 265
-- Data for Name: capability_capabilityfeature; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.capability_capabilityfeature (id, is_active, display_order, created_at, updated_at, label, capability_id) FROM stdin;
5ed1ad31-adca-4dde-a846-79fcebc318e7	t	1	2026-07-11 15:18:18.715973+07	2026-07-11 15:18:18.71598+07	Nghiên cứu	7e373022-f6d5-4fe4-8011-b2a84b1e0126
48901f77-c4c9-49e4-9ee1-119314e760df	t	2	2026-07-11 15:18:18.722839+07	2026-07-11 15:18:18.722844+07	Dữ liệu	7e373022-f6d5-4fe4-8011-b2a84b1e0126
f9713b95-e364-4942-9c3d-0b985c95a3da	t	3	2026-07-11 15:18:18.723256+07	2026-07-11 15:18:18.723259+07	Phân tích	7e373022-f6d5-4fe4-8011-b2a84b1e0126
cbc5c1cc-fe4b-472c-bedf-6f19ec8813d1	t	4	2026-07-11 15:18:18.723602+07	2026-07-11 15:18:18.723605+07	Chính sách	7e373022-f6d5-4fe4-8011-b2a84b1e0126
2519d007-cb19-4de8-ae1c-f927366fa13c	t	5	2026-07-11 15:18:18.724119+07	2026-07-11 15:18:18.724125+07	KHCN & ĐMST	7e373022-f6d5-4fe4-8011-b2a84b1e0126
4ef5e9f8-0caa-4664-a9be-cf9350040316	t	1	2026-07-11 15:18:18.787175+07	2026-07-11 15:18:18.787179+07	AI	5c66a894-c096-431f-812d-5700d3c94cc7
d145792d-9c54-4151-a9a1-7fcaafd62420	t	2	2026-07-11 15:18:18.787595+07	2026-07-11 15:18:18.787599+07	Dữ liệu số	5c66a894-c096-431f-812d-5700d3c94cc7
bdde0394-a42c-4ccb-b425-3103ed650391	t	3	2026-07-11 15:18:18.787977+07	2026-07-11 15:18:18.787982+07	Y tế số	5c66a894-c096-431f-812d-5700d3c94cc7
4509e44f-2f8c-4ba7-ba8a-060e4a6cd36d	t	4	2026-07-11 15:18:18.788362+07	2026-07-11 15:18:18.788367+07	KHCN & ĐMST	5c66a894-c096-431f-812d-5700d3c94cc7
61ec428f-bc88-4778-b7c5-3083247d1dae	t	5	2026-07-11 15:18:18.788734+07	2026-07-11 15:18:18.788738+07	Chuyển đổi số	5c66a894-c096-431f-812d-5700d3c94cc7
cf81aaf4-48b0-4f64-800a-335a9b341d0c	t	1	2026-07-11 15:18:18.799993+07	2026-07-11 15:18:18.799998+07	Đào tạo	692ac4e1-bc3d-4186-a610-92fe26fa7638
b3afc887-9942-47a1-9b8b-1ed8989583a9	t	2	2026-07-11 15:18:18.800398+07	2026-07-11 15:18:18.800402+07	Năng lực	692ac4e1-bc3d-4186-a610-92fe26fa7638
72fcda50-b2b1-4bb3-8a22-f9bb51602423	t	3	2026-07-11 15:18:18.800789+07	2026-07-11 15:18:18.800792+07	E-Learning	692ac4e1-bc3d-4186-a610-92fe26fa7638
2a4fb23e-6340-4d5c-8c69-8526b41e7c36	t	4	2026-07-11 15:18:18.801246+07	2026-07-11 15:18:18.801251+07	Phát triển con người	692ac4e1-bc3d-4186-a610-92fe26fa7638
58c072fe-783d-464d-9184-cbc663247092	t	1	2026-07-11 15:18:18.812886+07	2026-07-11 15:18:18.81289+07	Sức khỏe tâm thần	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
ad84bb6b-b36e-4a25-ada2-7bffea9e4b95	t	2	2026-07-11 15:18:18.813284+07	2026-07-11 15:18:18.813288+07	Wellbeing	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
21d3b5fa-ddb5-475b-a62a-9d2ca13e0421	t	3	2026-07-11 15:18:18.81369+07	2026-07-11 15:18:18.813695+07	Phòng ngừa	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
7a5eafdf-e5fc-4277-8fd9-cd6abd9139a2	t	4	2026-07-11 15:18:18.814061+07	2026-07-11 15:18:18.814065+07	Phục hồi	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
14e64dfa-e890-4754-886c-a6f73cc4eee9	t	1	2026-07-11 15:18:18.825416+07	2026-07-11 15:18:18.825421+07	ESG	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
c27dda7b-7bc1-4159-9f93-6f5891abb685	t	2	2026-07-11 15:18:18.825892+07	2026-07-11 15:18:18.825897+07	Bền vững	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
d28af117-6775-49c0-ad30-0f5b834f48a8	t	3	2026-07-11 15:18:18.826999+07	2026-07-11 15:18:18.827002+07	Green University	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
43317db2-ac0c-47f4-b351-295aaa382330	t	4	2026-07-11 15:18:18.827369+07	2026-07-11 15:18:18.827373+07	Green Hospital	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
d76e2258-bba1-49a0-986f-a12128818bb7	t	5	2026-07-11 15:18:18.827727+07	2026-07-11 15:18:18.827731+07	Quản trị	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
c03b78b0-5d3e-4e15-a426-a056be1f7b5d	t	1	2026-07-11 15:18:18.839242+07	2026-07-11 15:18:18.839246+07	Truyền thông	303c00b4-4917-41d4-8fa4-c014a9c0da18
1ca93fcc-71f2-47e1-8be8-e79e39bdd968	t	2	2026-07-11 15:18:18.839571+07	2026-07-11 15:18:18.839574+07	Tri thức	303c00b4-4917-41d4-8fa4-c014a9c0da18
588b9121-567b-4b4a-a8d3-172c032996ff	t	3	2026-07-11 15:18:18.839841+07	2026-07-11 15:18:18.839844+07	Cộng đồng	303c00b4-4917-41d4-8fa4-c014a9c0da18
92a050d9-4f68-4403-8026-dce720c75b6e	t	4	2026-07-11 15:18:18.840109+07	2026-07-11 15:18:18.840112+07	Nội dung	303c00b4-4917-41d4-8fa4-c014a9c0da18
dd885c62-168d-4ac8-8afd-ab18ddd4cb79	t	1	2026-07-11 15:18:18.850772+07	2026-07-11 15:18:18.850776+07	Môi trường	2c2afc67-a579-4f42-ab1c-53491b6e6666
9f6b2a87-a419-4cc8-8065-3cad1fe03299	t	2	2026-07-11 15:18:18.851121+07	2026-07-11 15:18:18.851125+07	Phục hồi	2c2afc67-a579-4f42-ab1c-53491b6e6666
b9d2fe3d-8d99-45b9-b35a-5e048b3851a6	t	3	2026-07-11 15:18:18.851395+07	2026-07-11 15:18:18.851398+07	Can thiệp	2c2afc67-a579-4f42-ab1c-53491b6e6666
80e8ca55-1dac-485f-ad6f-8e9bbde676d5	t	4	2026-07-11 15:18:18.851719+07	2026-07-11 15:18:18.851723+07	Sức khỏe toàn diện	2c2afc67-a579-4f42-ab1c-53491b6e6666
\.


--
-- TOC entry 6390 (class 0 OID 312186)
-- Dependencies: 266
-- Data for Name: capability_capabilityhowstep; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.capability_capabilityhowstep (id, is_active, display_order, created_at, updated_at, title, icon, capability_id, step_image, icon_image) FROM stdin;
6ab1d405-e948-4150-9537-26a415582ce2	t	4	2026-07-11 15:18:18.832181+07	2026-07-11 15:18:18.832185+07	Đồng hành triển khai, giám sát và cải tiến liên tục theo tiêu chuẩn	arrow-trending-up	6be3c227-fe07-4f5d-94cc-d5e2332ecf02		
31f323d2-3298-4a97-84cf-842fd024617f	t	1	2026-07-11 15:18:18.74518+07	2026-07-18 08:49:31.076624+07	Thiết kế nghiên cứu ứng dụng và khung phân tích	document-text	7e373022-f6d5-4fe4-8011-b2a84b1e0126	capability/how-steps/Capa_NghienCuuUngDung_ThietKeNghienCuuUngDung.png	capability/how-step-icons/icon_capa_nghiencukh_tkud.png
ad14e764-ee72-4a67-8b8f-73d29bcb0c0c	t	2	2026-07-11 15:18:18.752347+07	2026-07-18 08:49:31.078238+07	Khảo sát, chuẩn hóa, xử lý và diễn giải dữ liệu	chart-bar	7e373022-f6d5-4fe4-8011-b2a84b1e0126	capability/how-steps/Capa_NghienCuuUngDung_KhaoSat.png	capability/how-step-icons/icon_capa_nghiencukh_khaosat.png
f95f9f99-8c3b-4a2f-9d2e-58e8e0a816f2	t	3	2026-07-11 15:18:18.752794+07	2026-07-18 08:49:31.079087+07	Tổng hợp bằng chứng, xây dựng khuyến nghị, concept note	light-bulb	7e373022-f6d5-4fe4-8011-b2a84b1e0126	capability/how-steps/Capa_NghienCuuUngDung_TongHop.png	capability/how-step-icons/icon_capa_tonghop.png
1d3279ef-9dbf-4333-b655-15b2874b2de5	t	4	2026-07-11 15:18:18.753342+07	2026-07-18 08:49:31.079879+07	Đề xuất nhiệm vụ KHCN & ĐMST	arrow-trending-up	7e373022-f6d5-4fe4-8011-b2a84b1e0126	capability/how-steps/Capa_NghienCuuUngDung_DeXuat.png	capability/how-step-icons/icon_capa_dexuat.png
44cb372e-d5c5-4257-affa-8df4ac6ced2f	t	1	2026-07-11 15:18:18.791329+07	2026-07-18 09:03:31.899724+07	Rà soát bài toán số hóa và mức độ sẵn sàng của dữ liệu	magnifying-glass	5c66a894-c096-431f-812d-5700d3c94cc7	capability/how-steps/Capa_AI_Resoat.png	capability/how-step-icons/Icon_capa_ai_rasoat.png
d65b45e9-4f93-4a90-a3fb-de1ed4d2d011	t	2	2026-07-11 15:18:18.791685+07	2026-07-18 09:03:31.90087+07	Đề xuất ý tưởng và kết nối chuyên gia công nghệ & AI phù hợp từ mạng lưới	users	5c66a894-c096-431f-812d-5700d3c94cc7	capability/how-steps/Capa_AI_DeXuat.png	capability/how-step-icons/brain-icon_icon_ai_dexuat.png
079e95de-6084-4cbe-bdc9-880203edc888	t	3	2026-07-11 15:18:18.792064+07	2026-07-18 09:03:31.901846+07	Điều phối và quản lý nhiệm vụ KHCN & ĐMST	document-text	5c66a894-c096-431f-812d-5700d3c94cc7	capability/how-steps/Capa_AI_DieuPhoi.png	capability/how-step-icons/icon_ai_dieuphoi.png
12023f40-37b7-414b-892f-3ff903f63f5b	t	4	2026-07-11 15:18:18.792374+07	2026-07-18 09:03:31.90272+07	Thiết kế logic hỗ trợ ra quyết định, dashboard hoặc công cụ số	chart-bar	5c66a894-c096-431f-812d-5700d3c94cc7	capability/how-steps/Capa_AI_ThietKe.png	capability/how-step-icons/icon_ai_thietke.png
d95dc67c-6c2f-4f39-b008-a613df43edeb	t	5	2026-07-11 15:18:18.792671+07	2026-07-18 09:03:31.903864+07	Đồng hành thử nghiệm, tinh chỉnh, tập huấn và đánh giá khả năng ứng dụng	arrow-trending-up	5c66a894-c096-431f-812d-5700d3c94cc7	capability/how-steps/Capa_AI_DongHanh.png	capability/how-step-icons/icon_ai_donghanh.png
f78aa923-f41f-41fb-9717-956468f7c8cc	t	1	2026-07-11 15:18:18.804223+07	2026-07-18 09:13:07.773604+07	Thiết kế chương trình đào tạo, microlearning và E-Learning	document-text	692ac4e1-bc3d-4186-a610-92fe26fa7638	capability/how-steps/Capa_GiaoDuc_ThietKe.png	capability/how-step-icons/Icon_capa_giaoduc_thietke.png
bfe121c2-ca4e-47b9-9c0a-d974218e87fd	t	2	2026-07-11 15:18:18.80463+07	2026-07-18 09:13:07.775161+07	Phát triển kỹ năng, tư duy, năng lực làm việc và năng lực thích ứng	light-bulb	692ac4e1-bc3d-4186-a610-92fe26fa7638	capability/how-steps/Capa_GiaoDuc_PhatTrien.png	capability/how-step-icons/icon_capa_giaoduc_phattrien.png
6e0312b7-22df-400c-9ee2-cffca11f80bc	t	3	2026-07-11 15:18:18.805023+07	2026-07-18 09:13:07.776128+07	Gắn học tập với tình huống và bối cảnh thực tế, phản tư và ứng dụng vào công việc	arrow-trending-up	692ac4e1-bc3d-4186-a610-92fe26fa7638	capability/how-steps/Capa_GiaoDuc_GanPhatTrien.png	capability/how-step-icons/icon_capa_giaoduc_ganhoc.png
ba2f9c2f-3aaa-40a5-90ce-db1b7feca950	t	1	2026-07-11 15:18:18.817122+07	2026-07-18 09:23:58.571756+07	Nghiên cứu thực trạng và yếu tố liên quan đến sức khỏe tâm thần	magnifying-glass	5ab16d24-513c-49d2-b2d8-4e63575d6ca5	capability/how-steps/Capa_SucKhoeTamThan_NghienCuu.png	capability/how-step-icons/icon_nghiencu.png
54853540-e494-4c7c-a7e2-b8978e3ae23f	t	2	2026-07-11 15:18:18.817477+07	2026-07-18 09:23:58.572955+07	Thiết kế chương trình nâng cao nhận thức, hỗ trợ sớm và hỗ trợ đồng nghiệp	light-bulb	5ab16d24-513c-49d2-b2d8-4e63575d6ca5	capability/how-steps/Capa_SucKhoeTamThan_NghienCuu_hV2cRoi.png	capability/how-step-icons/icon_thietke.png
1cc3cfc5-b655-4ff3-8399-8ec0bd009360	t	3	2026-07-11 15:18:18.817851+07	2026-07-18 09:23:58.575562+07	Đề xuất cải thiện môi trường học tập - làm việc theo hướng lành mạnh	users	5ab16d24-513c-49d2-b2d8-4e63575d6ca5	capability/how-steps/Capa_SucKhoeTamThan_DeXuat.png	capability/how-step-icons/Icon_dexuat.png
c363cc6f-52b4-4f3c-adea-46d48269bbd3	t	4	2026-07-11 15:18:18.818225+07	2026-07-18 09:23:58.576529+07	Thiết kế hệ thống quản lý và chăm sóc sức khỏe tâm thần sớm và đa tầng	arrow-trending-up	5ab16d24-513c-49d2-b2d8-4e63575d6ca5	capability/how-steps/Capa_SucKhoeTamThan_ThietKeHeThong.png	capability/how-step-icons/icon_thietkehethong.png
04a95126-a041-4706-bacd-f671aa3fbb0d	t	1	2026-07-11 15:18:18.830945+07	2026-07-18 09:36:32.792995+07	Định hình khung ESG phù hợp bối cảnh tổ chức	magnifying-glass	6be3c227-fe07-4f5d-94cc-d5e2332ecf02		capability/how-step-icons/icon_dinhhinh.png
52693e9a-bfb1-4c62-b794-8fb480c2ae5d	t	2	2026-07-11 15:18:18.831347+07	2026-07-18 09:36:32.794267+07	Phát triển định hướng Green University hoặc Green Hospital	document-text	6be3c227-fe07-4f5d-94cc-d5e2332ecf02		capability/how-step-icons/icon_phattrien.png
f9ea81a4-1572-4ae6-86e6-78547f7b211e	t	3	2026-07-11 15:18:18.831794+07	2026-07-18 09:36:32.795209+07	Xây dựng roadmap, bộ chỉ số theo dõi và khuyến nghị triển khai	chart-bar	6be3c227-fe07-4f5d-94cc-d5e2332ecf02		capability/how-step-icons/icon_xaydung.png
744cf646-e127-4c3b-a4e9-fed43ecfbd22	t	1	2026-07-11 15:18:18.84252+07	2026-07-18 22:09:14.496689+07	Tổ chức hội thảo, tọa đàm, diễn đàn chuyên đề	magnifying-glass	303c00b4-4917-41d4-8fa4-c014a9c0da18	capability/how-steps/PhoBienTriThuc_ToChuc.png	capability/how-step-icons/Icon_tochuc.png
b65cda89-2e90-4aa0-9d92-821b7ecd3ee6	t	2	2026-07-11 15:18:18.842939+07	2026-07-18 22:09:14.500372+07	Biên soạn tài liệu, ấn phẩm và nội dung phổ biến tri thức	document-text	303c00b4-4917-41d4-8fa4-c014a9c0da18	capability/how-steps/PhoBienTriThuc_BienSoan.png	capability/how-step-icons/Icon_BienSoan.png
18892dd7-3306-4d68-b08e-3a93f22e1f50	t	3	2026-07-11 15:18:18.843289+07	2026-07-18 22:09:14.504852+07	Thiết kế truyền thông cộng đồng dựa trên bằng chứng và phù hợp với bối cảnh	users	303c00b4-4917-41d4-8fa4-c014a9c0da18	capability/how-steps/PhoBienTriThuc_ThietKe.png	capability/how-step-icons/Icon_ThietKe_CyFYcaX.png
2d531374-eaa8-4c35-936a-679a1b47477a	t	4	2026-07-11 15:18:18.8436+07	2026-07-18 22:09:14.508602+07	Xuất bản bài viết chuyên môn từ các chuyên gia, link các công trình liên quan	chart-bar	303c00b4-4917-41d4-8fa4-c014a9c0da18	capability/how-steps/PhoBienTriThuc_XuatBan.png	capability/how-step-icons/Icon_XuatBan.png
675d2ea6-1304-48ef-8f8f-c487256f87f3	t	1	2026-07-11 15:18:18.854219+07	2026-07-18 22:18:22.837628+07	Nghiên cứu tác động của môi trường đến stress, phục hồi và wellbeing	magnifying-glass	2c2afc67-a579-4f42-ab1c-53491b6e6666	capability/how-steps/SucKhoe_NghienCuu.png	capability/how-step-icons/Icon_SucKhoe_NghienCuu.png
cd204c85-205a-4eae-afa1-4c668eae451f	t	2	2026-07-11 15:18:18.854579+07	2026-07-18 22:18:22.841641+07	Thiết kế mô hình phục hồi dựa trên bối cảnh	light-bulb	2c2afc67-a579-4f42-ab1c-53491b6e6666	capability/how-steps/SucKhoe_ThietKe.png	capability/how-step-icons/Icon_SucKhoe_ThietKe.png
e55f8d89-61ac-4a93-866a-5d958fb299c0	t	3	2026-07-11 15:18:18.854847+07	2026-07-18 22:18:22.844847+07	Kết nối không gian sống - làm việc - học tập với sức khỏe và chất lượng sống	users	2c2afc67-a579-4f42-ab1c-53491b6e6666	capability/how-steps/SucKhoe_KetNoi.png	capability/how-step-icons/Icon_SucKhoe_KetNo.png
c1e38225-84f5-49dc-8f88-9cb82c601b04	f	4	2026-07-11 15:18:18.855103+07	2026-07-18 22:18:22.848209+07	Theo dõi, đánh giá và cải tiến mô hình can thiệp	arrow-trending-up	2c2afc67-a579-4f42-ab1c-53491b6e6666		
\.


--
-- TOC entry 6391 (class 0 OID 312202)
-- Dependencies: 267
-- Data for Name: capability_capabilitylistingpage; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.capability_capabilitylistingpage (id, is_active, display_order, created_at, updated_at, section_label, heading, description, overview_heading, overview_description, cta_label, cta_url, hero_image, cta_show, cta_bg_image, cta_eyebrow, cta_heading, cta_description, cta_overlay_color, cta_overlay_opacity) FROM stdin;
64a1306b-8143-473a-9df7-17013559036b	t	0	2026-07-04 22:17:18.642847+07	2026-07-17 23:17:20.723502+07	Nền tảng chuyên môn	Năng lực cốt lõi	Các năng lực dưới đây tạo nên nền tảng chuyên môn của IRDM – là cơ sở để đồng hành, thiết kế và triển khai các giải pháp phù hợp với từng đối tác.	Tổng quan về 7 năng lực	Các năng lực dưới đây tạo nên nền tảng chuyên môn của IRDM – là cơ sở để đồng hành, thiết kế và triển khai các giải pháp phù hợp với từng đối tác. Mỗi năng lực phản ánh một lĩnh vực can thiệp và đồng hành cụ thể, được phát triển từ thực tiễn làm việc với các tổ chức y tế, giáo dục và cộng đồng.	Liên hệ hợp tác	/contact/	capability/listing/Capality_HerobackgroundImage_UwYjSvW.png	t	capability/cta/capabilities_ketnoi_idrm.png	Kết nối với IRDM	Cùng thiết kế giải pháp phù hợp với bối cảnh và mục tiêu phát triển của tổ chức	Kết nối với Viện IRDM để cùng thiết kế giải pháp phù hợp với bối cảnh, dữ liệu và mục tiêu phát triển của tổ chức của bạn.	#0a1628	75
\.


--
-- TOC entry 6392 (class 0 OID 312229)
-- Dependencies: 268
-- Data for Name: capability_capabilityneeditem; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.capability_capabilityneeditem (id, is_active, display_order, created_at, updated_at, number, content, capability_id) FROM stdin;
5494866d-53d3-4af5-a7cc-c00416adc8c1	t	1	2026-07-11 15:18:18.727191+07	2026-07-11 15:18:18.727196+07	1	Có dữ liệu, khảo sát hoặc kinh nghiệm thực tiễn nhưng chưa được phân tích thành insight rõ ràng.	7e373022-f6d5-4fe4-8011-b2a84b1e0126
7c964281-354e-43c1-8e28-55d832291d0e	t	2	2026-07-11 15:18:18.734751+07	2026-07-11 15:18:18.734758+07	2	Cần xây dựng concept note, đề xuất nhiệm vụ KHCN & ĐMST hoặc khuyến nghị chính sách / quản trị.	7e373022-f6d5-4fe4-8011-b2a84b1e0126
689ad27c-4679-412e-8669-d71e6b804f2f	t	3	2026-07-11 15:18:18.735281+07	2026-07-11 15:18:18.735285+07	3	Cần đánh giá hiện trạng, nguyên nhân và ưu tiên hành động trước khi thiết kế giải pháp.	7e373022-f6d5-4fe4-8011-b2a84b1e0126
9928e159-488f-4434-ad72-f60b35488703	t	4	2026-07-11 15:18:18.735631+07	2026-07-11 15:18:18.735634+07	4	Cần sáng kiến / ý tưởng KHCN & ĐMST, thiết kế nhiệm vụ và triển khai các nhiệm vụ KHCN & ĐMST.	7e373022-f6d5-4fe4-8011-b2a84b1e0126
f1a7a7e7-9375-44e3-a686-97d297f37db5	t	5	2026-07-11 15:18:18.736063+07	2026-07-11 15:18:18.736067+07	5	Đánh giá tác động và hiệu quả của chương trình / dự án.	7e373022-f6d5-4fe4-8011-b2a84b1e0126
8319823e-fea0-4b87-8b06-0b164d7a0fca	t	6	2026-07-11 15:18:18.736438+07	2026-07-11 15:18:18.736441+07	6	Đánh giá kinh tế - y tế Dược.	7e373022-f6d5-4fe4-8011-b2a84b1e0126
a13ab94e-8fd9-47ab-89b4-73bb513552cd	t	1	2026-07-11 15:18:18.789812+07	2026-07-11 15:18:18.789817+07	1	Muốn ứng dụng AI hoặc công cụ số nhưng chưa rõ bài toán ưu tiên và điều kiện dữ liệu.	5c66a894-c096-431f-812d-5700d3c94cc7
a876a595-7c11-45a9-a798-ccfa899ba982	t	2	2026-07-11 15:18:18.790177+07	2026-07-11 15:18:18.79018+07	2	Cần dashboard, công cụ theo dõi hoặc logic hỗ trợ ra quyết định phục vụ quản trị / vận hành.	5c66a894-c096-431f-812d-5700d3c94cc7
c04d8487-5a30-4657-889f-eb59e88af942	t	3	2026-07-11 15:18:18.790456+07	2026-07-11 15:18:18.790459+07	3	Cần lộ trình thí điểm, đánh giá và mở rộng giải pháp số theo từng giai đoạn.	5c66a894-c096-431f-812d-5700d3c94cc7
814ad0a3-012e-4935-93a7-1649d18e9d59	t	1	2026-07-11 15:18:18.802455+07	2026-07-11 15:18:18.80246+07	1	Đội ngũ cần nâng cao kỹ năng, tư duy, năng lực thích ứng hoặc năng lực phối hợp.	692ac4e1-bc3d-4186-a610-92fe26fa7638
460a7142-e037-423c-9b15-36af7fe37f96	t	2	2026-07-11 15:18:18.802848+07	2026-07-11 15:18:18.802852+07	2	Cần chương trình đào tạo, microlearning hoặc E-Learning có khả năng ứng dụng thực tế.	692ac4e1-bc3d-4186-a610-92fe26fa7638
fe86df63-4514-4f93-ad4a-14fe2e91d50c	t	3	2026-07-11 15:18:18.803237+07	2026-07-11 15:18:18.803241+07	3	Muốn phát triển lộ trình năng lực cho nhân sự, quản lý hoặc nhóm chuyên môn.	692ac4e1-bc3d-4186-a610-92fe26fa7638
874d7156-1066-4180-9837-26ecdaca44a9	t	1	2026-07-11 15:18:18.814988+07	2026-07-11 15:18:18.814992+07	1	Nhân sự, học sinh hoặc cộng đồng đang trải qua áp lực tâm lý, kiệt sức hoặc stress kéo dài.	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
b59fafb7-ec16-4880-8a79-986546391ba8	t	2	2026-07-11 15:18:18.815361+07	2026-07-11 15:18:18.815365+07	2	Tổ chức muốn xây dựng chương trình phòng ngừa và hỗ trợ sức khỏe tâm thần tại nơi làm việc hoặc học đường.	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
50936ff7-0d98-4551-a045-e7f1fca5ca43	t	3	2026-07-11 15:18:18.815732+07	2026-07-11 15:18:18.815736+07	3	Cần đánh giá thực trạng wellbeing và thiết kế can thiệp phù hợp với bối cảnh cụ thể.	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
a91dec71-390a-497b-87f8-476ad3e4253a	t	4	2026-07-11 15:18:18.81612+07	2026-07-11 15:18:18.816125+07	4	Muốn tích hợp yếu tố sức khỏe tâm thần vào chương trình đào tạo, quản lý hoặc chăm sóc lâm sàng.	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
aff642f9-4317-446f-ba73-eef196e5fdbd	t	1	2026-07-11 15:18:18.828745+07	2026-07-11 15:18:18.828749+07	1	Tổ chức muốn xây dựng báo cáo ESG hoặc lộ trình phát triển bền vững lần đầu.	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
454ccf94-1aea-447c-af3f-c1f7c245ec6d	t	2	2026-07-11 15:18:18.829124+07	2026-07-11 15:18:18.829128+07	2	Cần tích hợp tiêu chí ESG vào quản trị, vận hành và chiến lược tổ chức.	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
75213c15-da2d-42b8-954a-cf8105f8b952	t	3	2026-07-11 15:18:18.829488+07	2026-07-11 15:18:18.829492+07	3	Muốn đạt chứng nhận Green Hospital, Green University hoặc tiêu chuẩn bền vững quốc tế.	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
fe2fc7dc-c565-4609-9c67-7e849ebef39f	t	4	2026-07-11 15:18:18.829847+07	2026-07-11 15:18:18.829851+07	4	Cần đánh giá hiện trạng ESG và xác định ưu tiên cải thiện phù hợp năng lực tổ chức.	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
22953a74-6ce0-4c9e-8cdd-f9c801655cea	t	1	2026-07-11 15:18:18.840992+07	2026-07-11 15:18:18.840996+07	1	Có kết quả nghiên cứu, dữ liệu hoặc kiến thức chuyên môn nhưng chưa tiếp cận được đến đối tượng cần thiết.	303c00b4-4917-41d4-8fa4-c014a9c0da18
de93888f-c32d-486a-af36-788daa29000e	t	2	2026-07-11 15:18:18.841293+07	2026-07-11 15:18:18.841296+07	2	Cần thiết kế chiến dịch truyền thông sức khỏe hoặc truyền thông chính sách hướng đến cộng đồng.	303c00b4-4917-41d4-8fa4-c014a9c0da18
317f3086-44ee-4072-b13c-4d34babb1db7	t	3	2026-07-11 15:18:18.841572+07	2026-07-11 15:18:18.841574+07	3	Muốn xây dựng kênh phổ biến tri thức chuyên ngành hoặc tài nguyên học tập mở cho cộng đồng.	303c00b4-4917-41d4-8fa4-c014a9c0da18
b9c91242-1e0c-4941-a7b1-638d2991ec9f	t	1	2026-07-11 15:18:18.852623+07	2026-07-11 15:18:18.852627+07	1	Tổ chức muốn cải thiện môi trường vật lý và xã hội để hỗ trợ sức khỏe và phục hồi.	2c2afc67-a579-4f42-ab1c-53491b6e6666
c9c16fb0-dbeb-41cd-8774-125051c58bdd	t	2	2026-07-11 15:18:18.85295+07	2026-07-11 15:18:18.852953+07	2	Cần thiết kế chương trình can thiệp tích hợp giữa môi trường, sức khỏe thể chất và tâm thần.	2c2afc67-a579-4f42-ab1c-53491b6e6666
f88c3f31-ff1b-4ec2-882c-a135f6d5e957	t	3	2026-07-11 15:18:18.853281+07	2026-07-11 15:18:18.853285+07	3	Muốn đánh giá tác động của môi trường học tập / làm việc đến sức khỏe và hiệu suất.	2c2afc67-a579-4f42-ab1c-53491b6e6666
\.


--
-- TOC entry 6393 (class 0 OID 312244)
-- Dependencies: 269
-- Data for Name: capability_capabilityoutput; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.capability_capabilityoutput (id, is_active, display_order, created_at, updated_at, number, content, capability_id) FROM stdin;
4461f821-2838-4775-b6ef-7944b180536f	t	1	2026-07-11 15:18:18.761108+07	2026-07-11 15:18:18.761116+07	1	Báo cáo nghiên cứu ứng dụng hoặc báo cáo phân tích dữ liệu	7e373022-f6d5-4fe4-8011-b2a84b1e0126
2d17b233-32c5-4ae0-83b2-3b3c16f6c4fd	t	2	2026-07-11 15:18:18.767763+07	2026-07-11 15:18:18.767769+07	2	Bộ chỉ số, khung đánh giá hoặc dashboard phân tích khi phù hợp	7e373022-f6d5-4fe4-8011-b2a84b1e0126
5e2bb7f7-e18d-46bd-bbdb-51cde8a27820	t	3	2026-07-11 15:18:18.768303+07	2026-07-11 15:18:18.76831+07	3	Tổng hợp bằng chứng và bộ dữ liệu chuẩn hóa	7e373022-f6d5-4fe4-8011-b2a84b1e0126
1b9ab58e-2f29-4480-83dc-52ceb8b7836b	t	4	2026-07-11 15:18:18.768739+07	2026-07-11 15:18:18.768742+07	4	Concept note, policy brief, khuyến nghị quản trị	7e373022-f6d5-4fe4-8011-b2a84b1e0126
1fd0ec82-e5ad-4507-ba90-5db431dae40b	t	5	2026-07-11 15:18:18.769167+07	2026-07-11 15:18:18.769172+07	5	Nhiệm vụ KHCN & ĐMST được triển khai và nghiệm thu đúng hạn	7e373022-f6d5-4fe4-8011-b2a84b1e0126
25bc8f8d-3a75-45fa-98e3-496093803407	t	1	2026-07-11 15:18:18.793574+07	2026-07-11 15:18:18.793578+07	1	Bản đồ use case và đánh giá mức độ sẵn sàng của dữ liệu	5c66a894-c096-431f-812d-5700d3c94cc7
1f56ff3d-fbfc-460b-b08e-5bf433c1208f	t	2	2026-07-11 15:18:18.793979+07	2026-07-11 15:18:18.793982+07	2	Dashboard, mô hình dữ liệu hoặc đặc tả yêu cầu cho công cụ số	5c66a894-c096-431f-812d-5700d3c94cc7
bc9717ca-ff5b-4725-af16-c008d3277d18	t	3	2026-07-11 15:18:18.794397+07	2026-07-11 15:18:18.794402+07	3	Ý tưởng KHCN & ĐMST, hỗ trợ đề xuất / đặt hàng và triển khai nhiệm vụ / dự án	5c66a894-c096-431f-812d-5700d3c94cc7
a10557be-0b20-4fbe-8105-fc36d79ca6bc	t	4	2026-07-11 15:18:18.794786+07	2026-07-11 15:18:18.79479+07	4	Lộ trình thí điểm, tài liệu tập huấn và khuyến nghị triển khai / mở rộng	5c66a894-c096-431f-812d-5700d3c94cc7
83777b6c-e0b8-446f-8069-7e8e23ea76d6	t	1	2026-07-11 15:18:18.806535+07	2026-07-11 15:18:18.806543+07	1	Khung chương trình đào tạo, tập huấn hoặc phát triển năng lực	692ac4e1-bc3d-4186-a610-92fe26fa7638
0b8bf2cb-29b4-4bf9-bd30-ff1735062e59	t	2	2026-07-11 15:18:18.807006+07	2026-07-11 15:18:18.80701+07	2	Bộ học liệu, bài tập ứng dụng, case thực hành hoặc nội dung E-Learning	692ac4e1-bc3d-4186-a610-92fe26fa7638
894375fa-9fba-4131-99ed-780baf1ab6b8	t	3	2026-07-11 15:18:18.80739+07	2026-07-11 15:18:18.807394+07	3	Lộ trình phát triển năng lực theo nhóm đối tượng hoặc theo mục tiêu tổ chức	692ac4e1-bc3d-4186-a610-92fe26fa7638
a45cdd7a-75f4-4219-b603-04816b58fd88	t	1	2026-07-11 15:18:18.819191+07	2026-07-11 15:18:18.819195+07	1	Báo cáo đánh giá thực trạng sức khỏe tâm thần và wellbeing của tổ chức	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
c77a9ba5-9bc2-4780-8ade-55768b1498ad	t	2	2026-07-11 15:18:18.819555+07	2026-07-11 15:18:18.819558+07	2	Chương trình phòng ngừa, hỗ trợ tâm lý - xã hội và nâng cao năng lực phục hồi	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
470953f9-1401-4be5-b586-338cf0855dee	t	3	2026-07-11 15:18:18.819908+07	2026-07-11 15:18:18.819912+07	3	Bộ tài liệu tập huấn cho nhân viên tuyến đầu và người hỗ trợ	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
940f3d44-c970-497b-bc0c-425b85186836	t	4	2026-07-11 15:18:18.820278+07	2026-07-11 15:18:18.820281+07	4	Khuyến nghị điều chỉnh môi trường làm việc / học tập để hỗ trợ wellbeing	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
f406cb5d-947b-418a-8c58-67dde4909a0e	t	1	2026-07-11 15:18:18.8335+07	2026-07-11 15:18:18.833505+07	1	Báo cáo đánh giá hiện trạng ESG và khoảng cách cần cải thiện	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
9ac378d8-3551-4a03-a5d7-2528cafbf20e	t	2	2026-07-11 15:18:18.833906+07	2026-07-11 15:18:18.83391+07	2	Lộ trình ESG / phát triển bền vững theo từng giai đoạn	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
4d724759-cf98-499e-b8c8-c0a14138d134	t	3	2026-07-11 15:18:18.834235+07	2026-07-11 15:18:18.834238+07	3	Hệ thống thu thập dữ liệu và báo cáo ESG / bền vững	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
5619c889-db48-4364-8525-64a9a553d093	t	4	2026-07-11 15:18:18.834524+07	2026-07-11 15:18:18.834527+07	4	Tài liệu chuẩn bị hồ sơ chứng nhận Green Hospital / Green University	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
c28b79db-d6f5-444f-9588-31784da9097a	t	1	2026-07-11 15:18:18.844507+07	2026-07-11 15:18:18.844511+07	1	Bộ tài liệu truyền thông, infographic và nội dung đa phương tiện	303c00b4-4917-41d4-8fa4-c014a9c0da18
4f70cf3f-8abd-4f95-8192-4a47c82f662c	t	2	2026-07-11 15:18:18.844827+07	2026-07-11 15:18:18.84483+07	2	Chiến lược và kế hoạch truyền thông cộng đồng	303c00b4-4917-41d4-8fa4-c014a9c0da18
92be4b5f-2722-4a99-9bb8-37d878dedc14	t	3	2026-07-11 15:18:18.845138+07	2026-07-11 15:18:18.845141+07	3	Tài nguyên học tập mở hoặc thư viện tri thức chuyên ngành	303c00b4-4917-41d4-8fa4-c014a9c0da18
8fc34bab-a2d3-4601-935b-8cad4bff237e	t	4	2026-07-11 15:18:18.8454+07	2026-07-11 15:18:18.845402+07	4	Báo cáo hiệu quả truyền thông và khuyến nghị cải tiến	303c00b4-4917-41d4-8fa4-c014a9c0da18
c2cf0f88-96f7-47a5-86e2-6d5c76b9cf13	t	1	2026-07-11 15:18:18.85607+07	2026-07-11 15:18:18.856074+07	1	Báo cáo đánh giá môi trường và các yếu tố tác động đến sức khỏe	2c2afc67-a579-4f42-ab1c-53491b6e6666
587191f6-0af3-4390-b4b4-d316019e90b9	t	2	2026-07-11 15:18:18.856371+07	2026-07-11 15:18:18.856374+07	2	Mô hình can thiệp phục hồi tích hợp và kế hoạch triển khai	2c2afc67-a579-4f42-ab1c-53491b6e6666
ee6bf0b0-fa26-49b4-a262-847fd0a1d969	t	3	2026-07-11 15:18:18.856644+07	2026-07-11 15:18:18.856647+07	3	Bộ tài liệu hướng dẫn và công cụ đánh giá cho tổ chức	2c2afc67-a579-4f42-ab1c-53491b6e6666
6fcc2fd0-0929-4448-83fb-6287e34822f4	t	4	2026-07-11 15:18:18.856895+07	2026-07-11 15:18:18.856898+07	4	Khuyến nghị cải thiện môi trường vật lý và xã hội	2c2afc67-a579-4f42-ab1c-53491b6e6666
\.


--
-- TOC entry 6486 (class 0 OID 334694)
-- Dependencies: 362
-- Data for Name: contact_contactrequest; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.contact_contactrequest (id, full_name, email, phone, organization, inquiry_type, message, status, source_url, created_at, updated_at) FROM stdin;
1	Dũng Nguyễn Văn	bluesky775177@gmail.com	0912027023	Trưởng phòng Tổ chức Hành chính - Viện IRDM / Chuyên viên Điều phối dự án / Nhà khoa học/chuyên gia; Giảng viên & Chuyên gia học tập ứng dụng.	other	111rtertertertertert	new	/lien-he/	2026-08-10 22:30:50.737341+07	2026-08-10 22:30:50.737356+07
\.


--
-- TOC entry 6394 (class 0 OID 312259)
-- Dependencies: 270
-- Data for Name: core_footerlink; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.core_footerlink (id, is_active, display_order, created_at, updated_at, label, url, open_in_new_tab, section_id) FROM stdin;
faee708f-7766-4efd-a4b4-e3cf83bf0b89	t	100	2026-07-03 22:44:05.463749+07	2026-07-03 22:44:05.463758+07	Cơ quan quản lý	/giai-phap/co-quan-quan-ly/	f	1a6f006e-56e7-4075-8e2e-01286cf65dbc
a03fbb78-3330-4120-91fc-3adba2061aba	t	110	2026-07-03 22:44:05.465371+07	2026-07-03 22:44:05.465377+07	Hệ thống y tế	/giai-phap/he-thong-y-te/	f	1a6f006e-56e7-4075-8e2e-01286cf65dbc
8c2c651b-0b08-4da0-bd89-8f1138accfe7	t	120	2026-07-03 22:44:05.466129+07	2026-07-03 22:44:05.466133+07	Trường Đại học	/giai-phap/giao-duc/	f	1a6f006e-56e7-4075-8e2e-01286cf65dbc
4b9ce661-5f03-4224-a499-5c0bc8409758	t	130	2026-07-03 22:44:05.466853+07	2026-07-03 22:44:05.466857+07	Doanh nghiệp	/giai-phap/doanh-nghiep/	f	1a6f006e-56e7-4075-8e2e-01286cf65dbc
897488d1-a600-4209-916f-703ea2e375d0	t	140	2026-07-03 22:44:05.467541+07	2026-07-03 22:44:05.467545+07	Tổ chức quốc tế	/giai-phap/to-chuc-quoc-te/	f	1a6f006e-56e7-4075-8e2e-01286cf65dbc
cfc6bb4b-5e0b-4159-b3f6-cdc2959e4602	t	100	2026-07-03 22:44:05.472524+07	2026-07-03 22:44:05.472528+07	Giới thiệu	/ve-irdm/	f	b50e2dc9-0312-44aa-9c57-2ddd39e9c41c
fb345ba1-e201-4903-a26f-3cff06f4d0ce	t	110	2026-07-03 22:44:05.473243+07	2026-07-03 22:44:05.473247+07	Đội ngũ chuyên gia	/chuyen-gia/	f	b50e2dc9-0312-44aa-9c57-2ddd39e9c41c
b4ac7e33-f54a-48d3-9a33-7dbeb91a9a94	t	120	2026-07-03 22:44:05.473946+07	2026-07-03 22:44:05.473949+07	Đối tác	/doi-tac/	f	b50e2dc9-0312-44aa-9c57-2ddd39e9c41c
051b8d96-90d2-4e45-b93d-c744a4118b5e	t	130	2026-07-03 22:44:05.474583+07	2026-07-03 22:44:05.474587+07	Liên hệ	/lien-he/	f	b50e2dc9-0312-44aa-9c57-2ddd39e9c41c
e0b16136-1560-438f-afc6-df676386db24	t	10	2026-07-05 22:18:18.66637+07	2026-07-05 22:18:18.666376+07	Cơ quan quản lý & Chính sách	/giai-phap/co-quan-quan-ly-va-chinh-sach/	f	1a6f006e-56e7-4075-8e2e-01286cf65dbc
8224a88d-cb96-4cdd-b875-6ffc351e55d9	t	30	2026-07-05 22:18:18.668922+07	2026-07-05 22:18:18.668927+07	Trường đại học & Giáo dục	/giai-phap/truong-dai-hoc-va-giao-duc/	f	1a6f006e-56e7-4075-8e2e-01286cf65dbc
6ff6e1ed-a83e-41de-9096-3fe85237a85b	t	50	2026-07-05 22:18:18.670058+07	2026-07-05 22:18:18.670062+07	Tổ chức quốc tế & NGO	/giai-phap/to-chuc-quoc-te-va-ngo/	f	1a6f006e-56e7-4075-8e2e-01286cf65dbc
af448e48-13f2-4848-b389-6ba5718bf157	t	100	2026-07-03 22:44:05.469241+07	2026-07-03 22:44:05.469245+07	Xuất bản & Tài liệu	/tri-thuc-goc-nhin/	f	5412024d-49d3-48c5-9573-39e2e71585bd
5ac6038a-d3cd-4dc4-a97c-08ab8a1f0528	t	110	2026-07-03 22:44:05.470002+07	2026-07-03 22:44:05.470007+07	Sự kiện & Diễn đàn	/tri-thuc-goc-nhin/	f	5412024d-49d3-48c5-9573-39e2e71585bd
bf58f5cf-aea5-4ffe-bd80-5d255fdd8fe5	t	120	2026-07-03 22:44:05.470684+07	2026-07-03 22:44:05.470688+07	Góc nhìn từ Đối tác	/tri-thuc-goc-nhin/	f	5412024d-49d3-48c5-9573-39e2e71585bd
dc881eab-1f69-4549-8af7-b1ca2a674f79	t	130	2026-07-03 22:44:05.471365+07	2026-07-03 22:44:05.471369+07	Truyền thông	/tri-thuc-goc-nhin/	f	5412024d-49d3-48c5-9573-39e2e71585bd
\.


--
-- TOC entry 6395 (class 0 OID 312274)
-- Dependencies: 271
-- Data for Name: core_footersection; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.core_footersection (id, is_active, display_order, created_at, updated_at, title) FROM stdin;
1a6f006e-56e7-4075-8e2e-01286cf65dbc	t	100	2026-07-03 22:44:05.460047+07	2026-07-03 22:44:05.460052+07	Giải pháp
5412024d-49d3-48c5-9573-39e2e71585bd	t	110	2026-07-03 22:44:05.468373+07	2026-07-03 22:44:05.468378+07	Tri thức & Góc nhìn
b50e2dc9-0312-44aa-9c57-2ddd39e9c41c	t	120	2026-07-03 22:44:05.471918+07	2026-07-03 22:44:05.471922+07	Về IRDM
\.


--
-- TOC entry 6396 (class 0 OID 312284)
-- Dependencies: 272
-- Data for Name: core_menuitem; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.core_menuitem (id, is_active, display_order, created_at, updated_at, menu, label, url, open_in_new_tab, parent_id) FROM stdin;
746ffa57-f9c0-48c0-a1a6-aadbb1662825	t	10	2026-07-03 22:44:05.449057+07	2026-07-03 22:44:05.449066+07	header	Trang chủ	/	f	\N
830e8c57-05b8-4901-af26-3d9c8945d2e7	t	20	2026-07-03 22:44:05.450597+07	2026-07-03 22:44:05.450601+07	header	Giải pháp	/giai-phap/	f	\N
12a60a0f-1066-4f03-88dd-a2257b2ba8e3	t	10	2026-07-03 22:44:05.455137+07	2026-07-03 22:44:05.455143+07	footer	Trang chủ	/	f	\N
361ee272-2683-4858-8af8-0c8f1138d904	t	20	2026-07-03 22:44:05.456041+07	2026-07-03 22:44:05.456045+07	footer	Giải pháp	/giai-phap/	f	\N
403f6dff-d75b-4c6e-9f17-885ae884c8c5	t	30	2026-07-05 22:18:18.654043+07	2026-07-05 22:18:18.654048+07	header	Năng lực cốt lõi	/capabilities/	f	\N
29caf2a9-dafe-4b3e-b6d9-3a26bf3497fb	t	30	2026-07-05 22:18:18.660853+07	2026-07-05 22:18:18.660864+07	footer	Năng lực cốt lõi	/capabilities/	f	\N
c6038502-4255-4402-b1d7-23d3646778e2	t	40	2026-07-03 22:44:05.451396+07	2026-07-03 22:44:05.4514+07	header	Tri thức & Góc nhìn	/tri-thuc-goc-nhin/	f	\N
7af5255c-d8b5-4e5c-8129-136c9d3f53d2	t	30	2026-07-03 22:44:05.456765+07	2026-07-09 21:43:47.539083+07	footer	Tri thức & Góc nhìn	/tri-thuc-goc-nhin/	f	\N
881e2229-5da7-4af3-add6-0354e23adf08	t	40	2026-07-03 22:44:05.457434+07	2026-07-09 21:44:19.056515+07	footer	Đội ngũ chuyên gia	/capabilities/	f	\N
b1f58622-3eb9-4b1c-b63f-2926061fbf1e	t	50	2026-07-03 22:44:05.452208+07	2026-07-09 21:46:13.002914+07	header	Đội ngũ chuyên gia	/chuyen-gia/	f	\N
5302c200-b656-46c1-9a97-a924ae4b5b42	t	60	2026-07-03 22:44:05.454117+07	2026-07-09 21:46:20.620309+07	header	Về IRDM	/ve-irdm/	f	\N
7dca3fbe-c49d-45fe-918a-fe62c71c209e	t	50	2026-07-03 22:44:05.45811+07	2026-07-09 21:44:36.28425+07	footer	Về IRDM	/ve-irdm/	f	\N
7303d1d2-d0d8-46ca-8e54-fc85cd6f3fe2	f	50	2026-07-05 22:18:18.662952+07	2026-07-29 23:37:01.819152+07	footer	Liên hệ	/lien-he/	f	\N
e9f0d73d-575b-4cae-84e9-7bcaebaa97e5	f	50	2026-07-03 22:44:05.45324+07	2026-07-29 23:37:01.829731+07	header	Đối tác & Khách hàng	/capabilities/	f	\N
e07c5d49-73a2-4433-b9e3-aea9dae9d795	f	70	2026-07-05 22:18:18.65884+07	2026-07-29 23:37:01.831238+07	header	Liên hệ	/lien-he/	f	\N
\.


--
-- TOC entry 6397 (class 0 OID 312299)
-- Dependencies: 273
-- Data for Name: core_sitesettings; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.core_sitesettings (id, is_active, display_order, created_at, updated_at, site_name, site_tagline, site_description, logo, logo_white, favicon, email, phone, address, linkedin_url, twitter_url, facebook_url, youtube_url, map_embed_url, operating_hours) FROM stdin;
91920ceb-3611-4e81-866f-81083b64ff5e	t	0	2026-07-03 22:44:05.443041+07	2026-07-11 15:37:45.99958+07	IRDM	Viện Nghiên cứu Phát triển Nguồn lực Việt	Viện Nghiên cứu Phát triển Nguồn lực Việt (IRDM) là tổ chức Khoa học, Công nghệ và Đổi mới sáng tạo, hoạt động nghiên cứu tập trung các lĩnh vực Y tế – Giáo dục – Môi trường trong bối cảnh ứng dụng công nghệ số.\r\nViện IRDM được thành lập theo Quyết định số 1111/QĐ-LHHVN ngày 01/11/2019 của Liên Hiệp các Hội Khoa học và Kỹ thuẫt Việt Nam; Được cấp Chứng nhận Đăng ký hoạt động Khoa học và Công nghệ số A – 2157 do Bộ Khoa học và Công nghệ cấp ngày 29/11/2019.	core/logo/irdm-logo_4mTqWOo_75LRxGU.png	core/logo/irdm-logo-white_fx1zQBu_NRkI90o.png		vienncptnlv@irdm.edu.vn	(+84) 33 656 7701	8C Trần Huy Liệu, Phường Phú Nhuận, TP.HCM	https://linkedin.com/company/irdm		https://facebook.com/irdm	https://youtube.com/@irdm	https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.418742898547!2d106.67854097579797!3d10.779498258849395!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f3a9d8b6fb5%3A0x8f5b7c2a1e4d3c9b!2s8C%20Tr%E1%BA%A7n%20Huy%20Li%E1%BB%87u%2C%20Ph%C6%B0%E1%BB%9Dng%20Ph%C3%BA%20Nhu%E1%BA%ADn%2C%20Th%C3%A0nh%20ph%E1%BB%91%20H%E1%BB%93%20Ch%C3%AD%20Minh!5e0!3m2!1svi!2svn!4v1720000000000!5m2!1svi!2svn	Thứ 2 đến Thứ 6 | 8h00 – 17h00
\.


--
-- TOC entry 6398 (class 0 OID 312325)
-- Dependencies: 274
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2026-07-04 22:34:04.537646+07	c964b47d-24b2-416d-972b-a2a8de64c3cd	Cách IRDM tạo ra tác động	2	[{"changed": {"fields": ["CTA URL"]}}]	23	1
2	2026-07-07 21:27:53.333344+07	91920ceb-3611-4e81-866f-81083b64ff5e	IRDM	2	[{"changed": {"fields": ["Site description", "Logo"]}}]	7	1
3	2026-07-07 21:38:14.813634+07	a2a9cac5-e458-400b-b88f-5c23309f1e3e	Vì sao dữ liệu bệnh viện chưa dễ chuyển thành nhiệm vụ KH,CN&ĐMST?	2	[]	47	1
4	2026-07-09 21:43:47.542591+07	7af5255c-d8b5-4e5c-8129-136c9d3f53d2	Footer (điều hướng dưới) — Tri thức & Góc nhìn	2	[{"changed": {"fields": ["URL"]}}]	10	1
5	2026-07-09 21:44:19.057614+07	881e2229-5da7-4af3-add6-0354e23adf08	Footer (điều hướng dưới) — Đội ngũ chuyên gia	2	[{"changed": {"fields": ["URL"]}}]	10	1
6	2026-07-09 21:44:36.285029+07	7dca3fbe-c49d-45fe-918a-fe62c71c209e	Footer (điều hướng dưới) — Về IRDM	2	[{"changed": {"fields": ["URL"]}}]	10	1
7	2026-07-09 21:44:49.75558+07	7303d1d2-d0d8-46ca-8e54-fc85cd6f3fe2	Footer (điều hướng dưới) — Liên hệ	2	[{"changed": {"fields": ["URL"]}}]	10	1
8	2026-07-09 21:46:06.722904+07	e9f0d73d-575b-4cae-84e9-7bcaebaa97e5	Header (điều hướng trên) — Đối tác & Khách hàng	2	[{"changed": {"fields": ["URL"]}}]	10	1
9	2026-07-09 21:46:13.003928+07	b1f58622-3eb9-4b1c-b63f-2926061fbf1e	Header (điều hướng trên) — Đội ngũ chuyên gia	2	[{"changed": {"fields": ["URL"]}}]	10	1
10	2026-07-09 21:46:20.621099+07	5302c200-b656-46c1-9a97-a924ae4b5b42	Header (điều hướng trên) — Về IRDM	2	[{"changed": {"fields": ["URL"]}}]	10	1
11	2026-07-09 21:46:32.80689+07	e07c5d49-73a2-4433-b9e3-aea9dae9d795	Header (điều hướng trên) — Liên hệ	2	[{"changed": {"fields": ["URL"]}}]	10	1
12	2026-07-09 21:53:17.929364+07	7e373022-f6d5-4fe4-8011-b2a84b1e0126	Nghiên cứu ứng dụng & khoa học dữ liệu	2	[{"changed": {"fields": ["Thumbnail", "Hero image"]}}]	31	1
13	2026-07-11 15:30:16.56001+07	d14ea039-8c25-4e8f-8a4b-6055d4dd951b	Nghiên cứu ứng dụng & khoa học dữ liệu	2	[{"changed": {"fields": ["Background image", "Link URL"]}}]	18	1
14	2026-07-11 15:32:37.830459+07	f313a59b-0682-463d-97d0-98e0fb34f673	AI, y tế số & hỗ trợ ra quyết định	2	[{"changed": {"fields": ["Background image", "Link URL"]}}]	18	1
15	2026-07-11 15:33:07.756752+07	34f66b62-0ead-4e7c-ad92-fc403a710655	Giáo dục & phát triển năng lực	2	[{"changed": {"fields": ["Background image", "Link URL"]}}]	18	1
16	2026-07-11 15:33:35.339873+07	01ebd488-d641-4d50-bf37-f6577fc7ffeb	Sức khỏe tâm thần & wellbeing	2	[{"changed": {"fields": ["Background image", "Link URL"]}}]	18	1
17	2026-07-11 15:33:58.115507+07	57745ce9-009a-4ad0-94ce-3c5d2e82b0c1	ESG, Green University & Green Hospital	2	[{"changed": {"fields": ["Background image", "Link URL"]}}]	18	1
18	2026-07-11 15:34:28.358634+07	6f7149be-3ebe-465c-a861-19034a3b3efd	Phổ biến tri thức & truyền thông cộng đồng	2	[{"changed": {"fields": ["Background image", "Link URL"]}}]	18	1
19	2026-07-11 15:34:52.884266+07	a15d2df5-d269-46ef-8e19-3c0714f6e965	Sức khỏe môi trường & mô hình can thiệp phục hồi	2	[{"changed": {"fields": ["Background image", "Link URL"]}}]	18	1
20	2026-07-11 15:36:53.978297+07	91920ceb-3611-4e81-866f-81083b64ff5e	IRDM	2	[{"changed": {"fields": ["Site description", "Logo"]}}]	7	1
21	2026-07-11 15:37:46.001037+07	91920ceb-3611-4e81-866f-81083b64ff5e	IRDM	2	[{"changed": {"fields": ["Logo (white)"]}}]	7	1
22	2026-07-11 16:50:38.841692+07	d14ea039-8c25-4e8f-8a4b-6055d4dd951b	Nghiên cứu ứng dụng & khoa học dữ liệu	2	[{"changed": {"fields": ["Icon image"]}}]	18	1
23	2026-07-11 16:51:32.355246+07	f313a59b-0682-463d-97d0-98e0fb34f673	AI, y tế số & hỗ trợ ra quyết định	2	[{"changed": {"fields": ["Icon image"]}}]	18	1
24	2026-07-11 16:51:44.877346+07	34f66b62-0ead-4e7c-ad92-fc403a710655	Giáo dục & phát triển năng lực	2	[{"changed": {"fields": ["Icon image"]}}]	18	1
25	2026-07-11 16:52:07.346337+07	01ebd488-d641-4d50-bf37-f6577fc7ffeb	Sức khỏe tâm thần & wellbeing	2	[{"changed": {"fields": ["Icon image"]}}]	18	1
26	2026-07-11 16:52:22.703418+07	57745ce9-009a-4ad0-94ce-3c5d2e82b0c1	ESG, Green University & Green Hospital	2	[{"changed": {"fields": ["Icon image"]}}]	18	1
27	2026-07-11 16:52:40.964952+07	6f7149be-3ebe-465c-a861-19034a3b3efd	Phổ biến tri thức & truyền thông cộng đồng	2	[{"changed": {"fields": ["Icon image"]}}]	18	1
28	2026-07-11 16:52:55.25296+07	a15d2df5-d269-46ef-8e19-3c0714f6e965	Sức khỏe môi trường & mô hình can thiệp phục hồi	2	[{"changed": {"fields": ["Icon image"]}}]	18	1
29	2026-07-11 21:17:25.566431+07	1ab4629d-46fa-4f3a-8753-e3c0f8764dfe	KIẾN TẠO GIẢI PHÁP TỪ NGHIÊN CỨU, DỮ LIỆU VÀ TRI THỨC LIÊN NGÀNH	2	[{"changed": {"fields": ["Background image"]}}]	12	1
30	2026-07-11 22:07:13.961072+07	82ebdedb-573b-4242-93bd-d969207fb5ef	KIẾN TẠO GIẢI PHÁP TỪ	2	[{"changed": {"fields": ["Background image (section overlay)"]}}]	12	1
31	2026-07-11 22:07:41.505854+07	82ebdedb-573b-4242-93bd-d969207fb5ef	KIẾN TẠO GIẢI PHÁP TỪ	2	[{"changed": {"fields": ["Hero illustration (right panel)"]}}]	12	1
32	2026-07-11 22:10:19.39083+07	82ebdedb-573b-4242-93bd-d969207fb5ef	KIẾN TẠO GIẢI PHÁP TỪ	2	[{"changed": {"fields": ["Hero illustration (right panel)"]}}]	12	1
33	2026-07-11 22:15:48.512242+07	82ebdedb-573b-4242-93bd-d969207fb5ef	KIẾN TẠO GIẢI PHÁP TỪ	2	[]	12	1
34	2026-07-11 23:13:29.517641+07	82ebdedb-573b-4242-93bd-d969207fb5ef	KIẾN TẠO GIẢI PHÁP TỪ	2	[{"changed": {"fields": ["Quote icon"]}}]	12	1
35	2026-07-11 23:15:28.883433+07	82ebdedb-573b-4242-93bd-d969207fb5ef	KIẾN TẠO GIẢI PHÁP TỪ	2	[{"changed": {"fields": ["Quote icon"]}}]	12	1
36	2026-07-13 11:59:59.606535+07	64a1306b-8143-473a-9df7-17013559036b	Năng lực cốt lõi	2	[{"changed": {"fields": ["Hero background image"]}}]	29	1
37	2026-07-13 14:02:56.153548+07	5c66a894-c096-431f-812d-5700d3c94cc7	AI, y tế số & hỗ trợ ra quyết định	2	[{"changed": {"fields": ["Card icon", "Hero image"]}}]	31	1
38	2026-07-13 14:03:25.015036+07	5c66a894-c096-431f-812d-5700d3c94cc7	AI, y tế số & hỗ trợ ra quyết định	2	[{"changed": {"fields": ["Thumbnail"]}}]	31	1
39	2026-07-13 15:58:30.872171+07	7e373022-f6d5-4fe4-8011-b2a84b1e0126	Nghiên cứu ứng dụng & khoa học dữ liệu	2	[{"changed": {"fields": ["Card icon"]}}]	31	1
40	2026-07-13 16:18:52.59272+07	692ac4e1-bc3d-4186-a610-92fe26fa7638	Giáo dục & phát triển năng lực	2	[{"changed": {"fields": ["Card icon", "Hero image"]}}]	31	1
41	2026-07-13 17:01:20.486902+07	692ac4e1-bc3d-4186-a610-92fe26fa7638	Giáo dục & phát triển năng lực	2	[{"changed": {"fields": ["Thumbnail"]}}]	31	1
42	2026-07-13 17:02:01.21114+07	5ab16d24-513c-49d2-b2d8-4e63575d6ca5	Sức khỏe tâm thần & wellbeing	2	[{"changed": {"fields": ["Thumbnail", "Card icon"]}}]	31	1
43	2026-07-13 17:02:41.917366+07	6be3c227-fe07-4f5d-94cc-d5e2332ecf02	ESG, Green University & Green Hospital	2	[{"changed": {"fields": ["Thumbnail", "Card icon"]}}]	31	1
44	2026-07-13 17:03:29.877767+07	303c00b4-4917-41d4-8fa4-c014a9c0da18	Phổ biến tri thức & truyền thông cộng đồng	2	[{"changed": {"fields": ["Thumbnail", "Card icon"]}}]	31	1
45	2026-07-13 17:04:41.692237+07	2c2afc67-a579-4f42-ab1c-53491b6e6666	Sức khỏe môi trường & mô hình can thiệp phục hồi	2	[{"changed": {"fields": ["Thumbnail", "Card icon"]}}]	31	1
46	2026-07-13 22:35:06.406459+07	7e373022-f6d5-4fe4-8011-b2a84b1e0126	Nghiên cứu ứng dụng & khoa học dữ liệu	2	[{"changed": {"fields": ["Hero image"]}}]	31	1
47	2026-07-13 22:36:16.613051+07	7e373022-f6d5-4fe4-8011-b2a84b1e0126	Nghiên cứu ứng dụng & khoa học dữ liệu	2	[{"changed": {"fields": ["Hero image"]}}]	31	1
48	2026-07-13 22:36:48.351933+07	7e373022-f6d5-4fe4-8011-b2a84b1e0126	Nghiên cứu ứng dụng & khoa học dữ liệu	2	[{"changed": {"fields": ["'What is' illustration"]}}]	31	1
49	2026-07-14 10:09:38.893682+07	7e373022-f6d5-4fe4-8011-b2a84b1e0126	Nghiên cứu ứng dụng & khoa học dữ liệu	2	[{"changed": {"fields": ["'When needed' intro text"]}}]	31	1
50	2026-07-14 12:17:12.098031+07	7e373022-f6d5-4fe4-8011-b2a84b1e0126	Nghiên cứu ứng dụng & khoa học dữ liệu	2	[{"changed": {"name": "capability how step", "object": "Nghi\\u00ean c\\u1ee9u \\u1ee9ng d\\u1ee5ng & khoa h\\u1ecdc d\\u1eef li\\u1ec7u \\u2014 Thi\\u1ebft k\\u1ebf nghi\\u00ean c\\u1ee9u \\u1ee9ng d\\u1ee5ng v\\u00e0 khung ph\\u00e2n t\\u00edch", "fields": ["Step photo"]}}, {"changed": {"name": "capability how step", "object": "Nghi\\u00ean c\\u1ee9u \\u1ee9ng d\\u1ee5ng & khoa h\\u1ecdc d\\u1eef li\\u1ec7u \\u2014 Kh\\u1ea3o s\\u00e1t, chu\\u1ea9n h\\u00f3a, x\\u1eed l\\u00fd v\\u00e0 di\\u1ec5n gi\\u1ea3i d\\u1eef li\\u1ec7u", "fields": ["Step photo"]}}, {"changed": {"name": "capability how step", "object": "Nghi\\u00ean c\\u1ee9u \\u1ee9ng d\\u1ee5ng & khoa h\\u1ecdc d\\u1eef li\\u1ec7u \\u2014 T\\u1ed5ng h\\u1ee3p b\\u1eb1ng ch\\u1ee9ng, x\\u00e2y d\\u1ef1ng khuy\\u1ebfn ngh\\u1ecb, concept note", "fields": ["Step photo"]}}, {"changed": {"name": "capability how step", "object": "Nghi\\u00ean c\\u1ee9u \\u1ee9ng d\\u1ee5ng & khoa h\\u1ecdc d\\u1eef li\\u1ec7u \\u2014 \\u0110\\u1ec1 xu\\u1ea5t nhi\\u1ec7m v\\u1ee5 KHCN & \\u0110MST", "fields": ["Step photo"]}}]	31	1
51	2026-07-14 13:48:37.111665+07	5c66a894-c096-431f-812d-5700d3c94cc7	AI, y tế số & hỗ trợ ra quyết định	2	[{"changed": {"fields": ["'What is' illustration"]}}, {"changed": {"name": "capability how step", "object": "AI, y t\\u1ebf s\\u1ed1 & h\\u1ed7 tr\\u1ee3 ra quy\\u1ebft \\u0111\\u1ecbnh \\u2014 R\\u00e0 so\\u00e1t b\\u00e0i to\\u00e1n s\\u1ed1 h\\u00f3a v\\u00e0 m\\u1ee9c \\u0111\\u1ed9 s\\u1eb5n s\\u00e0ng c\\u1ee7a d\\u1eef li\\u1ec7u", "fields": ["Step photo"]}}, {"changed": {"name": "capability how step", "object": "AI, y t\\u1ebf s\\u1ed1 & h\\u1ed7 tr\\u1ee3 ra quy\\u1ebft \\u0111\\u1ecbnh \\u2014 \\u0110\\u1ec1 xu\\u1ea5t \\u00fd t\\u01b0\\u1edfng v\\u00e0 k\\u1ebft n\\u1ed1i chuy\\u00ean gia c\\u00f4ng ngh\\u1ec7 & AI ph\\u00f9 h\\u1ee3p t\\u1eeb m\\u1ea1ng l\\u01b0\\u1edbi", "fields": ["Step photo"]}}, {"changed": {"name": "capability how step", "object": "AI, y t\\u1ebf s\\u1ed1 & h\\u1ed7 tr\\u1ee3 ra quy\\u1ebft \\u0111\\u1ecbnh \\u2014 \\u0110i\\u1ec1u ph\\u1ed1i v\\u00e0 qu\\u1ea3n l\\u00fd nhi\\u1ec7m v\\u1ee5 KHCN & \\u0110MST", "fields": ["Step photo"]}}, {"changed": {"name": "capability how step", "object": "AI, y t\\u1ebf s\\u1ed1 & h\\u1ed7 tr\\u1ee3 ra quy\\u1ebft \\u0111\\u1ecbnh \\u2014 Thi\\u1ebft k\\u1ebf logic h\\u1ed7 tr\\u1ee3 ra quy\\u1ebft \\u0111\\u1ecbnh, dashboard ho\\u1eb7c c\\u00f4ng c\\u1ee5 s\\u1ed1", "fields": ["Step photo"]}}, {"changed": {"name": "capability how step", "object": "AI, y t\\u1ebf s\\u1ed1 & h\\u1ed7 tr\\u1ee3 ra quy\\u1ebft \\u0111\\u1ecbnh \\u2014 \\u0110\\u1ed3ng h\\u00e0nh th\\u1eed nghi\\u1ec7m, tinh ch\\u1ec9nh, t\\u1eadp hu\\u1ea5n v\\u00e0 \\u0111\\u00e1nh gi\\u00e1 kh\\u1ea3 n\\u0103ng \\u1ee9ng d\\u1ee5ng", "fields": ["Step photo"]}}]	31	1
52	2026-07-14 13:53:45.52589+07	692ac4e1-bc3d-4186-a610-92fe26fa7638	Giáo dục & phát triển năng lực	2	[{"changed": {"fields": ["'What is' illustration"]}}, {"changed": {"name": "capability how step", "object": "Gi\\u00e1o d\\u1ee5c & ph\\u00e1t tri\\u1ec3n n\\u0103ng l\\u1ef1c \\u2014 Thi\\u1ebft k\\u1ebf ch\\u01b0\\u01a1ng tr\\u00ecnh \\u0111\\u00e0o t\\u1ea1o, microlearning v\\u00e0 E-Learning", "fields": ["Step photo"]}}, {"changed": {"name": "capability how step", "object": "Gi\\u00e1o d\\u1ee5c & ph\\u00e1t tri\\u1ec3n n\\u0103ng l\\u1ef1c \\u2014 Ph\\u00e1t tri\\u1ec3n k\\u1ef9 n\\u0103ng, t\\u01b0 duy, n\\u0103ng l\\u1ef1c l\\u00e0m vi\\u1ec7c v\\u00e0 n\\u0103ng l\\u1ef1c th\\u00edch \\u1ee9ng", "fields": ["Step photo"]}}, {"changed": {"name": "capability how step", "object": "Gi\\u00e1o d\\u1ee5c & ph\\u00e1t tri\\u1ec3n n\\u0103ng l\\u1ef1c \\u2014 G\\u1eafn h\\u1ecdc t\\u1eadp v\\u1edbi t\\u00ecnh hu\\u1ed1ng v\\u00e0 b\\u1ed1i c\\u1ea3nh th\\u1ef1c t\\u1ebf, ph\\u1ea3n t\\u01b0 v\\u00e0 \\u1ee9ng d\\u1ee5ng v\\u00e0o c\\u00f4ng vi\\u1ec7c", "fields": ["Step photo"]}}]	31	1
53	2026-07-14 14:01:45.148593+07	5ab16d24-513c-49d2-b2d8-4e63575d6ca5	Sức khỏe tâm thần & wellbeing	2	[{"changed": {"fields": ["'What is' illustration"]}}, {"changed": {"name": "capability how step", "object": "S\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n & wellbeing \\u2014 Nghi\\u00ean c\\u1ee9u th\\u1ef1c tr\\u1ea1ng v\\u00e0 y\\u1ebfu t\\u1ed1 li\\u00ean quan \\u0111\\u1ebfn s\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n", "fields": ["Title", "Step photo"]}}, {"changed": {"name": "capability how step", "object": "S\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n & wellbeing \\u2014 Thi\\u1ebft k\\u1ebf ch\\u01b0\\u01a1ng tr\\u00ecnh n\\u00e2ng cao nh\\u1eadn th\\u1ee9c, h\\u1ed7 tr\\u1ee3 s\\u1edbm v\\u00e0 h\\u1ed7 tr\\u1ee3 \\u0111\\u1ed3ng nghi\\u1ec7p", "fields": ["Title", "Step photo"]}}, {"changed": {"name": "capability how step", "object": "S\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n & wellbeing \\u2014 \\u0110\\u1ec1 xu\\u1ea5t c\\u1ea3i thi\\u1ec7n m\\u00f4i tr\\u01b0\\u1eddng h\\u1ecdc t\\u1eadp - l\\u00e0m vi\\u1ec7c theo h\\u01b0\\u1edbng l\\u00e0nh m\\u1ea1nh", "fields": ["Title", "Step photo"]}}, {"changed": {"name": "capability how step", "object": "S\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n & wellbeing \\u2014 Thi\\u1ebft k\\u1ebf h\\u1ec7 th\\u1ed1ng qu\\u1ea3n l\\u00fd v\\u00e0 ch\\u0103m s\\u00f3c s\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n s\\u1edbm v\\u00e0 \\u0111a t\\u1ea7ng", "fields": ["Title", "Step photo"]}}]	31	1
54	2026-07-14 16:05:50.004788+07	5ab16d24-513c-49d2-b2d8-4e63575d6ca5	Sức khỏe tâm thần & wellbeing	2	[{"changed": {"name": "capability how step", "object": "S\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n & wellbeing \\u2014 Thi\\u1ebft k\\u1ebf ch\\u01b0\\u01a1ng tr\\u00ecnh n\\u00e2ng cao nh\\u1eadn th\\u1ee9c, h\\u1ed7 tr\\u1ee3 s\\u1edbm v\\u00e0 h\\u1ed7 tr\\u1ee3 \\u0111\\u1ed3ng nghi\\u1ec7p", "fields": ["Icon image"]}}]	31	1
55	2026-07-14 16:42:05.109863+07	33007cdb-0f5b-4a08-b24e-3d5ee8a36921	Nghiên cứu ứng dụng & khoa học dữ liệu — case 01	2	[{"changed": {"fields": ["Case study image"]}}]	34	1
56	2026-07-14 17:22:08.180555+07	33007cdb-0f5b-4a08-b24e-3d5ee8a36921	Nghiên cứu ứng dụng & khoa học dữ liệu — case 01	2	[{"changed": {"fields": ["Case study image"]}}]	34	1
57	2026-07-17 23:17:20.726624+07	64a1306b-8143-473a-9df7-17013559036b	Năng lực cốt lõi	2	[{"changed": {"fields": ["CTA background image"]}}]	29	1
101	2026-07-28 23:12:48.136087+07	803303a1-5704-4823-a8b3-6b1b91efb7b5	Khoa học dữ liệu & AI	2	[{"changed": {"fields": ["Card icon", "Card tags"]}}]	66	1
102	2026-07-29 21:37:09.013746+07	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	Nhà khoa học & Chuyên gia	2	[{"added": {"name": "info group block", "object": "Nh\\u00e0 khoa h\\u1ecdc & Chuy\\u00ean gia \\u2014 Y T\\u1ebf & Qu\\u1ea3n Tr\\u1ecb Y T\\u1ebf"}}]	71	1
151	2026-07-31 22:41:48.980592+07	6126b35f-9fe8-415d-a02b-dc84ede3c592	Xã hội học	2	[{"changed": {"fields": ["Is active"]}}]	66	1
152	2026-07-31 22:41:48.981262+07	7a09b2e0-85f3-42ab-9981-fc0d72083993	E-Learning	2	[{"changed": {"fields": ["Is active"]}}]	66	1
58	2026-07-18 08:49:31.081189+07	7e373022-f6d5-4fe4-8011-b2a84b1e0126	Nghiên cứu ứng dụng & khoa học dữ liệu	2	[{"changed": {"name": "capability how step", "object": "Nghi\\u00ean c\\u1ee9u \\u1ee9ng d\\u1ee5ng & khoa h\\u1ecdc d\\u1eef li\\u1ec7u \\u2014 Thi\\u1ebft k\\u1ebf nghi\\u00ean c\\u1ee9u \\u1ee9ng d\\u1ee5ng v\\u00e0 khung ph\\u00e2n t\\u00edch", "fields": ["Icon image"]}}, {"changed": {"name": "capability how step", "object": "Nghi\\u00ean c\\u1ee9u \\u1ee9ng d\\u1ee5ng & khoa h\\u1ecdc d\\u1eef li\\u1ec7u \\u2014 Kh\\u1ea3o s\\u00e1t, chu\\u1ea9n h\\u00f3a, x\\u1eed l\\u00fd v\\u00e0 di\\u1ec5n gi\\u1ea3i d\\u1eef li\\u1ec7u", "fields": ["Icon image"]}}, {"changed": {"name": "capability how step", "object": "Nghi\\u00ean c\\u1ee9u \\u1ee9ng d\\u1ee5ng & khoa h\\u1ecdc d\\u1eef li\\u1ec7u \\u2014 T\\u1ed5ng h\\u1ee3p b\\u1eb1ng ch\\u1ee9ng, x\\u00e2y d\\u1ef1ng khuy\\u1ebfn ngh\\u1ecb, concept note", "fields": ["Icon image"]}}, {"changed": {"name": "capability how step", "object": "Nghi\\u00ean c\\u1ee9u \\u1ee9ng d\\u1ee5ng & khoa h\\u1ecdc d\\u1eef li\\u1ec7u \\u2014 \\u0110\\u1ec1 xu\\u1ea5t nhi\\u1ec7m v\\u1ee5 KHCN & \\u0110MST", "fields": ["Icon image"]}}]	31	1
59	2026-07-18 09:03:31.905504+07	5c66a894-c096-431f-812d-5700d3c94cc7	AI, y tế số & hỗ trợ ra quyết định	2	[{"changed": {"name": "capability how step", "object": "AI, y t\\u1ebf s\\u1ed1 & h\\u1ed7 tr\\u1ee3 ra quy\\u1ebft \\u0111\\u1ecbnh \\u2014 R\\u00e0 so\\u00e1t b\\u00e0i to\\u00e1n s\\u1ed1 h\\u00f3a v\\u00e0 m\\u1ee9c \\u0111\\u1ed9 s\\u1eb5n s\\u00e0ng c\\u1ee7a d\\u1eef li\\u1ec7u", "fields": ["Icon image"]}}, {"changed": {"name": "capability how step", "object": "AI, y t\\u1ebf s\\u1ed1 & h\\u1ed7 tr\\u1ee3 ra quy\\u1ebft \\u0111\\u1ecbnh \\u2014 \\u0110\\u1ec1 xu\\u1ea5t \\u00fd t\\u01b0\\u1edfng v\\u00e0 k\\u1ebft n\\u1ed1i chuy\\u00ean gia c\\u00f4ng ngh\\u1ec7 & AI ph\\u00f9 h\\u1ee3p t\\u1eeb m\\u1ea1ng l\\u01b0\\u1edbi", "fields": ["Icon image"]}}, {"changed": {"name": "capability how step", "object": "AI, y t\\u1ebf s\\u1ed1 & h\\u1ed7 tr\\u1ee3 ra quy\\u1ebft \\u0111\\u1ecbnh \\u2014 \\u0110i\\u1ec1u ph\\u1ed1i v\\u00e0 qu\\u1ea3n l\\u00fd nhi\\u1ec7m v\\u1ee5 KHCN & \\u0110MST", "fields": ["Icon image"]}}, {"changed": {"name": "capability how step", "object": "AI, y t\\u1ebf s\\u1ed1 & h\\u1ed7 tr\\u1ee3 ra quy\\u1ebft \\u0111\\u1ecbnh \\u2014 Thi\\u1ebft k\\u1ebf logic h\\u1ed7 tr\\u1ee3 ra quy\\u1ebft \\u0111\\u1ecbnh, dashboard ho\\u1eb7c c\\u00f4ng c\\u1ee5 s\\u1ed1", "fields": ["Icon image"]}}, {"changed": {"name": "capability how step", "object": "AI, y t\\u1ebf s\\u1ed1 & h\\u1ed7 tr\\u1ee3 ra quy\\u1ebft \\u0111\\u1ecbnh \\u2014 \\u0110\\u1ed3ng h\\u00e0nh th\\u1eed nghi\\u1ec7m, tinh ch\\u1ec9nh, t\\u1eadp hu\\u1ea5n v\\u00e0 \\u0111\\u00e1nh gi\\u00e1 kh\\u1ea3 n\\u0103ng \\u1ee9ng d\\u1ee5ng", "fields": ["Icon image"]}}]	31	1
60	2026-07-18 09:06:59.074768+07	653f4f82-6b7a-4d8b-a0fc-8fdba26dc788	AI, y tế số & hỗ trợ ra quyết định — case 01	2	[{"changed": {"fields": ["Case study image"]}}]	34	1
61	2026-07-18 09:12:30.975056+07	2768528d-d44b-4232-b488-d8ab4792b2a9	Giáo dục & phát triển năng lực — case 01	2	[{"changed": {"fields": ["Case study image"]}}]	34	1
62	2026-07-18 09:13:07.777249+07	692ac4e1-bc3d-4186-a610-92fe26fa7638	Giáo dục & phát triển năng lực	2	[{"changed": {"name": "capability how step", "object": "Gi\\u00e1o d\\u1ee5c & ph\\u00e1t tri\\u1ec3n n\\u0103ng l\\u1ef1c \\u2014 Thi\\u1ebft k\\u1ebf ch\\u01b0\\u01a1ng tr\\u00ecnh \\u0111\\u00e0o t\\u1ea1o, microlearning v\\u00e0 E-Learning", "fields": ["Icon image"]}}, {"changed": {"name": "capability how step", "object": "Gi\\u00e1o d\\u1ee5c & ph\\u00e1t tri\\u1ec3n n\\u0103ng l\\u1ef1c \\u2014 Ph\\u00e1t tri\\u1ec3n k\\u1ef9 n\\u0103ng, t\\u01b0 duy, n\\u0103ng l\\u1ef1c l\\u00e0m vi\\u1ec7c v\\u00e0 n\\u0103ng l\\u1ef1c th\\u00edch \\u1ee9ng", "fields": ["Icon image"]}}, {"changed": {"name": "capability how step", "object": "Gi\\u00e1o d\\u1ee5c & ph\\u00e1t tri\\u1ec3n n\\u0103ng l\\u1ef1c \\u2014 G\\u1eafn h\\u1ecdc t\\u1eadp v\\u1edbi t\\u00ecnh hu\\u1ed1ng v\\u00e0 b\\u1ed1i c\\u1ea3nh th\\u1ef1c t\\u1ebf, ph\\u1ea3n t\\u01b0 v\\u00e0 \\u1ee9ng d\\u1ee5ng v\\u00e0o c\\u00f4ng vi\\u1ec7c", "fields": ["Icon image"]}}]	31	1
63	2026-07-18 09:23:58.578179+07	5ab16d24-513c-49d2-b2d8-4e63575d6ca5	Sức khỏe tâm thần & wellbeing	2	[{"changed": {"name": "capability how step", "object": "S\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n & wellbeing \\u2014 Nghi\\u00ean c\\u1ee9u th\\u1ef1c tr\\u1ea1ng v\\u00e0 y\\u1ebfu t\\u1ed1 li\\u00ean quan \\u0111\\u1ebfn s\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n", "fields": ["Icon image"]}}, {"changed": {"name": "capability how step", "object": "S\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n & wellbeing \\u2014 Thi\\u1ebft k\\u1ebf ch\\u01b0\\u01a1ng tr\\u00ecnh n\\u00e2ng cao nh\\u1eadn th\\u1ee9c, h\\u1ed7 tr\\u1ee3 s\\u1edbm v\\u00e0 h\\u1ed7 tr\\u1ee3 \\u0111\\u1ed3ng nghi\\u1ec7p", "fields": ["Icon image"]}}, {"changed": {"name": "capability how step", "object": "S\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n & wellbeing \\u2014 \\u0110\\u1ec1 xu\\u1ea5t c\\u1ea3i thi\\u1ec7n m\\u00f4i tr\\u01b0\\u1eddng h\\u1ecdc t\\u1eadp - l\\u00e0m vi\\u1ec7c theo h\\u01b0\\u1edbng l\\u00e0nh m\\u1ea1nh", "fields": ["Icon image"]}}, {"changed": {"name": "capability how step", "object": "S\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n & wellbeing \\u2014 Thi\\u1ebft k\\u1ebf h\\u1ec7 th\\u1ed1ng qu\\u1ea3n l\\u00fd v\\u00e0 ch\\u0103m s\\u00f3c s\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n s\\u1edbm v\\u00e0 \\u0111a t\\u1ea7ng", "fields": ["Icon image"]}}]	31	1
64	2026-07-18 09:24:18.809429+07	6fe08cc4-41b9-49fa-8c55-0878544c3767	Sức khỏe tâm thần & wellbeing — case 01	2	[{"changed": {"fields": ["Case study image"]}}]	34	1
65	2026-07-18 09:30:26.941106+07	82363111-7a1e-40fa-b49d-5b8814c26d1e	ESG, Green University & Green Hospital — case 01	2	[{"changed": {"fields": ["Case study image"]}}]	34	1
66	2026-07-18 09:36:32.796237+07	6be3c227-fe07-4f5d-94cc-d5e2332ecf02	ESG, Green University & Green Hospital	2	[{"changed": {"fields": ["'What is' illustration"]}}, {"changed": {"name": "capability how step", "object": "ESG, Green University & Green Hospital \\u2014 \\u0110\\u1ecbnh h\\u00ecnh khung ESG ph\\u00f9 h\\u1ee3p b\\u1ed1i c\\u1ea3nh t\\u1ed5 ch\\u1ee9c", "fields": ["Title", "Icon image"]}}, {"changed": {"name": "capability how step", "object": "ESG, Green University & Green Hospital \\u2014 Ph\\u00e1t tri\\u1ec3n \\u0111\\u1ecbnh h\\u01b0\\u1edbng Green University ho\\u1eb7c Green Hospital", "fields": ["Title", "Icon image"]}}, {"changed": {"name": "capability how step", "object": "ESG, Green University & Green Hospital \\u2014 X\\u00e2y d\\u1ef1ng roadmap, b\\u1ed9 ch\\u1ec9 s\\u1ed1 theo d\\u00f5i v\\u00e0 khuy\\u1ebfn ngh\\u1ecb tri\\u1ec3n khai", "fields": ["Title", "Icon image"]}}]	31	1
67	2026-07-18 10:30:00.439334+07	32c588b5-da2e-41a1-b498-0b08a6dbec44	Tri thức & Góc nhìn ngành	2	[{"changed": {"fields": ["Description", "Featured section background image"]}}]	45	1
68	2026-07-18 10:44:17.880274+07	4ff5e077-aec3-46b8-83e4-b8ce3fb2cd89	Hệ thống Y tế	1	[{"added": {}}]	44	1
69	2026-07-18 10:46:19.386504+07	32c588b5-da2e-41a1-b498-0b08a6dbec44	Tri thức & Góc nhìn ngành	2	[{"changed": {"fields": ["Featured section decoration"]}}]	45	1
103	2026-07-29 21:39:59.286142+07	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	Nhà khoa học & Chuyên gia	2	[{"added": {"name": "info group block", "object": "Nh\\u00e0 khoa h\\u1ecdc & Chuy\\u00ean gia \\u2014 AI, D\\u1eef li\\u1ec7u & Chuy\\u1ec3n \\u0111\\u1ed5i s\\u1ed1"}}]	71	1
148	2026-07-31 22:41:48.978401+07	c497e561-8c38-485b-9d7d-339d425bfaf4	Wellbeing	2	[{"changed": {"fields": ["Is active"]}}]	66	1
149	2026-07-31 22:41:48.979128+07	039d7d34-cc8a-445c-b867-e29d717f87d4	Tâm lý	2	[{"changed": {"fields": ["Is active"]}}]	66	1
150	2026-07-31 22:41:48.979861+07	20ec8865-4874-4b20-8277-37d3b8540767	Nghiên cứu	2	[{"changed": {"fields": ["Is active"]}}]	66	1
70	2026-07-18 22:09:14.512226+07	303c00b4-4917-41d4-8fa4-c014a9c0da18	Phổ biến tri thức & truyền thông cộng đồng	2	[{"changed": {"fields": ["'What is' illustration"]}}, {"changed": {"name": "capability how step", "object": "Ph\\u1ed5 bi\\u1ebfn tri th\\u1ee9c & truy\\u1ec1n th\\u00f4ng c\\u1ed9ng \\u0111\\u1ed3ng \\u2014 T\\u1ed5 ch\\u1ee9c h\\u1ed9i th\\u1ea3o, t\\u1ecda \\u0111\\u00e0m, di\\u1ec5n \\u0111\\u00e0n chuy\\u00ean \\u0111\\u1ec1", "fields": ["Title", "Icon image", "Step photo"]}}, {"changed": {"name": "capability how step", "object": "Ph\\u1ed5 bi\\u1ebfn tri th\\u1ee9c & truy\\u1ec1n th\\u00f4ng c\\u1ed9ng \\u0111\\u1ed3ng \\u2014 Bi\\u00ean so\\u1ea1n t\\u00e0i li\\u1ec7u, \\u1ea5n ph\\u1ea9m v\\u00e0 n\\u1ed9i dung ph\\u1ed5 bi\\u1ebfn tri th\\u1ee9c", "fields": ["Title", "Icon image", "Step photo"]}}, {"changed": {"name": "capability how step", "object": "Ph\\u1ed5 bi\\u1ebfn tri th\\u1ee9c & truy\\u1ec1n th\\u00f4ng c\\u1ed9ng \\u0111\\u1ed3ng \\u2014 Thi\\u1ebft k\\u1ebf truy\\u1ec1n th\\u00f4ng c\\u1ed9ng \\u0111\\u1ed3ng d\\u1ef1a tr\\u00ean b\\u1eb1ng ch\\u1ee9ng v\\u00e0 ph\\u00f9 h\\u1ee3p v\\u1edbi b\\u1ed1i c\\u1ea3nh", "fields": ["Title", "Icon image", "Step photo"]}}, {"changed": {"name": "capability how step", "object": "Ph\\u1ed5 bi\\u1ebfn tri th\\u1ee9c & truy\\u1ec1n th\\u00f4ng c\\u1ed9ng \\u0111\\u1ed3ng \\u2014 Xu\\u1ea5t b\\u1ea3n b\\u00e0i vi\\u1ebft chuy\\u00ean m\\u00f4n t\\u1eeb c\\u00e1c chuy\\u00ean gia, link c\\u00e1c c\\u00f4ng tr\\u00ecnh li\\u00ean quan", "fields": ["Title", "Icon image", "Step photo"]}}]	31	1
71	2026-07-18 22:09:36.593867+07	297dcd6f-928a-4bf2-b33b-23e4158bf6a0	Phổ biến tri thức & truyền thông cộng đồng — case 01	2	[{"changed": {"fields": ["Case study image"]}}]	34	1
72	2026-07-18 22:15:50.376245+07	459e17ce-afce-4632-b14f-5e50e92cc94d	Sức khỏe môi trường & mô hình can thiệp phục hồi — case 01	2	[{"changed": {"fields": ["Case study image"]}}]	34	1
73	2026-07-18 22:18:22.850176+07	2c2afc67-a579-4f42-ab1c-53491b6e6666	Sức khỏe môi trường & mô hình can thiệp phục hồi	2	[{"changed": {"fields": ["'What is' illustration"]}}, {"changed": {"name": "capability how step", "object": "S\\u1ee9c kh\\u1ecfe m\\u00f4i tr\\u01b0\\u1eddng & m\\u00f4 h\\u00ecnh can thi\\u1ec7p ph\\u1ee5c h\\u1ed3i \\u2014 Nghi\\u00ean c\\u1ee9u t\\u00e1c \\u0111\\u1ed9ng c\\u1ee7a m\\u00f4i tr\\u01b0\\u1eddng \\u0111\\u1ebfn stress, ph\\u1ee5c h\\u1ed3i v\\u00e0 wellbeing", "fields": ["Title", "Icon image", "Step photo"]}}, {"changed": {"name": "capability how step", "object": "S\\u1ee9c kh\\u1ecfe m\\u00f4i tr\\u01b0\\u1eddng & m\\u00f4 h\\u00ecnh can thi\\u1ec7p ph\\u1ee5c h\\u1ed3i \\u2014 Thi\\u1ebft k\\u1ebf m\\u00f4 h\\u00ecnh ph\\u1ee5c h\\u1ed3i d\\u1ef1a tr\\u00ean b\\u1ed1i c\\u1ea3nh", "fields": ["Title", "Icon image", "Step photo"]}}, {"changed": {"name": "capability how step", "object": "S\\u1ee9c kh\\u1ecfe m\\u00f4i tr\\u01b0\\u1eddng & m\\u00f4 h\\u00ecnh can thi\\u1ec7p ph\\u1ee5c h\\u1ed3i \\u2014 K\\u1ebft n\\u1ed1i kh\\u00f4ng gian s\\u1ed1ng - l\\u00e0m vi\\u1ec7c - h\\u1ecdc t\\u1eadp v\\u1edbi s\\u1ee9c kh\\u1ecfe v\\u00e0 ch\\u1ea5t l\\u01b0\\u1ee3ng s\\u1ed1ng", "fields": ["Title", "Icon image", "Step photo"]}}, {"changed": {"name": "capability how step", "object": "S\\u1ee9c kh\\u1ecfe m\\u00f4i tr\\u01b0\\u1eddng & m\\u00f4 h\\u00ecnh can thi\\u1ec7p ph\\u1ee5c h\\u1ed3i \\u2014 Theo d\\u00f5i, \\u0111\\u00e1nh gi\\u00e1 v\\u00e0 c\\u1ea3i ti\\u1ebfn m\\u00f4 h\\u00ecnh can thi\\u1ec7p", "fields": ["Is active"]}}]	31	1
74	2026-07-18 22:19:47.659187+07	459e17ce-afce-4632-b14f-5e50e92cc94d	Sức khỏe môi trường & mô hình can thiệp phục hồi — case 01	2	[{"changed": {"fields": ["Case study image"]}}]	34	1
75	2026-07-18 22:23:50.580058+07	67d49005-a736-45a6-aa2c-21e5056b9b9c	Hệ thống y tế	1	[{"added": {}}]	44	1
76	2026-07-18 22:24:26.881757+07	67d49005-a736-45a6-aa2c-21e5056b9b9c	Hệ thống y tế	3		44	1
77	2026-07-18 22:26:55.645737+07	84998d33-9fbb-486f-b6be-7bea52ca274e	Hệ thống y tế	1	[{"added": {}}]	46	1
78	2026-07-18 22:27:29.245391+07	a2a9cac5-e458-400b-b88f-5c23309f1e3e	Vì sao dữ liệu bệnh viện chưa dễ chuyển thành nhiệm vụ KH,CN&ĐMST?	2	[{"changed": {"fields": ["Topics"]}}]	47	1
79	2026-07-18 23:22:39.945565+07	32c588b5-da2e-41a1-b498-0b08a6dbec44	Tri thức & Góc nhìn ngành	2	[{"changed": {"fields": ["Description"]}}, {"changed": {"name": "content type card", "object": "C\\u00f4ng b\\u1ed1 nghi\\u00ean c\\u1ee9u", "fields": ["Cover image"]}}, {"changed": {"name": "content type card", "object": "G\\u00f3c nh\\u00ecn ng\\u00e0nh", "fields": ["Cover image"]}}, {"changed": {"name": "content type card", "object": "T\\u00f3m l\\u01b0\\u1ee3c ch\\u00ednh s\\u00e1ch", "fields": ["Cover image"]}}, {"changed": {"name": "content type card", "object": "B\\u00e1o c\\u00e1o & t\\u00e0i li\\u1ec7u", "fields": ["Cover image"]}}, {"changed": {"name": "content type card", "object": "Tin IRDM", "fields": ["Cover image"]}}, {"changed": {"name": "content type card", "object": "S\\u1ef1 ki\\u1ec7n", "fields": ["Cover image"]}}]	45	1
85	2026-07-27 22:17:47.596645+07	ff2599d0-4f06-4a6e-80fd-2d8586b722f7	MẠNG LƯỚI NHÀ KHOA HỌC & CHUYÊN GIA LIÊN NGÀNH	2	[{"changed": {"fields": ["Hero background image"]}}]	62	1
86	2026-07-27 22:20:35.383385+07	ff2599d0-4f06-4a6e-80fd-2d8586b722f7	MẠNG LƯỚI NHÀ KHOA HỌC & CHUYÊN GIA LIÊN NGÀNH	2	[{"changed": {"fields": ["Hero eyebrow"]}}]	62	1
87	2026-07-27 22:45:02.793633+07	ff2599d0-4f06-4a6e-80fd-2d8586b722f7	MẠNG LƯỚI NHÀ KHOA HỌC & CHUYÊN GIA LIÊN NGÀNH	2	[{"changed": {"fields": ["Hero badge text"]}}]	62	1
88	2026-07-27 22:45:58.293551+07	ff2599d0-4f06-4a6e-80fd-2d8586b722f7	MẠNG LƯỚI NHÀ KHOA HỌC\\n& CHUYÊN GIA LIÊN NGÀNH	2	[{"changed": {"fields": ["Hero heading"]}}]	62	1
89	2026-07-27 22:47:01.047965+07	ff2599d0-4f06-4a6e-80fd-2d8586b722f7	MẠNG LƯỚI NHÀ KHOA HỌC\\n & CHUYÊN GIA LIÊN NGÀNH	2	[{"changed": {"fields": ["Hero heading"]}}]	62	1
90	2026-07-27 23:03:48.031227+07	ff2599d0-4f06-4a6e-80fd-2d8586b722f7	MẠNG LƯỚI NHÀ KHOA HỌC \r\n& CHUYÊN GIA LIÊN NGÀNH	2	[{"changed": {"fields": ["Hero heading", "Hero description"]}}]	62	1
91	2026-07-27 23:05:04.592363+07	ff2599d0-4f06-4a6e-80fd-2d8586b722f7	MẠNG LƯỚI NHÀ KHOA HỌC \r\n& CHUYÊN GIA LIÊN NGÀNH	2	[{"changed": {"fields": ["Hero description"]}}]	62	1
92	2026-07-27 23:23:11.706437+07	ff2599d0-4f06-4a6e-80fd-2d8586b722f7	MẠNG LƯỚI NHÀ KHOA HỌC \r\n& CHUYÊN GIA LIÊN NGÀNH	2	[{"changed": {"fields": ["Hero bottom badge logo"]}}]	62	1
93	2026-07-27 23:23:41.662577+07	ff2599d0-4f06-4a6e-80fd-2d8586b722f7	MẠNG LƯỚI NHÀ KHOA HỌC \r\n& CHUYÊN GIA LIÊN NGÀNH	2	[]	62	1
94	2026-07-28 21:44:37.665858+07	ff2599d0-4f06-4a6e-80fd-2d8586b722f7	MẠNG LƯỚI NHÀ KHOA HỌC & CHUYÊN GIA LIÊN NGÀNH	2	[{"changed": {"fields": ["Process section heading"]}}]	62	1
95	2026-07-28 22:01:49.701128+07	8b00b6e5-4263-492f-9dde-866efa62f049	PGS.TS. Phạm Đức Hùng	2	[{"changed": {"fields": ["Senior expert", "Featured"]}}]	64	1
96	2026-07-28 22:12:24.683064+07	0122e571-d2d9-4085-81ac-6cce3df19edf	Giáo dục	1	[{"added": {}}]	65	1
97	2026-07-28 22:12:49.354513+07	99a07c82-ec65-4666-b9a2-bb32ba7d1007	Chính sách	1	[{"added": {}}]	65	1
98	2026-07-28 22:13:59.415529+07	dea89a12-8647-4952-9b28-f6283f91e0c6	GS.TS. PGS. Lê Quang Minh	1	[{"added": {}}]	64	1
99	2026-07-28 22:14:14.973048+07	dea89a12-8647-4952-9b28-f6283f91e0c6	GS.TS. PGS. Lê Quang Minh	2	[{"changed": {"fields": ["Senior expert", "Featured", "Published"]}}]	64	1
100	2026-07-28 23:11:37.445644+07	6ddddd4a-fd62-4fe2-9c9d-a8c8cc740a08	Y tế & Sức khỏe cộng đồng	2	[{"changed": {"fields": ["Card icon", "Card tags"]}}]	66	1
104	2026-07-29 21:43:53.501004+07	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	Nhà khoa học & Chuyên gia	2	[{"added": {"name": "info group block", "object": "Nh\\u00e0 khoa h\\u1ecdc & Chuy\\u00ean gia \\u2014 Gi\\u00e1o d\\u1ee5c & Ph\\u00e1t tri\\u1ec3n n\\u0103ng l\\u1ef1c"}}, {"added": {"name": "info group block", "object": "Nh\\u00e0 khoa h\\u1ecdc & Chuy\\u00ean gia \\u2014 T\\u00e2m l\\u00fd & S\\u1ee9c kh\\u1ecfe t\\u00e2m th\\u1ea7n"}}, {"added": {"name": "info group block", "object": "Nh\\u00e0 khoa h\\u1ecdc & Chuy\\u00ean gia \\u2014 X\\u00e3 h\\u1ed9i h\\u1ecdc & Ch\\u00ednh s\\u00e1ch c\\u00f4ng"}}, {"added": {"name": "info group block", "object": "Nh\\u00e0 khoa h\\u1ecdc & Chuy\\u00ean gia \\u2014 M\\u00f4i tr\\u01b0\\u1eddng & Ph\\u00e1t tri\\u1ec3n b\\u1ec1n v\\u1eefng"}}, {"added": {"name": "info group block", "object": "Nh\\u00e0 khoa h\\u1ecdc & Chuy\\u00ean gia \\u2014 Qu\\u1ea3n tr\\u1ecb nh\\u00e2n s\\u1ef1 & T\\u1ed5 ch\\u1ee9c"}}, {"added": {"name": "info group block", "object": "Nh\\u00e0 khoa h\\u1ecdc & Chuy\\u00ean gia \\u2014 Qu\\u1ea3n tr\\u1ecb kinh t\\u1ebf & T\\u00e1c \\u0111\\u1ed9ng x\\u00e3 h\\u1ed9"}}]	71	1
105	2026-07-29 21:46:00.941544+07	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	Nhà khoa học & Chuyên gia	2	[{"changed": {"fields": ["Icon", "Show expert grid"]}}]	71	1
106	2026-07-29 21:47:28.398645+07	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	Nhà khoa học & Chuyên gia	2	[{"changed": {"fields": ["Show expert grid"]}}]	71	1
107	2026-07-29 21:53:59.443513+07	2a264ebc-0bdc-4264-9d99-d9384a9e060d	GS.TS.BS GS.TS.BS. Phạm Lê An	1	[{"added": {}}]	64	1
108	2026-07-29 22:01:51.19707+07	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	Nhà khoa học & Chuyên gia	2	[{"changed": {"fields": ["Show expert grid"]}}]	71	1
109	2026-07-29 22:04:33.072771+07	32ed1fd7-4f41-4fd7-a9a8-26ee188bee20	Y Tế & Quản Trị Y Tế	1	[{"added": {}}]	66	1
110	2026-07-29 22:05:04.254978+07	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	Nhà khoa học & Chuyên gia	2	[{"changed": {"fields": ["Expert research areas"]}}]	71	1
111	2026-07-29 22:08:33.820072+07	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	Nhà khoa học & Chuyên gia	2	[{"changed": {"fields": ["Show expert grid"]}}]	71	1
112	2026-07-29 23:37:01.821774+07	7303d1d2-d0d8-46ca-8e54-fc85cd6f3fe2	Footer (điều hướng dưới) — Liên hệ	2	[{"changed": {"fields": ["Is active"]}}]	10	1
113	2026-07-29 23:37:01.830678+07	e9f0d73d-575b-4cae-84e9-7bcaebaa97e5	Header (điều hướng trên) — Đối tác & Khách hàng	2	[{"changed": {"fields": ["Is active"]}}]	10	1
114	2026-07-29 23:37:01.831903+07	e07c5d49-73a2-4433-b9e3-aea9dae9d795	Header (điều hướng trên) — Liên hệ	2	[{"changed": {"fields": ["Is active"]}}]	10	1
115	2026-07-31 21:48:25.510574+07	81d5f380-1962-4904-bd36-7b02753156b3	PGS.TS. Phan Thị Mai Hương	2	[{"changed": {"fields": ["Senior expert", "Published", "Display order"]}}]	64	1
116	2026-07-31 22:01:24.658748+07	81d5f380-1962-4904-bd36-7b02753156b3	PGS.TS. Phan Thị Mai Hương	2	[{"changed": {"fields": ["Featured", "Published"]}}]	64	1
117	2026-07-31 22:01:52.341643+07	81d5f380-1962-4904-bd36-7b02753156b3	PGS.TS. Phan Thị Mai Hương	2	[{"changed": {"fields": ["Display order"]}}]	64	1
118	2026-07-31 22:02:26.24326+07	cc2c8d15-3a91-4485-81ef-8fcef5ea4a25	GS.TS. Nguyễn Văn An	2	[{"changed": {"fields": ["Senior expert", "Featured", "Published"]}}]	64	1
119	2026-07-31 22:02:56.161163+07	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	TS. Phạm Đức Trọng	2	[{"changed": {"fields": ["Senior expert", "Featured", "Display order"]}}]	64	1
120	2026-07-31 22:08:46.050286+07	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	TS. Phạm Đức Trọng	2	[{"changed": {"fields": ["Slug", "Position/role", "Avatar", "Short bio"]}}]	64	1
121	2026-07-31 22:12:20.441064+07	dd234f0e-9c5a-4f46-867d-ff0baf577aa2	Giáo dục	1	[{"added": {}}]	66	1
122	2026-07-31 22:12:37.703956+07	3fe7dd74-a8c3-4a2d-8c56-99a9f6252a62	Chinh sách	1	[{"added": {}}]	66	1
123	2026-07-31 22:12:51.400748+07	8e0deda3-e38f-4838-bf05-4c47dd741d41	Đại học	1	[{"added": {}}]	66	1
124	2026-07-31 22:13:16.081375+07	dea89a12-8647-4952-9b28-f6283f91e0c6	GS.TS. PGS. Lê Quang Minh	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
125	2026-07-31 22:14:13.009772+07	c497e561-8c38-485b-9d7d-339d425bfaf4	Wellbeing	1	[{"added": {}}]	66	1
126	2026-07-31 22:14:43.706067+07	039d7d34-cc8a-445c-b867-e29d717f87d4	Tâm lý	1	[{"added": {}}]	66	1
127	2026-07-31 22:15:04.924549+07	20ec8865-4874-4b20-8277-37d3b8540767	Nghiên cứu	1	[{"added": {}}]	66	1
128	2026-07-31 22:15:34.884332+07	6126b35f-9fe8-415d-a02b-dc84ede3c592	Xã hội học	1	[{"added": {}}]	66	1
129	2026-07-31 22:15:52.577471+07	7a09b2e0-85f3-42ab-9981-fc0d72083993	E-Learning	1	[{"added": {}}]	66	1
130	2026-07-31 22:16:26.495569+07	882a1399-69c4-47ab-86a2-32a120af5c39	Y tế	1	[{"added": {}}]	66	1
131	2026-07-31 22:16:50.454603+07	1780795b-b3c0-4b13-8fdd-a89e298c0f1e	Dữ liệu	1	[{"added": {}}]	66	1
132	2026-07-31 22:17:16.316255+07	11e1b709-54e6-4319-b847-713d7c5054d2	Điều phối	1	[{"added": {}}]	66	1
133	2026-07-31 22:17:33.62821+07	5d84a13c-abd5-4b17-b1f3-1a25ee853642	Chuyển đổi số	1	[{"added": {}}]	66	1
134	2026-07-31 22:19:16.291936+07	81d5f380-1962-4904-bd36-7b02753156b3	PGS.TS. Phan Thị Mai Hương	2	[{"changed": {"fields": ["Position/role", "Research areas"]}}]	64	1
135	2026-07-31 22:19:41.335128+07	4bfedb13-2989-40cb-a435-0c3314c0f5c3	PGS.TS. Trần Thị Bình	2	[{"changed": {"fields": ["Senior expert", "Featured", "Published"]}}]	64	1
136	2026-07-31 22:19:52.518592+07	162d63f1-2d74-436c-b497-12b6f71fd9f7	TS. Lê Minh Châu	2	[{"changed": {"fields": ["Senior expert", "Featured", "Published"]}}]	64	1
137	2026-07-31 22:20:13.131386+07	8b00b6e5-4263-492f-9dde-866efa62f049	PGS.TS. Phạm Đức Hùng	2	[{"changed": {"fields": ["Senior expert", "Featured", "Published"]}}]	64	1
138	2026-07-31 22:20:53.538941+07	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	TS. Phạm Đức Trọng	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
139	2026-07-31 22:23:16.128668+07	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	ThS. Tạ Thị Phấn	2	[{"changed": {"fields": ["Position/role", "Avatar", "Research areas", "Featured", "Senior expert", "Display order"]}}]	64	1
140	2026-07-31 22:25:46.871713+07	2787d14e-fde3-4220-a181-ac7a878f6626	Đào tạo	1	[{"added": {}}]	66	1
141	2026-07-31 22:26:57.377055+07	7a442992-c910-47e8-b627-afd0e7ce4c83	TS.DS. Trần Lê Diễm Anh	2	[{"changed": {"fields": ["Position/role", "Avatar", "Short bio", "Full bio", "Research areas", "Featured", "Senior expert"]}}]	64	1
142	2026-07-31 22:27:44.067137+07	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	ThS. Tạ Thị Phấn	2	[{"changed": {"fields": ["Short bio", "Display order"]}}]	64	1
143	2026-07-31 22:28:36.685376+07	81d5f380-1962-4904-bd36-7b02753156b3	PGS.TS. Phan Thị Mai Hương	2	[{"changed": {"fields": ["Short bio"]}}]	64	1
144	2026-07-31 22:41:48.974597+07	32ed1fd7-4f41-4fd7-a9a8-26ee188bee20	Y Tế & Quản Trị Y Tế	2	[{"changed": {"fields": ["Is active"]}}]	66	1
145	2026-07-31 22:41:48.975995+07	dd234f0e-9c5a-4f46-867d-ff0baf577aa2	Giáo dục	2	[{"changed": {"fields": ["Is active"]}}]	66	1
146	2026-07-31 22:41:48.976932+07	3fe7dd74-a8c3-4a2d-8c56-99a9f6252a62	Chinh sách	2	[{"changed": {"fields": ["Is active"]}}]	66	1
147	2026-07-31 22:41:48.977874+07	8e0deda3-e38f-4838-bf05-4c47dd741d41	Đại học	2	[{"changed": {"fields": ["Is active"]}}]	66	1
153	2026-07-31 22:41:48.981789+07	882a1399-69c4-47ab-86a2-32a120af5c39	Y tế	2	[{"changed": {"fields": ["Is active"]}}]	66	1
154	2026-07-31 22:41:48.98239+07	1780795b-b3c0-4b13-8fdd-a89e298c0f1e	Dữ liệu	2	[{"changed": {"fields": ["Is active"]}}]	66	1
155	2026-07-31 22:41:48.982963+07	11e1b709-54e6-4319-b847-713d7c5054d2	Điều phối	2	[{"changed": {"fields": ["Is active"]}}]	66	1
156	2026-07-31 22:41:48.983596+07	5d84a13c-abd5-4b17-b1f3-1a25ee853642	Chuyển đổi số	2	[{"changed": {"fields": ["Is active"]}}]	66	1
157	2026-07-31 22:41:48.984299+07	2787d14e-fde3-4220-a181-ac7a878f6626	Đào tạo	2	[{"changed": {"fields": ["Is active"]}}]	66	1
158	2026-07-31 22:41:48.985001+07	34eaf735-6af7-46b6-95ad-b817ca2c8556	Kinh tế học liên ngành	2	[{"changed": {"fields": ["Is active"]}}]	66	1
159	2026-07-31 22:41:48.985739+07	0abb7a07-8b4d-42c6-b3b2-cfb87c47e73b	Quản trị & Lãnh đạo	2	[{"changed": {"fields": ["Is active"]}}]	66	1
160	2026-07-31 22:41:48.986547+07	803303a1-5704-4823-a8b3-6b1b91efb7b5	Khoa học dữ liệu & AI	2	[{"changed": {"fields": ["Is active"]}}]	66	1
161	2026-07-31 22:41:48.987298+07	bf821fe1-65a6-4b88-b9d7-7b5eb938e41b	Chính sách công & Quản lý nhà nước	2	[{"changed": {"fields": ["Is active"]}}]	66	1
162	2026-07-31 22:41:48.988069+07	90153c0d-0e83-4a93-8396-7b10fc3a4054	Phát triển bền vững	2	[{"changed": {"fields": ["Is active"]}}]	66	1
163	2026-07-31 22:41:48.989026+07	df5fd549-8bbe-4ced-80e8-ff28b3f80acf	Giáo dục & Đào tạo	2	[{"changed": {"fields": ["Is active"]}}]	66	1
164	2026-07-31 22:41:48.990274+07	6ddddd4a-fd62-4fe2-9c9d-a8c8cc740a08	Y tế & Sức khỏe cộng đồng	2	[{"changed": {"fields": ["Is active"]}}]	66	1
165	2026-07-31 22:41:48.990835+07	ec6f9c69-fd83-47c7-9f15-c5ca7897823d	Công nghệ & Đổi mới sáng tạo	2	[{"changed": {"fields": ["Is active"]}}]	66	1
166	2026-07-31 22:49:17.571417+07	5739f6b8-20ea-40b7-8c3d-adeef7a07ed1	PGS.TS. Lê Quang Minh	3		64	1
167	2026-07-31 22:50:17.085817+07	dea89a12-8647-4952-9b28-f6283f91e0c6	GS.TS. Lê Quang Minh	2	[{"changed": {"fields": ["Full name"]}}]	64	1
168	2026-07-31 22:52:20.21068+07	0320a7f6-ea8e-434e-b1b5-b1492092aff7	PGS.TS. Lê Quang Minh	2	[{"changed": {"fields": ["Is active"]}}]	64	1
169	2026-07-31 23:35:51.514454+07	5e834e6b-7d63-4416-b323-80a1758300b1	GS.TS.BS. Phạm Lê An	2	[{"changed": {"fields": ["Position/role", "Short bio"]}}]	64	1
170	2026-07-31 23:36:30.171767+07	87104716-3c20-40b8-80b1-b0e8cc93b6e6	KHCN	1	[{"added": {}}]	66	1
171	2026-07-31 23:37:44.526264+07	5e834e6b-7d63-4416-b323-80a1758300b1	GS.TS.BS. Phạm Lê An	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
172	2026-07-31 23:40:01.984421+07	5fc008a3-db50-4ef7-b125-07a8492a3e3b	Kinh tế	1	[{"added": {}}]	66	1
173	2026-07-31 23:40:24.240512+07	767afe2b-67b0-4078-88ad-28d0d8bc209f	TS. Ngô Gia Lương	2	[{"changed": {"fields": ["Position/role", "Short bio", "Research areas"]}}]	64	1
174	2026-07-31 23:40:53.471456+07	767afe2b-67b0-4078-88ad-28d0d8bc209f	TS. Ngô Gia Lương	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
175	2026-07-31 23:41:06.026755+07	767afe2b-67b0-4078-88ad-28d0d8bc209f	TS. Ngô Gia Lương	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
176	2026-07-31 23:48:12.947339+07	d65bf112-2363-4863-90af-c2290e38552a	TS. Nguyễn Minh Nhựt	2	[{"changed": {"fields": ["Position/role", "Avatar", "Short bio", "Research areas"]}}]	64	1
177	2026-07-31 23:49:02.271673+07	d65bf112-2363-4863-90af-c2290e38552a	TS. Nguyễn Minh Nhựt	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
178	2026-07-31 23:51:56.777075+07	577f79a5-e422-41bf-9e99-0724e93c88ff	TS. Phạm Thị Thúy	2	[{"changed": {"fields": ["Position/role", "Avatar", "Short bio", "Research areas"]}}]	64	1
179	2026-07-31 23:52:09.111983+07	fd76c511-20a5-4b3e-88db-7c5e3008b3d9	Kỹ năng	1	[{"added": {}}]	66	1
180	2026-07-31 23:52:32.978545+07	577f79a5-e422-41bf-9e99-0724e93c88ff	TS. Phạm Thị Thúy	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
181	2026-07-31 23:56:10.327262+07	55dae78f-50c7-4bec-8975-998d7d55dba2	PGS.TS. Nguyễn Thanh Bình	2	[{"changed": {"fields": ["Position/role", "Avatar", "Short bio"]}}]	64	1
182	2026-07-31 23:56:21.164523+07	faa8b82b-f913-47f9-8dde-d0637e3ccf87	AI	1	[{"added": {}}]	66	1
183	2026-07-31 23:57:06.025187+07	55dae78f-50c7-4bec-8975-998d7d55dba2	PGS.TS. Nguyễn Thanh Bình	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
184	2026-07-31 23:57:22.330598+07	58fe82ec-38e4-4e5d-99d9-60204eae6ae3	Công nghệ	1	[{"added": {}}]	66	1
185	2026-07-31 23:59:39.201426+07	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	TS. Trần Thanh Tâm	2	[{"changed": {"fields": ["Position/role", "Avatar", "Short bio"]}}]	64	1
186	2026-07-31 23:59:52.457769+07	92b94ac8-987f-453c-b990-9a61951734c3	Môi trường	1	[{"added": {}}]	66	1
187	2026-08-01 00:00:14.944393+07	2126df8a-2a6c-4d17-9257-df2fa2be3367	ESG	1	[{"added": {}}]	66	1
188	2026-08-01 00:00:27.070173+07	f130202b-4bbb-4402-9258-85d359ba9762	Bền vững	1	[{"added": {}}]	66	1
189	2026-08-01 00:00:55.635431+07	58fe82ec-38e4-4e5d-99d9-60204eae6ae3	Công nghệ	2	[{"changed": {"fields": ["Is active"]}}]	66	1
190	2026-08-01 00:00:55.637327+07	92b94ac8-987f-453c-b990-9a61951734c3	Môi trường	2	[{"changed": {"fields": ["Is active"]}}]	66	1
191	2026-08-01 00:01:17.441351+07	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	TS. Trần Thanh Tâm	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
192	2026-08-01 00:03:33.757779+07	0b8fec46-7f9c-485e-9e61-2e36704a3d88	ThS. Ngô Minh Uy	2	[{"changed": {"fields": ["Position/role", "Avatar", "Short bio", "Research areas"]}}]	64	1
193	2026-08-01 08:34:01.659685+07	c5b52559-8e8c-4b91-a25f-51999547292f	ThS. Nguyễn Quốc Định	3		64	1
194	2026-08-01 08:50:48.530486+07	dea89a12-8647-4952-9b28-f6283f91e0c6	GS.TS. Lê Quang Minh	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
195	2026-08-01 08:52:27.417738+07	dea89a12-8647-4952-9b28-f6283f91e0c6	GS.TS. Lê Quang Minh	2	[]	64	1
196	2026-08-01 08:59:36.774631+07	dea89a12-8647-4952-9b28-f6283f91e0c6	GS.TS. Lê Quang Minh	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
197	2026-08-01 21:42:55.917+07	dea89a12-8647-4952-9b28-f6283f91e0c6	GS.TS. Lê Quang Minh	2	[{"changed": {"fields": ["Card specialty label"]}}]	64	1
198	2026-08-01 21:58:00.205388+07	5e834e6b-7d63-4416-b323-80a1758300b1	GS.TS.BS. Phạm Lê An	2	[{"changed": {"fields": ["Card specialty label"]}}]	64	1
199	2026-08-01 21:59:10.355771+07	7a442992-c910-47e8-b627-afd0e7ce4c83	TS.DS. Trần Lê Diễm Anh	2	[{"changed": {"fields": ["Card specialty label"]}}]	64	1
200	2026-08-01 22:00:54.9974+07	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	TS. Trần Thanh Tâm	2	[{"changed": {"fields": ["Card specialty label"]}}]	64	1
201	2026-08-01 22:02:13.689542+07	0b8fec46-7f9c-485e-9e61-2e36704a3d88	ThS. Ngô Minh Uy	2	[{"changed": {"fields": ["Card specialty label"]}}]	64	1
202	2026-08-01 22:02:56.193539+07	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	ThS. Tạ Thị Phấn	2	[{"changed": {"fields": ["Card specialty label"]}}]	64	1
203	2026-08-01 22:59:52.476904+07	90d6d402-f468-4cab-8fdd-3a6b41815638	VE IRDM	3		88	1
204	2026-08-01 23:01:34.839161+07	52922ea4-afcd-4a8b-9103-c39885043dfc	VỀ IRDM	2	[{"changed": {"fields": ["Description", "Background image"]}}]	88	1
205	2026-08-01 23:03:58.402098+07	52922ea4-afcd-4a8b-9103-c39885043dfc	VỀ IRDM	2	[{"changed": {"fields": ["Description"]}}]	88	1
206	2026-08-01 23:22:14.273833+07	52922ea4-afcd-4a8b-9103-c39885043dfc	VỀ IRDM	2	[{"changed": {"fields": ["Quote icon"]}}]	88	1
207	2026-08-01 23:43:28.073358+07	9701925a-ecd4-4e3b-9ab1-719933bcdb6a	IRDM LÀ AI?	2	[{"changed": {"fields": ["Large image"]}}, {"changed": {"name": "highlight card", "object": "K\\u1ebft n\\u1ed1i tri th\\u1ee9c khoa h\\u1ecdc", "fields": ["Icon image"]}}, {"changed": {"name": "highlight card", "object": "T\\u1ea1o b\\u1eb1ng ch\\u1ee9ng t\\u1eeb d\\u1eef li\\u1ec7u", "fields": ["Icon image"]}}, {"changed": {"name": "highlight card", "object": "\\u0110\\u1ed3ng thi\\u1ebft k\\u1ebf gi\\u1ea3i ph\\u00e1p c\\u00f3 th\\u1ec3 tri\\u1ec3n khai", "fields": ["Icon image"]}}]	91	1
208	2026-08-02 00:07:50.9625+07	9701925a-ecd4-4e3b-9ab1-719933bcdb6a	IRDM LÀ AI?	2	[{"changed": {"fields": ["Background image"]}}]	91	1
209	2026-08-02 10:06:33.005831+07	854d259f-9009-4c62-9586-c0b48993357e	VÌ SAO IRDM TỒN TẠI?	2	[{"changed": {"fields": ["Description", "Diagram image"]}}]	83	1
210	2026-08-02 10:19:55.806413+07	854d259f-9009-4c62-9586-c0b48993357e	VÌ SAO IRDM TỒN TẠI?	2	[{"changed": {"fields": ["Quote icon image"]}}]	83	1
211	2026-08-02 10:38:38.897457+07	288f5bd9-1db1-4e69-91d3-42137d93f3bf	TẦM NHÌN — SỨ MỆNH — TRIẾT LÝ PHÁT TRIỂN	3		99	1
212	2026-08-02 10:39:58.139148+07	b07dcc08-76e9-4243-9ed5-740590fa1e95	TẦM NHÌN - SỨ MỆNH - TRIẾT LÝ PHÁT TRIỂN	2	[{"changed": {"name": "vision/mission card", "object": "Vision: T\\u1ea7m nh\\u00ecn", "fields": ["Icon image"]}}]	99	1
213	2026-08-02 10:40:46.331412+07	b07dcc08-76e9-4243-9ed5-740590fa1e95	TẦM NHÌN - SỨ MỆNH - TRIẾT LÝ PHÁT TRIỂN	2	[{"changed": {"name": "vision/mission card", "object": "Mission: S\\u1ee9 m\\u1ec7nh", "fields": ["Icon image"]}}]	99	1
214	2026-08-02 10:41:34.570068+07	b07dcc08-76e9-4243-9ed5-740590fa1e95	TẦM NHÌN - SỨ MỆNH - TRIẾT LÝ PHÁT TRIỂN	2	[{"changed": {"name": "vision/mission card", "object": "Development Philosophy: Tri\\u1ebft l\\u00fd ph\\u00e1t tri\\u1ec3n", "fields": ["Icon image"]}}]	99	1
215	2026-08-02 10:42:19.477185+07	b07dcc08-76e9-4243-9ed5-740590fa1e95	TẦM NHÌN - SỨ MỆNH - TRIẾT LÝ PHÁT TRIỂN	2	[{"added": {"name": "vision/mission panel icon", "object": "Icon 0"}}]	99	1
216	2026-08-02 10:45:31.521445+07	b07dcc08-76e9-4243-9ed5-740590fa1e95	TẦM NHÌN - SỨ MỆNH - TRIẾT LÝ PHÁT TRIỂN	2	[{"added": {"name": "vision/mission panel icon", "object": "Icon 0"}}, {"added": {"name": "vision/mission panel icon", "object": "Icon 0"}}, {"added": {"name": "vision/mission panel icon", "object": "Icon 0"}}]	99	1
217	2026-08-02 11:27:23.38826+07	53828d8c-6a19-4fc9-b6f9-112b2137cf08	Chính trực	2	[{"changed": {"fields": ["Icon image"]}}]	77	1
218	2026-08-02 11:27:51.576441+07	9ab1f034-fa9f-4c7f-8077-54ba27064736	Thấu cảm	2	[{"changed": {"fields": ["Icon image"]}}]	77	1
219	2026-08-02 11:28:25.627556+07	acaf91a2-ebb4-4310-8585-e8a6b1e7e08c	Cam kết phát triển bền vững	2	[{"changed": {"fields": ["Icon image"]}}]	77	1
220	2026-08-02 11:28:42.393177+07	b532db23-20e1-4ab4-ac5b-809c762ef650	Chuyển hóa	2	[{"changed": {"fields": ["Icon image"]}}]	77	1
221	2026-08-02 11:36:45.370312+07	902f3c24-8d15-448d-833e-0c34869cdabd	Pháp lý và phạm vi hoạt động	2	[{"changed": {"fields": ["Title"]}}]	92	1
222	2026-08-02 11:48:13.065047+07	902f3c24-8d15-448d-833e-0c34869cdabd	Pháp lý và phạm vi hoạt động	3		92	1
223	2026-08-02 11:48:51.549285+07	db58ab1f-0c0b-4e80-9584-e606d9722293	PHÁP LÝ VÀ PHẠM VI HOẠT ĐỘNG	2	[{"changed": {"fields": ["Left image"]}}]	92	1
224	2026-08-02 14:14:56.298651+07	ff301a18-4464-49bd-ad62-cfae30c0b2a9	ĐỐI TÁC NHẬN ĐƯỢC GÌ KHI LÀM VIỆC VỚI IRDM?	2	[{"changed": {"fields": ["Background decoration"]}}]	95	1
225	2026-08-02 14:28:23.522936+07	ff301a18-4464-49bd-ad62-cfae30c0b2a9	ĐỐI TÁC NHẬN ĐƯỢC GÌ KHI LÀM VIỆC VỚI IRDM?	2	[{"changed": {"name": "partner benefit", "object": "Nghi\\u00ean c\\u1ee9u chuy\\u00ean s\\u00e2u", "fields": ["Icon image"]}}, {"changed": {"name": "partner benefit", "object": "V\\u1ea5n \\u0111\\u1ec1 \\u0111\\u01b0\\u1ee3c l\\u00e0m r\\u00f5 tr\\u01b0\\u1edbc khi \\u0111\\u1ec1 xu\\u1ea5t gi\\u1ea3i ph\\u00e1p", "fields": ["Icon image"]}}, {"changed": {"name": "partner benefit", "object": "M\\u1ea1ng l\\u01b0\\u1edbi chuy\\u00ean gia", "fields": ["Icon image"]}}, {"changed": {"name": "partner benefit", "object": "D\\u1eef li\\u1ec7u, kh\\u1ea3o s\\u00e1t v\\u00e0 kinh nghi\\u1ec7m th\\u1ef1c ti\\u1ec5n \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c th\\u00e0nh b\\u1eb1ng ch\\u1ee9ng", "fields": ["Icon image"]}}]	95	1
226	2026-08-02 20:39:50.004674+07	ff301a18-4464-49bd-ad62-cfae30c0b2a9	ĐỐI TÁC NHẬN ĐƯỢC GÌ KHI LÀM VIỆC VỚI IRDM?	2	[]	95	1
227	2026-08-02 20:40:21.6506+07	ff301a18-4464-49bd-ad62-cfae30c0b2a9	ĐỐI TÁC NHẬN ĐƯỢC GÌ KHI LÀM VIỆC VỚI IRDM?	2	[{"changed": {"name": "partner benefit", "object": "V\\u1ea5n \\u0111\\u1ec1 \\u0111\\u01b0\\u1ee3c l\\u00e0m r\\u00f5 tr\\u01b0\\u1edbc khi \\u0111\\u1ec1 xu\\u1ea5t gi\\u1ea3i ph\\u00e1p", "fields": ["Icon image"]}}]	95	1
228	2026-08-02 20:41:13.543919+07	ff301a18-4464-49bd-ad62-cfae30c0b2a9	ĐỐI TÁC NHẬN ĐƯỢC GÌ KHI LÀM VIỆC VỚI IRDM?	2	[{"changed": {"name": "partner benefit", "object": "D\\u1eef li\\u1ec7u, kh\\u1ea3o s\\u00e1t v\\u00e0 kinh nghi\\u1ec7m th\\u1ef1c ti\\u1ec5n \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c th\\u00e0nh b\\u1eb1ng ch\\u1ee9ng", "fields": ["Icon image"]}}, {"changed": {"name": "partner benefit", "object": "Gi\\u1ea3i ph\\u00e1p \\u0111\\u01b0\\u1ee3c \\u0111\\u00f3ng thi\\u1ebft k\\u1ebf theo b\\u1ed1i c\\u1ea3nh v\\u1eadn h\\u00e0nh", "fields": ["Icon image"]}}]	95	1
229	2026-08-02 20:42:31.831836+07	ff301a18-4464-49bd-ad62-cfae30c0b2a9	ĐỐI TÁC NHẬN ĐƯỢC GÌ KHI LÀM VIỆC VỚI IRDM?	2	[{"changed": {"name": "partner benefit", "object": "T\\u1ed5 h\\u1ee3p chuy\\u00ean gia \\u0111\\u01b0\\u1ee3c huy \\u0111\\u1ed9ng theo \\u0111\\u00fang b\\u00e0i to\\u00e1n", "fields": ["Icon image"]}}, {"changed": {"name": "partner benefit", "object": "K\\u1ebft qu\\u1ea3 \\u0111\\u01b0\\u1ee3c theo d\\u00f5i, \\u0111\\u00e1nh gi\\u00e1 v\\u00e0 chuy\\u1ec3n h\\u00f3a th\\u00e0nh gi\\u00e1 tr\\u1ecb", "fields": ["Icon image"]}}, {"changed": {"name": "partner benefit", "object": "T\\u01b0 v\\u1ea5n chi\\u1ebfn l\\u01b0\\u1ee3c v\\u1edbi g\\u00f3c nh\\u00ecn th\\u1ef1c ti\\u1ec5n", "fields": ["Icon image"]}}]	95	1
230	2026-08-02 22:01:43.737123+07	a95d5674-6c4d-402a-ab03-c22767c98167	Hội đồng khoa học	2	[{"changed": {"fields": ["Icon image"]}}]	103	1
231	2026-08-02 22:04:44.740349+07	a33d33cb-157c-4550-b82a-cfd0b62a3a4a	TỔ CHỨC VÀ MẠNG LƯỚI CHUYÊN MÔN	2	[{"changed": {"name": "org structure card", "object": "C\\u01a1 c\\u1ea5u t\\u1ed5 ch\\u1ee9c", "fields": ["Icon image"]}}, {"changed": {"name": "org structure card", "object": "Nh\\u00e0 khoa h\\u1ecdc & chuy\\u00ean gia", "fields": ["Icon image"]}}, {"changed": {"name": "org structure card", "object": "Gi\\u1ea3ng vi\\u00ean & Chuy\\u00ean gia h\\u1ecdc t\\u1eadp", "fields": ["Icon image"]}}, {"changed": {"name": "org structure card", "object": "Hi\\u1ec7p h\\u1ed9i & M\\u1ea1ng l\\u01b0\\u1edbi chuy\\u00ean m\\u00f4n", "fields": ["Icon image"]}}]	104	1
316	2026-08-05 23:46:34.464468+07	154ee17b-3296-4023-ad7b-7505f476ba25	Chính sách công	1	[{"added": {}}]	67	1
318	2026-08-05 23:47:37.406561+07	79309c79-5bbf-4d49-8e20-d38e7506ea21	Strategic Planning	1	[{"added": {}}]	67	1
232	2026-08-02 22:08:50.552571+07	a33d33cb-157c-4550-b82a-cfd0b62a3a4a	TỔ CHỨC VÀ MẠNG LƯỚI CHUYÊN MÔN	2	[{"changed": {"name": "org structure card", "object": "C\\u01a1 c\\u1ea5u t\\u1ed5 ch\\u1ee9c", "fields": ["View more URL"]}}, {"changed": {"name": "org structure card", "object": "Gi\\u1ea3ng vi\\u00ean & Chuy\\u00ean gia h\\u1ecdc t\\u1eadp", "fields": ["View more URL"]}}]	104	1
233	2026-08-02 22:09:20.772901+07	a95d5674-6c4d-402a-ab03-c22767c98167	Hội đồng khoa học	2	[{"changed": {"fields": ["View more URL"]}}]	103	1
234	2026-08-02 22:36:20.870235+07	724a75ec-8644-4c69-8ed9-919a05d92832	IRDM ĐỒNG HÀNH CÙNG NHỮNG AI?	3		97	1
235	2026-08-02 22:38:36.754564+07	8ad2e13a-afda-4a41-bc4c-c9f044838025	IRDM ĐỒNG HÀNH VỚI NHỮNG AI?	2	[{"changed": {"name": "target audience", "object": "C\\u01a1 quan qu\\u1ea3n l\\u00fd", "fields": ["Icon image", "Description"]}}, {"changed": {"name": "target audience", "object": "H\\u1ec7 th\\u1ed1ng y t\\u1ebf", "fields": ["Icon image"]}}, {"changed": {"name": "target audience", "object": "Tr\\u01b0\\u1eddng \\u0111\\u1ea1i h\\u1ecdc", "fields": ["Icon image"]}}, {"changed": {"name": "target audience", "object": "Doanh nghi\\u1ec7p", "fields": ["Icon image"]}}, {"changed": {"name": "target audience", "object": "T\\u1ed5 ch\\u1ee9c qu\\u1ed1c t\\u1ebf", "fields": ["Icon image"]}}]	97	1
236	2026-08-02 23:05:11.452145+07	dfab852c-4dd8-44dc-b28e-b47c2a5ec61c	BẰNG CHỨNG NĂNG LỰC VÀ HỆ SINH THÁI HỢP  TÁC	2	[{"changed": {"fields": ["Section label", "Title", "Hub label"]}}]	84	1
237	2026-08-02 23:55:06.071474+07	347c185d-60b7-42e7-9ef9-c321af3b968b	KẾT NỐI VỚI IRDM	2	[{"changed": {"fields": ["Background image"]}}]	76	1
238	2026-08-03 22:36:06.352224+07	99b923e5-bc93-482a-a0a7-25eb89887fd0	Hội đồng khoa học	2	[{"changed": {"name": "info group member", "object": "H\\u1ed9i \\u0111\\u1ed3ng khoa h\\u1ecdc \\u2014 L\\u00ea Quang Minh", "fields": ["Avatar"]}}, {"changed": {"name": "info group member", "object": "H\\u1ed9i \\u0111\\u1ed3ng khoa h\\u1ecdc \\u2014 T\\u1ea1 Th\\u1ecb Ph\\u1ea5n", "fields": ["Avatar"]}}]	71	1
239	2026-08-03 22:38:26.197909+07	ce32d91f-3db1-4598-987d-470416d8c72c	TS.DS. Trần Lê Diễm Anh	3		64	1
240	2026-08-03 22:40:33.488374+07	6a85721a-54d2-4a99-9426-c22f31b4b26a	BS.CKII. Huỳnh Anh Lan	2	[{"changed": {"fields": ["Position/role", "Avatar"]}}]	64	1
241	2026-08-03 22:43:43.647936+07	1548f376-7bd3-455c-a18c-6ae017a08383	Mr. Trần Trung Hiếu	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
242	2026-08-03 22:45:11.369803+07	ac818b90-cbb3-472a-a4ad-56cd14fc32b6	TS. Trần Trung Hiếu	3		64	1
243	2026-08-03 22:45:36.181615+07	356539d8-b54a-409f-8240-cbdd65692b91	TS. Bùi Hồng Quân	3		64	1
244	2026-08-03 22:46:49.923479+07	032459a4-fa62-412f-8b8e-88e11b17a173	TS. Bùi Hồng Quân	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
245	2026-08-03 22:47:16.354007+07	756e958f-d731-40c0-b1e6-c4475fec800d	TS. Nguyễn Thị Minh	3		64	1
246	2026-08-03 22:47:53.18519+07	eb0fa648-67ab-4716-84ae-9e28c7e9e779	TS. Nguyễn Thị Minh	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
247	2026-08-03 22:48:14.138966+07	d93dcc25-c39f-4030-89c6-f6e2580baa4f	ThS. Lương Dũng Nhân	3		64	1
248	2026-08-03 22:49:03.91801+07	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	ThS. Lương Dũng Nhân	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
249	2026-08-03 22:49:24.866792+07	0cfaaf99-ace3-4c89-904f-f37040c149e0	ThS. Lê Ngọc Anh Khoa	3		64	1
250	2026-08-03 22:50:04.804181+07	c262cfba-f4c8-4c29-b13b-924f195aace4	ThS. Lê Ngọc Anh Khoa	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
251	2026-08-03 22:51:10.176047+07	71f9729b-ec4c-414c-b7ee-aa76589d75a5	ThS. Trịnh Thùy Linh	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
252	2026-08-03 22:51:43.887021+07	71f9729b-ec4c-414c-b7ee-aa76589d75a5	ThS. Trịnh Thùy Linh	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
253	2026-08-03 22:52:29.875173+07	577f79a5-e422-41bf-9e99-0724e93c88ff	TS. Phạm Thị Thúy	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
254	2026-08-03 22:53:39.321012+07	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	ThS. Tạ Thị Phấn	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
255	2026-08-03 22:56:53.561716+07	b76598b7-de62-495f-b239-f9e921f05fd6	ThS. Tạ Thị Phấn	3		64	1
256	2026-08-03 22:58:05.524335+07	eee0c197-271d-40ad-bccc-56d46dd429c5	TS. John Stiles	3		64	1
257	2026-08-03 22:58:57.635361+07	2316b863-f75c-4f1c-947d-c92ff5630f80	TS. John Stiles	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
258	2026-08-03 22:59:18.174479+07	59731a6e-0002-4aaf-b5a1-bc3d3dbcc951	ThS. Nguyễn Thị Bích Hà	3		64	1
259	2026-08-03 23:00:15.044055+07	b2f5c1ea-5835-4c1e-9c29-805b2c2d322b	ThS. Nguyễn Thị Bích Hà	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
260	2026-08-03 23:01:56.132805+07	e4f1b232-f338-4822-a71a-dc7108e34ff2	TS. Nguyễn Hữu Hoàng	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
261	2026-08-03 23:03:06.860519+07	f51aed81-7ebf-428f-bdb4-70b0d54514a2	ThS. Lê Ngọc Thiên Phương	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
262	2026-08-03 23:03:44.475659+07	b89d62ba-5f31-476f-9f77-300836854969	ThS. Bùi Thanh Tùng	3		64	1
263	2026-08-03 23:04:22.792899+07	9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	ThS. Bùi Thanh Tùng	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
264	2026-08-03 23:05:23.60283+07	616eb172-f424-4e66-b503-be9b2bf1aa14	ThS.BS. Ngô Văn Huy	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
265	2026-08-03 23:06:21.442074+07	a14a0b20-9b70-4821-970e-e6f505bdbcb9	Mr. Trần Tuấn Hùng	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
266	2026-08-03 23:07:39.757555+07	9612b096-9176-4200-95fd-60cb8495d5f2	Ms. Trần Thị Thế Thanh	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
267	2026-08-03 23:08:52.761153+07	722d2f3a-b0f0-48c0-a162-e69c53923476	ThS. Nguyễn Quốc Định	2	[{"changed": {"fields": ["Slug"]}}]	64	1
268	2026-08-03 23:14:18.427611+07	e23ebc4e-6d8d-4070-b204-51f85793e29e	Hiệp hội & Mạng lưới chuyên môn	2	[{"changed": {"name": "association", "object": "Hi\\u1ec7p h\\u1ed9i & M\\u1ea1ng l\\u01b0\\u1edbi chuy\\u00ean m\\u00f4n \\u2014 M\\u1ea1ng l\\u01b0\\u1edbi Trung t\\u00e2m \\u0110\\u00e0o t\\u1ea1o Xu\\u1ea5t s\\u1eafc v\\u00e0 T\\u00e0i n\\u0103ng v\\u1ec1 C\\u00f4ng ngh", "fields": ["Logo"]}}, {"changed": {"name": "association", "object": "Hi\\u1ec7p h\\u1ed9i & M\\u1ea1ng l\\u01b0\\u1edbi chuy\\u00ean m\\u00f4n \\u2014 Chi h\\u1ed9i V\\u0103n ph\\u00f2ng C\\u00f4ng t\\u00e1c ph\\u00eda Nam c\\u1ee7a H\\u1ed9i X\\u00e3 h\\u1ed9i h\\u1ecdc Vi\\u1ec7t ", "fields": ["Logo"]}}]	71	1
269	2026-08-03 23:17:25.753765+07	e23ebc4e-6d8d-4070-b204-51f85793e29e	Hiệp hội & Mạng lưới chuyên môn	2	[{"changed": {"name": "association", "object": "Hi\\u1ec7p h\\u1ed9i & M\\u1ea1ng l\\u01b0\\u1edbi chuy\\u00ean m\\u00f4n \\u2014 M\\u1ea1ng l\\u01b0\\u1edbi Trung t\\u00e2m \\u0110\\u00e0o t\\u1ea1o Xu\\u1ea5t s\\u1eafc v\\u00e0 T\\u00e0i n\\u0103ng v\\u1ec1 C\\u00f4ng ngh", "fields": ["Logo"]}}]	71	1
270	2026-08-03 23:21:05.249631+07	e23ebc4e-6d8d-4070-b204-51f85793e29e	Hiệp hội & Mạng lưới chuyên môn	2	[{"changed": {"name": "association", "object": "Hi\\u1ec7p h\\u1ed9i & M\\u1ea1ng l\\u01b0\\u1edbi chuy\\u00ean m\\u00f4n \\u2014 M\\u1ea1ng l\\u01b0\\u1edbi Trung t\\u00e2m \\u0110\\u00e0o t\\u1ea1o Xu\\u1ea5t s\\u1eafc v\\u00e0 T\\u00e0i n\\u0103ng v\\u1ec1 C\\u00f4ng ngh", "fields": ["Icon background color (hex)"]}}]	71	1
317	2026-08-05 23:47:24.89511+07	26d0af55-3d57-4a63-8b1a-db225d483d83	Quản lý môi trường	1	[{"added": {}}]	67	1
271	2026-08-03 23:27:53.993605+07	e23ebc4e-6d8d-4070-b204-51f85793e29e	Hiệp hội & Mạng lưới chuyên môn	2	[{"changed": {"name": "association", "object": "Hi\\u1ec7p h\\u1ed9i & M\\u1ea1ng l\\u01b0\\u1edbi chuy\\u00ean m\\u00f4n \\u2014 M\\u1ea1ng l\\u01b0\\u1edbi Trung t\\u00e2m \\u0110\\u00e0o t\\u1ea1o Xu\\u1ea5t s\\u1eafc v\\u00e0 T\\u00e0i n\\u0103ng v\\u1ec1 C\\u00f4ng ngh", "fields": ["Logo"]}}]	71	1
272	2026-08-04 21:30:21.076673+07	2a264ebc-0bdc-4264-9d99-d9384a9e060d	GS.TS.BS GS.TS.BS. Phạm Lê An	3		64	1
273	2026-08-04 21:33:55.289997+07	5e834e6b-7d63-4416-b323-80a1758300b1	GS.TS.BS. Phạm Lê An	2	[{"changed": {"fields": ["Short bio", "Full bio", "Experience highlights", "Engagement types", "Knowledge topics"]}}]	64	1
274	2026-08-04 22:22:33.953721+07	5e834e6b-7d63-4416-b323-80a1758300b1	GS.TS.BS. Phạm Lê An	2	[{"changed": {"fields": ["Ticker bar text"]}}]	64	1
275	2026-08-04 22:57:10.259046+07	5e834e6b-7d63-4416-b323-80a1758300b1	GS.TS.BS. Phạm Lê An	2	[{"changed": {"fields": ["Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Notable projects"]}}]	64	1
276	2026-08-04 22:59:13.627759+07	5e834e6b-7d63-4416-b323-80a1758300b1	GS.TS.BS. Phạm Lê An	2	[{"changed": {"fields": ["Discussion topics", "Notable projects"]}}]	64	1
277	2026-08-04 23:08:22.369569+07	7a442992-c910-47e8-b627-afd0e7ce4c83	TS.DS. Trần Lê Diễm Anh	2	[{"changed": {"fields": ["Organization", "Short bio", "Hero tagline", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects"]}}]	64	1
278	2026-08-04 23:19:53.723424+07	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	ThS. Tạ Thị Phấn	2	[{"changed": {"fields": ["Organization", "Avatar", "Short bio", "Hero tagline", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types", "Knowledge topics"]}}]	64	1
279	2026-08-05 00:08:37.88763+07	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	ThS. Tạ Thị Phấn	2	[{"changed": {"fields": ["Avatar", "Hero avatar"]}}]	64	1
280	2026-08-05 22:14:03.848588+07	a78667f1-f6cc-407c-8079-eb9a2beed0d1	GS.TS.DS. Nguyễn Đức Tuấn	2	[{"changed": {"fields": ["Slug", "Position/role", "Short bio", "Full bio", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Research areas", "Card specialty label"]}}]	64	1
281	2026-08-05 22:15:32.804245+07	a78667f1-f6cc-407c-8079-eb9a2beed0d1	GS.TS.DS. Nguyễn Đức Tuấn	2	[{"changed": {"fields": ["Avatar", "Hero avatar"]}}]	64	1
282	2026-08-05 22:17:46.22786+07	64116546-b287-4874-a917-60c790eded7f	Kiểm nghiệm thuốc	1	[{"added": {}}]	67	1
283	2026-08-05 22:20:18.960861+07	4d3bf782-5347-40da-928b-3d89be9c2174	Phân tích dược chất	1	[{"added": {}}]	67	1
284	2026-08-05 22:20:35.819574+07	64116546-b287-4874-a917-60c790eded7f	Kiểm nghiệm thuốc	2	[{"changed": {"fields": ["Is active"]}}]	67	1
285	2026-08-05 22:20:58.906424+07	bcd6a166-de4e-4fc6-a665-22ac90ae6f29	Dược phẩm	1	[{"added": {}}]	67	1
286	2026-08-05 22:21:19.00728+07	2aa1d421-e6fd-49cb-9018-8adb4c878dc3	Quản lý chất lượng giáo dục	1	[{"added": {}}]	67	1
287	2026-08-05 22:21:37.737146+07	dfc52589-b833-45aa-b480-98e622f460ea	Giáo dục đại học	1	[{"added": {}}]	67	1
288	2026-08-05 22:21:48.68744+07	7435e3c0-aa94-47f7-a7f6-0850d4dd5ddb	HPLC	1	[{"added": {}}]	67	1
289	2026-08-05 22:22:06.380484+07	e864fd9d-7062-4f0c-b1ff-0a76f224282e	LC-MS/MS	1	[{"added": {}}]	67	1
290	2026-08-05 22:22:22.679951+07	004bda91-e522-4bdd-a795-1ad2fa053001	Dược điển	1	[{"added": {}}]	67	1
291	2026-08-05 22:22:33.564006+07	b0f1d473-6e9d-406d-83fc-70c74eecfa01	Pharmaceutical Analysis	1	[{"added": {}}]	67	1
292	2026-08-05 22:22:47.941323+07	9a1d5c83-1ad1-4b15-ad45-8250e3b97f70	Quality Assurance	1	[{"added": {}}]	67	1
293	2026-08-05 22:23:14.165557+07	a78667f1-f6cc-407c-8079-eb9a2beed0d1	GS.TS.DS. Nguyễn Đức Tuấn	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
294	2026-08-05 22:24:36.753407+07	a78667f1-f6cc-407c-8079-eb9a2beed0d1	GS.TS.DS. Nguyễn Đức Tuấn	2	[{"changed": {"fields": ["Engagement types"]}}]	64	1
295	2026-08-05 22:29:31.585682+07	55dae78f-50c7-4bec-8975-998d7d55dba2	PGS.TS. Nguyễn Thanh Bình	2	[{"changed": {"fields": ["Full bio", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label"]}}]	64	1
296	2026-08-05 22:49:47.27853+07	9ee1d1c7-af25-494c-a5c2-6870dd4d1627	Trí tuệ nhân tạo (AI)	1	[{"added": {}}]	67	1
297	2026-08-05 22:50:04.116533+07	d351e629-7281-47c0-8af7-a5ad445fced9	Machine Learning	1	[{"added": {}}]	67	1
298	2026-08-05 22:50:15.172732+07	b1e34afc-58bd-4a11-8e58-2e38aae98d86	Deep Learning	1	[{"added": {}}]	67	1
299	2026-08-05 22:50:27.227991+07	2c2fbbfa-5fec-48fe-a5fa-5e0c0bcb1b46	Toán học ứng dụng	1	[{"added": {}}]	67	1
300	2026-08-05 22:50:40.030846+07	08667282-0ec3-4f62-9d22-3b6cf067e3ae	Khoa học dữ liệu	1	[{"added": {}}]	67	1
301	2026-08-05 22:50:50.128169+07	c0ba013b-4741-4efe-a52d-a4aca5c22f8b	Computer Vision	1	[{"added": {}}]	67	1
302	2026-08-05 22:51:05.097521+07	b778bfd7-5910-4d4c-ac88-b6513b6b2f61	NLP	1	[{"added": {}}]	67	1
303	2026-08-05 22:51:15.564186+07	c00b6e42-4be8-42ef-b6a0-4e977161cc70	AI công nghiệp	1	[{"added": {}}]	67	1
304	2026-08-05 22:51:25.488361+07	2f44528b-51e8-4b79-acb4-f3fa6d42f7d2	AI môi trường	1	[{"added": {}}]	67	1
305	2026-08-05 22:51:36.65872+07	2126a220-8fc1-46ab-a283-ed63816b3445	AI ứng dụng	1	[{"added": {}}]	67	1
306	2026-08-05 22:51:45.826757+07	55dae78f-50c7-4bec-8975-998d7d55dba2	PGS.TS. Nguyễn Thanh Bình	2	[{"changed": {"fields": ["Profile tagline", "Full bio", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types"]}}]	64	1
307	2026-08-05 22:52:33.256871+07	55dae78f-50c7-4bec-8975-998d7d55dba2	PGS.TS. Nguyễn Thanh Bình	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
308	2026-08-05 23:33:14.779206+07	0320a7f6-ea8e-434e-b1b5-b1492092aff7	PGS.TS. Lê Quang Minh	2	[{"changed": {"fields": ["Profile tagline", "Full bio", "Hero tagline", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 2 \\u2014 value", "Stat 2 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Is active"]}}]	64	1
309	2026-08-05 23:35:34.562678+07	dea89a12-8647-4952-9b28-f6283f91e0c6	GS.TS. Lê Quang Minh	2	[{"changed": {"fields": ["Senior expert", "Featured", "Published"]}}]	64	1
310	2026-08-05 23:35:34.570404+07	0320a7f6-ea8e-434e-b1b5-b1492092aff7	PGS.TS. Lê Quang Minh	2	[{"changed": {"fields": ["Senior expert", "Featured"]}}]	64	1
311	2026-08-05 23:39:23.170921+07	dea89a12-8647-4952-9b28-f6283f91e0c6	GS.TS. Lê Quang Minh	3		64	1
312	2026-08-05 23:39:28.291063+07	0320a7f6-ea8e-434e-b1b5-b1492092aff7	PGS.TS. Lê Quang Minh	2	[{"changed": {"fields": ["Display order"]}}]	64	1
313	2026-08-05 23:45:38.910022+07	baed0ba6-a206-4e60-8e9f-7aea7b5d9ab4	Quản trị đại học	1	[{"added": {}}]	67	1
314	2026-08-05 23:46:01.193221+07	fa3e65cc-6337-40de-888e-013e530c2a38	Đảm bảo chất lượng Giáo dục	1	[{"added": {}}]	67	1
315	2026-08-05 23:46:15.632562+07	953b3e71-d0dc-4816-a69d-b0fe1d21ff63	AUN-QA	1	[{"added": {}}]	67	1
319	2026-08-05 23:49:14.741395+07	03e3ef2d-a5e7-4231-b487-8a38fd4ad6e7	Outcome-Based Education	1	[{"added": {}}]	67	1
320	2026-08-05 23:49:18.813537+07	0320a7f6-ea8e-434e-b1b5-b1492092aff7	PGS.TS. Lê Quang Minh	2	[{"changed": {"fields": ["Position/role", "Organization", "Engagement types"]}}]	64	1
321	2026-08-05 23:52:50.835911+07	0320a7f6-ea8e-434e-b1b5-b1492092aff7	PGS.TS. Lê Quang Minh	2	[{"changed": {"fields": ["Position/role", "Short bio", "Research areas", "Knowledge topics"]}}]	64	1
322	2026-08-06 21:51:48.215798+07	49562603-d4d9-416c-a763-56589e046afa	Xã hội học du lịch	1	[{"added": {}}]	67	1
323	2026-08-06 21:52:02.57435+07	5018cd4d-1146-4c98-9469-a9f3a69f5672	Du lịch bền vững	1	[{"added": {}}]	67	1
324	2026-08-06 21:52:17.077166+07	bb812c25-fe79-4803-a18f-91e2f890dead	PGS.TS. Nguyễn Thị Vân Hạnh	2	[]	64	1
325	2026-08-06 21:52:28.579893+07	7875f415-20ec-4332-b46d-0cb934052e67	Du lịch thông minh	1	[{"added": {}}]	67	1
326	2026-08-06 21:52:43.805059+07	df9856f5-3078-4086-8d97-5ed2dbb94417	Công nghệ trong du lịch	1	[{"added": {}}]	67	1
327	2026-08-06 21:52:59.170096+07	d052ac03-7323-4097-982c-1b68a12263b4	Hành vi du khách	1	[{"added": {}}]	67	1
328	2026-08-06 21:53:12.640595+07	9237b016-d22e-415c-891f-49a7c9bcbada	Du lịch thực tế ảo	1	[{"added": {}}]	67	1
329	2026-08-06 21:53:30.140475+07	a9d96996-5e55-41af-b899-84d198aa3f91	Giới trong quản lý và du lịch	1	[{"added": {}}]	67	1
330	2026-08-06 21:53:46.880542+07	ada3a2e4-9a88-450d-b536-04a15a268981	Phát triển năng lực nghiên cứu	1	[{"added": {}}]	67	1
331	2026-08-06 21:55:06.831859+07	bb812c25-fe79-4803-a18f-91e2f890dead	PGS.TS. Nguyễn Thị Vân Hạnh	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
332	2026-08-06 21:59:04.065288+07	bb812c25-fe79-4803-a18f-91e2f890dead	PGS.TS. Nguyễn Thị Vân Hạnh	2	[{"changed": {"fields": ["Position/role", "Avatar", "Hero avatar", "Short bio", "Profile tagline", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label"]}}]	64	1
333	2026-08-06 22:04:48.587093+07	bb812c25-fe79-4803-a18f-91e2f890dead	PGS.TS. Nguyễn Thị Vân Hạnh	2	[{"changed": {"fields": ["Position/role", "Short bio", "Profile tagline", "Full bio", "Hero tagline", "Ticker bar text", "Experience highlights", "Discussion topics", "Notable projects"]}}]	64	1
334	2026-08-06 22:05:21.026462+07	bb812c25-fe79-4803-a18f-91e2f890dead	PGS.TS. Nguyễn Thị Vân Hạnh	2	[{"changed": {"fields": ["Hero tagline"]}}]	64	1
335	2026-08-06 22:11:59.76233+07	81d5f380-1962-4904-bd36-7b02753156b3	PGS.TS. Phan Thị Mai Hương	2	[{"changed": {"fields": ["Position/role", "Avatar", "Hero avatar", "Profile tagline", "Full bio", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects"]}}]	64	1
336	2026-08-06 22:12:37.337657+07	e4fa8d9b-e223-4846-a1ea-d5e4fc955b22	Tâm lý học	1	[{"added": {}}]	67	1
337	2026-08-06 22:12:55.735326+07	10560ebc-c885-44b5-a57b-b7f24ba02f07	Sức khỏe tinh thần	1	[{"added": {}}]	67	1
338	2026-08-06 22:13:15.409072+07	b4dbe7bf-429a-434f-be05-e2e575d3c07d	Wellbeing	1	[{"added": {}}]	67	1
339	2026-08-06 22:13:30.103149+07	74158a94-8b65-4638-bea3-b059b23e55b1	Trí tuệ cảm xúc	1	[{"added": {}}]	67	1
340	2026-08-06 22:13:47.597244+07	a119d58a-f9f1-435e-be79-4ea85baae961	Hạnh phúc học đường	1	[{"added": {}}]	67	1
341	2026-08-06 22:14:46.763048+07	936739fc-d997-47cd-8892-c84531e4ffd9	Cảm xúc tại nơi làm việc	1	[{"added": {}}]	67	1
342	2026-08-06 22:15:04.404617+07	77ad0ee5-ce14-47dc-bbe7-db4e0f491762	Kiệt sức nghề nghiệp	1	[{"added": {}}]	67	1
343	2026-08-06 22:15:23.053555+07	cbf7003b-dda4-4a27-aceb-ee38d282d9b6	Chất lượng cuộc sống	1	[{"added": {}}]	67	1
344	2026-08-06 22:22:47.389028+07	81d5f380-1962-4904-bd36-7b02753156b3	PGS.TS. Phan Thị Mai Hương	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
345	2026-08-06 22:24:50.940324+07	81d5f380-1962-4904-bd36-7b02753156b3	PGS.TS. Phan Thị Mai Hương	2	[{"changed": {"fields": ["Research areas", "Card specialty label"]}}]	64	1
346	2026-08-06 22:29:40.876989+07	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	TS.BS. Trần Thị Minh Hạnh	2	[{"changed": {"fields": ["Position/role", "Avatar", "Hero avatar", "Profile tagline", "Full bio", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects"]}}]	64	1
347	2026-08-06 22:30:21.358181+07	7558be27-1816-4f53-bd5f-8d16ff56b70f	Dinh dưỡng cộng đồng	1	[{"added": {}}]	67	1
348	2026-08-06 22:30:39.263165+07	8fabf6f2-3263-4732-95c8-75e433c543ec	Sức khỏe học đường	1	[{"added": {}}]	67	1
349	2026-08-06 22:30:53.322349+07	43cb7461-e81f-4bc5-b47b-1320419d3924	Y tế công cộng	1	[{"added": {}}]	67	1
350	2026-08-06 22:31:08.431072+07	2415d132-80e4-46fb-b804-fa98cf8d617f	Dinh dưỡng lâm sàng	1	[{"added": {}}]	67	1
351	2026-08-06 22:31:22.288786+07	e3696a0c-6dce-4813-aeb7-763d0c24899d	Sức khỏe trẻ em	1	[{"added": {}}]	67	1
352	2026-08-06 22:31:36.427283+07	48b43deb-301a-40c8-a735-e788a4591364	Sức khỏe phụ nữ	1	[{"added": {}}]	67	1
353	2026-08-06 22:31:49.221074+07	d4edd0fe-5be7-4ab8-9427-e13a37e785a8	Community Health	1	[{"added": {}}]	67	1
354	2026-08-06 22:32:01.775348+07	9000957d-8eba-4757-8881-9269a11d4517	School Health	1	[{"added": {}}]	67	1
355	2026-08-06 22:32:12.797122+07	9e6f6a9a-d65d-4b2e-af05-3e1884ffc6b5	Nutrition	1	[{"added": {}}]	67	1
356	2026-08-06 22:32:24.914541+07	cf7987a0-e2d5-47eb-abb1-f652156b82be	Đào tạo	1	[{"added": {}}]	67	1
357	2026-08-06 22:32:36.472015+07	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	TS.BS. Trần Thị Minh Hạnh	2	[]	64	1
358	2026-08-06 22:33:59.006174+07	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	TS.BS. Trần Thị Minh Hạnh	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
359	2026-08-06 22:40:21.301852+07	767afe2b-67b0-4078-88ad-28d0d8bc209f	TS. Ngô Gia Lương	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Card specialty label"]}}]	64	1
360	2026-08-06 22:41:10.310964+07	bfa765cd-e586-4d16-abbe-dfe50a1a9b79	Quản trị y tế	1	[{"added": {}}]	67	1
361	2026-08-06 22:41:24.528068+07	432d9bf6-d2ff-4c30-aa41-30238adf3290	Quản trị bệnh viện	1	[{"added": {}}]	67	1
362	2026-08-06 22:41:37.544215+07	1638aa77-ce0e-4a96-8334-0831094df6c5	Kinh tế y tế	1	[{"added": {}}]	67	1
363	2026-08-06 22:41:48.592775+07	ea374086-771f-4da3-a843-b789a92e1f03	Đào tạo nhân lực Y – Dược	1	[{"added": {}}]	67	1
364	2026-08-06 22:42:01.880075+07	365443de-d4b5-4f38-833c-7e2dd21080b2	Phát triển chương trình đào tạo	1	[{"added": {}}]	67	1
365	2026-08-06 22:42:14.130355+07	b41aba38-290f-4a46-b4dc-8f9cf0fe5fa6	Quản trị tổ chức học tập	1	[{"added": {}}]	67	1
366	2026-08-06 22:42:25.743943+07	bd331573-097a-4b50-8ae8-a25c603ff6e9	Phân tích hiệu quả dịch vụ y tế	1	[{"added": {}}]	67	1
418	2026-08-09 15:44:41.273284+07	f7a8b534-cb7b-4b54-9bfa-e3ed1e5060a6	Thai giáo	1	[{"added": {}}]	67	1
367	2026-08-06 22:42:37.064428+07	cc7d3946-cf34-4068-b73e-147f513ecf2c	Phát triển hệ thống y tế bền vững	1	[{"added": {}}]	67	1
368	2026-08-06 22:44:00.444751+07	767afe2b-67b0-4078-88ad-28d0d8bc209f	TS. Ngô Gia Lương	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
369	2026-08-08 23:15:55.878665+07	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	TS. Phạm Đức Trọng	2	[{"changed": {"fields": ["Profile tagline", "Full bio", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Research areas", "Card specialty label", "Engagement types"]}}]	64	1
370	2026-08-08 23:17:27.211414+07	15b186f4-f352-4a3f-a283-9fce2e2fa1ec	Xã hội học ứng dụng	1	[{"added": {}}]	67	1
371	2026-08-08 23:17:43.637577+07	b7a0ffad-d8c5-4c32-9290-8a0a5d48167c	Chính sách Y tế cộng đồng	1	[{"added": {}}]	67	1
372	2026-08-08 23:17:58.115442+07	4fc1292d-e705-4c72-ae62-a494fc41f39a	HIV/AIDS	1	[{"added": {}}]	67	1
373	2026-08-08 23:18:10.304816+07	4bcc1e36-6ff7-4371-be2d-22c857bdfef2	Đánh giá tác động xã hội	1	[{"added": {}}]	67	1
374	2026-08-08 23:18:24.486977+07	acb98897-86a4-4c16-b4f0-b462a544f580	Nghiên cứu cộng đồng	1	[{"added": {}}]	67	1
375	2026-08-08 23:18:38.810136+07	f47826c2-8648-4bdc-9fb0-8cd23f42f9a8	Hành vi sức khỏe	1	[{"added": {}}]	67	1
376	2026-08-08 23:18:52.591618+07	e1af6052-53d3-460e-95e0-593ba9f3c7a8	Public Health	1	[{"added": {}}]	67	1
377	2026-08-08 23:19:05.782996+07	5f837ab7-48ed-4c32-8794-edb96d2cf282	Social Development	1	[{"added": {}}]	67	1
378	2026-08-08 23:22:19.151882+07	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	TS. Phạm Đức Trọng	2	[{"changed": {"fields": ["Position/role", "Knowledge topics"]}}]	64	1
379	2026-08-08 23:23:40.360002+07	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	TS. Phạm Đức Trọng	2	[{"changed": {"fields": ["Position/role", "Hero tagline"]}}]	64	1
380	2026-08-08 23:26:18.797346+07	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	TS. Phạm Đức Trọng	2	[{"changed": {"fields": ["Position/role"]}}]	64	1
381	2026-08-08 23:27:15.924738+07	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	TS. Phạm Đức Trọng	2	[{"changed": {"fields": ["Organization", "Hero tagline"]}}]	64	1
382	2026-08-08 23:28:20.708456+07	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	TS. Phạm Đức Trọng	2	[{"changed": {"fields": ["Card specialty label"]}}]	64	1
383	2026-08-08 23:29:24.25866+07	9323faa7-70f4-45aa-8f12-a5cb7381eb48	Chủ tịch Hội đồng quản lý IRDM Nhà khoa học/chuyên gia	1	[{"added": {}}]	65	1
384	2026-08-08 23:29:28.854563+07	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	TS. Phạm Đức Trọng	2	[{"changed": {"fields": ["Organization", "Expert group", "Card specialty label"]}}]	64	1
385	2026-08-08 23:46:20.431534+07	98873274-3e71-480f-a413-c1d9f67c9ef3	Phát triển năng lực lãnh đạo	1	[{"added": {}}]	67	1
386	2026-08-08 23:46:35.861366+07	25bfa583-2e3a-4a2c-a464-8774ec7167d4	Giao tiếp trong tổ chức	1	[{"added": {}}]	67	1
387	2026-08-08 23:46:53.286613+07	193516b7-6f76-41ba-bffa-0e3ebf356cd7	Thuyết trình và nói trước công chúng	1	[{"added": {}}]	67	1
388	2026-08-08 23:47:14.008438+07	f220350d-d53a-4fe3-bd24-67eb197de678	Quản lý con người	1	[{"added": {}}]	67	1
389	2026-08-08 23:47:27.316887+07	e5a9b7ec-e08e-4d14-9d69-1ae41c69b031	Quản trị cảm xúc	1	[{"added": {}}]	67	1
390	2026-08-08 23:47:56.467464+07	0c5d1c94-ad83-4b8e-8fac-e0ca0fd2f662	Hiệu suất làm việc	1	[{"added": {}}]	67	1
391	2026-08-08 23:48:14.375922+07	0f911e91-9682-443b-9e4b-11f8f41e0b1b	Truyền thông tổ chức	1	[{"added": {}}]	67	1
392	2026-08-08 23:48:27.76898+07	ac34aaa4-2a67-4009-a50d-690242a3a5fc	Coaching	1	[{"added": {}}]	67	1
393	2026-08-08 23:48:31.20177+07	eb0fa648-67ab-4716-84ae-9e28c7e9e779	TS. Nguyễn Thị Minh	2	[{"changed": {"fields": ["Position/role", "Profile tagline", "Full bio", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types"]}}]	64	1
394	2026-08-08 23:49:38.505141+07	eb0fa648-67ab-4716-84ae-9e28c7e9e779	TS. Nguyễn Thị Minh	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
395	2026-08-09 00:01:40.427026+07	eb0fa648-67ab-4716-84ae-9e28c7e9e779	TS. Nguyễn Thị Minh	2	[{"changed": {"fields": ["Role badges"]}}]	64	1
396	2026-08-09 00:02:37.920601+07	eb0fa648-67ab-4716-84ae-9e28c7e9e779	TS. Nguyễn Thị Minh	2	[{"changed": {"fields": ["Position/role", "Role badges"]}}]	64	1
397	2026-08-09 00:04:06.38229+07	eb0fa648-67ab-4716-84ae-9e28c7e9e779	TS. Nguyễn Thị Minh	2	[{"changed": {"fields": ["Position/role"]}}]	64	1
398	2026-08-09 00:05:25.71343+07	9323faa7-70f4-45aa-8f12-a5cb7381eb48	Chủ tịch Hội đồng quản lý IRDM Nhà khoa học/chuyên gia	3		65	1
399	2026-08-09 00:05:36.350246+07	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	TS. Phạm Đức Trọng	2	[{"changed": {"fields": ["Role badges"]}}]	64	1
400	2026-08-09 00:05:52.964683+07	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	TS. Phạm Đức Trọng	2	[{"changed": {"fields": ["Expert group"]}}]	64	1
401	2026-08-09 00:07:02.239727+07	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	TS. Phạm Đức Trọng	2	[{"changed": {"fields": ["Card specialty label"]}}]	64	1
402	2026-08-09 00:11:53.468011+07	032459a4-fa62-412f-8b8e-88e11b17a173	TS. Bùi Hồng Quân	2	[{"changed": {"fields": ["Position/role", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types"]}}]	64	1
403	2026-08-09 00:12:17.207718+07	93c03593-0266-405a-96a2-ede734026a44	Tâm lý học ứng dụng	1	[{"added": {}}]	67	1
404	2026-08-09 00:12:34.975819+07	5b7bde81-7a17-4d55-9e21-0970ead66bfa	Tâm lý học trường học	1	[{"added": {}}]	67	1
405	2026-08-09 00:12:46.37791+07	e254cd71-1694-4b7a-8fa4-ca41471fbabd	Kỹ năng mềm	1	[{"added": {}}]	67	1
406	2026-08-09 00:13:00.59837+07	1494abde-8f59-4879-821f-bad8e8dbc2fb	SEL	1	[{"added": {}}]	67	1
407	2026-08-09 00:13:34.946964+07	263f7067-6044-4fa6-95c7-9ec6a7f627d9	School Counseling	1	[{"added": {}}]	67	1
408	2026-08-09 00:13:52.703709+07	bb801df2-6e64-448e-8b00-98f47e38ae64	Leadership	1	[{"added": {}}]	67	1
409	2026-08-09 00:14:06.748049+07	d4e020fd-a86f-4cc1-84fb-4585bcd5d655	Giáo dục kỹ năng sống	1	[{"added": {}}]	67	1
410	2026-08-09 00:16:24.033645+07	032459a4-fa62-412f-8b8e-88e11b17a173	TS. Bùi Hồng Quân	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
411	2026-08-09 15:25:00.561784+07	3bdbf9f6-a569-4a6d-81e4-7ad65f06149a	TS. Huỳnh Ngọc Tín	2	[{"changed": {"fields": ["Avatar", "Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Knowledge topics"]}}]	64	1
419	2026-08-09 15:44:57.627526+07	4db97b13-01b3-4326-a681-de25bfa98ba7	Parenting Education	1	[{"added": {}}]	67	1
426	2026-08-09 16:01:31.37342+07	2144f359-b48c-419d-b140-21a36f92ade6	Xã hội học đô thị	1	[{"added": {}}]	67	1
433	2026-08-09 16:03:56.606366+07	d65bf112-2363-4863-90af-c2290e38552a	TS. Nguyễn Minh Nhựt	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
440	2026-08-09 16:10:33.038361+07	d87d43fb-8ace-48bf-be62-e762344bf2be	Carbon Market	1	[{"added": {}}]	67	1
447	2026-08-09 16:18:45.626647+07	2316b863-f75c-4f1c-947d-c92ff5630f80	TS. John Stiles	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types"]}}]	64	1
454	2026-08-09 16:20:16.148273+07	204bcdbf-f24b-4905-916d-ff6d2b9820ef	Hợp tác đa văn hóa	1	[{"added": {}}]	67	1
461	2026-08-09 16:27:58.007416+07	3dd45923-49bc-4e09-9406-c00bde675a2c	Dịch vụ công trực tuyến	1	[{"added": {}}]	67	1
468	2026-08-09 16:34:13.555387+07	030b1d35-6bd6-438e-9c99-86dd91a01b48	Professional Development	1	[{"added": {}}]	67	1
475	2026-08-09 16:44:06.075438+07	90a48300-ab9e-46e5-a30f-7fa11877e905	Hệ thống y tế	1	[{"added": {}}]	67	1
412	2026-08-09 15:35:04.9905+07	5155add1-431a-4895-8fb2-b9dcea956e31	Xử lý ngôn ngữ tự nhiên (NLP)	1	[{"added": {}}]	67	1
420	2026-08-09 15:45:23.031561+07	a269ddd8-4b1f-4199-a40b-eeb9472b1dc6	Tâm lý học đường	1	[{"added": {}}]	67	1
427	2026-08-09 16:01:49.461507+07	0ce4cc26-0fa6-46dd-83c6-f007a5411d18	Quản trị đô thị	1	[{"added": {}}]	67	1
434	2026-08-09 16:05:27.207518+07	e796389d-d04a-426e-8bde-5f80bd1fd8ba	TS. Trần Thanh Tâm	3		64	1
441	2026-08-09 16:10:57.517561+07	25074aa6-8222-4311-9b5f-ab351ec250b6	Vật liệu sinh học	1	[{"added": {}}]	67	1
448	2026-08-09 16:18:57.56968+07	11e5fe84-a109-4509-bdd5-7dfea6ffe874	Giao tiếp liên văn hóa	1	[{"added": {}}]	67	1
455	2026-08-09 16:20:30.190965+07	511fd457-0ba5-4b1b-8392-1aa65c0090ae	Thuyết trình tương tác	1	[{"added": {}}]	67	1
462	2026-08-09 16:28:54.893648+07	e4f1b232-f338-4822-a71a-dc7108e34ff2	TS. Nguyễn Hữu Hoàng	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
469	2026-08-09 16:34:25.808195+07	469d77c5-3ec2-46ef-b7cc-f5defbf80851	Medical Collaboration	1	[{"added": {}}]	67	1
476	2026-08-09 16:44:18.43914+07	c8a7eb61-b116-4520-bd6b-79be1527006b	Quản trị thay đổi	1	[{"added": {}}]	67	1
413	2026-08-09 15:35:46.083565+07	5d308d0d-5cf1-4bf2-a0a1-329e6b005f75	Đào tạo AI	1	[{"added": {}}]	67	1
421	2026-08-09 15:45:37.353891+07	7851fd91-efb9-4789-a143-ffc79b74c5b2	Giáo dục cảm xúc – xã hội	1	[{"added": {}}]	67	1
428	2026-08-09 16:02:06.699698+07	be710963-6fb9-46e4-ad7d-b6acfd3680c5	Phát triển cộng đồng	1	[{"added": {}}]	67	1
435	2026-08-09 16:09:25.951495+07	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	TS. Trần Thanh Tâm	2	[{"changed": {"fields": ["Profile tagline", "Full bio", "Role badges", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types"]}}]	64	1
442	2026-08-09 16:11:09.199777+07	10ab82e1-ac1e-4d3a-a87f-1d9319741a54	Công nghệ môi trường	1	[{"added": {}}]	67	1
449	2026-08-09 16:19:11.400783+07	0549154a-29f1-4bbf-bdd5-e4f2638e073a	Năng lực thích ứng văn hóa	1	[{"added": {}}]	67	1
456	2026-08-09 16:21:32.591289+07	2316b863-f75c-4f1c-947d-c92ff5630f80	TS. John Stiles	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
463	2026-08-09 16:33:13.074627+07	6a85721a-54d2-4a99-9426-c22f31b4b26a	BS.CKII. Huỳnh Anh Lan	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types"]}}]	64	1
470	2026-08-09 16:34:38.566646+07	d2ef8d85-b62a-4e57-b01f-fb68bc3a1500	Healthcare Leadership	1	[{"added": {}}]	67	1
477	2026-08-09 16:44:39.062687+07	cc34ed10-d089-4277-98dd-83da090e668b	Quản trị nhân sự	1	[{"added": {}}]	67	1
414	2026-08-09 15:36:47.543324+07	3bdbf9f6-a569-4a6d-81e4-7ad65f06149a	TS. Huỳnh Ngọc Tín	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
422	2026-08-09 15:45:50.582984+07	92181c93-d161-4af8-aa3e-e2d8709fe4bd	Tham vấn tâm lý	1	[{"added": {}}]	67	1
429	2026-08-09 16:02:18.892471+07	03c7320b-7bba-4895-a439-bf0282fa4b09	Chính quyền địa phương	1	[{"added": {}}]	67	1
436	2026-08-09 16:09:36.140281+07	4ff29a48-fa6d-490f-943d-2c6dde786af7	Kinh tế tuần hoàn	1	[{"added": {}}]	67	1
443	2026-08-09 16:11:22.538441+07	ba7b8678-61e6-4712-969c-9cc1f8432d1e	Green Innovation	1	[{"added": {}}]	67	1
450	2026-08-09 16:19:26.261443+07	2cdf1876-d580-4ff5-b23c-83172ded3c84	Giao tiếp quốc tế	1	[{"added": {}}]	67	1
457	2026-08-09 16:27:03.049573+07	e4f1b232-f338-4822-a71a-dc7108e34ff2	TS. Nguyễn Hữu Hoàng	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Expert group", "Research areas", "Engagement types", "Knowledge topics"]}}]	64	1
464	2026-08-09 16:33:22.934687+07	65146668-1df7-482a-aa21-1f14c5b8c9f3	Răng Hàm Mặt	1	[{"added": {}}]	67	1
471	2026-08-09 16:36:02.401925+07	6a85721a-54d2-4a99-9426-c22f31b4b26a	BS.CKII. Huỳnh Anh Lan	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
478	2026-08-09 16:44:51.716299+07	16460166-33ad-4578-a81d-4bc0f9070b76	Tăng trưởng doanh nghiệp	1	[{"added": {}}]	67	1
415	2026-08-09 15:42:44.450897+07	577f79a5-e422-41bf-9e99-0724e93c88ff	TS. Phạm Thị Thúy	2	[{"changed": {"fields": ["Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Expert group", "Engagement types"]}}]	64	1
423	2026-08-09 15:46:30.358649+07	0ced2aa4-0552-48ad-9af6-bf3d771c50d3	Xã hội học & chính sách công	1	[{"added": {}}]	69	1
430	2026-08-09 16:02:30.321034+07	f2f76abf-5d25-4f9d-91d0-3c7c958f08bd	Biến đổi khí hậu dựa vào cộng đồng	1	[{"added": {}}]	67	1
437	2026-08-09 16:09:50.864507+07	fb0ddb1c-eebd-4512-9d5a-078021de499d	GHG	1	[{"added": {}}]	67	1
444	2026-08-09 16:11:34.25579+07	5468c8c5-55f1-41ca-86cd-9b373d8247d4	Sustainability	1	[{"added": {}}]	67	1
451	2026-08-09 16:19:38.909175+07	fb2e06ed-fcdf-4010-89ee-4bd96d26ba8a	Đa dạng văn hóa	1	[{"added": {}}]	67	1
458	2026-08-09 16:27:21.800185+07	f45e7705-a90d-4da7-a4a6-f55dafa703ea	Xã hội học số	1	[{"added": {}}]	67	1
465	2026-08-09 16:33:35.14529+07	3dcd408a-e6b2-4093-9c07-d4a2a7cf8577	Giáo dục Y khoa	1	[{"added": {}}]	67	1
472	2026-08-09 16:43:16.064242+07	616eb172-f424-4e66-b503-be9b2bf1aa14	ThS.BS. Ngô Văn Huy	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Expert group", "Card specialty label", "Engagement types"]}}]	64	1
479	2026-08-09 16:45:57.002188+07	616eb172-f424-4e66-b503-be9b2bf1aa14	ThS.BS. Ngô Văn Huy	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
416	2026-08-09 15:43:54.462467+07	471244e8-5264-48ef-a982-729ef1092705	Giáo dục gia đình	1	[{"added": {}}]	67	1
424	2026-08-09 15:48:33.458203+07	577f79a5-e422-41bf-9e99-0724e93c88ff	TS. Phạm Thị Thúy	2	[{"changed": {"fields": ["Engagement types", "Knowledge topics"]}}]	64	1
431	2026-08-09 16:02:45.285427+07	7976e42f-4cc2-481d-a2a0-c4258e37779b	Bảo vệ trẻ em	1	[{"added": {}}]	67	1
438	2026-08-09 16:10:01.132544+07	faf62711-1224-473f-87f4-d7478c1e8d05	CBAM	1	[{"added": {}}]	67	1
445	2026-08-09 16:11:47.703793+07	6beea87c-3293-4ba5-aba4-366163827745	Chuyển giao công nghệ	1	[{"added": {}}]	67	1
452	2026-08-09 16:19:52.093793+07	6d2767b2-c771-4689-9fa5-6bf8506705bd	Thấu cảm liên văn hóa	1	[{"added": {}}]	67	1
459	2026-08-09 16:27:34.660626+07	32e3d1cd-205f-47ed-875c-8def3452ac67	Chuyển đổi số xã hội	1	[{"added": {}}]	67	1
466	2026-08-09 16:33:48.744885+07	ac5bc09b-b06a-4c34-83cc-2ae001cdc752	Oral Medicine	1	[{"added": {}}]	67	1
473	2026-08-09 16:43:25.173585+07	ba603109-c9c6-4d4a-9a78-8c0a4c064f1e	Quản trị doanh nghiệp	1	[{"added": {}}]	67	1
417	2026-08-09 15:44:26.413756+07	a56965df-5cfd-48f3-8362-7b5b81de0df5	Kỹ năng sống	1	[{"added": {}}]	67	1
425	2026-08-09 15:56:22.658309+07	d65bf112-2363-4863-90af-c2290e38552a	TS. Nguyễn Minh Nhựt	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types", "Knowledge topics"]}}]	64	1
432	2026-08-09 16:03:00.973932+07	8a57f289-91f9-4abb-9a90-bc6af674ad8e	Đánh giá tác động chính sách	1	[{"added": {}}]	67	1
439	2026-08-09 16:10:17.794715+07	a5f50d08-8c13-459b-a064-75bfbcaae831	ESG	1	[{"added": {}}]	67	1
446	2026-08-09 16:13:01.762701+07	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	TS. Trần Thanh Tâm	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
453	2026-08-09 16:20:04.634254+07	62b7228c-393f-47cd-84b0-9eb69a2f12a4	Quan hệ trong tổ chức	1	[{"added": {}}]	67	1
460	2026-08-09 16:27:46.986556+07	1eaf36b5-8098-490e-91ab-1460457ab1d0	Quản trị công	1	[{"added": {}}]	67	1
467	2026-08-09 16:34:00.951791+07	885fd976-ebf7-4165-a4d8-33b8dcdd871e	Healthcare Education	1	[{"added": {}}]	67	1
474	2026-08-09 16:43:39.078506+07	24c51332-105e-4a5f-9938-9ad9e6381b02	Chiến lược kinh doanh	1	[{"added": {}}]	67	1
480	2026-08-09 20:23:53.309237+07	722d2f3a-b0f0-48c0-a162-e69c53923476	ThS. Nguyễn Quốc Định	2	[{"changed": {"fields": ["Avatar", "Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Card specialty label", "Engagement types"]}}]	64	1
485	2026-08-09 20:24:54.052357+07	b53a4cd4-14e5-4569-8aa7-78d73f9a48eb	Hỗ trợ ra quyết định lâm sàng	1	[{"added": {}}]	67	1
490	2026-08-09 20:25:50.489038+07	640ea237-8629-4786-ab2e-25790295b4f1	Đào tạo & tập huấn	1	[{"added": {}}]	67	1
495	2026-08-09 20:33:26.401876+07	07a8e4e3-a684-43ad-aa02-493fc120c207	Smart Governance	1	[{"added": {}}]	67	1
500	2026-08-09 20:34:20.431764+07	a2ed8cdc-25a4-46f9-89f5-028823769f83	Technology Solutions	1	[{"added": {}}]	67	1
505	2026-08-09 20:40:51.875947+07	9ddd126c-f094-430a-b1de-b5a8e169ed40	Kỹ thuật xây dựng prompt	1	[{"added": {}}]	67	1
510	2026-08-09 20:41:47.258926+07	39ec3d44-27e6-40e5-80a7-0e4c499efef5	Phát triển năng lực số	1	[{"added": {}}]	67	1
515	2026-08-09 20:47:37.765214+07	9a2899d7-19ac-4a15-99ca-352a5fde48cf	Đổi mới sáng tạo	1	[{"added": {}}]	67	1
520	2026-08-09 20:59:58.591181+07	04752e52-8b5d-4379-80ba-efa6089aa752	THS. Trịnh Hải Linh	2	[{"changed": {"fields": ["Academic title"]}}]	64	1
525	2026-08-09 21:01:05.225079+07	145c59ae-059e-48c3-bcd3-67e304ba6b7d	Giáo dục khai phóng	1	[{"added": {}}]	67	1
530	2026-08-09 21:09:26.019549+07	04752e52-8b5d-4379-80ba-efa6089aa752	THS. Trịnh Hải Linh	2	[{"changed": {"fields": ["Slug", "Engagement types"]}}]	64	1
535	2026-08-09 21:21:03.750457+07	8dd1ca64-4c7e-4ed4-8314-7888dd20eb07	ThS. Ngô Minh Uy	3		64	1
540	2026-08-09 21:26:36.34204+07	7f013dfb-b494-42ac-ab4e-5021620ad0c6	Phát triển nguồn nhân lực	1	[{"added": {}}]	67	1
545	2026-08-09 21:32:52.476079+07	fc7725e3-4093-441f-b970-d6ae63fdce01	Lao động nhập cư	1	[{"added": {}}]	67	1
550	2026-08-09 21:39:10.663964+07	ce5dba86-d252-497e-82be-9ddce6d30f30	ThS. Nguyễn Minh Hương	2	[{"changed": {"fields": ["Avatar", "Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types"]}}]	64	1
555	2026-08-09 21:40:09.486721+07	226be80c-bf3a-4363-81cd-4f1258edb198	Kỹ năng giao tiếp	1	[{"added": {}}]	67	1
560	2026-08-09 21:50:06.966965+07	6e4ec282-c897-46c1-83a6-3752906c8ed2	Quản trị bản thân	1	[{"added": {}}]	67	1
565	2026-08-09 21:56:50.872902+07	ffd27b46-d313-49b3-ae8c-1e3f82f9542f	Lãnh đạo khai phóng	1	[{"added": {}}]	67	1
570	2026-08-09 21:58:57.133571+07	8ba10eec-7416-4b9a-93f1-3bd09f5c7778	ThS. Nguyễn Thị Thanh Hương	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
575	2026-08-09 22:06:51.377701+07	35bab76b-ec3b-4d07-ac43-690a6877837b	Quan hệ lao động	1	[{"added": {}}]	67	1
580	2026-08-09 22:12:37.90284+07	0b907f34-5577-4226-86ae-08c9a3de704c	Lãnh đạo doanh nghiệp	1	[{"added": {}}]	67	1
585	2026-08-09 22:14:13.391068+07	d47074e2-20e0-4dfd-b3f0-bfa8374d0cb2	Phát triển kinh doanh	1	[{"added": {}}]	67	1
590	2026-08-09 22:20:54.074032+07	80737dd8-c572-48bd-854d-9322665a61c6	Công nghệ thông tin	1	[{"added": {}}]	67	1
595	2026-08-09 22:26:44.051039+07	28493c63-5d45-4971-81f0-49ac10164050	Quản trị tài chính	1	[{"added": {}}]	67	1
600	2026-08-09 22:29:33.578714+07	a14a0b20-9b70-4821-970e-e6f505bdbcb9	Mr. Trần Tuấn Hùng	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
605	2026-08-09 22:35:41.525057+07	7f2618b3-c1f9-48a6-a25d-23d021448572	Leadership Development	1	[{"added": {}}]	67	1
610	2026-08-09 22:42:50.740087+07	be3a9b66-a72a-4f9c-9187-087576e141e6	Đào tạo lãnh đạo	1	[{"added": {}}]	67	1
615	2026-08-09 23:01:20.878242+07	dccc4005-14fc-4500-abb2-f9a9e2c42a4a	Giáo dục	2	[{"changed": {"fields": ["Cover image"]}}]	55	1
620	2026-08-09 23:10:40.079738+07	eca018e3-78a1-43e5-b5ef-6bd8cd5d8c04	Sức khỏe tâm thần nhân viên y tế: khi "chịu đựng tốt" không còn là chiến lược bền vững	2	[{"changed": {"fields": ["Hero image"]}}]	47	1
625	2026-08-10 23:04:24.013408+07	7c8bba25-4029-42eb-b006-5f16d7492174	Hệ thống y tế	2	[{"changed": {"fields": ["Primary CTA URL"]}}]	39	1
481	2026-08-09 20:24:07.500481+07	0db45da2-e1eb-430a-9723-3613884caa59	Công nghệ thông tin y tế	1	[{"added": {}}]	67	1
486	2026-08-09 20:25:05.23979+07	81ff75df-d125-416d-b101-5c93cad4705b	Trung tâm dữ liệu	1	[{"added": {}}]	67	1
491	2026-08-09 20:26:02.97072+07	56ffbe1f-789a-439f-acce-3b39f1b59e64	Đồng thiết kế giải pháp	1	[{"added": {}}]	67	1
496	2026-08-09 20:33:35.417881+07	2bf211b3-f9f1-462b-b91c-04eb2c00fd8d	System Development	1	[{"added": {}}]	67	1
501	2026-08-09 20:35:19.706036+07	9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	ThS. Bùi Thanh Tùng	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
506	2026-08-09 20:41:03.000703+07	babf9b06-b0f5-4e77-86c0-eeb31039c7cf	Năng lực tư duy cùng AI	1	[{"added": {}}]	67	1
511	2026-08-09 20:42:46.26676+07	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	ThS. Lương Dũng Nhân	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
516	2026-08-09 20:47:50.424005+07	a7d3b119-a47f-4c86-966d-352ee6118763	Khởi nghiệp đổi mới sáng tạo	1	[{"added": {}}]	67	1
521	2026-08-09 21:00:16.14769+07	200bfb41-effb-4580-b8a5-5f63bd6dc30b	Tâm lý giáo dục	1	[{"added": {}}]	67	1
526	2026-08-09 21:01:22.139987+07	1d3d6e49-b2f1-4d82-9433-e97d69324db7	Phát triển năng lực	1	[{"added": {}}]	67	1
531	2026-08-09 21:10:43.624224+07	04752e52-8b5d-4379-80ba-efa6089aa752	THS. Trịnh Hải Linh	2	[{"changed": {"fields": ["Published"]}}]	64	1
536	2026-08-09 21:25:16.864357+07	0b8fec46-7f9c-485e-9e61-2e36704a3d88	ThS. Ngô Minh Uy	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types", "Knowledge topics"]}}]	64	1
541	2026-08-09 21:26:46.63571+07	87ad2c6d-2904-4bb0-9ba6-962939f97f44	Quản lý stress	1	[{"added": {}}]	67	1
546	2026-08-09 21:33:18.798054+07	6da85c8b-88b4-49a6-9b4e-5af18fb5c4e6	Phát triển bền vững	1	[{"added": {}}]	67	1
551	2026-08-09 21:39:24.112339+07	512ce0d9-015b-4ad3-ba4a-137885b0afa6	Truyền thông	1	[{"added": {}}]	67	1
556	2026-08-09 21:40:23.217799+07	2dea6d8b-5f99-40cb-8694-3b536598ac92	Thuyết trình	1	[{"added": {}}]	67	1
561	2026-08-09 21:50:57.511274+07	b2f5c1ea-5835-4c1e-9c29-805b2c2d322b	ThS. Nguyễn Thị Bích Hà	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
566	2026-08-09 21:57:00.944485+07	0367d5d7-cbc0-41d7-9c59-79585f913713	Lãnh đạo thấu cảm	1	[{"added": {}}]	67	1
571	2026-08-09 22:05:42.609215+07	f51aed81-7ebf-428f-bdb4-70b0d54514a2	ThS. Lê Ngọc Thiên Phương	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Expert group", "Engagement types"]}}]	64	1
576	2026-08-09 22:07:02.103841+07	0f42e3d1-dd0b-423e-8b0c-5fb34c52199f	Chuỗi cung ứng có trách nhiệm	1	[{"added": {}}]	67	1
581	2026-08-09 22:12:51.884409+07	a87206a4-f121-4d04-9482-e32c94e0d228	Quản trị tổ chức	1	[{"added": {}}]	67	1
586	2026-08-09 22:15:11.89332+07	e68cb480-9541-41b4-b9b0-5a248684757d	ThS. Nguyễn Thuận Đạt	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
591	2026-08-09 22:21:04.10343+07	62bbe225-bf28-454f-bce8-36437563e028	Hệ thống mạng	1	[{"added": {}}]	67	1
596	2026-08-09 22:27:00.563372+07	50575516-5213-4dd9-a455-546788d6cd27	Quản trị rủi ro	1	[{"added": {}}]	67	1
601	2026-08-09 22:34:50.93201+07	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	MS. Trần Thị Thể Thanh	1	[{"added": {}}]	64	1
606	2026-08-09 22:36:46.636787+07	9612b096-9176-4200-95fd-60cb8495d5f2	Ms. Trần Thị Thế Thanh	3		64	1
611	2026-08-09 22:43:03.724618+07	41c78ac1-77b8-40a2-a72b-c0b36614d1bb	Employee Experience	1	[{"added": {}}]	67	1
616	2026-08-09 23:01:31.301549+07	34647d7f-952c-496a-8c80-fe9d439a49c5	Môi trường & phát triển bền vững	2	[{"changed": {"fields": ["Cover image"]}}]	55	1
621	2026-08-09 23:11:30.017751+07	eca018e3-78a1-43e5-b5ef-6bd8cd5d8c04	Sức khỏe tâm thần nhân viên y tế: khi "chịu đựng tốt" không còn là chiến lược bền vững	2	[{"changed": {"fields": ["Thumbnail"]}}]	47	1
626	2026-08-10 23:04:40.767893+07	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	Trường đại học & Giáo dục	2	[{"changed": {"fields": ["Primary CTA URL"]}}]	39	1
482	2026-08-09 20:24:20.327282+07	3ced7fe5-5778-4609-ae86-e7309d89c22b	Chuyển đổi số bệnh viện	1	[{"added": {}}]	67	1
487	2026-08-09 20:25:16.302477+07	fc9b0ed2-2303-4b65-86a4-1229d364abe7	Y tin học	1	[{"added": {}}]	67	1
492	2026-08-09 20:27:19.350067+07	722d2f3a-b0f0-48c0-a162-e69c53923476	ThS. Nguyễn Quốc Định	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
497	2026-08-09 20:33:46.928824+07	b507e92a-afe6-495b-b1ef-04e289b0ecc7	Digital Platform	1	[{"added": {}}]	67	1
502	2026-08-09 20:40:08.013191+07	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	ThS. Lương Dũng Nhân	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types"]}}]	64	1
507	2026-08-09 20:41:14.751387+07	790b5c62-0a06-49fa-8db1-52176be72619	AI trong giáo dục	1	[{"added": {}}]	67	1
512	2026-08-09 20:47:03.336645+07	c262cfba-f4c8-4c29-b13b-924f195aace4	ThS. Lê Ngọc Anh Khoa	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types", "Knowledge topics"]}}]	64	1
517	2026-08-09 20:48:06.002019+07	ea82535d-473e-4bf1-a1b6-003b9471fcab	Thiết kế mô hình kinh doanh	1	[{"added": {}}]	67	1
522	2026-08-09 21:00:36.388603+07	abeaba43-04fa-4aaa-8b27-593919254546	Hướng nghiệp	1	[{"added": {}}]	67	1
527	2026-08-09 21:01:34.162238+07	4d8c6fe6-a280-4861-86a1-6f6e2b045e90	Thiết kế chương trình học tập	1	[{"added": {}}]	67	1
532	2026-08-09 21:17:21.465822+07	04752e52-8b5d-4379-80ba-efa6089aa752	THS. Trịnh Hải Linh	2	[{"changed": {"fields": ["Published"]}}]	64	1
537	2026-08-09 21:25:28.808486+07	dd8d69c2-9e51-4151-bdc7-c254d47f4f6c	Sức khỏe tâm thần	1	[{"added": {}}]	67	1
542	2026-08-09 21:28:14.293744+07	0b8fec46-7f9c-485e-9e61-2e36704a3d88	ThS. Ngô Minh Uy	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
547	2026-08-09 21:33:36.508464+07	43deb429-41de-4ab2-b3bf-89de77209e8c	Văn hóa xã hội	1	[{"added": {}}]	67	1
552	2026-08-09 21:39:33.175649+07	34f81210-db82-461f-a6bc-fcae55ae8347	Marketing	1	[{"added": {}}]	67	1
557	2026-08-09 21:41:56.967624+07	ce5dba86-d252-497e-82be-9ddce6d30f30	ThS. Nguyễn Minh Hương	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
562	2026-08-09 21:56:18.075153+07	8ba10eec-7416-4b9a-93f1-3bd09f5c7778	ThS. Nguyễn Thị Thanh Hương	2	[{"changed": {"fields": ["Avatar", "Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Knowledge topics"]}}]	64	1
567	2026-08-09 21:57:10.860993+07	28838538-aa47-465f-ba5f-9a5a3cd37eb5	Phát triển đội ngũ	1	[{"added": {}}]	67	1
572	2026-08-09 22:05:50.537834+07	bf084cb0-3784-49e2-bb79-1204f517e307	Quản trị nhân sự chiến lược	1	[{"added": {}}]	67	1
577	2026-08-09 22:08:10.738659+07	f51aed81-7ebf-428f-bdb4-70b0d54514a2	ThS. Lê Ngọc Thiên Phương	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
582	2026-08-09 22:13:01.805845+07	75209019-28db-43fb-8af8-3c931d99ccb2	Doanh nghiệp đa quốc gia	1	[{"added": {}}]	67	1
587	2026-08-09 22:20:12.770135+07	1ce9b61f-1e94-4c61-bc68-de6f6eabab89	Kỹ sư Minh Nguyễn	2	[{"changed": {"fields": ["Avatar", "Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects"]}}]	64	1
592	2026-08-09 22:21:13.819499+07	bcdd5165-1a48-4cbc-915f-df623139ea26	Hạ tầng CNTT	1	[{"added": {}}]	67	1
597	2026-08-09 22:27:10.505798+07	42b567f9-2d16-4677-84dc-536d9fc97e83	Kế toán – kiểm toán	1	[{"added": {}}]	67	1
602	2026-08-09 22:34:57.986603+07	8dc2183f-9354-4e5a-818c-532e5559e329	Đào tạo quản lý	1	[{"added": {}}]	67	1
607	2026-08-09 22:37:51.971787+07	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	MS. Trần Thị Thể Thanh	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
612	2026-08-09 22:43:25.133695+07	1548f376-7bd3-455c-a18c-6ae017a08383	Mr. Trần Trung Hiếu	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
617	2026-08-09 23:01:58.387555+07	75b848fc-1adf-4f43-a315-23be0a6df481	AI, dữ liệu & chuyển đổi số	2	[{"changed": {"fields": ["Cover image"]}}]	55	1
622	2026-08-10 21:06:32.784384+07	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	ThS. Tạ Thị Phấn	2	[{"changed": {"fields": ["Avatar"]}}]	64	1
627	2026-08-10 23:04:58.884115+07	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	Doanh nghiệp	2	[{"changed": {"fields": ["Primary CTA URL"]}}]	39	1
483	2026-08-09 20:24:31.201809+07	3fb0bc8e-3279-4178-8264-99e9f448f0c6	Quản trị dữ liệu y tế	1	[{"added": {}}]	67	1
488	2026-08-09 20:25:28.865115+07	eb95f406-d6d4-4fe7-a4a4-4842743487cb	SNOMED CT	1	[{"added": {}}]	67	1
493	2026-08-09 20:33:04.827235+07	9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	ThS. Bùi Thanh Tùng	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Card specialty label", "Engagement types"]}}]	64	1
498	2026-08-09 20:33:57.180601+07	9d9d7ee4-6d9b-4647-8786-bee0edf9921d	Data Management	1	[{"added": {}}]	67	1
503	2026-08-09 20:40:31.041205+07	c6cdabf0-8a3e-4d77-8f6e-df1afb878cb4	AI tạo sinh	1	[{"added": {}}]	67	1
508	2026-08-09 20:41:26.273504+07	784fbe9d-dfc5-4c05-9aa1-f648726e8eec	AI trong doanh nghiệp	1	[{"added": {}}]	67	1
513	2026-08-09 20:47:10.178007+07	7429ee8a-9b79-4a55-8f17-50dede8cbe4a	Fintech	1	[{"added": {}}]	67	1
518	2026-08-09 20:49:22.644329+07	c262cfba-f4c8-4c29-b13b-924f195aace4	ThS. Lê Ngọc Anh Khoa	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
523	2026-08-09 21:00:44.25712+07	3aa3313e-040e-4600-abc8-113e413acd27	Kỹ năng cảm xúc – xã hội	1	[{"added": {}}]	67	1
528	2026-08-09 21:02:41.097597+07	04752e52-8b5d-4379-80ba-efa6089aa752	THS. Trịnh Hải Linh	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
533	2026-08-09 21:19:31.886288+07	71f9729b-ec4c-414c-b7ee-aa76589d75a5	ThS. Trịnh Thùy Linh	3		64	1
538	2026-08-09 21:25:52.582843+07	695df05b-97e7-478a-a488-7e092df89c14	Giáo dục cảm xúc – xã hội (SEL)	1	[{"added": {}}]	67	1
543	2026-08-09 21:32:26.567262+07	71787fd3-18e9-4093-b74d-d0966c7872c7	ThS. Trần Quyết Thắng	2	[{"changed": {"fields": ["Avatar", "Hero avatar", "Profile tagline", "Full bio", "Ticker bar text", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types", "Knowledge topics"]}}]	64	1
548	2026-08-09 21:34:30.892035+07	71787fd3-18e9-4093-b74d-d0966c7872c7	ThS. Trần Quyết Thắng	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
553	2026-08-09 21:39:42.826437+07	7d0812a1-4245-41aa-97fa-d4d210e31749	Phát triển con người	1	[{"added": {}}]	67	1
558	2026-08-09 21:49:24.923276+07	b2f5c1ea-5835-4c1e-9c29-805b2c2d322b	ThS. Nguyễn Thị Bích Hà	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Research areas", "Card specialty label", "Engagement types"]}}]	64	1
563	2026-08-09 21:56:27.756059+07	68ac1ef5-748f-4b7b-b8f3-0220b80a446d	Phát triển tổ chức	1	[{"added": {}}]	67	1
568	2026-08-09 21:57:23.805542+07	2ae0b982-4711-4907-b730-11af1c5c3442	Năng lực lãnh đạo	1	[{"added": {}}]	67	1
573	2026-08-09 22:06:29.61857+07	face5f20-0b59-44af-bf12-2e38a3c19be3	Trách nhiệm xã hội doanh nghiệp	1	[{"added": {}}]	67	1
578	2026-08-09 22:12:17.036524+07	21c8a90a-8f4a-4d1c-a625-27053fe234e1	Quản lý doanh nghiệp	1	[{"added": {}}]	67	1
583	2026-08-09 22:13:35.183719+07	e68cb480-9541-41b4-b9b0-5a248684757d	ThS. Nguyễn Thuận Đạt	2	[{"changed": {"fields": ["Slug", "Avatar", "Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects"]}}]	64	1
588	2026-08-09 22:20:26.169981+07	04f132ec-5cbf-4bee-8aa9-01f41474c723	AI	1	[{"added": {}}]	67	1
593	2026-08-09 22:22:08.774061+07	1ce9b61f-1e94-4c61-bc68-de6f6eabab89	Kỹ sư Minh Nguyễn	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
598	2026-08-09 22:29:16.831317+07	a14a0b20-9b70-4821-970e-e6f505bdbcb9	Mr. Trần Tuấn Hùng	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
603	2026-08-09 22:35:08.11009+07	c0f12626-e9d0-4b04-ac9d-c79da4bdbcb6	Văn hóa doanh nghiệp	1	[{"added": {}}]	67	1
608	2026-08-09 22:38:02.944906+07	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	MS. Trần Thị Thể Thanh	2	[{"changed": {"fields": ["Published"]}}]	64	1
613	2026-08-09 22:51:35.927034+07	15beced7-8d20-4c4a-89c6-fc013e2bed92	Y tế	2	[]	46	1
618	2026-08-09 23:02:07.946424+07	20758bc8-6c42-454a-86d5-1b7152f55da7	Sức khỏe tâm thần & wellbeing	2	[{"changed": {"fields": ["Cover image"]}}]	55	1
623	2026-08-10 21:41:58.927068+07	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	MS. Trần Thị Thể Thanh	2	[{"changed": {"fields": ["Research areas"]}}]	64	1
628	2026-08-10 23:05:23.377699+07	2f00571a-2c96-46fa-ad12-3aabfd52de57	Tổ chức quốc tế & NGO	2	[{"changed": {"fields": ["Primary CTA URL"]}}]	39	1
484	2026-08-09 20:24:43.550227+07	3c3aaa40-9337-4ae9-93a1-fae3ca3a0629	Hệ thống thông tin bệnh viện	1	[{"added": {}}]	67	1
489	2026-08-09 20:25:39.453098+07	16c03e2f-5966-4431-857b-90b1b9389b96	Tư vấn chiến lược	1	[{"added": {}}]	67	1
494	2026-08-09 20:33:14.969261+07	19167bf9-c0f8-4ec4-a84e-7589b0990d84	Digital Transformation	1	[{"added": {}}]	67	1
499	2026-08-09 20:34:10.036759+07	4c67e15e-f448-4a5b-b806-a074b3bc6dcb	Digital Operations	1	[{"added": {}}]	67	1
504	2026-08-09 20:40:40.480811+07	30a4c55e-b2bb-446e-8225-433d49abb0a6	Mô hình ngôn ngữ lớn	1	[{"added": {}}]	67	1
509	2026-08-09 20:41:37.367886+07	e51ecf59-154a-4a72-8d20-17bef3864db8	Thiết kế học tập	1	[{"added": {}}]	67	1
514	2026-08-09 20:47:24.375912+07	364707e1-750d-45ae-94a7-fa4e7e100609	Chuyển đổi số	1	[{"added": {}}]	67	1
519	2026-08-09 20:59:39.505058+07	04752e52-8b5d-4379-80ba-efa6089aa752	THS Trịnh Hải Linh	1	[{"added": {}}]	64	1
524	2026-08-09 21:00:56.089034+07	546d4d08-4755-4779-be11-8080e0be557f	Phát triển bản thân	1	[{"added": {}}]	67	1
529	2026-08-09 21:03:25.466189+07	04752e52-8b5d-4379-80ba-efa6089aa752	THS. Trịnh Hải Linh	2	[]	64	1
534	2026-08-09 21:19:43.860407+07	04752e52-8b5d-4379-80ba-efa6089aa752	THS. Trịnh Hải Linh	2	[{"changed": {"fields": ["Published"]}}]	64	1
539	2026-08-09 21:26:06.123199+07	60672869-0497-45c3-b214-4c9751ffad36	Tâm lý tổ chức	1	[{"added": {}}]	67	1
544	2026-08-09 21:32:34.70097+07	d969d581-da40-48d7-a534-b7c15c849e9e	Chính sách xã hội	1	[{"added": {}}]	67	1
549	2026-08-09 21:35:11.945694+07	5be799bd-bb86-4b46-afe7-22840c17be54	ThS. Nguyễn Minh Hương	3		64	1
554	2026-08-09 21:39:56.008367+07	cf2029a3-77b5-4d88-a53c-6566b2e43b4c	Kỹ năng lãnh đạo	1	[{"added": {}}]	67	1
559	2026-08-09 21:49:32.841822+07	e375a577-aae1-4b5c-8b2d-ac10544f7c5a	Giá trị sống	1	[{"added": {}}]	67	1
564	2026-08-09 21:56:40.546651+07	54d59619-7ea4-442e-acdc-d7bf889db197	Trí tuệ cảm xúc (EQ)	1	[{"added": {}}]	67	1
569	2026-08-09 21:58:13.728947+07	8ba10eec-7416-4b9a-93f1-3bd09f5c7778	ThS. Nguyễn Thị Thanh Hương	2	[{"changed": {"fields": ["Knowledge topics"]}}]	64	1
574	2026-08-09 22:06:40.41827+07	ffab6ca2-b33c-46ec-a2bb-a1e891bbeb2e	Sản xuất bền vững	1	[{"added": {}}]	67	1
579	2026-08-09 22:12:26.595382+07	4c47f16e-54d0-4fc4-8daa-41f422249d1f	Quản trị điều hành	1	[{"added": {}}]	67	1
584	2026-08-09 22:13:59.364488+07	fe798f1b-bed2-484a-a86d-e60dbfdbead5	Doanh nghiệp khởi nghiệp	1	[{"added": {}}]	67	1
589	2026-08-09 22:20:35.947198+07	3bbcef97-6036-4c47-8947-a14f01b192f5	Blockchain	1	[{"added": {}}]	67	1
594	2026-08-09 22:26:36.883054+07	a14a0b20-9b70-4821-970e-e6f505bdbcb9	Mr. Trần Tuấn Hùng	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types"]}}]	64	1
599	2026-08-09 22:29:23.169306+07	082c1ce5-a8f9-461c-86c8-6b9ead38c73c	Phát triển năng lực quản lý	1	[{"added": {}}]	67	1
604	2026-08-09 22:35:18.477051+07	9caf182a-6033-43cb-9eae-18df6830f468	Quản trị nhân tài	1	[{"added": {}}]	67	1
609	2026-08-09 22:42:42.677033+07	1548f376-7bd3-455c-a18c-6ae017a08383	Mr. Trần Trung Hiếu	2	[{"changed": {"fields": ["Hero avatar", "Profile tagline", "Full bio", "Role badges", "Ticker bar text", "Stat 1 \\u2014 value", "Stat 1 \\u2014 label", "Stat 3 \\u2014 value", "Stat 3 \\u2014 label", "Experience highlights", "Discussion topics", "Notable projects", "Engagement types", "Knowledge topics"]}}]	64	1
614	2026-08-09 23:01:09.196805+07	cd36258d-69c7-4ff6-b94e-a2037918c94b	Y tế	2	[{"changed": {"fields": ["Cover image"]}}]	55	1
619	2026-08-09 23:02:19.585364+07	df11e1bf-9dd1-47df-8ef2-2184eb5eafc0	Nguồn nhân lực	2	[{"changed": {"fields": ["Cover image"]}}]	55	1
624	2026-08-10 23:03:35.652506+07	b1610548-78b7-41e9-94e5-5aeccd0cb124	Cơ quan quản lý & Chính sách	2	[{"changed": {"fields": ["Primary CTA URL"]}}]	39	1
629	2026-08-10 23:08:59.881132+07	48d32921-c6db-4f80-b7d6-8b0675c9a473	Giải pháp	2	[{"changed": {"fields": ["Primary CTA URL"]}}]	38	1
\.


--
-- TOC entry 6400 (class 0 OID 312338)
-- Dependencies: 276
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	core	sitesettings
8	core	footerlink
9	core	footersection
10	core	menuitem
11	home	featuredsectionconfig
12	home	herosection
13	home	partnerlogo
14	home	statisticitem
15	home	audiencesectionheader
16	home	audiencesegment
17	home	capabilitiessectionheader
18	home	corecapability
19	home	ctabanner
20	home	evidencesectionheader
21	home	knowledgecategory
22	home	knowledgesectionheader
23	home	methodologysectionheader
24	home	methodologystep
25	home	philosophyprinciple
26	home	philosophysectionheader
27	home	audiencetag
28	home	heropilltag
29	capability	capabilitylistingpage
30	capability	capabilityoutput
31	capability	capability
32	capability	capabilityfeature
33	capability	capabilitycasestudytag
34	capability	capabilitycasestudy
35	capability	capabilityneeditem
36	capability	capabilityhowstep
37	solution	solutionapproachstep
38	solution	solutionlistingpage
39	solution	solution
40	solution	solutionchallenge
41	solution	solutionoutput
42	solution	solutionfeature
43	solution	solutionmethodologystep
44	knowledge	knowledgecategory
45	knowledge	knowledgelistingpage
46	knowledge	knowledgetopic
47	knowledge	knowledgearticle
48	knowledge	knowledgedownload
49	knowledge	knowledgenewsitem
50	knowledge	knowledgefeaturedarticle
51	knowledge	knowledgefiltergroup
52	knowledge	knowledgefilteritem
53	knowledge	knowledgecontenttypecard
54	knowledge	knowledgetopiccardtag
55	knowledge	knowledgetopiccard
56	knowledge	knowledgedownloadrequest
57	knowledge	knowledgeaccordionitem
58	knowledge	knowledgeeventtag
59	knowledge	knowledgeactivitynews
60	knowledge	knowledgeevent
62	expert	expertlistingpage
63	expert	processstep
64	expert	expert
65	expert	expertgroup
66	expert	researcharea
67	expert	knowledgetopic
68	knowledge	knowledgectabutton
69	expert	engagementtype
70	expert	orgunit
71	expert	infogroup
72	expert	infogroupblock
73	expert	orgnode
74	expert	infogroupmember
75	expert	association
76	about	aboutcontactbanner
77	about	aboutcorevalue
78	about	aboutcorevaluesection
79	about	aboutctabanner
80	about	aboutnetworksectionheader
81	about	aboutpageseo
82	about	aboutprofessionalnetwork
83	about	aboutpurpose
84	about	aboutcapabilityecosystem
85	about	aboutecosystempartnergroup
86	about	aboutecosystempartneritem
87	about	aboutecosystemstatistic
88	about	abouthero
89	about	aboutherostatistic
90	about	abouthighlightcard
91	about	aboutintroduction
92	about	aboutlegalinfo
93	about	aboutlegaltimelineitem
94	about	aboutpartnerbenefit
95	about	aboutpartnerbenefitsection
96	about	abouttargetaudience
97	about	abouttargetaudiencesection
98	about	aboutvisionmissioncard
99	about	aboutvisionmission
100	about	aboutvisionmissionicon
101	about	aboutlegalbadge
102	about	aboutlegalorgattribute
103	about	aboutorgstructurecard
104	about	aboutorgstructuresection
105	about	aboutorgstructurebulletitem
106	about	aboutcontactbannerstat
107	contact	contactrequest
\.


--
-- TOC entry 6402 (class 0 OID 312345)
-- Dependencies: 278
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2026-07-02 21:41:37.239927+07
2	auth	0001_initial	2026-07-02 21:41:37.274982+07
3	admin	0001_initial	2026-07-02 21:41:37.285787+07
4	admin	0002_logentry_remove_auto_add	2026-07-02 21:41:37.288821+07
5	admin	0003_logentry_add_action_flag_choices	2026-07-02 21:41:37.291611+07
6	contenttypes	0002_remove_content_type_name	2026-07-02 21:41:37.297879+07
7	auth	0002_alter_permission_name_max_length	2026-07-02 21:41:37.302366+07
8	auth	0003_alter_user_email_max_length	2026-07-02 21:41:37.305539+07
9	auth	0004_alter_user_username_opts	2026-07-02 21:41:37.308317+07
10	auth	0005_alter_user_last_login_null	2026-07-02 21:41:37.311339+07
11	auth	0006_require_contenttypes_0002	2026-07-02 21:41:37.311773+07
12	auth	0007_alter_validators_add_error_messages	2026-07-02 21:41:37.318879+07
13	auth	0008_alter_user_username_max_length	2026-07-02 21:41:37.324622+07
14	auth	0009_alter_user_last_name_max_length	2026-07-02 21:41:37.327745+07
15	auth	0010_alter_group_name_max_length	2026-07-02 21:41:37.331093+07
16	auth	0011_update_proxy_permissions	2026-07-02 21:41:37.334674+07
17	auth	0012_alter_user_first_name_max_length	2026-07-02 21:41:37.338122+07
18	sessions	0001_initial	2026-07-02 21:41:37.34234+07
19	core	0001_initial	2026-07-03 21:35:30.773075+07
20	home	0001_initial	2026-07-03 21:35:30.79095+07
21	core	0002_sitesettings_map_embed_url_and_more	2026-07-03 22:41:27.643933+07
22	home	0002_audiencesectionheader_audiencesegment_and_more	2026-07-03 22:41:27.739781+07
23	capability	0001_initial	2026-07-04 12:21:34.814241+07
24	solution	0001_initial	2026-07-05 00:22:00.306225+07
25	solution	0002_add_listing_page_hero_image	2026-07-05 18:58:57.688213+07
26	solution	0003_add_cta_image_and_listing_seo	2026-07-05 18:58:57.702585+07
27	solution	0004_add_output_image_step_description	2026-07-05 23:07:57.631002+07
28	solution	0005_add_card_color	2026-07-06 22:46:02.983393+07
29	home	0003_add_image_to_audience_and_knowledge_category	2026-07-07 21:15:19.959296+07
30	knowledge	0001_initial	2026-07-07 21:15:20.104128+07
31	knowledge	0002_add_hero_cta_filter_topic_cover	2026-07-07 21:15:20.132123+07
32	home	0004_add_link_url_to_corecapability	2026-07-11 15:17:29.08681+07
33	home	0005_add_icon_image_to_corecapability	2026-07-11 16:47:00.821129+07
34	home	0006_add_icon_image_to_audiencesegment	2026-07-11 17:14:54.231136+07
35	home	0007_herosection_heading_accent_herosection_hero_image_and_more	2026-07-11 21:46:45.628604+07
36	home	0008_herosection_quote_icon	2026-07-11 23:12:28.671976+07
37	capability	0002_add_card_icon_to_capability	2026-07-13 11:56:09.390419+07
38	capability	0003_add_image_fields_phase2	2026-07-13 11:56:09.428712+07
39	capability	0004_add_icon_image_to_howstep	2026-07-14 14:43:56.228945+07
40	capability	0005_capabilitylistingpage_cta_section	2026-07-17 22:48:43.032823+07
42	knowledge	0003_knowledge_filter_groups	2026-07-18 00:13:47.725193+07
43	knowledge	0004_featured_section_cms_fields	2026-07-18 10:08:30.967309+07
44	knowledge	0005_content_type_section	2026-07-18 23:05:25.089697+07
45	knowledge	0006_topic_browse_section	2026-07-18 23:56:50.303669+07
46	knowledge	0007_publication_section	2026-07-19 11:06:39.919575+07
47	knowledge	0008_news_events_section	2026-07-19 16:15:19.170142+07
51	expert	0001_initial	2026-07-27 17:37:03.756002+07
52	knowledge	0009_add_cta_target_to_news_and_event	2026-07-27 22:02:53.201303+07
53	knowledge	0010_add_press_section_and_news_cta_fields	2026-07-27 22:02:53.268055+07
54	knowledge	0011_add_ready_section_and_cta_button	2026-07-27 22:08:42.257555+07
55	core	0003_alter_footerlink_display_order_and_more	2026-07-27 22:11:13.642021+07
56	solution	0006_alter_solution_display_order_and_more	2026-07-27 22:11:13.701179+07
57	expert	0002_expertlistingpage_hero_badge_color_and_more	2026-07-27 22:41:38.054397+07
58	expert	0003_alter_expertlistingpage_hero_heading	2026-07-27 23:00:10.497215+07
59	expert	0004_expertlistingpage_hero_bottom_badge_logo_and_more	2026-07-27 23:20:06.45115+07
60	knowledge	0011_add_ready_section_and_cta_button	2026-07-27 23:57:31.85404+07
61	expert	0005_expertlistingpage_process_section_label	2026-07-28 21:01:08.824286+07
62	expert	0006_alter_expertlistingpage_process_heading	2026-07-28 21:43:57.902246+07
63	expert	0007_expertlistingpage_senior_description_and_more	2026-07-28 22:20:16.252773+07
64	expert	0008_expertlistingpage_map_cta1_label_and_more	2026-07-28 22:37:11.821243+07
65	expert	0009_researcharea_icon_choices_cta_fields	2026-07-28 22:57:52.32002+07
66	expert	0010_researcharea_card_icon	2026-07-28 23:09:11.055197+07
67	expert	0011_engagementtype_directory_fields	2026-07-28 23:30:32.242922+07
68	expert	0012_knowledgetopic_icon_color_cta	2026-07-29 13:18:57.108008+07
69	expert	0013_orgunit_topic_type_section_label	2026-07-29 14:05:42.093811+07
70	expert	0014_add_infogroup_and_listing_section	2026-07-29 14:27:27.060608+07
71	expert	0015_orgnode_infogroupblock_remove_bodyhtml	2026-07-29 15:28:05.277749+07
72	expert	0016_add_infogroupmember	2026-07-29 16:45:32.30924+07
73	expert	0017_infogroup_expert_grid	2026-07-29 21:20:48.456724+07
74	expert	0018_infogroup_flat_grid	2026-07-29 23:18:15.98311+07
75	expert	0019_association_model	2026-07-29 23:43:45.85635+07
76	expert	0020_expert_card_specialty	2026-08-01 09:12:03.877438+07
77	about	0001_initial	2026-08-01 22:36:31.304122+07
78	about	0002_add_quote_to_hero	2026-08-01 22:55:24.723455+07
79	about	0003_add_quote_icon	2026-08-01 23:21:05.179683+07
80	about	0004_add_bg_image_to_introduction	2026-08-02 00:06:08.253201+07
81	about	0005_extend_purpose_section	2026-08-02 00:17:18.504775+07
82	about	0006_vision_mission_enhancements	2026-08-02 10:34:18.721322+07
83	about	0007_core_value_section_bg_image	2026-08-02 11:32:16.571579+07
84	about	0008_legal_org_info_badges_attributes	2026-08-02 11:42:55.272092+07
85	about	0009_partner_benefit_enhancements	2026-08-02 13:59:30.156935+07
86	about	0010_org_structure_section	2026-08-02 21:48:25.10853+07
87	about	0011_target_audience_bg	2026-08-02 22:33:32.051445+07
88	about	0012_ecosystem_enhancements	2026-08-02 22:58:00.412498+07
89	about	0013_contact_banner_redesign	2026-08-02 23:50:43.730585+07
90	expert	0021_expert_detail_page_fields	2026-08-03 23:57:13.24995+07
91	expert	0022_expert_hero_cta_label	2026-08-04 21:54:01.818024+07
92	expert	0023_expert_hero_avatar	2026-08-04 23:36:07.991788+07
93	expert	0024_expert_profile_tagline	2026-08-05 22:42:42.566245+07
94	capability	0004_capability_icon_name	2026-08-09 09:55:37.485857+07
95	capability	0006_merge_20260809_0945	2026-08-09 09:55:37.490017+07
96	contact	0001_initial	2026-08-09 23:37:05.899046+07
\.


--
-- TOC entry 6404 (class 0 OID 312355)
-- Dependencies: 280
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
dah0zu063nx6naxbbkak0d51fxd0icgu	.eJxVjMsKwjAQAP9lzxJq3unRe78hJLsbU5UUmvYk_rsUetDrzDBviGnfatw7r3EmGOEKl1-WEz65HYIeqd0XgUvb1jmLIxGn7WJaiF-3s_0b1NQrjBAkhSxZW2vYkQqK2OqBaFDSEJMvWIzBJEl5XST7xJqcc-gCaq-Kgs8X8EI4VA:1whpvT:I9AEa9DzuIdDC7y2tnqVAIcBXsrsIjMXt5XPyTkM4CI	2026-07-23 21:40:31.163352+07
f00wro0c4e7w7l15kb2m1yxodc0c7l83	.eJxVjMsKwjAQAP9lzxJq3unRe78hJLsbU5UUmvYk_rsUetDrzDBviGnfatw7r3EmGOEKl1-WEz65HYIeqd0XgUvb1jmLIxGn7WJaiF-3s_0b1NQrjBAkhSxZW2vYkQqK2OqBaFDSEJMvWIzBJEl5XST7xJqcc-gCaq-Kgs8X8EI4VA:1wiTwD:l7Y_WOHVlelVOGiRK02JYW8gy6KncSYsOs__TJzuyHk	2026-07-25 16:23:57.294101+07
gz1n5eg4vvrlj02pcj5mix95uwtta2qj	.eJxVjMsOwiAQRf-FtSEzlEfr0r3fQIYBpGogKe3K-O_apAvd3nPOfQlP21r81tPi5yjOAsXpdwvEj1R3EO9Ub01yq-syB7kr8qBdXltMz8vh_h0U6uVbk046BhjQ2CEBRKcNpElpE4CVy0plAnY4IjmwaFXmcRqsQ2SDOugg3h_CdjbA:1wj8l2:qk3kWGDm-6-BYXOqCfgK3Wfe8qDUEEhwYjWJT_M9OZQ	2026-07-27 11:59:08.922891+07
7fmlawasq2l56o6nal69728nn5q83m90	.eJxVjMsOwiAQRf-FtSEzlEfr0r3fQIYBpGogKe3K-O_apAvd3nPOfQlP21r81tPi5yjOAsXpdwvEj1R3EO9Ub01yq-syB7kr8qBdXltMz8vh_h0U6uVbk046BhjQ2CEBRKcNpElpE4CVy0plAnY4IjmwaFXmcRqsQ2SDOugg3h_CdjbA:1wovWn:fO3jgbJxOas8oDrykl41nxKU4LJcPzDkPtgOp8cCZJ8	2026-08-12 11:04:21.417315+07
mu54zshk2098opvrr7qxg2no3rkdu1c3	.eJxVjMsKwjAQAP9lzxJq3unRe78hJLsbU5UUmvYk_rsUetDrzDBviGnfatw7r3EmGOEKl1-WEz65HYIeqd0XgUvb1jmLIxGn7WJaiF-3s_0b1NQrjBAkhSxZW2vYkQqK2OqBaFDSEJMvWIzBJEl5XST7xJqcc-gCaq-Kgs8X8EI4VA:1wsydu:6awn0Otfh6zmB4_bqyGFKjdGoUCn1gHTTbSoyZqj3Yc	2026-08-23 15:12:26.442476+07
r4hgzbxssqf8hdbq3loao8wnlvetc20r	.eJxVjMsKwjAQAP9lzxJq3unRe78hJLsbU5UUmvYk_rsUetDrzDBviGnfatw7r3EmGOEKl1-WEz65HYIeqd0XgUvb1jmLIxGn7WJaiF-3s_0b1NQrjBAkhSxZW2vYkQqK2OqBaFDSEJMvWIzBJEl5XST7xJqcc-gCaq-Kgs8X8EI4VA:1wt6Zv:S9s6knPAGgkWUuQJpCJVOMNAkUNtTjhs6OgYmQGO0Ug	2026-08-23 23:40:51.270984+07
\.


--
-- TOC entry 6405 (class 0 OID 312363)
-- Dependencies: 281
-- Data for Name: expert_association; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_association (id, is_active, display_order, created_at, updated_at, logo, icon, icon_bg_color, badge_label, badge_color, title, description, cta_label, cta_url, cta_target, info_group_id) FROM stdin;
bdfd86e3-ec2d-4e81-91ec-26df59adb992	t	2	2026-07-29 23:47:53.57254+07	2026-08-03 23:14:18.424778+07	expert/associations/VSA.png	users		Thành viên và Ban Chấp hành	#EC6D29	Chi hội Văn phòng Công tác phía Nam của Hội Xã hội học Việt Nam	IRDM gia Chi hội nhằm tăng cường kết nối học thuật, thúc đẩy nghiên cứu liên ngành và mở rộng đối thoại chuyên môn trong các lĩnh vực xã hội học sức khỏe, giáo dục, phát triển nguồn lực và chính sách xã hội.	Tìm hiểu thêm		_blank	e23ebc4e-6d8d-4070-b204-51f85793e29e
4a983c32-438c-4b9b-8778-c3cc4a81b31e	t	1	2026-07-29 23:47:53.569388+07	2026-08-03 23:27:53.991587+07	expert/associations/Icon_Brain_qac36ZO.png	cpu-chip		Thành viên và Ban điều hành mở rộng	#EC6D29	Mạng lưới Trung tâm Đào tạo Xuất sắc và Tài năng về Công nghệ 4.0 trong lĩnh vực Trí tuệ nhân tạo (AI) khu vực phía Nam	IRDM tham gia mạng lưới nhằm tăng cường kết nối học thuật, nghiên cứu ứng dụng và phát triển năng lực trong lĩnh vực AI, đồng thời thúc đẩy hợp tác liên ngành giữa các trường đại học, viện nghiên cứu, bệnh viện và tổ chức triển khai tại khu vực phía Nam.	Tìm hiểu thêm		_blank	e23ebc4e-6d8d-4070-b204-51f85793e29e
\.


--
-- TOC entry 6406 (class 0 OID 312385)
-- Dependencies: 282
-- Data for Name: expert_engagementtype; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_engagementtype (id, is_active, display_order, created_at, updated_at, name, slug, description) FROM stdin;
25654b63-9bd8-4585-ac38-867279f6512b	t	1	2026-07-28 23:36:07.617884+07	2026-07-28 23:36:07.61789+07	Tư vấn chiến lược	tu-van-chien-luoc	
23c2da6d-8f55-4c2d-8146-fea61be96edb	t	2	2026-07-28 23:36:07.619539+07	2026-07-28 23:36:07.619545+07	Thiết kế nghiên cứu	thiet-ke-nghien-cuu	
c34213a5-00ad-42b1-85ab-f30fce3f6ad5	t	3	2026-07-28 23:36:07.620498+07	2026-07-28 23:36:07.620504+07	Đào tạo & tập huấn	dao-tao-tap-huan	
a01de170-27f6-477c-a710-00a7d6f68268	t	4	2026-07-28 23:36:07.621143+07	2026-07-28 23:36:07.621147+07	Phản biện khoa học	phan-bien-khoa-hoc	
2d4498c3-376d-475d-a425-65caf86d6db5	t	5	2026-07-28 23:36:07.621748+07	2026-07-28 23:36:07.621752+07	Đồng thiết kế giải pháp	dong-thiet-ke-giai-phap	
828b7678-6bbb-4201-9e24-5d3db24a4dcd	t	6	2026-07-28 23:36:07.622614+07	2026-07-28 23:36:07.622619+07	Triển khai & đánh giá chương trình	trien-khai-danh-gia	
0ced2aa4-0552-48ad-9af6-bf3d771c50d3	f	7	2026-08-09 15:46:30.356011+07	2026-08-09 15:46:30.356024+07	Xã hội học & chính sách công	xa-hi-hc-chinh-sach-cong	Xã hội học & chính sách công
\.


--
-- TOC entry 6407 (class 0 OID 312399)
-- Dependencies: 283
-- Data for Name: expert_expert; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_expert (id, is_active, display_order, created_at, updated_at, name, slug, academic_title, "position", organization, avatar, short_bio, full_bio, email, profile_url, is_published, is_featured, is_senior, group_id, card_specialty, contact_cta_url, discussion_topics, experience_highlights, hero_tagline, notable_projects, role_badges, stat_1_label, stat_1_value, stat_2_label, stat_2_value, stat_3_label, stat_3_value, ticker_text, hero_cta_label, hero_avatar, profile_tagline) FROM stdin;
b79cdef4-3435-4990-9252-1791aedd6d2e	t	7	2026-07-27 17:43:39.048478+07	2026-07-28 23:36:07.673496+07	Đỗ Thị Hương	o-thi-huong	TS.	Chuyên gia Phát triển bền vững	Viện Chiến lược và Chính sách Tài nguyên Môi trường		Nhà nghiên cứu về kinh tế xanh và phát triển bền vững, tư vấn cho UNDP và GIZ tại Việt Nam.				t	f	f	07ba59c7-7723-41bc-8673-77c08c791b6c		/lien-he/															
82f35f80-7d8e-4b7c-9dfc-e0c27c6abf22	t	6	2026-07-27 17:43:39.040919+07	2026-07-28 23:36:07.67154+07	Ngô Quang Minh	ngo-quang-minh	GS.	Giáo sư Giáo dục học	Đại học Sư phạm Hà Nội		Chuyên gia hàng đầu về cải cách giáo dục và đào tạo giáo viên, cố vấn Bộ Giáo dục và Đào tạo.				t	f	f	0490c13d-38a8-445a-9c19-a93227978afd		/lien-he/															
b9ff32bd-2aa8-49e7-9586-379c75f33e28	t	9	2026-07-27 17:43:39.060016+07	2026-07-28 23:36:07.677552+07	Nguyễn Thị Mai	nguyen-thi-mai	PGS.TS.	Phó Giáo sư Xã hội học	Đại học Khoa học Xã hội và Nhân văn		Nhà nghiên cứu xã hội học chuyên về bất bình đẳng giới, di cư lao động và an sinh xã hội.				t	f	f	0490c13d-38a8-445a-9c19-a93227978afd		/lien-he/															
88999316-8f8d-4ca0-9438-82d9df238d59	t	10	2026-07-27 17:43:39.069274+07	2026-07-28 23:36:07.680021+07	Richard Thompson	richard-thompson	Prof.	Professor of International Economics	University of Melbourne		International expert on economic development in Southeast Asia with 30+ years of research experience.				t	f	f	53d588f5-b4ad-4059-bbcb-2a6f54b67150		/lien-he/															
95eef455-b009-4c6f-907e-91673dd3f1a8	t	11	2026-07-27 17:43:39.075405+07	2026-07-28 23:36:07.68281+07	Lý Thị Kim Ngân	ly-thi-kim-ngan	TS.	Chuyên gia Tài chính Công	Học viện Tài chính		Chuyên gia tài chính công và ngân sách nhà nước, từng tư vấn cho Bộ Tài chính về cải cách thuế.				t	f	f	07ba59c7-7723-41bc-8673-77c08c791b6c		/lien-he/															
a502b2c7-b3b8-4383-a12e-9c069de367c9	t	12	2026-07-27 17:43:39.085151+07	2026-07-28 23:36:07.685254+07	Trần Quốc Bảo	tran-quoc-bao	PGS.TS.	Giám đốc Trung tâm Nghiên cứu AI	Đại học Quốc gia Hà Nội		Nhà nghiên cứu AI và học máy, trưởng nhóm nghiên cứu xử lý ngôn ngữ tự nhiên tiếng Việt.				t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/															
d53433ba-b9d8-4441-83e8-14f9693736b5	t	13	2026-07-27 17:43:39.092419+07	2026-07-28 23:36:07.687229+07	Yoshida Kenji	yoshida-kenji	Dr.	Senior Researcher	JICA Research Institute		Japanese development economist specializing in education policy reform and human capital development in Asia.				t	f	f	53d588f5-b4ad-4059-bbcb-2a6f54b67150		/lien-he/															
7c089591-38b6-43a5-a990-f7b03c9d6d21	t	14	2026-07-27 17:43:39.102249+07	2026-07-28 23:36:07.68936+07	Bùi Thị Thu Hà	bui-thi-thu-ha	TS.	Chuyên gia Phát triển Tổ chức	Công ty Tư vấn McKinsey Vietnam		Chuyên gia tư vấn chiến lược với hơn 18 năm kinh nghiệm giúp doanh nghiệp Việt Nam nâng cao năng lực cạnh tranh.				t	f	f	f5b73ea9-c9e3-4f8a-908f-e725e2123cba		/lien-he/															
eb7bef3e-f94f-49f9-87f3-37f367ab994e	t	15	2026-07-27 17:43:39.110064+07	2026-07-28 23:36:07.691505+07	Đinh Văn Phúc	inh-van-phuc	GS.TS.	Giáo sư Y học Dự phòng	Đại học Y Dược TP.HCM		Chuyên gia y học dự phòng và dịch tễ học, trưởng nhóm nghiên cứu về bệnh không lây nhiễm tại Việt Nam.				t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/															
e661b4e7-3380-4305-9404-c2f437fe1aba	t	16	2026-07-27 17:43:39.11934+07	2026-07-28 23:36:07.693387+07	Phạm Thị Lan Anh	pham-thi-lan-anh	TS.	Chuyên gia Lãnh đạo Phụ nữ	Hội Liên hiệp Phụ nữ Việt Nam		Chuyên gia về bình đẳng giới và lãnh đạo phụ nữ trong khu vực công và tư nhân.				t	f	f	07ba59c7-7723-41bc-8673-77c08c791b6c		/lien-he/															
06f55fd9-7ccb-4bda-83d3-8d96d3ac8a69	t	17	2026-07-27 17:43:39.126555+07	2026-07-28 23:36:07.695418+07	Cao Xuân Hưng	cao-xuan-hung	TS.	Giám đốc Sản phẩm	VNG Corporation		Nhà lãnh đạo sản phẩm công nghệ với kinh nghiệm xây dựng nền tảng số phục vụ hàng triệu người dùng.				t	f	f	f5b73ea9-c9e3-4f8a-908f-e725e2123cba		/lien-he/															
a77bf886-849b-455b-852a-2df8b6b58fa0	t	18	2026-07-27 17:43:39.134357+07	2026-07-28 23:36:07.698194+07	Sarah Chen	sarah-chen	Dr.	Associate Professor of Development Studies	National University of Singapore		Researcher in sustainable development and urban governance with extensive fieldwork across Southeast Asia.				t	f	f	53d588f5-b4ad-4059-bbcb-2a6f54b67150		/lien-he/															
2664691b-c5df-4ae9-b521-0185b31cce4d	t	19	2026-07-27 17:43:39.141063+07	2026-07-28 23:36:07.700939+07	Lê Thị Thanh Huyền	le-thi-thanh-huyen	PGS.TS.	Phó Giáo sư Kinh tế Lao động	Viện Khoa học Lao động và Xã hội		Chuyên gia kinh tế lao động và an sinh xã hội, nghiên cứu về thị trường lao động và kỹ năng nghề.				t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/															
f545466a-f5e5-4312-b277-5beb577cfa3d	t	20	2026-07-27 17:43:39.148286+07	2026-07-28 23:36:07.703444+07	Nguyễn Bảo Long	nguyen-bao-long	TS.	Chuyên gia ESG & Bền vững	KPMG Vietnam		Chuyên gia về báo cáo ESG và chiến lược phát triển bền vững cho các tập đoàn đa quốc gia tại Việt Nam.				t	f	f	f5b73ea9-c9e3-4f8a-908f-e725e2123cba		/lien-he/															
d37db12f-a3b6-4dc9-aa60-b475590ed25f	t	21	2026-07-27 17:43:39.153912+07	2026-07-28 23:36:07.706055+07	Đặng Thị Minh Châu	ang-thi-minh-chau	TS.	Chuyên gia Tâm lý Tổ chức	Đại học Khoa học Xã hội và Nhân văn TP.HCM		Nhà tâm lý học tổ chức với chuyên môn về văn hóa doanh nghiệp, quản lý thay đổi và phát triển lãnh đạo.				t	f	f	0490c13d-38a8-445a-9c19-a93227978afd		/lien-he/															
96d80975-dbfe-4f48-95df-2d31e6cc6ede	t	22	2026-07-27 17:43:39.160426+07	2026-07-28 23:36:07.708412+07	Trương Văn Khoa	truong-van-khoa	GS.TS.	Giáo sư Toán học Ứng dụng	Đại học Khoa học Tự nhiên		Nhà toán học ứng dụng chuyên về mô hình hóa kinh tế và dự báo tài chính, thành viên Hội Toán học Việt Nam.				t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/															
0dac0759-934b-4704-97eb-527515f578ea	t	23	2026-07-27 17:43:39.167275+07	2026-07-28 23:36:07.710313+07	Phan Thị Ngọc Linh	phan-thi-ngoc-linh	TS.	Chuyên gia Dinh dưỡng Cộng đồng	Viện Dinh dưỡng Quốc gia		Chuyên gia dinh dưỡng và an toàn thực phẩm, chủ nhiệm nhiều đề tài nghiên cứu cấp quốc gia về dinh dưỡng học sinh.				t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/															
a7438e8f-5301-453e-b2be-212f786a8802	t	24	2026-07-27 17:43:39.172366+07	2026-07-28 23:36:07.71219+07	Michael Park	michael-park	Prof.	Professor of Digital Transformation	KAIST		Pioneer in digital transformation research with 20+ years studying technology adoption in emerging economies.				t	f	f	53d588f5-b4ad-4059-bbcb-2a6f54b67150		/lien-he/															
5bcb6772-6263-4add-a5f3-95054fd00246	t	5	2026-07-27 17:43:39.034892+07	2026-07-28 23:36:07.669477+07	Vũ Thị Lan	vu-thi-lan	TS.	Tiến sĩ Y tế Cộng đồng	Đại học Y Hà Nội		Nhà nghiên cứu y tế công cộng, chuyên gia về dinh dưỡng cộng đồng và can thiệp hành vi sức khỏe.				t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/															
e2f886bb-a017-458f-b4f8-311f0d800fee	t	8	2026-07-27 17:43:39.054909+07	2026-07-28 23:36:07.675633+07	Hoàng Văn Thành	hoang-van-thanh	TS.	Giám đốc Chuyển đổi số	Tập đoàn FPT		Lãnh đạo chuyển đổi số với 15 năm kinh nghiệm triển khai giải pháp công nghệ cho doanh nghiệp lớn.				t	f	f	f5b73ea9-c9e3-4f8a-908f-e725e2123cba		/lien-he/															
162d63f1-2d74-436c-b497-12b6f71fd9f7	t	3	2026-07-27 17:43:39.016567+07	2026-07-31 22:19:52.517329+07	Lê Minh Châu	le-minh-chau	TS.	Tiến sĩ Khoa học Dữ liệu	Đại học Bách khoa Hà Nội		Chuyên gia AI và phân tích dữ liệu lớn, từng làm việc tại MIT Media Lab và Google Research. Hiện đang dẫn dắt nhóm nghiên cứu AI ứng dụng trong y tế và giáo dục.				f	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/															
8b00b6e5-4263-492f-9dde-866efa62f049	t	4	2026-07-27 17:43:39.024389+07	2026-07-31 22:20:13.130236+07	Phạm Đức Hùng	pham-uc-hung	PGS.TS.	Phó Giáo sư Chính sách Công	Học viện Hành chính Quốc gia		Chuyên gia về cải cách hành chính và quản trị nhà nước với 20 năm kinh nghiệm tư vấn chính phủ.				f	f	f	07ba59c7-7723-41bc-8673-77c08c791b6c		/lien-he/															
6c3770a1-da0e-40ca-bd75-c37091d43431	t	25	2026-07-27 17:43:39.178+07	2026-07-28 23:36:07.714987+07	Võ Thị Thanh Tâm	vo-thi-thanh-tam	PGS.TS.	Phó Giáo sư Quản trị Y tế	Đại học Y tế Công cộng		Chuyên gia quản trị bệnh viện và chính sách y tế, tư vấn cải cách hệ thống y tế cho nhiều tỉnh thành.				t	f	f	0490c13d-38a8-445a-9c19-a93227978afd		/lien-he/															
858ac4bd-6f40-4bc3-b726-50c42d9cfe32	t	13	2026-07-29 22:39:48.492959+07	2026-07-29 22:39:48.492968+07	Nguyễn Ngọc Liêm	nguyen-ngoc-liem	Kỹ sư								t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/															
765a906e-fd8b-4b8b-9788-07cc411e2854	t	17	2026-07-29 22:39:48.506373+07	2026-07-29 22:39:48.50638+07	Phạm Thị Thủy	pham-thi-thuy	TS.								t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/															
8083be18-e5b7-4a0f-a1d9-68f8a0135d05	t	22	2026-07-29 22:39:48.520097+07	2026-07-29 22:39:48.520104+07	Trịnh Thúy Linh	trinh-thuy-linh	ThS.								t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/															
2486a510-13b5-40c4-aafe-d016ee99a05f	t	29	2026-07-29 22:39:48.540014+07	2026-07-29 22:39:48.54002+07	Lê Thị Lan Anh	le-thi-lan-anh	ThS.								t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/															
cc2c8d15-3a91-4485-81ef-8fcef5ea4a25	t	1	2026-07-27 17:43:38.979296+07	2026-07-31 22:02:26.242275+07	Nguyễn Văn An	nguyen-van-an	GS.TS.	Giáo sư Kinh tế học	Đại học Kinh tế Quốc dân		Chuyên gia hàng đầu về kinh tế phát triển với hơn 25 năm kinh nghiệm nghiên cứu và tư vấn chính sách. Từng là cố vấn cho các tổ chức quốc tế như World Bank và ADB.				f	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/															
4bfedb13-2989-40cb-a435-0c3314c0f5c3	t	2	2026-07-27 17:43:39.008155+07	2026-07-31 22:19:41.334325+07	Trần Thị Bình	tran-thi-binh	PGS.TS.	Phó Giáo sư Quản trị Kinh doanh	Đại học Ngoại thương		Chuyên gia về quản trị doanh nghiệp và chuyển đổi số với nhiều công trình nghiên cứu được quốc tế công nhận. Tác giả của 3 cuốn sách về lãnh đạo trong thời đại số.				f	f	f	0490c13d-38a8-445a-9c19-a93227978afd		/lien-he/															
5e834e6b-7d63-4416-b323-80a1758300b1	t	1	2026-07-29 22:39:48.44205+07	2026-08-04 22:59:13.623753+07	Phạm Lê An	pham-le-an	GS.TS.BS.	Y tế & quản trị y tế		expert/avatars/PhamLeAn.png	Nhà khoa học và chuyên gia cao cấp về Y học gia đình, sức khỏe cộng đồng và phát triển hệ thống Y tế – Giáo dục	GS.TS.BS. Phạm Lê An là chuyên gia hàng đầu trong lĩnh vực Y học gia đình, y tế cộng đồng và giáo dục y khoa tại Việt Nam. Với định hướng tiếp cận hệ thống và chăm sóc toàn diện, ông tập trung thúc đẩy các mô hình chăm sóc sức khỏe ban đầu, phát triển năng lực nhân lực y tế và kết nối liên ngành giữa Y tế – Giáo dục – Xã hội trong bối cảnh phát triển bền vững và hậu đại dịch.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b	Y tế & quản trị y tế	/lien-he/	Phát triển mô hình Y học gia đình và chăm sóc sức khỏe ban đầu\r\nSức khỏe cộng đồng và sức khỏe môi trường\r\nThiết kế và đánh giá dịch vụ Y tế\r\nGiáo dục y khoa và phát triển năng lực nhân lực Y tế\r\nSức khỏe tâm thần học đường và cộng đồng\r\nChính sách y tế và phát triển hệ thống chăm sóc toàn diện	Hơn 30 năm kinh nghiệm trong giảng dạy, nghiên cứu và phát triển hệ thống Y tế. Giáo sư Nhi khoa, Đại học Y Dược TP.HCM. Từng giữ nhiều vai trò lãnh đạo tại Đại học Y Dược TP.HCM như Trưởng Trung tâm Y học Gia đình, Phó Phòng Sau đại học và phụ trách Trung tâm Hỗ trợ dự án & đổi mới sáng tạo. Cố vấn chuyên môn và nghiên cứu khoa học tại IRDM từ năm 2022. Chủ biên nhiều giáo trình nền tảng cho đào tạo bác sĩ gia đình và nhân lực y tế tuyến đầu.		Chủ trì và tham gia các nghiên cứu về sức khỏe cộng đồng, sức khỏe hô hấp và sức khỏe tâm thần tại Việt Nam.\r\nDự án FRESH AIR (EU) về can thiệp hô hấp trong bối cảnh thiếu nguồn lực.\r\nDự án giảm ô nhiễm không khí và tăng cường sức khỏe trẻ em TP.HCM hợp tác với Đại học Purdue (Mỹ).\r\nNghiên cứu phát triển mô hình hỗ trợ tâm lý học đường và chăm sóc liên tục từ gia đình – nhà trường – y tế.\r\nCông bố hơn 150 bài báo khoa học, trong đó có hơn 50 bài quốc tế thuộc hệ thống ISI/Scopus.		Năm kinh nghiệm	30+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG			
8ba10eec-7416-4b9a-93f1-3bd09f5c7778	t	33	2026-07-29 22:39:48.549807+07	2026-08-09 21:58:57.128136+07	Nguyễn Thị Thanh Hương	nguyen-thi-thanh-huong	ThS.			expert/avatars/NguyenThiThanhHuong.jpg		ThS. Nguyễn Thị Thanh Hương là chuyên gia trong lĩnh vực quản trị nhân sự, phát triển lãnh đạo và phát triển tổ chức. Sau hơn 20 năm làm việc trong ngành tư vấn nhân sự, bà thành lập Liberal Leadership Organization (LLO), tổ chức tập trung vào các chương trình phát triển trí tuệ cảm xúc và năng lực lãnh đạo. Trước đó, bà là đồng sáng lập và từng giữ vị trí Phó Tổng Giám đốc Talentnet. Hoạt động chuyên môn của bà hướng đến việc giúp các nhà lãnh đạo nâng cao khả năng thấu hiểu bản thân, khai phóng tiềm năng và dẫn dắt đội ngũ bằng sự thấu cảm.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Phát triển năng lực lãnh đạo\r\nLãnh đạo bằng sự thấu cảm\r\nXây dựng và phát triển đội ngũ\r\nPhát triển văn hóa lãnh đạo\r\nTrí tuệ cảm xúc dành cho nhà quản lý\r\nThấu hiểu bản thân và phát triển nội lực lãnh đạo\r\nQuản trị con người trong tổ chức\r\nHành trình phát triển cá nhân của nhà lãnh đạo	Hơn 20 năm kinh nghiệm trong lĩnh vực tư vấn nhân sự, quản trị và phát triển lãnh đạo.\r\nNhà sáng lập và Tổng Giám đốc Liberal Leadership Organization (LLO).\r\nĐồng sáng lập và nguyên Phó Tổng Giám đốc Talentnet.\r\nPhát triển các chương trình đào tạo về trí tuệ cảm xúc và năng lực lãnh đạo.\r\nLà EQ Master Trainer và thành viên của International Coaching Federation (ICF).		Thành lập và điều hành Liberal Leadership Organization, phát triển các chương trình đào tạo chuyên sâu về EQ và Leadership.\r\nXây dựng các chương trình kết hợp giáo trình quốc tế, kiến thức nền tảng và trải nghiệm cá nhân nhằm hỗ trợ quá trình phát triển lâu dài của người học.\r\nĐồng hành cùng các nhà lãnh đạo trong quá trình thấu hiểu bản thân, khai phóng tiềm năng và phát triển khả năng dẫn dắt đội ngũ.\r\nTham gia chia sẻ chuyên môn về lãnh đạo tỉnh thức, nội lực lãnh đạo và vai trò của trí tuệ cảm xúc trong quản trị.	Nhà khoa học/chuyên gia	Năm kinh nghiệm	20+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/NguyenThiThanhHuong.jpg	Chuyên gia quản trị nhân sự và phát triển lãnh đạo với hơn 20 năm kinh nghiệm tư vấn, quản lý và đồng hành cùng các tổ chức.
55dae78f-50c7-4bec-8975-998d7d55dba2	t	7	2026-07-29 22:39:48.47286+07	2026-08-05 22:52:33.252687+07	Nguyễn Thanh Bình	nguyen-thanh-binh	PGS.TS.	Chuyên gia AI & dữ liệu		expert/avatars/NguyenThanhBinh.jpg	Chuyên gia về AI, khai phá dữ liệu và ứng dụng công nghệ trong y tế số.	PGS.TS. Nguyễn Thanh Bình là chuyên gia trong lĩnh vực trí tuệ nhân tạo, khoa học dữ liệu và toán học ứng dụng. Ông hiện là giảng viên Khoa Toán – Tin học, Trường Đại học Khoa học Tự nhiên (ĐHQG TP.HCM). Sau khi hoàn thành chương trình Tiến sĩ loại xuất sắc tại École Polytechnique (Pháp), ông trở về Việt Nam để giảng dạy, nghiên cứu và phát triển các hướng ứng dụng AI trong công nghiệp, môi trường, xử lý ngôn ngữ tự nhiên và chuyển đổi số. Hoạt động nghiên cứu của ông tập trung vào việc kết nối giữa trường đại học và doanh nghiệp nhằm chuyển giao các thành quả khoa học thành các giải pháp có giá trị thực tiễn.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Trí tuệ nhân tạo (AI)\r\nKhoa học dữ liệu và phân tích dữ liệu lớn\r\nXử lý ngôn ngữ tự nhiên (NLP)\r\nAI trong môi trường và đô thị thông minh\r\nMachine Learning và Deep Learning\r\nComputer Vision\r\nAI trong sản xuất công nghiệp\r\nThiết kế thuật toán và tối ưu hóa mô hình AI	Phó Giáo sư, Tiến sĩ Khoa học máy tính.\r\nThủ khoa tốt nghiệp ngành Toán – Tin học, Trường ĐH Khoa học Tự nhiên TP.HCM (2008).\r\nThạc sĩ Toán ứng dụng, Đại học Orléans (Pháp).\r\nTiến sĩ loại xuất sắc tại École Polytechnique (Pháp) năm 2013.\r\nHơn 11 năm giảng dạy và nghiên cứu tại Trường ĐH Khoa học Tự nhiên (ĐHQG TP.HCM).\r\nCó hơn 50 công bố khoa học quốc tế trên các tạp chí SCI và hội nghị quốc tế uy tín.\r\nChủ trì và tham gia nhiều nghiên cứu chuyển giao AI cho doanh nghiệp và cơ quan quản lý.		Đồng tác giả bằng sáng chế tại Hoa Kỳ về hệ thống đánh giá chất lượng sợi vải tự động bằng máy đo quang phổ (2021).\r\nPhát triển các mô hình AI dự đoán lỗi kỹ thuật và đánh giá chất lượng trong sản xuất công nghiệp.\r\nChủ trì nghiên cứu "Multi-source Machine Learning for AQI Estimation", ứng dụng IoT và Machine Learning để dự báo chất lượng không khí tại TP.HCM (IEEE Big Data 2021).\r\nCông bố các nghiên cứu về phân tích cảm xúc tiếng Việt và hệ thống hỏi – đáp trên tri thức bằng mô hình BERT tại các hội nghị quốc tế SoMeT và ICONIP 2021.\r\nCó hơn 50 công bố quốc tế trên các tạp chí SCI Q1 như SIAM Review, Knowledge-Based Systems, Information Sciences và Neurocomputing.		Năm kinh nghiệm	11+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế				Phó Giáo sư, Tiến sĩ Khoa học máy tính và Toán ứng dụng với chuyên môn về trí tuệ nhân tạo, học máy và chuyển giao các mô hình AI vào giải quyết bài toán thực tiễn
7a442992-c910-47e8-b627-afd0e7ce4c83	t	4	2026-07-29 22:39:48.461006+07	2026-08-04 23:08:22.357405+07	Trần Lê Diễm Anh	tran-le-diem-anh	TS.DS.	Chuyên gia học tập ứng dụng	Phó Chủ tịch Hội Đồng Quản lý Viện IRDM  Viện trưởng Viện IRDM  Nhà khoa học/chuyên gia; Giảng viên & Chuyên gia học tập ứng dụng	expert/avatars/TranLeDiemAnh.jpg	Nhà khoa học và chuyên gia liên ngành về quản trị y tế, sức khỏe tâm thần và phát triển hệ thống Y tế – Giáo dục	Chuyển hóa tri thức thành trải nghiệm học tập, E-Learning và phát triển năng lực.			t	t	t	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b	Giáo dục & y tế	/lien-he/	Quản trị và phát triển hệ thống Y tế;\r\nSức khỏe tâm thần học đường;\r\nNghiên cứu và phát triển chính sách xã hội sức khỏe.\r\nLeadership & wellbeing cho nhân sự Y tế;\r\nPhát triển năng lực liên ngành;	Hơn 22 năm kinh nghiệm trong lĩnh vực dược phẩm, chăm sóc sức khỏe và phát triển hệ thống Y tế. Từng đảm nhiệm các vị trí lãnh đạo cấp cao tại Roche, Johnson & Johnson, MSD/Merck, Menarini và Chemo Iberica SA. Giảng viên đồng thỉnh giảng Trường Dược – Đại học Y Dược TP.HCM. Tác giả và đồng tác giả nhiều nghiên cứu về sức khỏe tâm thần, xã hội học sức khỏe và phát triển hệ thống Y tế – Giáo dục. Chủ trì và tham gia các sáng kiến nghiên cứu ứng dụng, chuyển đổi số và phát triển năng lực trong lĩnh vực Y tế – Giáo dục.	TS.DS. Trần Lê Diễm Anh là nhà khoa học và chuyên gia liên ngành tập trung vào quản trị y tế, sức khỏe tâm thần và phát triển hệ thống Y tế – Giáo dục từ góc nhìn xã hội học và phát triển con người. TS. DS. Diễm Anh hiện là Viện trưởng IRDM, đồng thời tham gia nghiên cứu, đào tạo và phát triển các sáng kiến liên ngành hướng tới wellbeing và phát triển bền vững	Chủ trì và phát triển các nghiên cứu về sức khỏe tâm thần sinh viên khối ngành Y tế từ góc nhìn xã hội học.\r\nTham gia nhiệm vụ khoa học công nghệ “Ứng dụng chuyển đổi số trong quản lý, phê duyệt, giám sát hoạt động khoa học công nghệ ngành Y tế tại TP.HCM” (2024–2025).\r\nPhát triển các chương trình leadership và wellbeing cho nhân sự Y tế trong bối cảnh hậu COVID-19.\r\nTriển khai các sáng kiến liên ngành về xã hội học sức khỏe, phát triển hệ thống Y tế bền vững và nâng cao năng lực nguồn nhân lực Y tế – Giáo dục.\r\nCó sáng kiến và triển khai các nhiệm vụ ứng dụng AI trong hỗ trợ chẩn đoán, quản lý, phòng ngừa và dự báo bệnh tật.		Năm kinh nghiệm	22+					QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG			
a78667f1-f6cc-407c-8079-eb9a2beed0d1	t	15	2026-07-29 22:39:48.500403+07	2026-08-05 22:24:36.746909+07	Nguyễn Đức Tuấn	nguyen-duc-tuan	GS.TS.DS.	Nhà khoa học/chuyên gia		expert/avatars/GS_NguyenDucTuan.jpg	Nhà khoa học và chuyên gia cao cấp về quản trị Giáo dục đại học ngành Dược, kiểm soát chất lượng dược phẩm và phát triển hệ thống đào tạo Y Dược.	GS.TS. Nguyễn Đức Tuấn là chuyên gia đầu ngành trong lĩnh vực kiểm nghiệm thuốc, phân tích dược chất và quản lý chất lượng Giáo dục đại học ngành Dược tại Việt Nam. Với nền tảng nghiên cứu chuyên sâu kết hợp kinh nghiệm quản trị học thuật và phát triển hệ thống đảm bảo chất lượng, ông tập trung thúc đẩy đổi mới đào tạo Dược, nghiên cứu phát triển thuốc và ứng dụng khoa học phân tích trong kiểm soát chất lượng dược phẩm – thực phẩm – sản phẩm chăm sóc sức khỏe.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b	AI, dữ liệu & chuyển đổi số	/lien-he/	Đảm bảo và kiểm định chất lượng Giáo dục đại học\r\nKiểm nghiệm và tiêu chuẩn hóa dược phẩm – thực phẩm – sản phẩm chăm sóc sức khỏe\r\nNghiên cứu kinh tế Y tế và hành vi sử dụng thuốc\r\nPhát triển chương trình đào tạo ngành Y Dược theo chuẩn quốc tế\r\nPhân tích dược chất, tạp chất và chất đánh dấu sinh học\r\nTư vấn phát triển sản phẩm và hệ thống kiểm soát chất lượng	Giáo sư, Tiến sĩ Dược học; Phó Trưởng Khoa Dược và Trưởng Bộ môn Phân tích – Kiểm nghiệm, Đại học Y Dược TP.HCM.\r\nHơn 30 năm kinh nghiệm trong nghiên cứu, giảng dạy và phát triển hệ thống đảm bảo chất lượng đào tạo ngành Dược.\r\nTừng phụ trách Đơn vị Đảm bảo chất lượng Giáo dục Khoa Dược – Đại học Y Dược TP.HCM.\r\nCó nhiều giai đoạn nghiên cứu sau tiến sĩ tại Đại học Innsbruck (Áo) và Đại học Osaka (Nhật Bản).\r\nTham gia biên soạn Dược điển Việt Nam các phiên bản IV, V và VI.		Chủ trì và tham gia nhiều đề tài cấp Nhà nước, cấp Thành phố về kiểm nghiệm thuốc, tiêu chuẩn hóa dược chất và phát triển hệ thống phân tích dược phẩm.\r\nXây dựng quy trình kiểm nghiệm và tiêu chuẩn hóa nguyên liệu, thành phẩm đưa vào Dược điển Việt Nam.\r\nPhát triển các quy trình HPLC, CE, LC-MS/MS trong phân tích dược chất và chất chuyển hóa sinh học.\r\nTriển khai hoạt động đảm bảo chất lượng đào tạo ngành Dược theo chuẩn AUN-QA.\r\nCông bố hơn 100 bài báo khoa học và hướng dẫn nhiều nghiên cứu sinh, học viên cao học trong lĩnh vực Dược học và kiểm nghiệm thuốc.		Năm kinh nghiệm	30+			Phạm vi nghiên cứu và hợp tác quốc tế	Việt Nam	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/GS_NguyenDucTuan.jpg	
0320a7f6-ea8e-434e-b1b5-b1492092aff7	t	0	2026-07-29 22:39:48.49661+07	2026-08-05 23:52:50.823092+07	Lê Quang Minh	le-quang-minh	PGS.TS.	Nhà khoa học giáo dục	Thành viên Hội đồng quản lý IRDM	expert/avatars/PGS_LeQuangMinh.jpg	Đồng hành định hướng học thuật và phát triển năng lực trong giáo dục đại học	PGS.TS. Lê Quang Minh là chuyên gia hàng đầu trong lĩnh vực quản trị đại học, đảm bảo chất lượng Giáo dục, phát triển chính sách công và quản lý môi trường. Với hơn 40 năm kinh nghiệm nghiên cứu, giảng dạy và điều hành tại các cơ sở Giáo dục lớn của Việt Nam, ông từng giữ nhiều vị trí lãnh đạo trọng yếu như Hiệu trưởng Đại học Cần Thơ, Phó Giám đốc ĐHQG TP.HCM và Kiểm định viên trưởng AUN-QA. Ông đồng thời là chuyên gia tư vấn cho nhiều chương trình hợp tác quốc tế về phát triển Giáo dục, quản trị đại học và phát triển bền vững tại khu vực ASEAN.			t	t	t	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Chiến lược phát triển Giáo dục đại học\r\nPhát triển chương trình đào tạo theo chuẩn đầu ra và OBE\r\nChính sách công về Giáo dục và phát triển nguồn nhân lực\r\nThiết kế hệ thống đảm bảo chất lượng và kiểm định Giáo dục\r\nQuản trị đại học và phát triển lãnh đạo Giáo dục\r\nQuản lý môi trường, biến đổi khí hậu và phát triển bền vững	Nguyên Hiệu trưởng Đại học Cần Thơ; nguyên Phó Giám đốc ĐHQG TP.HCM.\r\nChủ tịch Hội đồng Đảm bảo Chất lượng ĐHQG TP.HCM và Kiểm định viên trưởng AUN-QA.\r\nHơn 40 năm kinh nghiệm trong quản trị đại học, phát triển chương trình đào tạo và hợp tác quốc tế.\r\nChủ trì nhiều dự án quốc tế quy mô lớn với tổng ngân sách hàng chục triệu Euro và Dollar từ Hà Lan, Bỉ, Canada và các tổ chức quốc tế.\r\nĐại biểu Quốc hội khóa X, XI; cố vấn cao cấp cho UB Văn hóa – Giáo dục Quốc hội và ĐHQG TP.HCM.	Thành viên Hội đồng quản lý IRDM\r\nNhà khoa học/chuyên gia; Giảng viên & Chuyên gia học tập ứng dụng	Chủ nhiệm các dự án phát triển đại học quốc tế như VLIR (Bỉ), MHO (Hà Lan), VSEP (Canada).\r\nThiết kế và triển khai chương trình Thạc sĩ Quản lý Môi trường và Biến đổi khí hậu hợp tác với Đại học Aarhus (Đan Mạch) và Đại học Duke (Hoa Kỳ).\r\nĐồng thiết kế và huấn luyện triển khai mô hình đào tạo Outcome-Based Education cho nhiều trường đại học trong ASEAN.\r\nTư vấn và đào tạo xây dựng hệ thống đảm bảo chất lượng nội bộ cho hơn 100 trường đại học và cao đẳng tại Việt Nam.\r\nChủ trì và tham gia nhiều nghiên cứu về quản lý tài nguyên nước, cải tạo đất phèn, phát triển bền vững vùng Đồng bằng sông Cửu Long.		Năm kinh nghiệm	40+	Trường đại học tư vấn	100+	Phạm vi nghiên cứu và hợp tác quốc tế	ASEAN				Chuyên gia cao cấp về quản trị đại học, kiểm định chất lượng Giáo dục và phát triển chính sách công – môi trường tại Việt Nam và ASEAN
bb812c25-fe79-4803-a18f-91e2f890dead	t	16	2026-07-29 22:39:48.503259+07	2026-08-06 22:05:21.020059+07	Nguyễn Thị Vân Hạnh	nguyen-thi-van-hanh	PGS.TS.	Nhà khoa học/chuyên gia		expert/avatars/NguyenThiMinh_ZeD0z6A.png		PGS.TS. Nguyễn Thị Vân Hạnh là nhà nghiên cứu và giảng viên xã hội học với hơn 20 năm kinh nghiệm trong nghiên cứu, giảng dạy và hướng dẫn khoa học tại Đại học Quốc gia Hà Nội và Đại học Quốc gia TP.HCM. Các hướng nghiên cứu nổi bật của bà tập trung vào xã hội học du lịch, phát triển du lịch bền vững, giới trong quản lý và du lịch, hành vi du khách, du lịch thông minh và tác động của công nghệ đối với ngành du lịch. Với nền tảng nghiên cứu quốc tế và kinh nghiệm hướng dẫn nhiều học viên cao học, nghiên cứu sinh, bà có thế mạnh trong thiết kế nghiên cứu, phát triển năng lực học thuật và chuyển hóa kết quả nghiên cứu thành hàm ý cho đào tạo, quản lý và phát triển ngành.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Thiết kế và triển khai nghiên cứu xã hội học ứng dụng\r\nỨng dụng công nghệ, AI và thực tế ảo trong du lịch\r\nPhát triển du lịch nông nghiệp, du lịch đêm và du lịch văn hóa\r\nPhát triển năng lực nghiên cứu cho giảng viên, học viên và nghiên cứu sinh\r\nPhát triển du lịch bền vững và du lịch dựa vào cộng đồng\r\nHành vi, trải nghiệm và quyết định của du khách\r\nGiới, cơ hội nghề nghiệp và môi trường làm việc trong ngành du lịch\r\nThiết kế chương trình đào tạo và học liệu liên ngành về du lịch – xã hội – công nghệ	Phó Giáo sư từ năm 2014 và Tiến sĩ Xã hội học từ năm 2008.\r\nHơn 20 năm giảng dạy tại Trường Đại học KHXH&NV – ĐHQG Hà Nội và Trường Đại học KHXH&NV – ĐHQG TP.HCM.\r\nHiện công tác tại Viện Nghiên cứu Khoa học Xã hội và Nhân văn, Trường Đại học KHXH&NV – ĐHQG TP.HCM.\r\nTừng tham gia các chương trình nghiên cứu và trao đổi học thuật tại University of Queensland, Seoul National University, University of Findlay và National Taiwan University.\r\nChủ trì nhiều đề tài về động lực làm việc trong trường đại học, hành vi ứng dụng công nghệ của du khách và phát triển du lịch đêm; tham gia các đề tài cấp Nhà nước về lãnh đạo, công tác xã hội, du lịch nông nghiệp và phát triển địa phương.\r\nHướng dẫn nhiều luận án tiến sĩ và luận văn thạc sĩ trong các lĩnh vực xã hội học, du lịch, giáo dục, lao động và phát triển cộng đồng.		Chủ trì đề tài “Xu hướng ứng dụng công nghệ trong hành vi du lịch của du khách”, phân tích sự thay đổi trong tìm kiếm thông tin, trải nghiệm và lựa chọn dịch vụ của du khách trong bối cảnh số hóa.\r\nChủ trì đề tài “Phát triển du lịch đêm ở Duyên hải Nam Trung Bộ”, đánh giá tiềm năng, cơ sở hạ tầng, sản phẩm, trải nghiệm du khách và đề xuất hướng phát triển phù hợp cho các đô thị ven biển.\r\nTham gia đề tài cấp Nhà nước về phát triển chuỗi giá trị du lịch nông nghiệp tại Đồng bằng sông Cửu Long, kết nối doanh nghiệp, cộng đồng địa phương và phát triển bền vững.\r\nTham gia xây dựng mô hình phát triển du lịch thị xã Tân Châu, gắn du lịch sinh thái, văn hóa và cộng đồng với định hướng phát triển địa phương.\r\nPhát triển chuỗi nghiên cứu về du lịch thực tế ảo và du lịch thông minh, bao gồm mức độ sẵn sàng của doanh nghiệp, sự chấp nhận công nghệ và ý định sử dụng của du khách.\r\nThực hiện nhiều nghiên cứu về giới trong quản lý và nghề nghiệp du lịch, đặc biệt là khó khăn nghề nghiệp, định kiến xã hội và sự hỗ trợ đối với nữ quản lý, nữ hướng dẫn viên.		Năm kinh nghiệm	20+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/NguyenThiMinh.png	Nhà khoa học và chuyên gia về xã hội học du lịch, phát triển du lịch bền vững, ứng dụng công nghệ và phát triển năng lực nghiên cứu trong giáo dục đại học.
11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	t	3	2026-07-29 22:39:48.458409+07	2026-08-06 22:33:59.001093+07	Trần Thị Minh Hạnh	tran-thi-minh-hanh	TS.BS.	Nhà khoa học/chuyên gia		expert/avatars/TranThiMinhHanh.jpg		TS.BS. Trần Thị Minh Hạnh là chuyên gia trong lĩnh vực dinh dưỡng cộng đồng, sức khỏe học đường và chăm sóc sức khỏe dự phòng. Với hơn 30 năm kinh nghiệm trong nghiên cứu, quản lý chuyên môn và triển khai chương trình dinh dưỡng tại bệnh viện, trường học và cộng đồng, bà tập trung thúc đẩy các mô hình chăm sóc sức khỏe toàn diện, nâng cao chất lượng sống và phát triển sức khỏe bền vững cho trẻ em, phụ nữ và cộng đồng đô thị.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Dinh dưỡng cộng đồng và sức khỏe học đường\r\nChăm sóc dinh dưỡng cho trẻ em và phụ nữ\r\nĐánh giá tình trạng dinh dưỡng và sức khỏe cộng đồng\r\nPhòng chống thừa cân – béo phì và thiếu vi chất dinh dưỡng\r\nPhát triển chương trình sức khỏe học đường và TTGDSK\r\nNghiên cứu dịch tễ học dinh dưỡng và hành vi sức khỏe	Hơn 30 năm kinh nghiệm trong lĩnh vực dinh dưỡng cộng đồng và chăm sóc sức khỏe dự phòng.\r\nNguyên Phó Giám đốc Trung tâm Dinh dưỡng TP.HCM.\r\nNguyên Trưởng khoa Dinh dưỡng lâm sàng – Bệnh viện Hoàn Mỹ Sài Gòn.\r\nTừng giữ vai trò lãnh đạo chuyên môn tại Trung tâm Dinh dưỡng TP.HCM trong các chương trình sức khỏe học đường và dinh dưỡng cộng đồng quy mô lớn.\r\nCông bố nhiều nghiên cứu quốc tế và trong nước về dinh dưỡng, béo phì, sức khỏe học đường và sức khỏe cộng đồng.		Triển khai các nghiên cứu quy mô lớn về thừa cân – béo phì, thiếu vi chất dinh dưỡng và sức khỏe học đường tại TP.HCM.\r\nTham gia các nghiên cứu quốc tế về dinh dưỡng trẻ em, nguy cơ tim mạch và hành vi sức khỏe vị thành niên tại Việt Nam.\r\nPhát triển và triển khai các chương trình đánh giá tình trạng dinh dưỡng, thiếu máu và thiếu vi chất cho học sinh, phụ nữ mang thai, phụ nữ cho con bú và nhóm lao động nhập cư tại TP.HCM\r\nĐồng tác giả nhiều nghiên cứu công bố trên International Journal of Pediatric Obesity, European Journal of Clinical Nutrition và Journal of Public Health Nutrition.\r\nChủ biên và tham gia biên soạn các tài liệu, sách hướng dẫn dinh dưỡng cộng đồng và thực hành dinh dưỡng tại Việt Nam.		Năm kinh nghiệm	30+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/TranThiMinhHanh.jpg	Chuyên gia về dinh dưỡng cộng đồng, sức khỏe học đường và phát triển chương trình chăm sóc sức khỏe toàn diện.
81d5f380-1962-4904-bd36-7b02753156b3	t	1	2026-07-29 22:39:48.524025+07	2026-08-06 22:24:50.926995+07	Phan Thị Mai Hương	phan-thi-mai-huong	PGS.TS.	Nhà khoa học/chuyên gia; Giảng viên & chuyên gia học tập ứng dụng		expert/avatars/PhanThiMaiHuong.png	Nghiên cứu và ứng dụng tâm lý học trong phát triển con người và wellbeing.	PGS.TS. Phan Thị Mai Hương là nhà nghiên cứu tâm lý học với hơn 30 năm kinh nghiệm trong nghiên cứu, giảng dạy và hướng dẫn khoa học. Các hướng nghiên cứu nổi bật của bà tập trung vào cảm xúc, trí tuệ cảm xúc, hạnh phúc, wellbeing, tâm lý học lao động và những yếu tố tâm lý ảnh hưởng đến học tập, công việc và chất lượng cuộc sống. Tại IRDM, bà tham gia với vai trò chuyên gia nghiên cứu, đóng góp chuyên môn trong thiết kế nghiên cứu và phản biện khoa học cho các sáng kiến về sức khỏe tâm thần và phát triển con người.			t	t	t	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b	Tâm lý & sức khỏe tâm thần	/lien-he/	Đánh giá sức khỏe tinh thần và wellbeing trong trường học, tổ chức và cộng đồng\r\nHạnh phúc học đường và trải nghiệm tâm lý của người học\r\nKiệt sức nghề nghiệp và chất lượng cuộc sống trong công việc\r\nTrí tuệ cảm xúc và hành vi xã hội của thanh thiếu niên\r\nCảm xúc, sự hài lòng và hiệu quả làm việc của người lao động\r\nThiết kế nghiên cứu, xây dựng thang đo và công cụ đánh giá tâm lý	Được công nhận học hàm Phó Giáo sư năm 2009 và nhận học vị Tiến sĩ Tâm lý học năm 2002.\r\nCó nền tảng đào tạo chuyên sâu về Tâm lý học tại Trường Đại học Tổng hợp Quốc gia Leningrad, Đại học Quốc gia Seoul và Viện Tâm lý học – Viện Khoa học Xã hội Việt Nam.\r\nCó nhiều năm giảng dạy và hướng dẫn khoa học tại Trường Đại học KHXH&NV Hà Nội, Học viện Khoa học Xã hội, Trường Đại học Sư phạm Hà Nội và Trường Đại học Sư phạm TP.HCM.\r\nLà chuyên gia nghiên cứu tại Viện IRDM từ năm 2022.\r\nChủ trì và tham gia nhiều nhiệm vụ khoa học cấp Nhà nước, cấp Bộ về trí tuệ cảm xúc, cảm xúc trong công việc, hạnh phúc học đường, đổi mới giáo dục và chất lượng cuộc sống nghề nghiệp.		Chủ trì đề tài cấp Nhà nước về trí tuệ cảm xúc và mối quan hệ với hành vi xã hội của thanh thiếu niên, góp phần làm rõ vai trò của năng lực cảm xúc trong quá trình phát triển và thích ứng xã hội của người trẻ.\r\nChủ trì đề tài cấp Bộ về cảm xúc tại nơi làm việc và ảnh hưởng đến hành vi thực hiện công việc của người lao động, kết nối nghiên cứu tâm lý với các vấn đề hiệu quả làm việc và chất lượng môi trường tổ chức.\r\nChủ trì đề tài cấp Bộ về tâm thế của giáo viên phổ thông đối với đổi mới giáo dục, đồng thời phát triển thang đo phục vụ nghiên cứu và đánh giá thực tiễn.\r\nThực hiện chuỗi nghiên cứu về hạnh phúc học đường, bao gồm cảm nhận hạnh phúc của học sinh và các yếu tố trường học có khả năng dự báo trải nghiệm tích cực của trẻ khi đến trường.\r\nĐồng thực hiện các nghiên cứu về kiệt sức làm cha mẹ trong đại dịch COVID-19, cung cấp bằng chứng về áp lực tâm lý và những yếu tố liên quan đến wellbeing của gia đình trong bối cảnh khủng hoảng.\r\nCông bố các chuyên khảo và tài liệu như Cảm xúc tại nơi làm việc, Phương pháp nghiên cứu trong Tâm lý học và các nghiên cứu về tâm lý người lao động, cư dân ven đô và cộng đồng trong quá trình đô thị hóa.		Năm kinh nghiệm	30+			Phạm vi nghiên cứu và hợp tác quốc tế	Việt Nam	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/PhanThiMaiHuong.png	Nhà khoa học và chuyên gia cao cấp về tâm lý học, cảm xúc, wellbeing và sức khỏe tinh thần trong giáo dục và môi trường làm việc.
767afe2b-67b0-4078-88ad-28d0d8bc209f	t	2	2026-07-29 22:39:48.453716+07	2026-08-06 22:44:00.43211+07	Ngô Gia Lương	ngo-gia-luong	TS.	Chuyên gia y tế & kinh tế		expert/avatars/NgoGiaLuong.jpg	Chuyên gia về quản trị y tế, kinh tế y tế và phân tích tác động của chính sách y tế.	TS. Ngô Gia Lương là chuyên gia liên ngành trong quản trị y tế, kinh tế y tế và đào tạo nguồn nhân lực Y – Dược, với hơn 40 năm kinh nghiệm làm việc trong các trường đại học và cơ sở đào tạo khối sức khỏe. Với nền tảng chuyên môn về hóa học, quản trị học và kinh tế học, ông tập trung kết nối khoa học sức khỏe với quản trị, tổ chức và phân tích hiệu quả nhằm hỗ trợ phát triển chương trình đào tạo, dịch vụ y tế và mô hình vận hành phù hợp với bối cảnh thực tiễn. Tại IRDM, ông đồng hành trong tư vấn chiến lược và đồng thiết kế các giải pháp liên quan đến giáo dục y tế, quản trị bệnh viện và phát triển tổ chức học tập trong ngành Y.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b	Y tế & quản trị y tế; Môi trường & phát triển bền vững; Quản trị kinh tế & tác động xã hội	/lien-he/	Quản trị bệnh viện và quản lý dịch vụ y tế\r\nThiết kế, cải tiến chương trình đào tạo nhân lực Y – Dược\r\nXây dựng tổ chức học tập trong bệnh viện và cơ sở đào tạo y khoa\r\nPhát triển dịch vụ khoa học – công nghệ trong lĩnh vực y tế\r\nKinh tế y tế và phân tích hiệu quả sử dụng nguồn lực\r\nPhát triển năng lực quản lý cho cán bộ y tế\r\nKết nối khoa học sức khỏe với quản trị và kinh tế\r\nChuyển đổi và cải tiến hệ thống giáo dục, dịch vụ y tế	Hơn 40 năm kinh nghiệm giảng dạy, quản lý đào tạo và phát triển chương trình trong các trường đại học Y – Dược.\r\nTừng là Phó Trưởng khoa Quản trị bệnh viện tại Trường Đại học Hùng Vương.\r\nTừng là giảng viên chính tại Trường Đại học Y khoa Phạm Ngọc Thạch.\r\nCó nhiều năm công tác tại Trung tâm Đào tạo và Bồi dưỡng cán bộ Y tế TP.HCM, trực tiếp tham gia đào tạo, huấn luyện đội ngũ cán bộ y tế.\r\nHiện tham gia giảng dạy thỉnh giảng tại nhiều cơ sở đại học như Đại học Kinh tế TP.HCM, Đại học Gia Định và Đại học Hoa Sen.\r\nTừng được cử đi thực tập và nghiên cứu tại các cơ sở học thuật ở Bỉ như FUNDP Namur, Louvain và Bruxelles, với các nội dung liên quan đến sinh học phân tử và ứng dụng quản lý trong y tế.		Tham gia xây dựng và giảng dạy các chương trình về quản trị bệnh viện, kinh tế y tế và quản lý y tế liên ngành, kết nối kiến thức chuyên môn sức khỏe với tư duy quản trị và sử dụng nguồn lực.\r\nTham gia đào tạo và bồi dưỡng hàng nghìn cán bộ y tế tại TP.HCM trong quá trình công tác tại Trung tâm Đào tạo và Bồi dưỡng cán bộ Y tế TP.HCM.\r\nPhát triển nội dung giảng dạy đa cấp độ, từ đào tạo kỹ thuật viên y tế, cử nhân đến học viên sau đại học trong các lĩnh vực khoa học sức khỏe, kinh tế và quản trị.\r\nThúc đẩy cách tiếp cận liên ngành giữa y học, quản trị và kinh tế, góp phần định hình tư duy cải tiến chương trình đào tạo và dịch vụ y tế.\r\nTại IRDM, tham gia tư vấn và đồng thiết kế các chương trình về giáo dục y tế, quản trị bệnh viện, phát triển dịch vụ khoa học – công nghệ và tổ chức học tập ngành Y.		Năm kinh nghiệm	40+					QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/NgoGiaLuong_1.jpg	Chuyên gia liên ngành về quản trị y tế, kinh tế y tế, đào tạo nhân lực Y – Dược và phát triển hệ thống chăm sóc sức khỏe bền vững.
dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	t	3	2026-07-29 22:39:48.529043+07	2026-08-09 00:07:02.235131+07	Phạm Đức Trọng	pham-duc-trong	TS.	Nhà nghiên cứu xã hội học		expert/avatars/PhamDucTrong.jpg	Phân tích bối cảnh xã hội, nhóm thụ hưởng và tác động chính sách.	TS. Phạm Đức Trọng là chuyên gia xã hội học ứng dụng với hơn 30 năm kinh nghiệm nghiên cứu, giảng dạy và triển khai các chương trình can thiệp cộng đồng trong lĩnh vực Y tế công cộng, HIV/AIDS và phát triển xã hội. Ông từng giữ nhiều vai trò học thuật và quản lý tại Trường Đại học KHXH&NV – ĐHQG TP.HCM và hiện là Chủ tịch Hội đồng Quản lý IRDM. Với định hướng nghiên cứu ứng dụng và tiếp cận cộng đồng, ông tập trung vào các vấn đề chính sách xã hội, hành vi sức khỏe và đánh giá tác động xã hội trong bối cảnh đô thị và nhóm yếu thế.			t	t	t	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b	Xã hội học & chính sách công	/lien-he/	Chính sách Y tế cộng đồng và hành vi sức khỏe\r\nĐánh giá tác động xã hội của chương trình/dự án\r\nThiết kế nghiên cứu cộng đồng và nghiên cứu định tính\r\nNghiên cứu xã hội học ứng dụng\r\nHIV/AIDS và nhóm yếu thế\r\nPhát triển hệ thống hỗ trợ cộng đồng trong bối cảnh đô thị	Chủ tịch Hội đồng Quản lý và Chủ tịch Hội đồng Khoa học IRDM từ năm 2020.\r\nNguyên Trưởng khoa Xã hội học – Trường Đại học KHXH&NV, ĐHQG TP.HCM.\r\nHơn 30 năm kinh nghiệm nghiên cứu và đào tạo trong lĩnh vực xã hội học ứng dụng và phát triển cộng đồng.\r\nĐã hướng dẫn thành công nhiều học viên cao học và nghiên cứu sinh ngành Xã hội học.\r\nHợp tác triển khai nhiều nghiên cứu với World Bank, CDC Hoa Kỳ, FHI và các cơ quan quản lý tại TP.HCM.		Chủ trì và tham gia nhiều nghiên cứu đánh giá hiệu quả chương trình phòng chống HIV/AIDS tại TP.HCM với sự hỗ trợ của World Bank, CDC Hoa Kỳ và FHI.\r\nTriển khai chương trình hồi gia và hỗ trợ tái hòa nhập cộng đồng cho người sau cai nghiện tại TP.HCM.\r\nThực hiện các nghiên cứu về hành vi nguy cơ, lây nhiễm HIV ở nhóm MSM và các nhóm nguy cơ cao tại đô thị.\r\nChủ nhiệm nghiên cứu đánh giá tác động của khu công nghiệp Sóng Thần đến đời sống cộng đồng dân cư khu vực lân cận.\r\nTham gia nghiên cứu về hành vi khán giả truyền hình và các xu hướng xã hội đô thị tại TP.HCM.	Chủ tịch Hội đồng quản lý IRDM Nhà khoa học/chuyên gia	Năm kinh nghiệm	30+					QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG			Chuyên gia về xã hội học ứng dụng, chính sách Y tế cộng đồng và đánh giá tác động xã hội.
eb0fa648-67ab-4716-84ae-9e28c7e9e779	t	19	2026-07-29 22:39:48.51307+07	2026-08-09 00:04:06.375535+07	Nguyễn Thị Minh	nguyen-thi-minh	TS.	Nhà khoa học/chuyên gia		expert/avatars/NguyenThiMinh.png		ThS. Nguyễn Minh Hương là chuyên gia truyền thông, nhà quản lý và giảng viên với hơn 20 năm kinh nghiệm trong điều hành doanh nghiệp, phát triển con người và đào tạo kỹ năng ứng dụng. Bà hiện là Tổng Giám đốc Golden Communication Group, đồng thời tham gia giảng dạy và huấn luyện về lãnh đạo, giao tiếp, thuyết trình, quản lý con người, quản trị cảm xúc và nâng cao hiệu suất làm việc. Tại IRDM, bà đồng hành trong thiết kế định hướng và triển khai các chương trình đào tạo nhằm phát triển năng lực cá nhân, đội ngũ và tổ chức.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Phát triển năng lực lãnh đạo và quản lý con người\r\nQuản trị cảm xúc trong môi trường làm việc\r\nQuản trị cảm xúc trong môi trường làm việc\r\nKỹ năng diễn giả dành cho giảng viên, chuyên gia và nhà quản lý\r\nGiao tiếp, thuyết trình và nói trước công chúng\r\nNâng cao hiệu suất và năng lực phối hợp của đội ngũ\r\nCoaching phát triển cá nhân và năng lực nghề nghiệp	Tổng Giám đốc Golden Communication Group từ năm 2006 đến nay, phụ trách hoạt động truyền thông và marketing.\r\nTừng giữ các vị trí quản lý về văn hóa, truyền thông và quan hệ quốc tế tại Nhà Văn hóa Thanh niên và Nhà Văn hóa Sinh viên TP.HCM.\r\nTừng là Ủy viên Ban Văn hóa – Xã hội, Hội đồng Nhân dân TP.HCM giai đoạn 2004–2009.\r\nCó kinh nghiệm làm MC và biên tập viên tại Đài Truyền hình TP.HCM.\r\nLà giảng viên chính tại IRDM từ năm 2020, phụ trách các chủ đề về diễn giả, lãnh đạo, giao tiếp, thuyết trình, quản lý con người và quản trị cảm xúc.\r\nGiảng viên thỉnh giảng tại Đại học Văn hóa TP.HCM, Đại học Tôn Đức Thắng, Đại học Y Dược TP.HCM và Khoa Y – ĐHQG TP.HCM.\r\nĐược đào tạo về NLP Master Coaching, Timeline Therapy và Transformative Coaching theo các chương trình quốc tế.		Thiết kế và giảng dạy các chương trình kỹ năng mềm dành cho giảng viên tại IRDM, tập trung vào năng lực diễn giả, lãnh đạo, giao tiếp, thuyết trình, quản lý con người và quản trị cảm xúc.\r\nGiảng dạy các chương trình kỹ năng làm việc và nâng cao hiệu suất cho người học trong khối ngành sức khỏe tại Đại học Y Dược TP.HCM và Khoa Y – ĐHQG TP.HCM.\r\nTham gia huấn luyện về truyền thông, giao tiếp và phát triển con người cho các tổ chức như Tập đoàn Y khoa Hoàn Mỹ, Sendo, Ngọc Dung Beauty, Báo Tuổi Trẻ, Mitani Sangyo ACSD, Dragon Capital và Manulife Việt Nam.\r\nTham gia với vai trò diễn giả trong các hoạt động chuyên môn về truyền thông và media của MMA Việt Nam.\r\nĐiều hành các hoạt động truyền thông – marketing của Golden Communication Group, kết nối kinh nghiệm quản trị thực tiễn với hoạt động đào tạo và phát triển đội ngũ.	Nhà khoa học/chuyên gia; Giảng viên & Chuyên gia học tập ứng dụng	Năm kinh nghiệm	20+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG			Chuyên gia học tập ứng dụng về truyền thông, phát triển năng lực lãnh đạo, giao tiếp và hiệu quả làm việc trong tổ chức.
032459a4-fa62-412f-8b8e-88e11b17a173	t	18	2026-07-29 22:39:48.510209+07	2026-08-09 00:16:24.00753+07	Bùi Hồng Quân	bui-hong-quan	TS.	Nhà khoa học/chuyên gia		expert/avatars/BuiHongQuan.jpg		TS. Bùi Hồng Quân là chuyên gia trong lĩnh vực tâm lý học ứng dụng, giáo dục kỹ năng và phát triển năng lực lãnh đạo trong khu vực công và môi trường học đường. Với nền tảng liên ngành giữa tâm lý học, giáo dục, hành chính công và chính trị học, ông tập trung vào các nghiên cứu và chương trình phát triển năng lực cảm xúc – xã hội, sức khỏe tinh thần học đường, kỹ năng mềm và năng lực lãnh đạo cho thanh thiếu niên, nhà giáo dục và đội ngũ quản lý			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Phát triển năng lực cảm xúc – xã hội (SEL) trong trường học\r\nKỹ năng mềm và năng lực lãnh đạo cho thanh thiếu niên\r\nĐào tạo kỹ năng giao tiếp, quản lý cảm xúc và làm việc nhóm\r\nTâm lý học trường học và sức khỏe tinh thần học sinh\r\nTư vấn học đường và phát triển wellbeing môi trường giáo dục\r\nXây dựng khung năng lực cho đội ngũ quản lý và tổ chức công	Giảng viên Khoa Tâm lý học – Đại học Sư phạm TP.HCM từ năm 2022.\r\nHơn 15 năm kinh nghiệm trong lĩnh vực giáo dục, đào tạo kỹ năng và phát triển năng lực cho thanh thiếu niên, cán bộ quản lý và tổ chức công.\r\nTừng công tác tại Sở Lao động – Thương binh & Xã hội TP.HCM, Thành ủy TP.HCM và Học viện Cán bộ TP.HCM.\r\nTham gia giảng dạy, huấn luyện và tư vấn chuyên môn cho nhiều trường đại học, bệnh viện, doanh nghiệp và tổ chức xã hội.\r\nChủ biên và đồng tác giả nhiều sách, giáo trình và nghiên cứu về tâm lý học, kỹ năng mềm và giáo dục công dân.		Chủ nhiệm đề tài cấp Bộ về phong cách, phương pháp và kỹ năng tiếp dân của cán bộ tại các cơ quan hành chính TP.HCM (2020–2021).\r\nChủ nhiệm nghiên cứu xây dựng khung năng lực lãnh đạo, quản lý cho đội ngũ cán bộ quản lý cấp phòng tại TP.HCM.\r\nTham gia đề tài Nafosted về ứng dụng mô hình giáo dục năng lực cảm xúc – xã hội (SEL) trong giáo dục kỹ năng sống bậc tiểu học.\r\nĐồng thực hiện các nghiên cứu về tư vấn học đường, kỹ năng mềm, sức khỏe tinh thần và hành vi xã hội của học sinh – sinh viên tại TP.HCM và khu vực phía Nam.\r\nChủ biên Sách giáo khoa Giáo dục công dân lớp 7 – Bộ Chân trời sáng tạo và tham gia biên soạn nhiều tài liệu giáo dục kỹ năng sống, giao tiếp và phát triển năng lực cho học sinh – sinh viên.	Nhà khoa học/chuyên gia; Giảng viên & Chuyên gia học tập ứng dụng	Năm kinh nghiệm	15+					QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG			Chuyên gia về tâm lý học ứng dụng, phát triển năng lực và sức khỏe tinh thần trong Giáo dục – cộng đồng – tổ chức.
3bdbf9f6-a569-4a6d-81e4-7ad65f06149a	t	9	2026-07-29 22:39:48.478643+07	2026-08-09 15:36:47.531763+07	Huỳnh Ngọc Tín	huynh-ngoc-tin	TS.			expert/avatars/HuynhNgocTin.jpg		TS. Huỳnh Ngọc Tín là chuyên gia trong lĩnh vực trí tuệ nhân tạo (AI), với chuyên môn về thị giác máy tính, học máy, học sâu và xử lý ngôn ngữ tự nhiên. Năm 2016, ông nhận bằng Tiến sĩ ngành Khoa học Máy tính tại Trường Đại học Công nghệ Thông tin (Đại học Quốc gia TP.HCM), là một trong những tiến sĩ thuộc khóa đào tạo Tiến sĩ Khoa học Máy tính đầu tiên của trường. Hiện ông là Giám đốc SIU AI Lab và Trưởng ngành Trí tuệ Nhân tạo tại Trường Đại học Quốc tế Sài Gòn (SIU), đồng thời tham gia phát triển các chương trình đào tạo và nghiên cứu ứng dụng AI vào nhiều lĩnh vực thực tiễn.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	hành\r\nMachine Learning và Deep Learning\r\nXử lý ngôn ngữ tự nhiên (NLP)\r\nAI ứng dụng trong y tế\r\nAI ứng dụng trong giao thông và quản trị thông minh\r\nTrí tuệ nhân tạo (AI)\r\nThị giác máy tính (Computer Vision)\r\nKhoa học dữ liệu và phân tích dữ liệu\r\nAI ứng dụng trong giáo dục	Tiến sĩ Khoa học Máy tính, Trường Đại học Công nghệ Thông tin – Đại học Quốc gia TP.HCM (2016).\r\nLà một trong những tiến sĩ thuộc khóa Tiến sĩ Khoa học Máy tính đầu tiên của UIT.\r\nGiám đốc SIU AI Lab, Trường Đại học Quốc tế Sài Gòn.\r\nTrưởng ngành Trí tuệ Nhân tạo tại Trường Đại học Quốc tế Sài Gòn.\r\nCó kinh nghiệm nghiên cứu, giảng dạy và phát triển các chương trình ứng dụng trí tuệ nhân tạo.		Lãnh đạo SIU AI Lab, định hướng nghiên cứu và phát triển các giải pháp ứng dụng trí tuệ nhân tạo.\r\nPhụ trách xây dựng và phát triển chương trình đào tạo ngành Trí tuệ Nhân tạo tại Trường Đại học Quốc tế Sài Gòn.\r\nTham gia nghiên cứu và triển khai các ứng dụng AI trong lĩnh vực y tế, giáo dục, giao thông và quản trị thông minh.\r\nĐồng hành phát triển các hoạt động nghiên cứu và đào tạo về Machine Learning, Deep Learning, Computer Vision và NLP.	Nhà khoa học/chuyên gia					Phạm vi nghiên cứu và hợp tác quốc tế	Quốc Tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/HuynhNgocTin.jpg	Chuyên gia trí tuệ nhân tạo với chuyên môn về học máy, học sâu, thị giác máy tính và xử lý ngôn ngữ tự nhiên.
577f79a5-e422-41bf-9e99-0724e93c88ff	t	3	2026-07-29 23:27:17.357479+07	2026-08-09 15:48:33.431993+07	Phạm Thị Thúy	gv-pham-thi-thuy	TS.	Chuyên gia học tập ứng dụng		expert/avatars/PhamThiThuy.jpg	Chuyên gia đào tạo, kỹ năng sống và phát triển con người.	TS. Phạm Thị Thúy là chuyên gia trong lĩnh vực xã hội học gia đình, tâm lý ứng dụng và giáo dục kỹ năng sống với hơn 20 năm kinh nghiệm giảng dạy, tham vấn và phát triển chương trình đào tạo tại Việt Nam. Bà tập trung vào các chủ đề phát triển năng lực cảm xúc – xã hội, giáo dục cha mẹ, hạnh phúc gia đình, kỹ năng sống và wellbeing cho trẻ em, thanh thiếu niên và cộng đồng học đường.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Giáo dục gia đình và phát triển năng lực cha mẹ\r\nTâm lý học đường và wellbeing học sinh\r\nKỹ năng giao tiếp; quản lý cảm xúc; xây dựng hạnh phúc cá nhân\r\nKỹ năng sống và giáo dục cảm xúc – xã hội (SEL)\r\nThai giáo và phát triển trẻ giai đoạn đầu đời\r\nPhương pháp sư phạm và phát triển năng lực giáo viên	Giảng viên Học viện Hành chính Quốc gia từ năm 2001 đến nay.\r\nHơn 20 năm kinh nghiệm đào tạo kỹ năng mềm, phương pháp sư phạm và phát triển năng lực cho giảng viên, doanh nghiệp và tổ chức xã hội.\r\nChuyên gia tham vấn tâm lý và diễn giả về hôn nhân – gia đình, giáo dục con cái và wellbeing cộng đồng tại nhiều cơ quan, trường học và doanh nghiệp.\r\nTham gia đào tạo và huấn luyện cho nhiều tập đoàn và tổ chức như Roche, LG, Abbott, Mead Johnson, Sacombank, Home Credit…\r\nTác giả và đồng tác giả nhiều sách chuyên khảo, cẩm nang và tài liệu giáo dục dành cho phụ huynh, giáo viên và học sinh.		Chủ biên và tham gia biên soạn nhiều đầu sách có ảnh hưởng trong lĩnh vực giáo dục gia đình, kỹ năng sống và phát triển trẻ em như Thai giáo – phương pháp khoa học dạy con từ trong bụng mẹ, Nghề làm cha mẹ, Kỹ năng làm cha mẹ – dạy con từ 0–6 tuổi và Chăm trái tim con ấm.\r\nTham gia các nghiên cứu về hạnh phúc gia đình, chỉ số hạnh phúc người Việt Nam, văn hóa giao tiếp công chức và phát triển kỹ năng hành chính cho cán bộ công chức tại TP.HCM và các tỉnh phía Nam.\r\nThực hiện các nghiên cứu và chương trình truyền thông cộng đồng liên quan đến bình đẳng giới, sức khỏe sinh sản, giáo dục trẻ em và bảo vệ trẻ em trước xâm hại.\r\nTham gia huấn luyện kỹ năng sống, quản lý cảm xúc, giao tiếp và phát triển năng lực cho giáo viên, phụ huynh, doanh nghiệp và tổ chức xã hội trên toàn quốc.	Nhà khoa học/chuyên gia; Giảng viên & Chuyên gia học tập ứng dụng	Năm kinh nghiệm	20+			Phạm vi nghiên cứu và hợp tác quốc tế	Việt Nam	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG			Chuyên gia về giáo dục gia đình, tâm lý ứng dụng và phát triển năng lực cảm xúc – xã hội trong học đường và cộng đồng.
d65bf112-2363-4863-90af-c2290e38552a	t	26	2026-07-29 22:39:48.5316+07	2026-08-09 16:03:56.583307+07	Nguyễn Minh Nhựt	nguyen-minh-nhut	TS.	Nhà nghiên cứu chính sách		expert/avatars/NguyenMinhNhut.jpg	Nghiên cứu chính sách công, tác động xã hội và phát triển hệ thống.	TS. Nguyễn Minh Nhựt là nhà nghiên cứu xã hội học có kinh nghiệm thực tiễn trong quản lý công, hoạt động dân cử, phát triển đô thị và các chương trình xã hội tại TP.HCM. Với nền tảng chuyên sâu về xã hội học cùng quá trình công tác trong Hội Chữ thập đỏ, Hội đồng Nhân dân TP.HCM và môi trường nghiên cứu – đào tạo, ông tập trung vào các vấn đề chính quyền đô thị, chính sách phát triển, biến đổi khí hậu dựa vào cộng đồng, bảo vệ trẻ em và sự tham gia của người dân. Tại IRDM, ông tham gia nghiên cứu, tư vấn và phản biện các sáng kiến liên quan đến chính sách công, quản trị đô thị và tác động xã hội.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Chính quyền đô thị và quản trị phát triển địa phương\r\nPhát triển cộng đồng dựa trên sự tham gia của người dân\r\nBiến đổi khí hậu, giảm nhẹ rủi ro và năng lực thích ứng cộng đồng\r\nChính sách thu hút chuyên gia, nhà khoa học và nguồn nhân lực chất lượng cao\r\nPhân tích, đánh giá tác động của chính sách công\r\nQuản trị đô thị, quy hoạch và phát triển TP.HCM\r\nChính sách bảo vệ, chăm sóc và giáo dục trẻ em\r\nThiết kế nghiên cứu xã hội học và tham vấn các bên liên quan	Tiến sĩ Xã hội học, Học viện Khoa học Xã hội, năm 2020; trước đó nhận bằng Thạc sĩ Xã hội học năm 2013 và Cử nhân Xã hội học năm 2009.\r\nTừng đảm nhiệm các vai trò quản lý tại Hội Chữ thập đỏ quận Bình Tân và Trung tâm Huấn luyện Sơ cấp cứu và Phòng chống thảm họa TP.HCM.\r\nTừng là Phó Trưởng ban Ban Đô thị, Hội đồng Nhân dân TP.HCM và Đại biểu Hội đồng Nhân dân Thành phố khóa IX.\r\nTheo LLKH, từ tháng 6/2021 giữ vai trò Phó Trưởng ban Ban Văn hóa – Xã hội, Hội đồng Nhân dân TP.HCM và Đại biểu Hội đồng Nhân dân Thành phố khóa X, nhiệm kỳ 2021–2026.\r\nThành viên Hội đồng Khoa học và Đào tạo Khoa Đô thị học, Trường Đại học KHXH&NV – ĐHQG TP.HCM từ năm 2021.\r\nNghiên cứu viên cộng tác tại Viện IRDM từ tháng 1/2022.		Thực hiện chuỗi nghiên cứu chuyên sâu về nhận thức, sự tham gia và cách thức ứng phó của cộng đồng trước biến đổi khí hậu tại huyện Cần Giờ, làm rõ vai trò của cư dân, nam giới, phụ nữ và Hội Chữ thập đỏ trong thích ứng dựa vào cộng đồng.\r\nNghiên cứu và đề xuất chính sách về mô hình chính quyền đô thị, chính quyền số và mô hình “thành phố trong thành phố”, trong đó có trường hợp TP. Thủ Đức và kinh nghiệm của một số quốc gia châu Á.\r\nPhân tích tác động của chính sách tổ chức chính quyền đô thị đối với đời sống kinh tế, văn hóa, xã hội và hoạt động bảo vệ môi trường của cộng đồng dân cư TP.HCM.\r\nThực hiện các nghiên cứu về nhận thức của cư dân đô thị và hiệu quả các giải pháp phòng, chống COVID-19, phản ánh góc nhìn xã hội học đối với quản trị khủng hoảng và sự tham gia của người dân.\r\nXây dựng các phân tích và khuyến nghị về hệ thống bảo vệ trẻ em, vai trò của tổ chức xã hội, phòng chống bạo lực gia đình và phát triển hệ thống Nhà Thiếu nhi TP.HCM.\r\nNghiên cứu về cơ chế, chính sách đặc thù phát triển TP.HCM, gồm phân cấp, ủy quyền, thu nhập tăng thêm, phát triển TP. Thủ Đức và chính sách thu hút chuyên gia, nhà khoa học, người có tài năng đặc biệt.	Nhà khoa học/chuyên gia							QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/NguyenMinhNhut.jpg	Nhà khoa học và chuyên gia về xã hội học đô thị, chính sách công, phát triển cộng đồng và quản trị phát triển TP.HCM.
b75f4486-d125-4a65-80e5-b9d4f2a6eb52	t	28	2026-07-29 22:39:48.537352+07	2026-08-09 16:13:01.749335+07	Trần Thanh Tâm	tran-thanh-tam	TS.	Chuyên gia môi trường		expert/avatars/TranThanhTam.jpg	Chuyên gia về sức khỏe môi trường, ESG và các mô hình phát triển bền vững trong y tế và giáo dục.	TS. Trần Thanh Tâm là chuyên gia trong lĩnh vực công nghệ môi trường, vật liệu sinh học và chuyển đổi xanh ứng dụng cho doanh nghiệp và cộng đồng. Với nền tảng liên ngành giữa công nghệ vật liệu, kỹ thuật môi trường và phát triển bền vững, ông tập trung vào các giải pháp kinh tế tuần hoàn, kiểm kê khí nhà kính (GHG), CBAM, ESG và chuyển giao công nghệ xanh nhằm thúc đẩy đổi mới sáng tạo và phát triển bền vững trong bối cảnh chuyển đổi carbon toàn cầu.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b	Môi trường & phát triển bền vững	/lien-he/	Kiểm kê khí nhà kính (GHG) và CBAM\r\nESG, thị trường carbon và phát triển bền vững\r\nĐổi mới sáng tạo và chuyển giao công nghệ xanh\r\nKinh tế tuần hoàn và chuyển đổi xanh cho doanh nghiệp\r\nCông nghệ môi trường và vật liệu sinh học\r\nXây dựng năng lực nghiên cứu và khởi nghiệp xanh cho sinh viên và tổ chức	Phó Trưởng phòng Khoa học, Công nghệ và Quan hệ đối ngoại – Trường Đại học Tài nguyên và Môi trường TP.HCM.\r\nHơn 10 năm kinh nghiệm nghiên cứu và triển khai các dự án công nghệ vật liệu, môi trường và chuyển đổi xanh cho doanh nghiệp.\r\nThực hiện hơn 10 dự án nghiên cứu và hợp đồng dịch vụ khoa học liên quan đến vật liệu sinh học, kinh tế tuần hoàn và kiểm kê khí nhà kính.\r\nTổ chức và giảng dạy các khóa đào tạo GHG, tín chỉ carbon và ESG cho hơn 250 doanh nghiệp tại Việt Nam.\r\nCông bố hơn 18 công trình khoa học trong nước và quốc tế về công nghệ nano, vật liệu sinh học và kỹ thuật môi trường.		Triển khai các dự án kiểm kê khí nhà kính (GHG) và CBAM cho nhiều doanh nghiệp sản xuất, vật liệu xây dựng, khách sạn và khu công nghiệp như Samhwan Vina, Viglacera Eurotile, Sheraton, Novotel và VRG.\r\nChủ trì và tham gia nghiên cứu tái chế chất thải theo mô hình kinh tế tuần hoàn thuộc Bộ Tài nguyên và Môi trường giai đoạn 2021–2023.\r\nPhát triển các giải pháp vật liệu xanh như tấm cách âm, cách nhiệt từ vỏ trấu và ứng dụng công nghệ vi sinh trong sản xuất nông nghiệp bền vững.\r\nThành lập và phát triển Green Living Lab nhằm hỗ trợ nghiên cứu, đổi mới sáng tạo và khởi nghiệp xanh cho sinh viên nhiều trường đại học tại TP.HCM.\r\nGọi vốn thành công dự án vật liệu xanh với tổng giá trị hỗ trợ lên đến 10 triệu USD từ đối tác quốc tế.	Thành viên Hội đồng quản lý IRDM\r\n Nhà khoa học/chuyên gia; Giảng viên & Chuyên gia học tập ứng dụng	Năm kinh nghiệm	10+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc Tế				Chuyên gia về công nghệ môi trường, kinh tế tuần hoàn và chuyển đổi xanh cho doanh nghiệp và hệ thống sản xuất.
2316b863-f75c-4f1c-947d-c92ff5630f80	t	30	2026-07-29 22:39:48.542626+07	2026-08-09 16:21:32.580062+07	John Stiles	john-stiles	TS.			expert/avatars/John.jpg		TS. John Stiles là học giả, tác giả và diễn giả chuyên về giao tiếp liên văn hóa, với kinh nghiệm giảng dạy và hoạt động chuyên môn trong môi trường giáo dục quốc tế. Ông từng giữ vai trò Trưởng khoa và Giáo sư về Giao tiếp tại Đại học Hannam, Hàn Quốc, và hiện phụ trách chương trình Hoa Kỳ học tại Trung tâm Quan hệ Quốc tế của trường. Với trải nghiệm tại hơn 70 quốc gia và cả bảy châu lục, ông tập trung giúp người học và tổ chức nâng cao năng lực thấu hiểu khác biệt, giao tiếp xuyên văn hóa và xây dựng quan hệ hợp tác trong những môi trường đa dạng.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Đồng hành\r\nPhát triển năng lực thích ứng khi học tập và làm việc quốc tế\r\nXây dựng sự thấu cảm và lòng tin trong đội ngũ đa dạng\r\nPhát triển tư duy toàn cầu cho sinh viên, giảng viên và nhân sự tổ chức\r\nGiao tiếp hiệu quả trong môi trường đa văn hóa\r\nNhận diện và giảm thiểu định kiến, khuôn mẫu văn hóa\r\nGiao tiếp và phối hợp trong tổ chức có yếu tố quốc tế\r\nKỹ năng trình bày, đối thoại và kết nối với khán giả đa văn hóa	Nhận bằng Tiến sĩ về Giao tiếp và Văn hóa tại Đại học Nam Mississippi, Hoa Kỳ.\r\nTốt nghiệp Đại học Montreat, Bắc Carolina và Chủng viện Thần học Gordon-Conwell, Massachusetts.\r\nTừng giữ vai trò Trưởng khoa và Giáo sư về Giao tiếp tại Đại học Hannam, Hàn Quốc.\r\nHiện phụ trách chương trình Hoa Kỳ học tại Trung tâm Quan hệ Quốc tế thuộc Đại học Hannam.\r\nCó trải nghiệm thực tế tại hơn 70 quốc gia và cả bảy châu lục, tạo nền tảng phong phú cho hoạt động nghiên cứu, giảng dạy và diễn thuyết về giao tiếp liên văn hóa.\r\nLà tác giả và diễn giả của chuỗi seminar tương tác “Siêu Xa lộ Liên Văn hóa”, hướng người học vượt qua khuôn mẫu và vùng an toàn văn hóa để phát triển sự thấu hiểu chân thành với người khác biệt.		Phát triển và trình bày seminar tương tác “Siêu Xa lộ Liên Văn hóa”, giúp người tham dự nhận diện giới hạn trong góc nhìn văn hóa của bản thân, mở rộng năng lực thấu cảm và cải thiện cách giao tiếp với những cộng đồng khác biệt.\r\nTham gia giảng dạy, diễn thuyết và điều phối các hoạt động học tập về giao tiếp liên văn hóa trong bối cảnh đại học và hợp tác quốc tế.\r\nKết nối trải nghiệm thực địa tại hơn 70 quốc gia với các nội dung đào tạo về khác biệt văn hóa, giao tiếp xuyên biên giới và thích ứng trong môi trường toàn cầu.\r\nPhát triển các buổi diễn thuyết và seminar dựa trên nội dung sách, kết hợp phân tích học thuật với hoạt động tương tác nhằm giúp người học chuyển kiến thức thành thay đổi trong nhận thức và hành vi giao tiếp.	Giảng viên & chuyên gia học tập ứng dụng					Phạm vi nghiên cứu và hợp tác quốc tế	Quốc Tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/John_1.jpg	Chuyên gia học tập ứng dụng về giao tiếp liên văn hóa, năng lực thích ứng và xây dựng quan hệ hiệu quả trong môi trường quốc tế.
e4f1b232-f338-4822-a71a-dc7108e34ff2	t	7	2026-07-29 23:27:17.366313+07	2026-08-09 16:28:54.88184+07	Nguyễn Hữu Hoàng	gv-nguyen-huu-hoang	TS.			expert/avatars/NguyenHuuHoang.jpg		TS. Nguyễn Hữu Hoàng là giảng viên và nhà nghiên cứu chuyên sâu trong lĩnh vực xã hội học, chính sách công và quản lý phát triển xã hội. Với nền tảng liên ngành giữa quản lý nhà nước, chính sách xã hội và xã hội học kỹ thuật số, ông tập trung nghiên cứu các vấn đề chuyển đổi số xã hội, quản trị công, người cao tuổi, dịch vụ công trực tuyến và thích ứng xã hội trong bối cảnh xã hội số và xã hội 5.0. Ông hiện là giảng viên tại Học viện Chính trị khu vực II và là một trong những nhà khoa học trẻ tiêu biểu trong lĩnh vực khoa học xã hội và nhân văn tại Việt Nam.			t	f	f	0490c13d-38a8-445a-9c19-a93227978afd		/lien-he/	Chính sách công và quản lý phát triển xã hội\r\nQuản trị công, quản lý xã hội và phát triển bao trùm\r\nChuyển đổi số xã hội và dịch vụ công trực tuyến\r\nĐánh giá tác động xã hội và nghiên cứu chính sách	Tiến sĩ Xã hội học tại Đại học Xã hội quốc gia Nga (Liên bang Nga), chuyên ngành Cơ cấu xã hội, thiết chế và quá trình xã hội.\r\nHơn 10 năm giảng dạy và nghiên cứu tại Học viện Chính trị khu vực II trong các lĩnh vực xã hội học, chính sách công và quản lý phát triển xã hội.\r\nCông bố hơn 50 bài báo khoa học và tham luận quốc tế về xã hội học kỹ thuật số, xã hội số, chính sách công, quản lý xã hội và người cao tuổi trong bối cảnh chuyển đổi số.\r\nTham gia nhiều đề tài cấp Bộ, dự án quốc tế hợp tác cùng UNDP, FES và các chương trình nghiên cứu chính sách công tại Việt Nam.\r\nĐạt Giải thưởng Khoa học “Khuê Văn Các” năm 2024 dành cho nhà khoa học trẻ xuất sắc trong lĩnh vực khoa học xã hội và nhân văn.		Chủ trì và tham gia nhiều nghiên cứu về xã hội số, xã hội 5.0 và chuyển đổi số xã hội tại Việt Nam, với các công bố trên các tạp chí quốc tế thuộc Web of Science và hệ thống học thuật Nga.\r\nThực hiện các nghiên cứu chuyên sâu về thích ứng xã hội của người cao tuổi đối với chuyển đổi số tại TP.HCM, Hà Nội và các đô thị lớn của Việt Nam.\r\nTham gia các dự án hợp tác với UNDP về cải thiện hiệu quả dịch vụ công trực tuyến cho vùng đồng bào dân tộc thiểu số và thúc đẩy chuyển đổi số trong lĩnh vực y tế tại Việt Nam.\r\nĐồng tác giả báo cáo tư vấn chính sách gửi Trung ương về cải thiện tiếp cận dịch vụ công trực tuyến cho người dân vùng dân tộc thiểu số và miền núi, được Văn phòng Chính phủ phản hồi và chỉ đạo tiếp thu ở cấp quốc gia.\r\nĐồng chủ biên và tham gia biên soạn nhiều sách chuyên khảo về chính sách an sinh xã hội, quản lý phát triển xã hội và khoa học lãnh đạo.	Giảng viên & Chuyên gia học tập ứng dụng	Năm kinh nghiệm	10+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc Tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/NguyenHuuHoang_1.jpg	Nhà khoa học trẻ về xã hội học kỹ thuật số, chính sách công và quản lý phát triển xã hội trong bối cảnh chuyển đổi số.
6a85721a-54d2-4a99-9426-c22f31b4b26a	t	5	2026-07-29 22:39:48.467117+07	2026-08-09 16:36:02.390056+07	Huỳnh Anh Lan	huynh-anh-lan	BS.CKII.	Y tế & Quản trị y tế		expert/avatars/HuynhAnhLan.jpg		BS.CKII. Huỳnh Anh Lan là chuyên gia nhiều năm kinh nghiệm trong lĩnh vực Răng Hàm Mặt, giáo dục Y khoa và phát triển hệ thống chuyên môn Y tế tại Việt Nam. Với hơn 40 năm gắn bó cùng Đại học Y Dược TP.HCM và các tổ chức nghề nghiệp Y khoa, bà tập trung vào đào tạo nhân lực Y tế, phát triển chuyên môn Răng Hàm Mặt, kết nối hợp tác học thuật quốc tế và thúc đẩy các hoạt động chuyên môn – học thuật trong lĩnh vực chăm sóc sức khỏe cộng đồng.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Giáo dục và phát triển nhân lực Y tế\r\nNâng cao năng lực chuyên môn và thực hành lâm sàng cho nhân sự Y tế\r\nRăng Hàm Mặt và chăm sóc sức khỏe răng miệng cộng đồng	Hơn 40 năm kinh nghiệm giảng dạy, nghiên cứu và phát triển chuyên môn trong lĩnh vực Răng Hàm Mặt.\r\nNguyên Trưởng Bộ môn Bệnh học miệng và Phó Khoa Răng Hàm Mặt – Đại học Y Dược TP.HCM.\r\nTừng giữ vai trò Trưởng phòng Hợp tác quốc tế – Đại học Y Dược TP.HCM.\r\nHiện là Phó Chủ tịch kiêm Tổng Thư ký Hội Y học TP.HCM và thành viên nhiều tổ chức chuyên môn Y khoa trong nước và quốc tế.\r\nĐược trao tặng danh hiệu Nhà giáo Ưu tú và nhiều huân chương, bằng khen vì đóng góp cho Giáo dục và ngành Y tế Việt Nam.		Tham gia nghiên cứu và báo cáo khoa học trong lĩnh vực bệnh lý và dịch tễ học tổn thương niêm mạc miệng và ung thư hốc miệng tại Việt Nam.\r\nĐồng hành xây dựng và phát triển chương trình đào tạo Răng Hàm Mặt tại Đại học Y Dược TP.HCM qua nhiều giai đoạn phát triển của Khoa Răng Hàm Mặt.\r\nPhát triển và thúc đẩy các hoạt động hợp tác quốc tế trong đào tạo và trao đổi học thuật Y khoa với các tổ chức và mạng lưới chuyên môn quốc tế.\r\nTham gia phát triển hoạt động chuyên môn, đào tạo liên tục và kết nối học thuật của Hội Y học TP.HCM, Hội Răng Hàm Mặt TP.HCM và International College of Dentists tại Việt Nam.	Thành viên Hội đồng Quản lý Viện IRDM/Nhà khoa học/chuyên gia	Năm kinh nghiệm	40+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc Tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/HuynhAnhLan_1.jpg	Chuyên gia cao cấp về Răng Hàm Mặt, giáo dục Y khoa và phát triển hợp tác chuyên môn trong lĩnh vực chăm sóc sức khỏe.
616eb172-f424-4e66-b503-be9b2bf1aa14	t	15	2026-07-29 23:27:17.385467+07	2026-08-09 16:45:56.99273+07	Ngô Văn Huy	gv-ngo-van-huy	ThS.BS.			expert/avatars/NgoVanHuy.jpg		ThS.BS. Ngô Văn Huy là chuyên gia cao cấp về quản trị doanh nghiệp dược phẩm, chiến lược thương mại và phát triển tổ chức trong lĩnh vực chăm sóc sức khỏe. Tốt nghiệp Bác sĩ Y khoa tại Đại học Y Dược Huế và Thạc sĩ Quản trị Kinh doanh tại Maastricht School of Management (Hà Lan), ông sở hữu hơn ba thập kỷ kinh nghiệm điều hành tại các tập đoàn dược phẩm và công nghệ y tế hàng đầu thế giới như Bayer, Roche, Abbott, Philips, IMS Health, Organon và Dr. Reddy's Laboratories. Với nền tảng kết hợp giữa y khoa và quản trị hiện đại, ông đồng hành cùng doanh nghiệp và tổ chức y tế trong xây dựng chiến lược phát triển, chuyển đổi tổ chức, phát triển đội ngũ lãnh đạo và nâng cao hiệu quả vận hành trên nền tảng phát triển bền vững.			t	f	f	f5b73ea9-c9e3-4f8a-908f-e725e2123cba	Quản trị doanh nghiệp & chuyển đổi tổ chức; Y tế & dược phẩm	/lien-he/	Chiến lược phát triển doanh nghiệp dược phẩm và chăm sóc sức khỏe\r\nChiến lược thương mại và mở rộng thị trường\r\nPhát triển đội ngũ lãnh đạo và quản trị nhân tài\r\nQuản trị hệ thống phân phối và tiếp cận thị trường dược phẩm\r\nQuản trị điều hành và chuyển đổi tổ chức\r\nM&A và tích hợp doanh nghiệp sau sáp nhập\r\nVăn hóa doanh nghiệp và quản trị thay đổi\r\nQuản trị tăng trưởng và phát triển bền vững trong doanh nghiệp y tế	Hơn 30 năm kinh nghiệm lãnh đạo trong ngành dược phẩm, chăm sóc sức khỏe và công nghệ y tế tại Việt Nam và khu vực Châu Á – Thái Bình Dương.\r\nHiện là Giám đốc Quốc gia phụ trách Việt Nam và Campuchia của Dr. Reddy's Laboratories.\r\nTừng đảm nhiệm các vị trí lãnh đạo cấp cao tại Abbott, Bayer, Roche, Organon, Philips, IMS Health và nhiều tập đoàn đa quốc gia khác.\r\nLà Tổng Giám đốc Abbott EPD Việt Nam, trực tiếp dẫn dắt quá trình sáp nhập Glomed vào Abbott và xây dựng doanh nghiệp trở thành một trong những công ty dược hàng đầu Việt Nam.\r\nCó nhiều năm kinh nghiệm phát triển thị trường, quản trị đội ngũ và điều hành kinh doanh tại Việt Nam, Đài Loan và Hồng Kông.		Chương trình tiêu biểu\r\nLãnh đạo thành công quá trình sáp nhập Glomed vào Abbott, xây dựng doanh nghiệp trở thành một trong năm công ty dược hàng đầu Việt Nam.\r\nDẫn dắt chiến lược tăng trưởng đưa doanh thu Abbott EPD Việt Nam từ khoảng 20 triệu USD lên 70 triệu USD trong vòng 5 năm, với tốc độ tăng trưởng gấp khoảng ba lần mức tăng trưởng chung của thị trường.\r\nXây dựng và tái cấu trúc hệ thống vận hành, thương mại và quản trị nhân sự cho các doanh nghiệp dược phẩm đa quốc gia tại Việt Nam.\r\nPhát triển và dẫn dắt đội ngũ lãnh đạo cấp cao tại Việt Nam, Đài Loan và Hồng Kông; triển khai các chương trình phát triển lãnh đạo kế thừa trong môi trường đa quốc gia.\r\nHiện điều hành hoạt động kinh doanh của Dr. Reddy's Laboratories tại Việt Nam và Campuchia, thúc đẩy chiến lược phát triển thị trường và hợp tác trong lĩnh vực chăm sóc sức khỏe.	Giảng viên & Chuyên gia học tập ứng dụng	Năm kinh nghiệm	30+			Phạm vi nghiên cứu và hợp tác quốc tế	Việt Nam	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/NgoVanHuy_1.jpg	Chuyên gia quản trị doanh nghiệp dược phẩm với hơn 30 năm kinh nghiệm lãnh đạo các tập đoàn chăm sóc sức khỏe đa quốc gia tại Việt Nam và khu vực Châu Á – Thái Bình Dương.
722d2f3a-b0f0-48c0-a162-e69c53923476	t	6	2026-07-29 22:39:48.469407+07	2026-08-09 20:27:19.344764+07	Nguyễn Quốc Định	nguyen-quoc-dinh	ThS.			expert/avatars/NguyenQuocDinh_1.jpg		ThS. Nguyễn Quốc Định là chuyên gia về công nghệ thông tin y tế, quản trị hệ thống và chuyển đổi số bệnh viện. Ông tốt nghiệp Thạc sĩ Khoa học máy tính tại Học viện Kỹ thuật Quân sự năm 2019, sau quá trình đào tạo chuyên ngành công nghệ phần mềm. Ông có gần 20 năm kinh nghiệm trong xây dựng và quản trị trung tâm dữ liệu, quản lý công nghệ thông tin bệnh viện và triển khai các chương trình chuyển đổi số trong y tế. Từ năm 2022, ông giữ vị trí Phó Giám đốc Bệnh viện Gia An 115, phụ trách công nghệ thông tin và chuyển đổi số; đồng thời tham gia hoạt động nghiên cứu tại Viện Nghiên cứu Phát triển nguồn lực Việt từ năm 2023.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b	Y tế & quản trị y tế; AI, dữ liệu & chuyển đổi số	/lien-he/	Chiến lược chuyển đổi số bệnh viện\r\nXây dựng và vận hành hệ thống thông tin bệnh viện\r\nHệ thống hỗ trợ ra quyết định lâm sàng\r\nHạ tầng trung tâm dữ liệu và an toàn hệ thống\r\nQuản trị công nghệ thông tin trong cơ sở y tế\r\nQuản trị và khai thác dữ liệu y tế\r\nChuẩn hóa dữ liệu và thuật ngữ y khoa\r\nĐào tạo y tin học và năng lực chuyển đổi số cho đội ngũ y tế	Thạc sĩ Khoa học máy tính, Học viện Kỹ thuật Quân sự, năm 2019.\r\nGần 20 năm kinh nghiệm trong công nghệ thông tin, quản trị hệ thống và chuyển đổi số.\r\nPhó Giám đốc Bệnh viện Gia An 115, phụ trách công nghệ thông tin và chuyển đổi số từ năm 2022 đến nay.\r\nTừng giữ vị trí Phó phòng Công nghệ thông tin tại Bệnh viện Đại học Y Dược TP.HCM trong giai đoạn 2010–2022.\r\nCó kinh nghiệm xây dựng và quản trị hệ thống trung tâm dữ liệu tại VDC trong giai đoạn 2005–2010.\r\nTham gia nghiên cứu và triển khai các hệ thống hỗ trợ ra quyết định lâm sàng, quản trị bệnh viện và đào tạo chuyển đổi số trong y tế.		Tham gia nghiên cứu nhận dạng dấu hiệu bất thường của gan từ hình ảnh MRI và CT bằng thị giác máy tính, trong chương trình hợp tác giữa Trường Đại học Bách khoa và Bệnh viện Đại học Y Dược TP.HCM.\r\nTham gia xây dựng bệnh án theo bệnh và phác đồ, ánh xạ với hệ thống thuật ngữ SNOMED CT để hỗ trợ ra quyết định lâm sàng tại Bệnh viện Đại học Y Dược TP.HCM.\r\nTham gia đề án xây dựng hệ thống quản trị bệnh viện và hệ thống hỗ trợ ra quyết định cho lãnh đạo.\r\nTham gia xây dựng hệ thống y học gia đình phục vụ giảng dạy, nghiên cứu và thực nghiệm.\r\nTham gia nghiên cứu hệ thống đào tạo chuyển đổi số thí điểm ngành Y tin, kết nối tri thức y tế, công nghệ thông tin và quản trị.	Nhà khoa học/chuyên gia; Giảng viên & Chuyên gia học tập ứng dụng	Năm kinh nghiệm	20+					QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/NguyenQuocDinh_1.jpg	Chuyên gia công nghệ thông tin y tế và chuyển đổi số bệnh viện với gần 20 năm kinh nghiệm xây dựng, quản trị và phát triển hệ thống số trong lĩnh vực y tế.
b2f5c1ea-5835-4c1e-9c29-805b2c2d322b	t	32	2026-07-29 22:39:48.547712+07	2026-08-09 21:50:57.504144+07	Nguyễn Thị Bích Hà	nguyen-thi-bich-ha	ThS.			expert/avatars/NguyenThiBichHa.png		ThS. Nguyễn Thị Bích Hà là chuyên gia trong lĩnh vực giáo dục giá trị sống, phát triển con người và chăm sóc sức khỏe toàn diện với nền tảng liên ngành giữa kinh tế, quản trị kinh doanh, huấn luyện sức khỏe và tâm lý – giáo dục ứng dụng. Bà có nhiều năm kinh nghiệm thiết kế và triển khai các chương trình phát triển năng lực cá nhân, wellbeing và giáo dục giá trị sống cho học sinh, sinh viên, doanh nghiệp và cộng đồng tại Việt Nam.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b	Quản trị nhân sự & tổ chức Tâm lý & sức khỏe tâm thần	/lien-he/	Giáo dục giá trị sống và phát triển năng lực cá nhân\r\nQuản trị bản thân và phát triển nội lực cá nhân\r\nXây dựng lối sống lành mạnh và cân bằng\r\nWellbeing và chăm sóc sức khỏe toàn diện\r\nGiáo dục cảm xúc – xã hội (SEL)\r\nPhát triển cộng đồng học tập tích cực và nhân văn	Thành viên Hội đồng quản trị Hiệp hội Giáo dục các Giá trị sống Quốc tế (ALIVE).\r\nChi Hội trưởng Chi hội Khoa học Tâm lý Giáo dục các Giá trị sống (LVEC).\r\nGiảng viên chương trình “Quản trị Bản thân để Thành công” – Đại học FPT.\r\nPhó Giám đốc Trung tâm Nghiên cứu và Tư vấn Các giá trị sống (LVRC).\r\nCó nền tảng đào tạo liên ngành về Quản trị kinh doanh, Kinh tế ứng dụng, Y học cổ truyền, châm cứu và huấn luyện sức khỏe toàn diện tại Việt Nam, Hoa Kỳ và Ấn Độ.		Đồng hành phát triển và triển khai Chương trình Giáo dục các Giá trị sống Việt Nam (LVEP) trong nhiều năm với vai trò tập huấn viên và điều phối hoạt động chuyên môn.\r\nTham gia điều hành và phát triển Hiệp hội Giáo dục các Giá trị sống Quốc tế (ALIVE) và Chi hội Khoa học Tâm lý Giáo dục các Giá trị sống tại Việt Nam.\r\nGiảng dạy chương trình “Quản trị Bản thân để Thành công” tại Đại học FPT, tập trung vào phát triển nội lực, giá trị sống và wellbeing cho sinh viên.\r\nTham gia biên dịch và phát triển tài liệu giáo dục giá trị sống, tiêu biểu là sách “Những Giá trị sống dành cho trẻ từ 8 đến 14 tuổi” – NXB Trẻ.	Giảng viên & Chuyên gia học tập ứng dụng					Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/NguyenThiBichHa_1.png	Chuyên gia về giáo dục giá trị sống, phát triển con người và chăm sóc sức khỏe toàn diện trong môi trường học tập và cộng đồng.
a14a0b20-9b70-4821-970e-e6f505bdbcb9	t	19	2026-07-29 23:27:17.396171+07	2026-08-09 22:29:33.573092+07	Trần Tuấn Hùng	gv-tran-tuan-hung	Mr.			expert/avatars/TranTheHung.png		Mr. Trần Tuấn Hùng là chuyên gia về tài chính, kế toán, quản trị doanh nghiệp và quản trị rủi ro với hơn 20 năm kinh nghiệm tại các doanh nghiệp đa quốc gia trong lĩnh vực dược phẩm, ngân hàng và chăm sóc sức khỏe. Tốt nghiệp Đại học Kinh tế TP.HCM, sở hữu Chứng chỉ Kiểm toán viên do Bộ Tài chính cấp và hoàn thành chương trình phát triển lãnh đạo tại INSEAD Singapore, anh có kinh nghiệm điều hành ở các vị trí quản lý cấp cao và hiện là Tổng Giám đốc Pierre Fabre Việt Nam. Hoạt động chuyên môn của anh tập trung vào quản trị tài chính, quản trị rủi ro, phát triển chiến lược kinh doanh và nâng cao năng lực quản trị doanh nghiệp trong bối cảnh chuyển đổi và tăng trưởng bền vững.			t	f	f	\N		/lien-he/	Quản trị tài chính doanh nghiệp\r\nChiến lược kinh doanh và quản trị điều hành\r\nRa quyết định dựa trên dữ liệu tài chính\r\nQuản trị hiệu quả hoạt động và tăng trưởng bền vững\r\nQuản trị rủi ro và kiểm soát nội bộ\r\nKế toán – kiểm toán trong doanh nghiệp hiện đại\r\nLãnh đạo doanh nghiệp trong bối cảnh chuyển đổi\r\nPhát triển năng lực quản lý cho đội ngũ lãnh đạo trẻ	Hơn 20 năm kinh nghiệm trong lĩnh vực tài chính, kế toán, kiểm toán và quản trị doanh nghiệp tại các tập đoàn đa quốc gia.\r\nHiện là Tổng Giám đốc Công ty TNHH Pierre Fabre Việt Nam.\r\nTừng giữ các vị trí quản lý cấp cao tại Pfizer Việt Nam và Hong Leong Bank Việt Nam.\r\nChứng chỉ Kiểm toán viên do Bộ Tài chính cấp.\r\nHoàn thành chương trình Leadership Development tại INSEAD Singapore.\r\nCó kinh nghiệm xây dựng chiến lược tài chính, quản trị rủi ro và điều hành doanh nghiệp trong môi trường quốc tế.		Lãnh đạo hoạt động điều hành và phát triển chiến lược tại Pierre Fabre Việt Nam.\r\nTham gia xây dựng và triển khai các hệ thống quản trị tài chính, kiểm soát nội bộ và quản trị rủi ro tại các doanh nghiệp đa quốc gia.\r\nĐồng hành cùng các chương trình đào tạo và chia sẻ về tài chính doanh nghiệp, quản trị điều hành và phát triển năng lực lãnh đạo cho nhà quản lý và người học.\r\nThúc đẩy các sáng kiến nâng cao hiệu quả vận hành, tối ưu nguồn lực và quản trị tăng trưởng trong doanh nghiệp.\r\nChia sẻ kinh nghiệm thực tiễn về quản trị doanh nghiệp, quản trị tài chính và phát triển nghề nghiệp trong môi trường quốc tế.	Giảng viên & chuyên gia học tập ứng dụng	Năm kinh nghiệm	20+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/TranTuanHung_1.png	Chuyên gia tài chính, quản trị doanh nghiệp và quản trị rủi ro với hơn 20 năm kinh nghiệm điều hành tại các tập đoàn đa quốc gia.
77df01e0-f60e-4ddc-8a92-9786fcb9b30b	t	0	2026-08-09 22:34:50.918946+07	2026-08-10 21:41:58.903997+07	Trần Thị Thể Thanh	trn-th-th-thanh	MS.			expert/avatars/TranThiTheThanh.jpg		Ms. Trần Thị Thể Thanh là chuyên gia về quản trị nhân sự, phát triển tổ chức và phát triển năng lực lãnh đạo với hơn 20 năm kinh nghiệm tại các tập đoàn đa quốc gia. Hoạt động chuyên môn của bà tập trung vào xây dựng chiến lược nhân sự, phát triển đội ngũ kế thừa, đào tạo lãnh đạo và phát triển văn hóa tổ chức. Với nền tảng đào tạo quốc tế cùng kinh nghiệm triển khai các chương trình phát triển năng lực trong nhiều ngành nghề, bà đồng hành cùng doanh nghiệp và tổ chức trong việc xây dựng đội ngũ lãnh đạo, nâng cao năng lực quản trị và phát triển nguồn nhân lực theo hướng bền vững.			t	f	f	07ba59c7-7723-41bc-8673-77c08c791b6c		/lien-he/	Xây dựng chiến lược nhân sự và phát triển tổ chức\r\nCoaching và phát triển năng lực quản lý\r\nQuản trị nhân tài và phát triển nghề nghiệp\r\nLãnh đạo trong bối cảnh chuyển đổi tổ chức\r\nPhát triển lãnh đạo và đội ngũ kế thừa\r\nXây dựng văn hóa doanh nghiệp và gắn kết nhân viên\r\nThiết kế chương trình đào tạo và phát triển năng lực\r\nPhát triển nguồn nhân lực cho ngành dịch vụ, khách sạn và du lịch	Hơn 20 năm kinh nghiệm quản trị nhân sự tại các tập đoàn đa quốc gia trong lĩnh vực khách sạn, dược phẩm và hàng tiêu dùng nhanh.\r\nTừng đảm nhiệm các vị trí lãnh đạo cấp cao về nhân sự và phát triển tổ chức.\r\nTham gia các dự án phát triển năng lực nghề nghiệp cùng Tổng cục Du lịch Việt Nam trong lĩnh vực du lịch và khách sạn.\r\nHoàn thành nhiều chương trình đào tạo quốc tế về quản trị nhân sự, phát triển lãnh đạo và phát triển tổ chức tại American Hotel & Lodging Association, Eliza Business School (Đại học Melbourne), Corporate Executive Board, Designed Learning Institute và Center for Creative Leadership (CCL).\r\nLà giảng viên được chứng nhận cho các chương trình phát triển lãnh đạo của Development Dimensions International (DDI) và Emergenetics® Profile.		Đồng hành xây dựng và triển khai các chương trình phát triển lãnh đạo và phát triển nguồn nhân lực tại các tập đoàn đa quốc gia trong lĩnh vực khách sạn, dược phẩm và FMCG.\r\nHợp tác với Tổng cục Du lịch Việt Nam trong các chương trình phát triển kỹ năng dành cho đội ngũ hướng dẫn viên và chuyên gia ngành du lịch – khách sạn.\r\nTriển khai các chương trình đào tạo, coaching và phát triển đội ngũ quản lý dựa trên các phương pháp của Development Dimensions International (DDI) và Emergenetics®.\r\nThiết kế và dẫn dắt các chương trình phát triển lãnh đạo, nâng cao năng lực quản lý và xây dựng đội ngũ kế thừa trong doanh nghiệp.\r\nTư vấn xây dựng văn hóa tổ chức, phát triển nhân tài và nâng cao hiệu quả quản trị nguồn nhân lực.	Nhà khoa học/chuyên gia; Giảng viên & Chuyên gia học tập ứng dụng	Năm kinh nghiệm	20+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/TranThiTheThanh.jpg	Chuyên gia phát triển nguồn nhân lực và lãnh đạo với hơn 20 năm kinh nghiệm trong các tập đoàn đa quốc gia thuộc lĩnh vực khách sạn, dược phẩm và hàng tiêu dùng nhanh.
9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	t	11	2026-07-29 22:39:48.485888+07	2026-08-09 20:35:19.701679+07	Bùi Thanh Tùng	bui-thanh-tung	ThS.			expert/avatars/BuiThanhTung.png		ThS. Bùi Thanh Tùng là chuyên gia trong lĩnh vực chuyển đổi số và phát triển giải pháp công nghệ ứng dụng cho doanh nghiệp và cơ quan quản lý nhà nước. Với nền tảng quản trị kinh doanh cùng nhiều năm kinh nghiệm vận hành doanh nghiệp công nghệ, ông tập trung vào các giải pháp quản trị dữ liệu, nền tảng số và ứng dụng công nghệ nhằm tối ưu quy trình vận hành, truyền thông và quản lý tổ chức trong bối cảnh chuyển đổi số.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b	AI, dữ liệu & chuyển đổi số	/lien-he/	Chuyển đổi số cho tổ chức và doanh nghiệp\r\nHệ thống dữ liệu và quản lý nội dung số\r\nỨng dụng công nghệ trong truyền thông và điều hành\r\nThiết kế và triển khai nền tảng quản trị trực tuyến\r\nTối ưu quy trình vận hành và quản trị thông tin\r\nPhát triển giải pháp công nghệ phục vụ quản trị tổ chức	Tổng Giám đốc Công ty Cổ phần Công nghệ TekNix từ năm 2021.\r\nHơn 10 năm kinh nghiệm trong lĩnh vực kỹ thuật, quản lý dự án và vận hành doanh nghiệp công nghệ.\r\nTừng đảm nhiệm các vai trò quản lý kỹ thuật, điều hành và phát triển kinh doanh tại nhiều doanh nghiệp công nghệ và kỹ thuật khu vực phía Nam.\r\nCó kinh nghiệm triển khai các nền tảng số phục vụ quản lý điều hành, truyền thông trực tuyến và chuyển đổi quy trình tổ chức.		Phát triển và triển khai “Hệ thống quản lý, xét duyệt nội dung truyền thanh trực tuyến 4.0” ứng dụng web đa nền tảng cho nhiều tỉnh thành như Bà Rịa – Vũng Tàu, Long An, Bến Tre và Cà Mau.\r\nĐiều hành và phát triển hoạt động của TekNix trong lĩnh vực giải pháp công nghệ và chuyển đổi số cho doanh nghiệp và khu vực công.\r\nTham gia triển khai các giải pháp quản trị kỹ thuật, vận hành hệ thống và quản lý dữ liệu tại các doanh nghiệp kỹ thuật và thương mại khu vực phía Nam.	Nhà khoa học/chuyên gia/ Giảng viên & Chuyên gia học tập ứng dụng	Năm kinh nghiệm	10+					QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/BuiThanhTung_1.png	Chuyên gia về chuyển đổi số, phát triển nền tảng công nghệ và giải pháp quản trị số cho tổ chức và doanh nghiệp.
04752e52-8b5d-4379-80ba-efa6089aa752	t	0	2026-08-09 20:59:39.483692+07	2026-08-09 21:19:43.856912+07	Trịnh Hải Linh	trinh-hai-linh	THS.			expert/avatars/TrinhHaiLinh.jpg		ThS. Trịnh Hải Linh là chuyên gia về tâm lý giáo dục, phát triển con người và thiết kế chương trình học tập ứng dụng. Bà tốt nghiệp Thạc sĩ Kinh tế chuyên ngành Ngân hàng – Tài chính tại Paris Dauphine University và ESCP Europe, đồng thời hoàn thành chương trình sau đại học về khoa học tâm lý tại Arden University, Vương quốc Anh. Sau hơn một thập kỷ làm việc trong lĩnh vực tài chính – đầu tư, bà chuyển hướng sang tâm lý và giáo dục, tập trung vào hướng nghiệp, sức khỏe tinh thần, phát triển năng lực cá nhân và kỹ năng cảm xúc – xã hội. Với nền tảng liên ngành giữa tài chính, tâm lý và giáo dục, bà đồng hành cùng người học và tổ chức trong việc xây dựng các chương trình phát triển con người có chiều sâu, phù hợp với bối cảnh thực tế và hướng đến sự phát triển bền vững.			t	f	f	0122e571-d2d9-4085-81ac-6cce3df19edf	Giáo dục & phát triển năng lực; Tâm lý & sức khỏe tâm thần	/lien-he/	Tâm lý giáo dục và phát triển người học\r\nHướng nghiệp và ra quyết định nghề nghiệp\r\nNhận diện giá trị cá nhân và định hướng phát triển bản thân\r\nNâng cao năng lực tự nhận thức và khả năng thích ứng\r\nKết nối tâm lý học với giáo dục và phát triển nghề nghiệp\r\nSức khỏe tinh thần trong học tập và công việc\r\nPhát triển kỹ năng cảm xúc – xã hội\r\nThiết kế chương trình giáo dục khai phóng\r\nPhát triển năng lực cho học sinh, sinh viên và người đi làm	Được đào tạo sau đại học trong các lĩnh vực ngân hàng – tài chính và khoa học tâm lý tại Pháp và Vương quốc Anh.\r\nCó hơn một thập kỷ kinh nghiệm làm việc tại các tổ chức tài chính và đầu tư như Standard Chartered Bank, Indochina Capital và Vietcombank Securities.\r\nTừng đảm nhiệm các vị trí quản lý trong lĩnh vực vận hành tài chính, đầu tư và quản trị doanh nghiệp.\r\nCó hơn 12 năm hoạt động trong lĩnh vực tâm lý giáo dục và phát triển con người.\r\nLà Chủ tịch kiêm Đồng sáng lập Talent Edu.\r\nCó kinh nghiệm thiết kế và triển khai các chương trình về hướng nghiệp, sức khỏe tinh thần, phát triển năng lực cá nhân và kỹ năng cảm xúc – xã hội cho học sinh, sinh viên và người đi làm.		Đồng sáng lập và điều hành Talent Edu, tổ chức phát triển các chương trình tâm lý giáo dục và phát triển con người.\r\nThiết kế và triển khai các chương trình hướng nghiệp, hỗ trợ người học nhận diện năng lực, giá trị cá nhân và lựa chọn định hướng phù hợp.\r\nXây dựng các chương trình về sức khỏe tinh thần, kỹ năng cảm xúc – xã hội và phát triển bản thân cho học sinh, sinh viên và người đi làm.\r\nPhát triển các hoạt động giáo dục khai phóng nhằm tăng cường khả năng tự nhận thức, kết nối nội tại và năng lực ra quyết định.\r\nTham gia chia sẻ, đào tạo và đồng hành trong các chương trình phát triển năng lực cá nhân và nghề nghiệp.	Nhà khoa học/chuyên gia; Giảng viên & Chuyên gia học tập ứng dụng	Năm kinh nghiệm	12+					QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/TrinhHaiLinh.jpg	Chuyên gia tâm lý giáo dục và phát triển con người với nền tảng liên ngành về tài chính, hướng nghiệp, sức khỏe tinh thần và năng lực cảm xúc – xã hội.
7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	t	20	2026-07-29 22:39:48.515564+07	2026-08-09 20:42:46.261919+07	Lương Dũng Nhân	luong-dung-nhan	ThS.			expert/avatars/LuongDungNhan.png		ThS. Lương Dũng Nhân là chuyên gia đào tạo và tư vấn về ứng dụng AI tạo sinh trong giáo dục, phát triển cá nhân và môi trường doanh nghiệp. Với nền tảng Thạc sĩ Lãnh đạo Giáo dục tại University of Queensland và định hướng nghiên cứu tiến sĩ về Generative AI trong giáo dục tại Edgewood College, ông tập trung phát triển năng lực tư duy cùng AI, xây dựng prompt, khai thác mô hình ngôn ngữ lớn và thiết kế quy trình ứng dụng AI cho các hoạt động chuyên môn. Thông qua AIMastermind và các chương trình đào tạo thực tiễn, ông theo đuổi cách tiếp cận AI toàn diện, có phương pháp, lấy con người làm trung tâm và gắn với tiêu chuẩn chất lượng của từng tổ chức.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Ứng dụng AI tạo sinh trong công việc văn phòng và quản trị tổ chức\r\nPhát triển năng lực tư duy, phân tích và sáng tạo cùng AI\r\nThiết kế quy trình AI cho nhân sự, marketing, nghiên cứu và phát triển sản phẩm tri thức\r\nKiểm chứng, đánh giá và hoàn thiện nội dung do AI tạo ra\r\nThiết kế prompt và mega-prompt cho mô hình ngôn ngữ lớn\r\nỨng dụng AI trong giảng dạy, quản lý giáo dục và phát triển học liệu\r\nChuẩn bị, cấu trúc và khai thác dữ liệu ngôn ngữ cho AI\r\nXây dựng nguyên tắc sử dụng AI có chất lượng, có trách nhiệm và không gây hại	Thạc sĩ Lãnh đạo Giáo dục tại University of Queensland, Úc.\r\nĐang theo học chương trình nghiên cứu sinh tiến sĩ về Generative AI trong giáo dục tại Edgewood College, Hoa Kỳ.\r\nSáng lập viên, thành viên Hội đồng quản trị và Giám đốc Đào tạo của Hệ thống Giáo dục ATY từ năm 2011.\r\nNhà nghiên cứu và giảng viên tại Viện Nghiên cứu Phát triển Bồi dưỡng Tài năng trẻ từ năm 2015.\r\nKhởi xướng AIMastermind từ cuối năm 2023, tập trung đào tạo và tư vấn ứng dụng AI cho cá nhân, tổ chức và doanh nghiệp.\r\nĐồng sáng lập, CEO WISEDUCATION từ năm 2024, phát triển các chương trình về tâm lý học và giáo dục học ứng dụng.\r\nCó kinh nghiệm thiết kế và triển khai các chương trình AI cho báo chí, giáo dục, công nghệ, bất động sản, khách sạn và thực hành tâm lý học.		Sáng lập AIMastermind, phát triển phương pháp tiếp cận ứng dụng AI toàn diện và nhân bản cho công việc, doanh nghiệp và phát triển cá nhân.\r\nXây dựng bộ phương pháp “9 nguyên lý chỉ huy AI”, hướng dẫn người dùng phát triển prompt từ yêu cầu cơ bản đến mega-prompt phức tạp cho chatbot AI.\r\nPhát triển framework W.I.S.E.A.I, hệ thống hóa sáu nhóm cơ hội ứng dụng AI trong công việc cá nhân và doanh nghiệp.\r\nXây dựng “8 quy tắc vận dụng AI hiệu quả”, nhấn mạnh chất lượng đầu ra, trách nhiệm của người sử dụng và hạn chế các tác động không mong muốn.\r\nPhát triển công thức IF-SIP để chuẩn bị tri thức và dữ liệu nguyên bản cho AI, hướng tới đầu ra phù hợp với nhu cầu cá nhân, tiêu chuẩn chuyên môn và yêu cầu tổ chức.\r\nXây dựng checklist FACTUAL để kiểm tra, hiệu chỉnh và hoàn thiện nội dung do AI tạo ra.\r\nTác giả sách Lối tắt khôn ngoan: Vượt trội cùng AI và Design Thinking (2024), kết nối AI tạo sinh với tư duy thiết kế và năng lực giải quyết vấn đề.	Nhà khoa học/chuyên gia; Giảng viên & Chuyên gia học tập ứng dụng							QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/LuongDungNhan_1.jpg	Chuyên gia học tập ứng dụng về AI tạo sinh, thiết kế trải nghiệm học tập và phát triển năng lực làm việc cùng AI trong giáo dục và doanh nghiệp.
0b8fec46-7f9c-485e-9e61-2e36704a3d88	t	24	2026-07-29 22:39:48.526569+07	2026-08-09 21:28:14.289541+07	Ngô Minh Uy	ngo-minh-uy	ThS.	Chuyên gia học tập ứng dụng		expert/avatars/NgoMinhUy.jpg	Chuyên gia thiết kế và triển khai chương trình hỗ trợ tâm lý và wellbeing.	ThS. Ngô Minh Uy là chuyên gia về tâm lý học ứng dụng, tham vấn tâm lý và phát triển năng lực tổ chức với gần 25 năm kinh nghiệm giảng dạy, huấn luyện và tư vấn tại Việt Nam và quốc tế. Tốt nghiệp Thạc sĩ chuyên ngành Tham vấn tâm lý tại Đại học Assumption (Thái Lan), ông có nhiều năm đồng hành cùng các doanh nghiệp, bệnh viện, trường học và tổ chức xã hội trong các lĩnh vực sức khỏe tâm thần, giáo dục cảm xúc – xã hội (SEL), phát triển lãnh đạo, tâm lý tổ chức và wellbeing. Ông là Nhà sáng lập Trung tâm WeLink, từng giữ vai trò Tổng Thư ký Hội Khoa học Tâm lý – Giáo dục TP.HCM và tham gia nhiều chương trình hợp tác quốc tế về đào tạo và phát triển nghề nghiệp trong lĩnh vực tâm lý học.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b	Tâm lý & sức khỏe tâm thần	/lien-he/	Tham vấn tâm lý\r\nGiáo dục cảm xúc – xã hội (SEL)\r\nPhát triển lãnh đạo và quản lý con người\r\nQuản lý stress và sức khỏe tinh thần tại nơi làm việc\r\nSức khỏe tâm thần cộng đồng\r\nTâm lý tổ chức và wellbeing\r\nPhát triển kỹ năng mềm\r\nXây dựng tổ chức học tập và phát triển nguồn nhân lực	Gần 25 năm kinh nghiệm trong lĩnh vực tham vấn tâm lý, đào tạo và phát triển năng lực tổ chức.\r\nThạc sĩ chuyên ngành Tham vấn tâm lý, Đại học Assumption (Thái Lan).\r\nNhà sáng lập Trung tâm WeLink về tâm lý học ứng dụng.\r\nTừng giữ vai trò Tổng Thư ký Hội Khoa học Tâm lý – Giáo dục TP.HCM và tham gia điều hành CASP-V.\r\nCó kinh nghiệm tư vấn, huấn luyện cho doanh nghiệp, bệnh viện, trường học và tổ chức phi lợi nhuận trong và ngoài nước.\r\nTham gia nhiều chương trình hợp tác quốc tế về đào tạo và phát triển nghề nghiệp trong lĩnh vực tâm lý học.		Thiết kế, điều phối và huấn luyện hơn 30 chương trình đào tạo về tâm lý học ứng dụng cho lãnh đạo, nhân sự, giáo viên, bác sĩ và nhân viên y tế tại nhiều địa phương trên cả nước.\r\nTư vấn cho các bệnh viện và tổ chức y tế trong các chương trình hỗ trợ tâm lý người bệnh, giao tiếp trong môi trường bệnh viện và chăm sóc sức khỏe tinh thần cho nhân viên y tế.\r\nĐồng sáng lập Chương trình phát triển kinh nghiệm nghề nghiệp tâm lý học VPPD hợp tác với Đại học John Carroll (Hoa Kỳ).\r\nHuấn luyện và tư vấn cho nhiều doanh nghiệp, trường đại học và tổ chức như Petro Secco, Doosan, Duy Tân, OPV, HOSREM, RMIT và Đại học Hoa Sen về phát triển năng lực cảm xúc – xã hội, tâm lý tổ chức và kỹ năng lãnh đạo.\r\nĐồng hành cùng IRDM trong các chương trình đào tạo lãnh đạo, giáo dục SEL, phát triển tổ chức học tập và nâng cao năng lực nguồn nhân lực cho lĩnh vực y tế, giáo dục và phát triển xã hội.	Nhà khoa học/chuyên gia;\r\nGiảng viên & chuyên gia học tập ứng dụng	Năm kinh nghiệm	25+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/NgoMinhUy_1.jpg	Chuyên gia tâm lý học ứng dụng, sức khỏe tâm thần và phát triển năng lực con người với gần 25 năm kinh nghiệm tham vấn, đào tạo và phát triển tổ chức.
f51aed81-7ebf-428f-bdb4-70b0d54514a2	t	10	2026-07-29 23:27:17.37398+07	2026-08-09 22:08:10.73316+07	Lê Ngọc Thiên Phương	gv-le-ngoc-thien-phuong	ThS.			expert/avatars/LeNgocThienPhuong.jpg		ThS. Lê Ngọc Thiên Phương là chuyên gia về quản trị nhân sự chiến lược, phát triển tổ chức, trách nhiệm xã hội doanh nghiệp và sản xuất bền vững. Tốt nghiệp Thạc sĩ Quản trị Kinh doanh chuyên ngành Quản trị Nhân sự chiến lược tại Maastricht School of Management, Hà Lan, bà có hơn 20 năm kinh nghiệm đảm nhiệm các vị trí quản lý cấp cao tại Nike, Sanofi, AIG và DFS Group. Hoạt động chuyên môn của bà tập trung vào xây dựng chiến lược nhân sự, phát triển năng lực lãnh đạo, quản trị thay đổi, kết nối đa bên và cải thiện điều kiện lao động trong chuỗi cung ứng. Với cách tiếp cận lấy con người làm trung tâm, bà đồng hành cùng tổ chức trong việc kết nối hiệu quả vận hành với trách nhiệm xã hội và phát triển bền vững.			t	f	f	0122e571-d2d9-4085-81ac-6cce3df19edf		/lien-he/	Xây dựng chiến lược nhân sự gắn với chiến lược tổ chức\r\nQuản trị thay đổi lấy con người làm trung tâm\r\nTrách nhiệm xã hội doanh nghiệp và phát triển cộng đồng\r\nQuan hệ công nghiệp và đối thoại tại nơi làm việc\r\nKết nối đa bên trong các chương trình phát triển bền vững\r\nPhát triển năng lực lãnh đạo và đội ngũ kế thừa\r\nXây dựng văn hóa tổ chức và môi trường làm việc bền vững\r\nQuản trị lao động trong chuỗi cung ứng\r\nQuản trị khủng hoảng và truyền thông nội bộ\r\nPhát triển nghề nghiệp và năng lực lãnh đạo nữ	Hơn 20 năm kinh nghiệm trong quản trị nhân sự, trách nhiệm xã hội doanh nghiệp và phát triển bền vững tại các tập đoàn đa quốc gia.\r\nTừng đảm nhiệm các vị trí Giám đốc Nhân sự khu vực Đông Dương, Trưởng đại diện Trách nhiệm xã hội doanh nghiệp và Giám đốc Hiệu quả Hoạt động Sản xuất Bền vững.\r\nCó kinh nghiệm làm việc tại Nike, Sanofi, AIG và DFS Group.\r\nTham gia xây dựng và triển khai chiến lược sản xuất bền vững cho chuỗi cung ứng tại Việt Nam và khu vực Đông Nam Á.\r\nCó kinh nghiệm phối hợp với các tổ chức quốc tế như ILO, World Bank, UNICEF và UNDP trong các chương trình về lao động, môi trường và phát triển cộng đồng.\r\nCó thế mạnh trong quản lý khủng hoảng, kết nối đa bên, phát triển đội ngũ và dẫn dắt các chương trình chuyển đổi tổ chức.		Tham gia xây dựng chiến lược sản xuất bền vững cho chuỗi cung ứng của Nike tại Việt Nam và khu vực Đông Nam Á.\r\nPhối hợp triển khai các sáng kiến cải thiện điều kiện lao động, hiệu quả vận hành và trách nhiệm xã hội tại hệ thống nhà máy trong chuỗi cung ứng.\r\nKết nối doanh nghiệp, nhà máy, tổ chức quốc tế và các bên liên quan trong những chương trình về lao động, môi trường và quan hệ công nghiệp.\r\nThiết kế và triển khai các hoạt động đào tạo, tư vấn và phát triển năng lực cho đội ngũ quản lý, nhân sự và người lao động.\r\nTham gia xây dựng chiến lược nhân sự, quản lý khủng hoảng và phát triển tổ chức tại các tập đoàn đa quốc gia thuộc nhiều lĩnh vực.\r\nCố vấn và đào tạo về lãnh đạo nhân văn, phát triển nghề nghiệp và quản trị tổ chức lấy con người làm trung tâm.	Giảng viên & chuyên gia học tập ứng dụng	Năm kinh nghiệm	20+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/NguyenThiThanhHuong_wbIpOq1.jpg	Chuyên gia quản trị nhân sự và phát triển bền vững với hơn 20 năm kinh nghiệm dẫn dắt các sáng kiến về con người, chuỗi cung ứng và trách nhiệm xã hội tại các tập đoàn đa quốc gia.
c262cfba-f4c8-4c29-b13b-924f195aace4	t	21	2026-07-29 22:39:48.517684+07	2026-08-09 20:49:22.638652+07	Lê Ngọc Anh Khoa	le-ngoc-anh-khoa	ThS.			expert/avatars/LeNgocAnhKhoa.jpg		ThS. Lê Ngọc Anh Khoa là chuyên gia về công nghệ, tài chính và đổi mới sáng tạo với nền tảng liên ngành giữa kỹ thuật, tài chính và giáo dục. Tốt nghiệp Kỹ sư Điện – Điện tử tại Đại học Bách khoa TP.HCM và Thạc sĩ Tài chính tại University of Houston – Clear Lake (Hoa Kỳ), anh hiện là giảng viên Trường Đại học Quốc tế – ĐHQG TP.HCM. Hoạt động chuyên môn của anh tập trung vào ứng dụng AI, Fintech và chuyển đổi số trong giáo dục, doanh nghiệp và khởi nghiệp, đồng thời đồng hành phát triển năng lực tư duy đổi mới, giải quyết vấn đề và khởi nghiệp cho sinh viên và các tổ chức.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Ứng dụng AI trong học tập, công việc và doanh nghiệp\r\nĐổi mới sáng tạo và khởi nghiệp công nghệ\r\nTư duy đổi mới và giải quyết vấn đề\r\nKhởi nghiệp trong bối cảnh AI và chuyển đổi số\r\nFintech và chuyển đổi số trong quản trị tài chính\r\nThiết kế mô hình kinh doanh (Business Model)\r\nPhát triển năng lực số cho sinh viên và người đi làm\r\nKết nối công nghệ với giáo dục và doanh nghiệp	Thạc sĩ Tài chính, University of Houston – Clear Lake (Hoa Kỳ).\r\nKỹ sư Điện – Điện tử, Trường Đại học Bách khoa TP.HCM.\r\nGiảng viên Trường Đại học Quốc tế – Đại học Quốc gia TP.HCM.\r\nCố vấn và giám khảo nhiều cuộc thi khởi nghiệp dành cho sinh viên Đại học Quốc gia TP.HCM, tiêu biểu là chương trình FlagUp.\r\nCó kinh nghiệm tư vấn Fintech, quản trị tài chính và chuyển đổi số cho doanh nghiệp vừa và nhỏ.\r\nĐồng hành đào tạo, huấn luyện sinh viên về đổi mới sáng tạo, phát triển ý tưởng và mô hình kinh doanh.		Đồng hành với chuỗi cuộc thi khởi nghiệp FlagUp của Đại học Quốc gia TP.HCM trong vai trò cố vấn và giám khảo, hỗ trợ sinh viên phát triển mô hình kinh doanh, hoàn thiện chiến lược khởi nghiệp và kỹ năng thuyết trình trước nhà đầu tư.\r\nTham gia đào tạo và huấn luyện về đổi mới sáng tạo, AI và chuyển đổi số cho sinh viên đại học thông qua các chương trình học tập gắn với thực tiễn.\r\nThúc đẩy các hoạt động kết nối giữa giáo dục, công nghệ và doanh nghiệp nhằm phát triển năng lực đổi mới sáng tạo và thích ứng với nền kinh tế số.	Nhà khoa học/chuyên gia; Giảng viên & Chuyên gia học tập ứng dụng					Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/LeNgocAnhKhoa_1.jpg	Chuyên gia học tập ứng dụng về AI, Fintech, đổi mới sáng tạo và phát triển năng lực số cho giáo dục và doanh nghiệp.
71787fd3-18e9-4093-b74d-d0966c7872c7	t	27	2026-07-29 22:39:48.534415+07	2026-08-09 21:34:30.888322+07	Trần Quyết Thắng	tran-quyet-thang	ThS.			expert/avatars/TranQuyetThang.png		ThS. Trần Quyết Thắng là nhà nghiên cứu xã hội học ứng dụng với kinh nghiệm tham gia nhiều đề tài về phát triển cộng đồng, di cư, lao động, văn hóa xã hội và quản lý phát triển xã hội tại khu vực phía Nam. Với nền tảng xã hội học và lý luận chính trị, ông tập trung vào các nghiên cứu phục vụ hoạch định chính sách, đánh giá tác động xã hội và phát triển bền vững trong bối cảnh đô thị hóa, chuyển đổi số và biến đổi đời sống cộng đồng.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Xã hội học ứng dụng và nghiên cứu cộng đồng\r\nĐánh giá tác động xã hội của chương trình/dự án\r\nVăn hóa giao tiếp công vụ và quản lý xã hội\r\nChính sách xã hội, lao động và di cư\r\nPhát triển bền vững vùng nông thôn và đô thị\r\nChuyển đổi số xã hội và quản lý phát triển vùng	Giảng viên tại Học viện Chính trị khu vực II từ năm 2018 đến nay.\r\nChuyên viên nghiên cứu tại IRDM từ năm 2021 đến nay.\r\nTừng công tác tại Khoa Xã hội học – Trường Đại học KHXH&NV TP.HCM với vai trò trợ giảng, thư ký và quản lý sinh viên.\r\nCó kinh nghiệm tham gia nhiều đề tài, dự án nghiên cứu về công nhân nhập cư, phụ nữ nhập cư, dân tộc thiểu số, phát triển nông thôn và quản lý phát triển xã hội.		Thực hiện nghiên cứu về tiếp cận và sử dụng dịch vụ chăm sóc sức khỏe của nữ công nhân nhập cư tại Khu công nghiệp VSIP II, Bình Dương.\r\nTham gia các nghiên cứu về đời sống phụ nữ nhập cư, công nhân khu chế xuất và nhóm dân\r\nCư di biến động tại TP.HCM.\r\nTham gia dự án phát triển bền vững vùng nông thôn mới Tây Nam Bộ và nghiên cứu về vấn đề dân số – di dân trong phát triển bền vững vùng Tây Nam Bộ.\r\nTham gia đề tài đánh giá tác động và đề xuất giải pháp đầu tư công nhằm thu hút các thành phần kinh tế đầu tư phát triển kinh tế – xã hội tỉnh Ninh Thuận.\r\nTham gia đề tài cấp Bộ về quản lý phát triển xã hội trong điều kiện chuyển đổi số quốc gia tại khu vực Đông Nam Bộ.								QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/TranQuyetThang.png	Nhà nghiên cứu về xã hội học ứng dụng, phát triển cộng đồng và đánh giá chính sách trong bối cảnh chuyển đổi xã hội.
e68cb480-9541-41b4-b9b0-5a248684757d	t	34	2026-07-29 22:39:48.551762+07	2026-08-09 22:15:11.881663+07	Nguyễn Thuận Đạt	nguyen-thuan-dat	ThS.			expert/avatars/NguyenThuanDat.jpg		ThS. Nguyễn Thuận Đạt là chuyên gia về quản lý và điều hành doanh nghiệp với hơn 16 năm kinh nghiệm làm việc tại các tập đoàn đa quốc gia và công ty khởi nghiệp. Ông tốt nghiệp Thạc sĩ Quản trị kinh doanh tại SKK Graduate School of Business, Hàn Quốc, năm 2007. Trong quá trình làm việc, ông đã đảm nhiệm các vị trí quản lý tại Samsung Electronics, DFS Việt Nam, Social Bella Việt Nam, Cocomi Singapore và một số doanh nghiệp khác. Từ năm 2024, ông giữ vị trí Giám đốc Điều hành Công ty Cổ phần Thời trang & Mỹ phẩm DAFC.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Quản lý và điều hành doanh nghiệp\r\nQuản trị tổ chức trong giai đoạn tăng trưởng\r\nPhát triển năng lực quản lý\r\nLãnh đạo trong môi trường đa quốc gia\r\nQuản lý doanh nghiệp khởi nghiệp\r\nKinh nghiệm vận hành doanh nghiệp trong lĩnh vực bán lẻ	Thạc sĩ Quản trị kinh doanh tại SKK Graduate School of Business, Hàn Quốc, năm 2007.\r\nHơn 16 năm kinh nghiệm quản lý doanh nghiệp tại các tập đoàn đa quốc gia và công ty khởi nghiệp.\r\nGiám đốc Điều hành Công ty Cổ phần Thời trang & Mỹ phẩm DAFC từ năm 2024 đến nay.\r\nTừng làm việc tại Samsung Electronics, DFS Việt Nam, Social Bella Việt Nam và Cocomi Singapore.\r\nCó kinh nghiệm quản lý và điều hành trong nhiều môi trường doanh nghiệp khác nhau.		Điều hành hoạt động của Công ty Cổ phần Thời trang & Mỹ phẩm DAFC từ năm 2024.\r\nTham gia quản lý và vận hành doanh nghiệp tại Samsung Electronics, DFS Việt Nam, Social Bella Việt Nam và Cocomi Singapore.\r\nCó hơn 16 năm kinh nghiệm làm việc trong các mô hình tập đoàn đa quốc gia và công ty khởi nghiệp.	Nhà khoa học/chuyên gia	Năm kinh nghiệm	16+			Phạm vi nghiên cứu và hợp tác quốc tế	Việt Nam	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/NguyenThuanDat.jpg	Chuyên gia quản lý và điều hành doanh nghiệp với hơn 16 năm kinh nghiệm tại các tập đoàn đa quốc gia và công ty khởi nghiệp.
1548f376-7bd3-455c-a18c-6ae017a08383	t	35	2026-07-29 22:39:48.475565+07	2026-08-09 22:43:25.129465+07	Trần Trung Hiếu	tran-trung-hieu	Mr.			expert/avatars/TranTrungHieu.png		Mr. Trần Trung Hiếu là chuyên gia về quản trị nhân sự, phát triển tổ chức và phát triển năng lực lãnh đạo với hơn 16 năm kinh nghiệm tại các doanh nghiệp đa quốc gia trong lĩnh vực dịch vụ, khách sạn, bán lẻ và công nghệ y tế. Tốt nghiệp Cử nhân Quản trị Kinh doanh tại Đại học Kinh tế TP.HCM và hoàn thành nhiều chương trình đào tạo lãnh đạo quốc tế, anh có kinh nghiệm xây dựng chiến lược nhân sự, phát triển văn hóa tổ chức, đào tạo lãnh đạo và quản trị thay đổi. Hiện anh là Giám đốc Nhân sự tại Align Việt Nam, đồng hành cùng doanh nghiệp trong việc phát triển đội ngũ, nâng cao năng lực tổ chức và xây dựng môi trường làm việc hướng tới hiệu quả và phát triển bền vững.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Xây dựng chiến lược nhân sự gắn với chiến lược kinh doanh\r\nVăn hóa doanh nghiệp và Employee Experience\r\nPhát triển năng lực cho quản lý trẻ và nhân tài kế cận\r\nĐào tạo kỹ năng lãnh đạo và quản lý hiệu suất\r\nPhát triển năng lực lãnh đạo và đội ngũ quản lý\r\nQuản trị thay đổi trong quá trình chuyển đổi tổ chức\r\nThu hút, phát triển và giữ chân nhân tài\r\nChuẩn bị nguồn nhân lực cho môi trường làm việc toàn cầu	Hơn 16 năm kinh nghiệm trong lĩnh vực quản trị nhân sự và phát triển tổ chức.\r\nHiện là Giám đốc Nhân sự tại Align Việt Nam.\r\nTừng đảm nhiệm các vị trí nhân sự và đào tạo tại The Grand Ho Tram Strip, Vinpearl, InterContinental Hotels Group, Levi Strauss & Co. cùng nhiều doanh nghiệp quốc tế.\r\nHoàn thành các chương trình phát triển lãnh đạo của Harvard Business Publishing, Ken Blanchard, Insights và Elanco Global.\r\nĐược vinh danh trong danh sách 40 Under 40 Asia HR Leaders 2022, ghi nhận những đóng góp trong lĩnh vực quản trị nhân sự tại khu vực châu Á.		Xây dựng và triển khai chiến lược nhân sự tại Align Việt Nam, đồng hành cùng quá trình phát triển đội ngũ trong lĩnh vực công nghệ y tế và chỉnh nha kỹ thuật số.\r\nPhát triển các chương trình đào tạo lãnh đạo, nâng cao năng lực quản lý và xây dựng đội ngũ kế thừa trong doanh nghiệp.\r\nTham gia xây dựng văn hóa tổ chức và các sáng kiến nâng cao trải nghiệm nhân viên tại nhiều tập đoàn đa quốc gia.\r\nĐồng hành cùng các chương trình đào tạo, chia sẻ kinh nghiệm về quản trị nhân sự, phát triển nghề nghiệp và kỹ năng lãnh đạo cho sinh viên và nhà quản lý trẻ.\r\nThúc đẩy các sáng kiến phát triển con người gắn với hiệu quả tổ chức và năng lực thích ứng trong bối cảnh chuyển đổi.	Giảng viên & chuyên gia học tập ứng dụng	Năm kinh nghiệm	16+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/TranTrungHieu_1.png	Chuyên gia quản trị nhân sự và phát triển tổ chức với kinh nghiệm xây dựng chiến lược con người trong các tập đoàn đa quốc gia và doanh nghiệp công nghệ.
ce5dba86-d252-497e-82be-9ddce6d30f30	t	31	2026-07-29 22:39:48.545324+07	2026-08-09 21:41:56.96326+07	Nguyễn Minh Hương	nguyen-minh-huong	ThS.			expert/avatars/NguyenMinhHuong.jpg		ThS. Nguyễn Minh Hương là chuyên gia trong lĩnh vực truyền thông, marketing và phát triển con người với hơn 20 năm kinh nghiệm điều hành doanh nghiệp truyền thông và đào tạo kỹ năng ứng dụng tại Việt Nam. Với nền tảng liên ngành giữa truyền thông, văn hóa, giáo dục và coaching, bà tập trung vào các chương trình phát triển năng lực lãnh đạo, giao tiếp, quản trị cảm xúc và xây dựng hình ảnh chuyên nghiệp cho cá nhân và tổ chức trong bối cảnh chuyển đổi xã hội và môi trường làm việc hiện đại.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Kỹ năng lãnh đạo và phát triển đội ngũ\r\nQuản trị cảm xúc và phát triển nội lực cá nhân\r\nNâng cao hiệu suất làm việc và văn hóa doanh nghiệp\r\nGiao tiếp, thuyết trình và xây dựng hình ảnh chuyên nghiệp\r\nTruyền thông thương hiệu và truyền thông tổ chức	CEO Golden Communication Group với hệ sinh thái gồm nhiều công ty truyền thông và marketing tại Việt Nam.\r\nHơn 20 năm kinh nghiệm trong lĩnh vực truyền thông, marketing, tổ chức sự kiện và phát triển thương hiệu.\r\nTừng là MC và biên tập viên Đài Truyền hình TP.HCM, đồng thời giữ nhiều vai trò quản lý văn hóa – truyền thông tại Nhà Văn hóa Thanh niên và Nhà Văn hóa Sinh viên TP.HCM.\r\nGiảng viên và diễn giả về kỹ năng lãnh đạo, giao tiếp, quản lý cảm xúc và phát triển con người tại nhiều trường đại học và doanh nghiệp lớn.\r\nĐược đào tạo chuyên sâu về NLP Coaching, Timeline Therapy và Transformative Coaching theo chuẩn quốc tế.		Điều hành và phát triển Golden Communication Group trở thành hệ sinh thái truyền thông – marketing đa lĩnh vực với nhiều hoạt động đào tạo, truyền thông và tổ chức sự kiện tại Việt Nam.\r\nThiết kế và giảng dạy các chương trình kỹ năng lãnh đạo, giao tiếp, thuyết trình, quản trị cảm xúc và phát triển con người tại IRDM, Đại học Y Dược TP.HCM, Đại học Quốc gia TP.HCM và nhiều tổ chức doanh nghiệp.\r\nHuấn luyện và đồng hành phát triển đội ngũ cho nhiều doanh nghiệp lớn như Tập đoàn Y khoa Hoàn Mỹ, Manulife Việt Nam, Dragon Capital, Sendo và Ngọc Dung Beauty.\r\nTham gia hoạt động diễn giả và chuyên gia truyền thông tại MMA (Mobile Marketing Association Vietnam) cùng nhiều diễn đàn chuyên môn về truyền thông và phát triển tổ chức.	Giảng viên & Chuyên gia học tập ứng dụng	Năm kinh nghiệm	20+			Phạm vi nghiên cứu và hợp tác quốc tế	Quốc tế	QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/NguyenMinhHuong.jpg	Chuyên gia về truyền thông, phát triển con người và nâng cao năng lực lãnh đạo – giao tiếp trong tổ chức hiện đại.
1ce9b61f-1e94-4c61-bc68-de6f6eabab89	t	12	2026-07-29 22:39:48.489531+07	2026-08-09 22:22:08.7686+07	Minh Nguyễn	minh-nguyen	Kỹ sư			expert/avatars/KySuMinhNguyen.png		Kỹ sư Minh Nguyễn là chuyên gia trong lĩnh vực công nghệ thông tin, hệ thống mạng và chuyển đổi số với hơn 20 năm kinh nghiệm lãnh đạo, quản lý doanh nghiệp công nghệ. Tốt nghiệp Cử nhân Khoa học máy tính tại Đại học Melbourne (Australia), ông hiện là Giám đốc Công ty Green IT Solution. Hoạt động chuyên môn tập trung vào phát triển hạ tầng công nghệ, hệ thống mạng và đào tạo các chủ đề liên quan đến AI và Blockchain.			t	f	f	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b		/lien-he/	Trí tuệ nhân tạo (AI)\r\nHệ thống mạng\r\nChuyển đổi số\r\nBlockchain\r\nHạ tầng công nghệ thông tin	Tốt nghiệp Cử nhân Khoa học máy tính, Đại học Melbourne (Australia).\r\nHiện là Giám đốc Công ty Green IT Solution.\r\nHơn 20 năm kinh nghiệm lãnh đạo và quản lý doanh nghiệp trong lĩnh vực công nghệ thông tin và hệ thống mạng.\r\nTham gia đào tạo các chủ đề về AI và Blockchain.		Điều hành hoạt động của Công ty Green IT Solution.\r\nTham gia đào tạo về AI và Blockchain.\r\nCó hơn 20 năm kinh nghiệm quản lý và phát triển doanh nghiệp trong lĩnh vực hệ thống mạng và công nghệ thông tin.	Nhà khoa học/chuyên gia	Năm kinh nghiệm	20+					QUẢN TRỊ ĐẠI HỌC ❖ CHÍNH SÁCH CÔNG ❖ PHÁT TRIỂN BỀN VỮNG		expert/hero_avatars/KySuMinhNguyen.png	Chuyên gia về công nghệ thông tin, hạ tầng hệ thống và đào tạo AI với hơn 20 năm kinh nghiệm quản lý doanh nghiệp công nghệ.
97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	t	5	2026-07-29 22:39:48.481383+07	2026-08-10 21:06:32.771256+07	Tạ Thị Phấn	ta-thi-phan	ThS.	Chuyên gia dữ liệu & điều phối chuyên môn	Trưởng phòng Tổ chức Hành chính - Viện IRDM / Chuyên viên Điều phối dự án / Nhà khoa học/chuyên gia; Giảng viên & Chuyên gia học tập ứng dụng.	expert/avatars/TaThiPhan_bw1bezj.jpg	ThS. Tạ Thị Phấn là nhà nghiên cứu xã hội học ứng dụng, có kinh nghiệm triển khai nhiều đề tài, dự án khoa học và phát triển tại Việt Nam. Cô theo đuổi hướng nghiên cứu liên ngành trong các lĩnh vực y tế, giáo dục, văn hóa, xã hội, con người và phát triển đô thị; đồng thời tập trung vào các vấn đề về chính sách công, nguồn nhân lực, lao động việc làm và chuyển đổi số. Với nền tảng chuyên sâu về xã hội học và nghiên cứu phát triển, cô chú trọng kết nối bằng chứng khoa học với nhu cầu quản trị và thực tiễn cộng đồng, hướng đến các giải pháp có tính ứng dụng.				t	t	t	0b2c289e-a16f-495e-9b56-9ec3a1a0be5b	AI, dữ liệu & chuyển đổi số	/lien-he/	Tư vấn nhiệm vụ KH,CN&ĐMST cấp tỉnh/thành phố\r\nNghiên cứu liên ngành y tế – giáo dục – văn hóa \r\nNguồn nhân lực, lao động và định hướng nghề nghiệp\r\nXã hội học ứng dụng và nghiên cứu cộng đồng\r\nChuyển đổi số trong quản trị xã hội và tổ chức\r\nTrách nhiệm xã hội và phát triển bền vững	Hơn 10 năm kinh nghiệm trong nghiên cứu xã hội học ứng dụng, điều phối đề tài, dự án khoa học và các chương trình phát triển cộng đồng.\r\nHiện đảm nhiệm công tác điều phối khoa học, quản lý dự án và Trưởng phòng Tổ chức – Hành chính tại IRDM, với thế mạnh kết nối chuyên gia, đối tác và tổ chức triển khai nghiên cứu.\r\nTừng là nghiên cứu viên tại Trung tâm Nghiên cứu Đô thị và Phát triển và Viện Nghiên cứu Đời sống Xã hội, có nền tảng vững về khảo sát, phân tích xã hội và nghiên cứu chính sách.\r\nCó kinh nghiệm nghiên cứu liên ngành trong các lĩnh vực y tế, giáo dục, văn hóa, lao động, nguồn nhân lực, trách nhiệm xã hội doanh nghiệp, chuyển đổi số và phát triển đô thị.\r\nThế mạnh nổi bật là kết nối bằng chứng khoa học với nhu cầu quản trị và thực tiễn, chuyển hóa kết quả nghiên cứu thành mô hình, quy trình và giải pháp có khả năng ứng dụng.	AI, dữ liệu & chuyển đổi số; Giáo dục & phát triển năng lực; Xã hội học & chính sách công; Quản trị kinh tế & tác động xã hội	Quyền đồng tác giả “Phần mềm quản lý hoạt động khoa học công nghệ ngành Y tế tại Thành phố Hồ Chí Minh”\r\nĐồng Tác giả “Tạo động lực làm việc cho cán bộ, công chức, viên chức gắn bó với chính quyền thành phố Hồ Chí Minh trong quá trình chuyển đổi số hiện nay”\r\nĐồng tác giả “Nhà ở xã hội của nữ công nhân trong các khu công nghiệp, khu chế xuất tại Thành phố Hồ Chí Minh – Góc nhìn giới trong quy hoạch đô thị trước sáp nhập địa giới hành chính”\r\nChủ nhiệm đề tài “Nhận diện xu hướng lựa chọn giá trị sống thông qua hành vi xác định mục tiêu nghề nghiệp của sinh viên tại TP.HCM hiện nay”.\r\nThành viên chính, Thư ký khoa học nhiệm vụ “Ứng dụng chuyển đổi số trong quản lý, phê duyệt, giám sát hoạt động khoa học công nghệ ngành Y tế tại Thành phố Hồ Chí Minh”\r\nThành viên chính nhiệm vụ “Bức khảm các tiểu văn hóa tại thành phố Hồ Chí Minh”\r\nThành viên chính nhiệm vụ “Nghiên cứu đề xuất các giải pháp tạo lập bản sắc quy hoạch – kiến trúc cho một số khu vực trọng điểm của tỉnh Bình Dương trong tương lai”\r\nThành viên chính nhiệm vụ “Nghiên cứu nhận thức, năng lực của nguồn nhân lực trẻ và đề xuất giải pháp đáp ứng yêu cầu tuyển dụng của doanh nghiệp trong bối cảnh cách mạng công nghiệp lần thứ tư tại thành phố Hồ Chí Minh”\r\nThành viên chính, Thư ký khoa học nhiệm vụ “Đánh giá thực trạng công tác quản lý và các phương thức tập hợp người lao động tham gia cung ứng dịch vụ xe sử dụng nền tảng ứng dụng công nghệ trên địa bàn Thành phố Hồ Chí Minh”\r\nThành viên chính, Thư ký khoa học “Nghiên cứu đề xuất giải pháp để các doanh nghiệp tỉnh Vĩnh Long thực hiện tốt trách nhiệm xã hội”\r\nThành viên nhiệm vụ “Xây dựng Khung năng lực của Cán bộ công chức tỉnh Quảng Ngãi theo Đề án Vị trí việc làm”\r\nThành viên nhiệm vụ “Nhà ở xã hội cho công nhân ở vùng Đông Nam Bộ hiện nay”										expert/hero_avatars/TaThiPhan.jpg	
\.


--
-- TOC entry 6408 (class 0 OID 312440)
-- Dependencies: 284
-- Data for Name: expert_expert_engagement_types; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_expert_engagement_types (id, expert_id, engagementtype_id) FROM stdin;
1	cc2c8d15-3a91-4485-81ef-8fcef5ea4a25	25654b63-9bd8-4585-ac38-867279f6512b
2	cc2c8d15-3a91-4485-81ef-8fcef5ea4a25	a01de170-27f6-477c-a710-00a7d6f68268
3	4bfedb13-2989-40cb-a435-0c3314c0f5c3	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
4	4bfedb13-2989-40cb-a435-0c3314c0f5c3	2d4498c3-376d-475d-a425-65caf86d6db5
5	162d63f1-2d74-436c-b497-12b6f71fd9f7	25654b63-9bd8-4585-ac38-867279f6512b
6	162d63f1-2d74-436c-b497-12b6f71fd9f7	23c2da6d-8f55-4c2d-8146-fea61be96edb
7	5e834e6b-7d63-4416-b323-80a1758300b1	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
8	5e834e6b-7d63-4416-b323-80a1758300b1	23c2da6d-8f55-4c2d-8146-fea61be96edb
9	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	25654b63-9bd8-4585-ac38-867279f6512b
10	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	2d4498c3-376d-475d-a425-65caf86d6db5
11	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	23c2da6d-8f55-4c2d-8146-fea61be96edb
12	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
13	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	a01de170-27f6-477c-a710-00a7d6f68268
14	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	828b7678-6bbb-4201-9e24-5d3db24a4dcd
15	a78667f1-f6cc-407c-8079-eb9a2beed0d1	25654b63-9bd8-4585-ac38-867279f6512b
16	a78667f1-f6cc-407c-8079-eb9a2beed0d1	a01de170-27f6-477c-a710-00a7d6f68268
17	55dae78f-50c7-4bec-8975-998d7d55dba2	25654b63-9bd8-4585-ac38-867279f6512b
18	55dae78f-50c7-4bec-8975-998d7d55dba2	a01de170-27f6-477c-a710-00a7d6f68268
19	55dae78f-50c7-4bec-8975-998d7d55dba2	23c2da6d-8f55-4c2d-8146-fea61be96edb
20	0320a7f6-ea8e-434e-b1b5-b1492092aff7	25654b63-9bd8-4585-ac38-867279f6512b
21	0320a7f6-ea8e-434e-b1b5-b1492092aff7	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
22	0320a7f6-ea8e-434e-b1b5-b1492092aff7	a01de170-27f6-477c-a710-00a7d6f68268
23	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	25654b63-9bd8-4585-ac38-867279f6512b
24	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	a01de170-27f6-477c-a710-00a7d6f68268
25	eb0fa648-67ab-4716-84ae-9e28c7e9e779	25654b63-9bd8-4585-ac38-867279f6512b
26	eb0fa648-67ab-4716-84ae-9e28c7e9e779	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
27	032459a4-fa62-412f-8b8e-88e11b17a173	25654b63-9bd8-4585-ac38-867279f6512b
28	032459a4-fa62-412f-8b8e-88e11b17a173	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
29	577f79a5-e422-41bf-9e99-0724e93c88ff	25654b63-9bd8-4585-ac38-867279f6512b
30	577f79a5-e422-41bf-9e99-0724e93c88ff	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
31	577f79a5-e422-41bf-9e99-0724e93c88ff	0ced2aa4-0552-48ad-9af6-bf3d771c50d3
32	d65bf112-2363-4863-90af-c2290e38552a	25654b63-9bd8-4585-ac38-867279f6512b
33	d65bf112-2363-4863-90af-c2290e38552a	a01de170-27f6-477c-a710-00a7d6f68268
34	d65bf112-2363-4863-90af-c2290e38552a	23c2da6d-8f55-4c2d-8146-fea61be96edb
35	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	25654b63-9bd8-4585-ac38-867279f6512b
36	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
37	2316b863-f75c-4f1c-947d-c92ff5630f80	25654b63-9bd8-4585-ac38-867279f6512b
38	2316b863-f75c-4f1c-947d-c92ff5630f80	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
39	e4f1b232-f338-4822-a71a-dc7108e34ff2	25654b63-9bd8-4585-ac38-867279f6512b
40	e4f1b232-f338-4822-a71a-dc7108e34ff2	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
41	e4f1b232-f338-4822-a71a-dc7108e34ff2	23c2da6d-8f55-4c2d-8146-fea61be96edb
42	6a85721a-54d2-4a99-9426-c22f31b4b26a	25654b63-9bd8-4585-ac38-867279f6512b
43	6a85721a-54d2-4a99-9426-c22f31b4b26a	a01de170-27f6-477c-a710-00a7d6f68268
44	616eb172-f424-4e66-b503-be9b2bf1aa14	25654b63-9bd8-4585-ac38-867279f6512b
45	616eb172-f424-4e66-b503-be9b2bf1aa14	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
46	722d2f3a-b0f0-48c0-a162-e69c53923476	25654b63-9bd8-4585-ac38-867279f6512b
47	722d2f3a-b0f0-48c0-a162-e69c53923476	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
48	722d2f3a-b0f0-48c0-a162-e69c53923476	2d4498c3-376d-475d-a425-65caf86d6db5
49	9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	25654b63-9bd8-4585-ac38-867279f6512b
50	9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
51	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	25654b63-9bd8-4585-ac38-867279f6512b
52	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
53	c262cfba-f4c8-4c29-b13b-924f195aace4	25654b63-9bd8-4585-ac38-867279f6512b
54	c262cfba-f4c8-4c29-b13b-924f195aace4	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
55	04752e52-8b5d-4379-80ba-efa6089aa752	25654b63-9bd8-4585-ac38-867279f6512b
56	04752e52-8b5d-4379-80ba-efa6089aa752	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
57	0b8fec46-7f9c-485e-9e61-2e36704a3d88	25654b63-9bd8-4585-ac38-867279f6512b
58	0b8fec46-7f9c-485e-9e61-2e36704a3d88	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
59	71787fd3-18e9-4093-b74d-d0966c7872c7	25654b63-9bd8-4585-ac38-867279f6512b
60	71787fd3-18e9-4093-b74d-d0966c7872c7	828b7678-6bbb-4201-9e24-5d3db24a4dcd
61	ce5dba86-d252-497e-82be-9ddce6d30f30	25654b63-9bd8-4585-ac38-867279f6512b
62	ce5dba86-d252-497e-82be-9ddce6d30f30	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
63	b2f5c1ea-5835-4c1e-9c29-805b2c2d322b	25654b63-9bd8-4585-ac38-867279f6512b
64	b2f5c1ea-5835-4c1e-9c29-805b2c2d322b	2d4498c3-376d-475d-a425-65caf86d6db5
65	f51aed81-7ebf-428f-bdb4-70b0d54514a2	25654b63-9bd8-4585-ac38-867279f6512b
66	f51aed81-7ebf-428f-bdb4-70b0d54514a2	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
67	a14a0b20-9b70-4821-970e-e6f505bdbcb9	25654b63-9bd8-4585-ac38-867279f6512b
68	a14a0b20-9b70-4821-970e-e6f505bdbcb9	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
69	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	25654b63-9bd8-4585-ac38-867279f6512b
70	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
71	1548f376-7bd3-455c-a18c-6ae017a08383	25654b63-9bd8-4585-ac38-867279f6512b
72	1548f376-7bd3-455c-a18c-6ae017a08383	c34213a5-00ad-42b1-85ab-f30fce3f6ad5
\.


--
-- TOC entry 6410 (class 0 OID 312447)
-- Dependencies: 286
-- Data for Name: expert_expert_knowledge_topics; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_expert_knowledge_topics (id, expert_id, knowledgetopic_id) FROM stdin;
1	cc2c8d15-3a91-4485-81ef-8fcef5ea4a25	8440df2b-91f6-475c-b4bc-14579c6e67dc
2	cc2c8d15-3a91-4485-81ef-8fcef5ea4a25	88f1757b-c60b-4d56-bc82-7281e375b2df
5	4bfedb13-2989-40cb-a435-0c3314c0f5c3	2d7bdbd6-befc-47c3-980f-fd44685e42ca
6	4bfedb13-2989-40cb-a435-0c3314c0f5c3	31fa99d3-215a-4f3b-a9ff-776756a9b901
9	162d63f1-2d74-436c-b497-12b6f71fd9f7	31fa99d3-215a-4f3b-a9ff-776756a9b901
11	8b00b6e5-4263-492f-9dde-866efa62f049	8440df2b-91f6-475c-b4bc-14579c6e67dc
12	8b00b6e5-4263-492f-9dde-866efa62f049	88f1757b-c60b-4d56-bc82-7281e375b2df
15	5bcb6772-6263-4add-a5f3-95054fd00246	2374e014-73a2-434c-bc38-b8de2f6a5d13
17	82f35f80-7d8e-4b7c-9dfc-e0c27c6abf22	61814c89-4232-48f6-9bc4-8d4895a0d775
19	b79cdef4-3435-4990-9252-1791aedd6d2e	8440df2b-91f6-475c-b4bc-14579c6e67dc
20	b79cdef4-3435-4990-9252-1791aedd6d2e	88f1757b-c60b-4d56-bc82-7281e375b2df
23	e2f886bb-a017-458f-b4f8-311f0d800fee	31fa99d3-215a-4f3b-a9ff-776756a9b901
25	b9ff32bd-2aa8-49e7-9586-379c75f33e28	2374e014-73a2-434c-bc38-b8de2f6a5d13
26	b9ff32bd-2aa8-49e7-9586-379c75f33e28	61814c89-4232-48f6-9bc4-8d4895a0d775
29	88999316-8f8d-4ca0-9438-82d9df238d59	88f1757b-c60b-4d56-bc82-7281e375b2df
31	95eef455-b009-4c6f-907e-91673dd3f1a8	8440df2b-91f6-475c-b4bc-14579c6e67dc
32	95eef455-b009-4c6f-907e-91673dd3f1a8	88f1757b-c60b-4d56-bc82-7281e375b2df
35	a502b2c7-b3b8-4383-a12e-9c069de367c9	31fa99d3-215a-4f3b-a9ff-776756a9b901
37	d53433ba-b9d8-4441-83e8-14f9693736b5	61814c89-4232-48f6-9bc4-8d4895a0d775
38	d53433ba-b9d8-4441-83e8-14f9693736b5	8440df2b-91f6-475c-b4bc-14579c6e67dc
41	7c089591-38b6-43a5-a990-f7b03c9d6d21	2d7bdbd6-befc-47c3-980f-fd44685e42ca
42	7c089591-38b6-43a5-a990-f7b03c9d6d21	31fa99d3-215a-4f3b-a9ff-776756a9b901
45	eb7bef3e-f94f-49f9-87f3-37f367ab994e	2374e014-73a2-434c-bc38-b8de2f6a5d13
47	e661b4e7-3380-4305-9404-c2f437fe1aba	61814c89-4232-48f6-9bc4-8d4895a0d775
48	e661b4e7-3380-4305-9404-c2f437fe1aba	8440df2b-91f6-475c-b4bc-14579c6e67dc
51	06f55fd9-7ccb-4bda-83d3-8d96d3ac8a69	31fa99d3-215a-4f3b-a9ff-776756a9b901
53	a77bf886-849b-455b-852a-2df8b6b58fa0	8440df2b-91f6-475c-b4bc-14579c6e67dc
54	a77bf886-849b-455b-852a-2df8b6b58fa0	88f1757b-c60b-4d56-bc82-7281e375b2df
57	2664691b-c5df-4ae9-b521-0185b31cce4d	61814c89-4232-48f6-9bc4-8d4895a0d775
58	2664691b-c5df-4ae9-b521-0185b31cce4d	88f1757b-c60b-4d56-bc82-7281e375b2df
61	f545466a-f5e5-4312-b277-5beb577cfa3d	2d7bdbd6-befc-47c3-980f-fd44685e42ca
62	f545466a-f5e5-4312-b277-5beb577cfa3d	88f1757b-c60b-4d56-bc82-7281e375b2df
65	d37db12f-a3b6-4dc9-aa60-b475590ed25f	2d7bdbd6-befc-47c3-980f-fd44685e42ca
66	d37db12f-a3b6-4dc9-aa60-b475590ed25f	61814c89-4232-48f6-9bc4-8d4895a0d775
69	96d80975-dbfe-4f48-95df-2d31e6cc6ede	31fa99d3-215a-4f3b-a9ff-776756a9b901
71	0dac0759-934b-4704-97eb-527515f578ea	2374e014-73a2-434c-bc38-b8de2f6a5d13
73	a7438e8f-5301-453e-b2be-212f786a8802	31fa99d3-215a-4f3b-a9ff-776756a9b901
75	6c3770a1-da0e-40ca-bd75-c37091d43431	2374e014-73a2-434c-bc38-b8de2f6a5d13
76	6c3770a1-da0e-40ca-bd75-c37091d43431	8440df2b-91f6-475c-b4bc-14579c6e67dc
313	5e834e6b-7d63-4416-b323-80a1758300b1	2374e014-73a2-434c-bc38-b8de2f6a5d13
314	5e834e6b-7d63-4416-b323-80a1758300b1	61814c89-4232-48f6-9bc4-8d4895a0d775
315	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	2374e014-73a2-434c-bc38-b8de2f6a5d13
316	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	61814c89-4232-48f6-9bc4-8d4895a0d775
317	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	31fa99d3-215a-4f3b-a9ff-776756a9b901
318	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	2d7bdbd6-befc-47c3-980f-fd44685e42ca
319	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	88f1757b-c60b-4d56-bc82-7281e375b2df
320	a78667f1-f6cc-407c-8079-eb9a2beed0d1	9a1d5c83-1ad1-4b15-ad45-8250e3b97f70
321	a78667f1-f6cc-407c-8079-eb9a2beed0d1	2aa1d421-e6fd-49cb-9018-8adb4c878dc3
322	a78667f1-f6cc-407c-8079-eb9a2beed0d1	bcd6a166-de4e-4fc6-a665-22ac90ae6f29
323	a78667f1-f6cc-407c-8079-eb9a2beed0d1	e864fd9d-7062-4f0c-b1ff-0a76f224282e
324	a78667f1-f6cc-407c-8079-eb9a2beed0d1	004bda91-e522-4bdd-a795-1ad2fa053001
325	a78667f1-f6cc-407c-8079-eb9a2beed0d1	7435e3c0-aa94-47f7-a7f6-0850d4dd5ddb
326	a78667f1-f6cc-407c-8079-eb9a2beed0d1	dfc52589-b833-45aa-b480-98e622f460ea
327	a78667f1-f6cc-407c-8079-eb9a2beed0d1	b0f1d473-6e9d-406d-83fc-70c74eecfa01
328	a78667f1-f6cc-407c-8079-eb9a2beed0d1	4d3bf782-5347-40da-928b-3d89be9c2174
329	a78667f1-f6cc-407c-8079-eb9a2beed0d1	64116546-b287-4874-a917-60c790eded7f
330	55dae78f-50c7-4bec-8975-998d7d55dba2	08667282-0ec3-4f62-9d22-3b6cf067e3ae
331	55dae78f-50c7-4bec-8975-998d7d55dba2	2c2fbbfa-5fec-48fe-a5fa-5e0c0bcb1b46
332	55dae78f-50c7-4bec-8975-998d7d55dba2	2126a220-8fc1-46ab-a283-ed63816b3445
333	55dae78f-50c7-4bec-8975-998d7d55dba2	2f44528b-51e8-4b79-acb4-f3fa6d42f7d2
334	55dae78f-50c7-4bec-8975-998d7d55dba2	c0ba013b-4741-4efe-a52d-a4aca5c22f8b
335	55dae78f-50c7-4bec-8975-998d7d55dba2	d351e629-7281-47c0-8af7-a5ad445fced9
336	55dae78f-50c7-4bec-8975-998d7d55dba2	9ee1d1c7-af25-494c-a5c2-6870dd4d1627
337	55dae78f-50c7-4bec-8975-998d7d55dba2	b778bfd7-5910-4d4c-ac88-b6513b6b2f61
338	55dae78f-50c7-4bec-8975-998d7d55dba2	c00b6e42-4be8-42ef-b6a0-4e977161cc70
339	55dae78f-50c7-4bec-8975-998d7d55dba2	b1e34afc-58bd-4a11-8e58-2e38aae98d86
340	0320a7f6-ea8e-434e-b1b5-b1492092aff7	154ee17b-3296-4023-ad7b-7505f476ba25
341	0320a7f6-ea8e-434e-b1b5-b1492092aff7	baed0ba6-a206-4e60-8e9f-7aea7b5d9ab4
342	0320a7f6-ea8e-434e-b1b5-b1492092aff7	26d0af55-3d57-4a63-8b1a-db225d483d83
343	0320a7f6-ea8e-434e-b1b5-b1492092aff7	fa3e65cc-6337-40de-888e-013e530c2a38
344	0320a7f6-ea8e-434e-b1b5-b1492092aff7	79309c79-5bbf-4d49-8e20-d38e7506ea21
345	0320a7f6-ea8e-434e-b1b5-b1492092aff7	03e3ef2d-a5e7-4231-b487-8a38fd4ad6e7
346	0320a7f6-ea8e-434e-b1b5-b1492092aff7	88f1757b-c60b-4d56-bc82-7281e375b2df
347	0320a7f6-ea8e-434e-b1b5-b1492092aff7	953b3e71-d0dc-4816-a69d-b0fe1d21ff63
348	bb812c25-fe79-4803-a18f-91e2f890dead	9237b016-d22e-415c-891f-49a7c9bcbada
349	bb812c25-fe79-4803-a18f-91e2f890dead	df9856f5-3078-4086-8d97-5ed2dbb94417
350	bb812c25-fe79-4803-a18f-91e2f890dead	d052ac03-7323-4097-982c-1b68a12263b4
351	bb812c25-fe79-4803-a18f-91e2f890dead	5018cd4d-1146-4c98-9469-a9f3a69f5672
352	bb812c25-fe79-4803-a18f-91e2f890dead	49562603-d4d9-416c-a763-56589e046afa
353	bb812c25-fe79-4803-a18f-91e2f890dead	ada3a2e4-9a88-450d-b536-04a15a268981
354	bb812c25-fe79-4803-a18f-91e2f890dead	a9d96996-5e55-41af-b899-84d198aa3f91
355	bb812c25-fe79-4803-a18f-91e2f890dead	7875f415-20ec-4332-b46d-0cb934052e67
356	81d5f380-1962-4904-bd36-7b02753156b3	77ad0ee5-ce14-47dc-bbe7-db4e0f491762
357	81d5f380-1962-4904-bd36-7b02753156b3	cbf7003b-dda4-4a27-aceb-ee38d282d9b6
358	81d5f380-1962-4904-bd36-7b02753156b3	b4dbe7bf-429a-434f-be05-e2e575d3c07d
359	81d5f380-1962-4904-bd36-7b02753156b3	936739fc-d997-47cd-8892-c84531e4ffd9
360	81d5f380-1962-4904-bd36-7b02753156b3	e4fa8d9b-e223-4846-a1ea-d5e4fc955b22
361	81d5f380-1962-4904-bd36-7b02753156b3	74158a94-8b65-4638-bea3-b059b23e55b1
362	81d5f380-1962-4904-bd36-7b02753156b3	10560ebc-c885-44b5-a57b-b7f24ba02f07
363	81d5f380-1962-4904-bd36-7b02753156b3	a119d58a-f9f1-435e-be79-4ea85baae961
364	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	d4edd0fe-5be7-4ab8-9427-e13a37e785a8
365	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	43cb7461-e81f-4bc5-b47b-1320419d3924
366	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	8fabf6f2-3263-4732-95c8-75e433c543ec
367	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	2415d132-80e4-46fb-b804-fa98cf8d617f
368	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	7558be27-1816-4f53-bd5f-8d16ff56b70f
369	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	cf7987a0-e2d5-47eb-abb1-f652156b82be
370	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	9e6f6a9a-d65d-4b2e-af05-3e1884ffc6b5
371	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	e3696a0c-6dce-4813-aeb7-763d0c24899d
372	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	9000957d-8eba-4757-8881-9269a11d4517
373	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	48b43deb-301a-40c8-a735-e788a4591364
374	767afe2b-67b0-4078-88ad-28d0d8bc209f	365443de-d4b5-4f38-833c-7e2dd21080b2
375	767afe2b-67b0-4078-88ad-28d0d8bc209f	cc7d3946-cf34-4068-b73e-147f513ecf2c
376	767afe2b-67b0-4078-88ad-28d0d8bc209f	432d9bf6-d2ff-4c30-aa41-30238adf3290
377	767afe2b-67b0-4078-88ad-28d0d8bc209f	b41aba38-290f-4a46-b4dc-8f9cf0fe5fa6
378	767afe2b-67b0-4078-88ad-28d0d8bc209f	bfa765cd-e586-4d16-abbe-dfe50a1a9b79
379	767afe2b-67b0-4078-88ad-28d0d8bc209f	ea374086-771f-4da3-a843-b789a92e1f03
380	767afe2b-67b0-4078-88ad-28d0d8bc209f	bd331573-097a-4b50-8ae8-a25c603ff6e9
381	767afe2b-67b0-4078-88ad-28d0d8bc209f	1638aa77-ce0e-4a96-8334-0831094df6c5
382	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	acb98897-86a4-4c16-b4f0-b462a544f580
383	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	4fc1292d-e705-4c72-ae62-a494fc41f39a
384	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	f47826c2-8648-4bdc-9fb0-8cd23f42f9a8
385	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	15b186f4-f352-4a3f-a283-9fce2e2fa1ec
386	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	5f837ab7-48ed-4c32-8794-edb96d2cf282
387	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	4bcc1e36-6ff7-4371-be2d-22c857bdfef2
388	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	e1af6052-53d3-460e-95e0-593ba9f3c7a8
389	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	b7a0ffad-d8c5-4c32-9290-8a0a5d48167c
390	eb0fa648-67ab-4716-84ae-9e28c7e9e779	25bfa583-2e3a-4a2c-a464-8774ec7167d4
391	eb0fa648-67ab-4716-84ae-9e28c7e9e779	e5a9b7ec-e08e-4d14-9d69-1ae41c69b031
392	eb0fa648-67ab-4716-84ae-9e28c7e9e779	f220350d-d53a-4fe3-bd24-67eb197de678
393	eb0fa648-67ab-4716-84ae-9e28c7e9e779	193516b7-6f76-41ba-bffa-0e3ebf356cd7
394	eb0fa648-67ab-4716-84ae-9e28c7e9e779	ac34aaa4-2a67-4009-a50d-690242a3a5fc
395	eb0fa648-67ab-4716-84ae-9e28c7e9e779	98873274-3e71-480f-a413-c1d9f67c9ef3
396	eb0fa648-67ab-4716-84ae-9e28c7e9e779	0c5d1c94-ad83-4b8e-8fac-e0ca0fd2f662
397	eb0fa648-67ab-4716-84ae-9e28c7e9e779	0f911e91-9682-443b-9e4b-11f8f41e0b1b
398	032459a4-fa62-412f-8b8e-88e11b17a173	bb801df2-6e64-448e-8b00-98f47e38ae64
399	032459a4-fa62-412f-8b8e-88e11b17a173	b4dbe7bf-429a-434f-be05-e2e575d3c07d
400	032459a4-fa62-412f-8b8e-88e11b17a173	e254cd71-1694-4b7a-8fa4-ca41471fbabd
401	032459a4-fa62-412f-8b8e-88e11b17a173	1494abde-8f59-4879-821f-bad8e8dbc2fb
402	032459a4-fa62-412f-8b8e-88e11b17a173	cf7987a0-e2d5-47eb-abb1-f652156b82be
403	032459a4-fa62-412f-8b8e-88e11b17a173	98873274-3e71-480f-a413-c1d9f67c9ef3
404	032459a4-fa62-412f-8b8e-88e11b17a173	263f7067-6044-4fa6-95c7-9ec6a7f627d9
405	032459a4-fa62-412f-8b8e-88e11b17a173	d4e020fd-a86f-4cc1-84fb-4585bcd5d655
406	032459a4-fa62-412f-8b8e-88e11b17a173	93c03593-0266-405a-96a2-ede734026a44
407	032459a4-fa62-412f-8b8e-88e11b17a173	5b7bde81-7a17-4d55-9e21-0970ead66bfa
408	3bdbf9f6-a569-4a6d-81e4-7ad65f06149a	c0ba013b-4741-4efe-a52d-a4aca5c22f8b
409	3bdbf9f6-a569-4a6d-81e4-7ad65f06149a	d351e629-7281-47c0-8af7-a5ad445fced9
410	3bdbf9f6-a569-4a6d-81e4-7ad65f06149a	9ee1d1c7-af25-494c-a5c2-6870dd4d1627
411	3bdbf9f6-a569-4a6d-81e4-7ad65f06149a	b1e34afc-58bd-4a11-8e58-2e38aae98d86
412	3bdbf9f6-a569-4a6d-81e4-7ad65f06149a	5155add1-431a-4895-8fb2-b9dcea956e31
413	3bdbf9f6-a569-4a6d-81e4-7ad65f06149a	2126a220-8fc1-46ab-a283-ed63816b3445
414	3bdbf9f6-a569-4a6d-81e4-7ad65f06149a	08667282-0ec3-4f62-9d22-3b6cf067e3ae
415	3bdbf9f6-a569-4a6d-81e4-7ad65f06149a	5d308d0d-5cf1-4bf2-a0a1-329e6b005f75
416	577f79a5-e422-41bf-9e99-0724e93c88ff	7851fd91-efb9-4789-a143-ffc79b74c5b2
417	577f79a5-e422-41bf-9e99-0724e93c88ff	92181c93-d161-4af8-aa3e-e2d8709fe4bd
418	577f79a5-e422-41bf-9e99-0724e93c88ff	b4dbe7bf-429a-434f-be05-e2e575d3c07d
419	577f79a5-e422-41bf-9e99-0724e93c88ff	f7a8b534-cb7b-4b54-9bfa-e3ed1e5060a6
420	577f79a5-e422-41bf-9e99-0724e93c88ff	1494abde-8f59-4879-821f-bad8e8dbc2fb
421	577f79a5-e422-41bf-9e99-0724e93c88ff	4db97b13-01b3-4326-a681-de25bfa98ba7
422	577f79a5-e422-41bf-9e99-0724e93c88ff	471244e8-5264-48ef-a982-729ef1092705
423	577f79a5-e422-41bf-9e99-0724e93c88ff	a56965df-5cfd-48f3-8362-7b5b81de0df5
424	577f79a5-e422-41bf-9e99-0724e93c88ff	a269ddd8-4b1f-4199-a40b-eeb9472b1dc6
425	577f79a5-e422-41bf-9e99-0724e93c88ff	93c03593-0266-405a-96a2-ede734026a44
426	d65bf112-2363-4863-90af-c2290e38552a	154ee17b-3296-4023-ad7b-7505f476ba25
427	d65bf112-2363-4863-90af-c2290e38552a	f2f76abf-5d25-4f9d-91d0-3c7c958f08bd
428	d65bf112-2363-4863-90af-c2290e38552a	0ce4cc26-0fa6-46dd-83c6-f007a5411d18
429	d65bf112-2363-4863-90af-c2290e38552a	7976e42f-4cc2-481d-a2a0-c4258e37779b
430	d65bf112-2363-4863-90af-c2290e38552a	8a57f289-91f9-4abb-9a90-bc6af674ad8e
431	d65bf112-2363-4863-90af-c2290e38552a	03c7320b-7bba-4895-a439-bf0282fa4b09
432	d65bf112-2363-4863-90af-c2290e38552a	be710963-6fb9-46e4-ad7d-b6acfd3680c5
433	d65bf112-2363-4863-90af-c2290e38552a	2144f359-b48c-419d-b140-21a36f92ade6
434	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	ba7b8678-61e6-4712-969c-9cc1f8432d1e
435	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	4ff29a48-fa6d-490f-943d-2c6dde786af7
436	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	25074aa6-8222-4311-9b5f-ab351ec250b6
437	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	10ab82e1-ac1e-4d3a-a87f-1d9319741a54
438	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	6beea87c-3293-4ba5-aba4-366163827745
439	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	fb0ddb1c-eebd-4512-9d5a-078021de499d
440	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	d87d43fb-8ace-48bf-be62-e762344bf2be
441	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	a5f50d08-8c13-459b-a064-75bfbcaae831
442	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	5468c8c5-55f1-41ca-86cd-9b373d8247d4
443	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	faf62711-1224-473f-87f4-d7478c1e8d05
444	2316b863-f75c-4f1c-947d-c92ff5630f80	204bcdbf-f24b-4905-916d-ff6d2b9820ef
445	2316b863-f75c-4f1c-947d-c92ff5630f80	6d2767b2-c771-4689-9fa5-6bf8506705bd
446	2316b863-f75c-4f1c-947d-c92ff5630f80	11e5fe84-a109-4509-bdd5-7dfea6ffe874
447	2316b863-f75c-4f1c-947d-c92ff5630f80	62b7228c-393f-47cd-84b0-9eb69a2f12a4
448	2316b863-f75c-4f1c-947d-c92ff5630f80	fb2e06ed-fcdf-4010-89ee-4bd96d26ba8a
449	2316b863-f75c-4f1c-947d-c92ff5630f80	0549154a-29f1-4bbf-bdd5-e4f2638e073a
450	2316b863-f75c-4f1c-947d-c92ff5630f80	2cdf1876-d580-4ff5-b23c-83172ded3c84
451	2316b863-f75c-4f1c-947d-c92ff5630f80	511fd457-0ba5-4b1b-8392-1aa65c0090ae
452	e4f1b232-f338-4822-a71a-dc7108e34ff2	154ee17b-3296-4023-ad7b-7505f476ba25
453	e4f1b232-f338-4822-a71a-dc7108e34ff2	f45e7705-a90d-4da7-a4a6-f55dafa703ea
454	e4f1b232-f338-4822-a71a-dc7108e34ff2	3dd45923-49bc-4e09-9406-c00bde675a2c
455	e4f1b232-f338-4822-a71a-dc7108e34ff2	1eaf36b5-8098-490e-91ab-1460457ab1d0
456	e4f1b232-f338-4822-a71a-dc7108e34ff2	8a57f289-91f9-4abb-9a90-bc6af674ad8e
457	e4f1b232-f338-4822-a71a-dc7108e34ff2	32e3d1cd-205f-47ed-875c-8def3452ac67
458	6a85721a-54d2-4a99-9426-c22f31b4b26a	469d77c5-3ec2-46ef-b7cc-f5defbf80851
459	6a85721a-54d2-4a99-9426-c22f31b4b26a	65146668-1df7-482a-aa21-1f14c5b8c9f3
460	6a85721a-54d2-4a99-9426-c22f31b4b26a	d4edd0fe-5be7-4ab8-9427-e13a37e785a8
461	6a85721a-54d2-4a99-9426-c22f31b4b26a	3dcd408a-e6b2-4093-9c07-d4a2a7cf8577
462	6a85721a-54d2-4a99-9426-c22f31b4b26a	ac5bc09b-b06a-4c34-83cc-2ae001cdc752
463	6a85721a-54d2-4a99-9426-c22f31b4b26a	885fd976-ebf7-4165-a4d8-33b8dcdd871e
464	6a85721a-54d2-4a99-9426-c22f31b4b26a	d2ef8d85-b62a-4e57-b01f-fb68bc3a1500
465	6a85721a-54d2-4a99-9426-c22f31b4b26a	030b1d35-6bd6-438e-9c99-86dd91a01b48
466	616eb172-f424-4e66-b503-be9b2bf1aa14	16460166-33ad-4578-a81d-4bc0f9070b76
467	616eb172-f424-4e66-b503-be9b2bf1aa14	ba603109-c9c6-4d4a-9a78-8c0a4c064f1e
468	616eb172-f424-4e66-b503-be9b2bf1aa14	c8a7eb61-b116-4520-bd6b-79be1527006b
469	616eb172-f424-4e66-b503-be9b2bf1aa14	24c51332-105e-4a5f-9938-9ad9e6381b02
470	616eb172-f424-4e66-b503-be9b2bf1aa14	bcd6a166-de4e-4fc6-a665-22ac90ae6f29
471	616eb172-f424-4e66-b503-be9b2bf1aa14	90a48300-ab9e-46e5-a30f-7fa11877e905
472	616eb172-f424-4e66-b503-be9b2bf1aa14	98873274-3e71-480f-a413-c1d9f67c9ef3
473	616eb172-f424-4e66-b503-be9b2bf1aa14	cc34ed10-d089-4277-98dd-83da090e668b
474	722d2f3a-b0f0-48c0-a162-e69c53923476	eb95f406-d6d4-4fe7-a4a4-4842743487cb
475	722d2f3a-b0f0-48c0-a162-e69c53923476	b53a4cd4-14e5-4569-8aa7-78d73f9a48eb
476	722d2f3a-b0f0-48c0-a162-e69c53923476	3c3aaa40-9337-4ae9-93a1-fae3ca3a0629
477	722d2f3a-b0f0-48c0-a162-e69c53923476	3ced7fe5-5778-4609-ae86-e7309d89c22b
478	722d2f3a-b0f0-48c0-a162-e69c53923476	16c03e2f-5966-4431-857b-90b1b9389b96
479	722d2f3a-b0f0-48c0-a162-e69c53923476	81ff75df-d125-416d-b101-5c93cad4705b
480	722d2f3a-b0f0-48c0-a162-e69c53923476	0db45da2-e1eb-430a-9723-3613884caa59
481	722d2f3a-b0f0-48c0-a162-e69c53923476	fc9b0ed2-2303-4b65-86a4-1229d364abe7
482	722d2f3a-b0f0-48c0-a162-e69c53923476	56ffbe1f-789a-439f-acce-3b39f1b59e64
483	722d2f3a-b0f0-48c0-a162-e69c53923476	3fb0bc8e-3279-4178-8264-99e9f448f0c6
484	722d2f3a-b0f0-48c0-a162-e69c53923476	640ea237-8629-4786-ab2e-25790295b4f1
485	9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	9d9d7ee4-6d9b-4647-8786-bee0edf9921d
486	9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	19167bf9-c0f8-4ec4-a84e-7589b0990d84
487	9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	b507e92a-afe6-495b-b1ef-04e289b0ecc7
488	9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	2bf211b3-f9f1-462b-b91c-04eb2c00fd8d
489	9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	07a8e4e3-a684-43ad-aa02-493fc120c207
490	9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	a2ed8cdc-25a4-46f9-89f5-028823769f83
491	9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	4c67e15e-f448-4a5b-b806-a074b3bc6dcb
492	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	c6cdabf0-8a3e-4d77-8f6e-df1afb878cb4
493	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	e51ecf59-154a-4a72-8d20-17bef3864db8
494	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	30a4c55e-b2bb-446e-8225-433d49abb0a6
495	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	790b5c62-0a06-49fa-8db1-52176be72619
496	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	39ec3d44-27e6-40e5-80a7-0e4c499efef5
497	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	784fbe9d-dfc5-4c05-9aa1-f648726e8eec
498	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	babf9b06-b0f5-4e77-86c0-eeb31039c7cf
499	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	9ddd126c-f094-430a-b1de-b5a8e169ed40
500	c262cfba-f4c8-4c29-b13b-924f195aace4	2126a220-8fc1-46ab-a283-ed63816b3445
501	c262cfba-f4c8-4c29-b13b-924f195aace4	a7d3b119-a47f-4c86-966d-352ee6118763
502	c262cfba-f4c8-4c29-b13b-924f195aace4	9a2899d7-19ac-4a15-99ca-352a5fde48cf
503	c262cfba-f4c8-4c29-b13b-924f195aace4	364707e1-750d-45ae-94a7-fa4e7e100609
504	c262cfba-f4c8-4c29-b13b-924f195aace4	39ec3d44-27e6-40e5-80a7-0e4c499efef5
505	c262cfba-f4c8-4c29-b13b-924f195aace4	ea82535d-473e-4bf1-a1b6-003b9471fcab
506	c262cfba-f4c8-4c29-b13b-924f195aace4	7429ee8a-9b79-4a55-8f17-50dede8cbe4a
507	c262cfba-f4c8-4c29-b13b-924f195aace4	dfc52589-b833-45aa-b480-98e622f460ea
508	04752e52-8b5d-4379-80ba-efa6089aa752	546d4d08-4755-4779-be11-8080e0be557f
509	04752e52-8b5d-4379-80ba-efa6089aa752	abeaba43-04fa-4aaa-8b27-593919254546
510	04752e52-8b5d-4379-80ba-efa6089aa752	4d8c6fe6-a280-4861-86a1-6f6e2b045e90
511	04752e52-8b5d-4379-80ba-efa6089aa752	200bfb41-effb-4580-b8a5-5f63bd6dc30b
512	04752e52-8b5d-4379-80ba-efa6089aa752	1d3d6e49-b2f1-4d82-9433-e97d69324db7
513	04752e52-8b5d-4379-80ba-efa6089aa752	10560ebc-c885-44b5-a57b-b7f24ba02f07
514	04752e52-8b5d-4379-80ba-efa6089aa752	3aa3313e-040e-4600-abc8-113e413acd27
515	04752e52-8b5d-4379-80ba-efa6089aa752	145c59ae-059e-48c3-bcd3-67e304ba6b7d
516	0b8fec46-7f9c-485e-9e61-2e36704a3d88	93c03593-0266-405a-96a2-ede734026a44
517	0b8fec46-7f9c-485e-9e61-2e36704a3d88	92181c93-d161-4af8-aa3e-e2d8709fe4bd
518	0b8fec46-7f9c-485e-9e61-2e36704a3d88	695df05b-97e7-478a-a488-7e092df89c14
519	0b8fec46-7f9c-485e-9e61-2e36704a3d88	b4dbe7bf-429a-434f-be05-e2e575d3c07d
520	0b8fec46-7f9c-485e-9e61-2e36704a3d88	87ad2c6d-2904-4bb0-9ba6-962939f97f44
521	0b8fec46-7f9c-485e-9e61-2e36704a3d88	60672869-0497-45c3-b214-4c9751ffad36
522	0b8fec46-7f9c-485e-9e61-2e36704a3d88	7f013dfb-b494-42ac-ab4e-5021620ad0c6
523	0b8fec46-7f9c-485e-9e61-2e36704a3d88	dd8d69c2-9e51-4151-bdc7-c254d47f4f6c
524	0b8fec46-7f9c-485e-9e61-2e36704a3d88	98873274-3e71-480f-a413-c1d9f67c9ef3
525	0b8fec46-7f9c-485e-9e61-2e36704a3d88	640ea237-8629-4786-ab2e-25790295b4f1
526	71787fd3-18e9-4093-b74d-d0966c7872c7	15b186f4-f352-4a3f-a283-9fce2e2fa1ec
527	71787fd3-18e9-4093-b74d-d0966c7872c7	d969d581-da40-48d7-a534-b7c15c849e9e
528	71787fd3-18e9-4093-b74d-d0966c7872c7	4bcc1e36-6ff7-4371-be2d-22c857bdfef2
529	71787fd3-18e9-4093-b74d-d0966c7872c7	43deb429-41de-4ab2-b3bf-89de77209e8c
530	71787fd3-18e9-4093-b74d-d0966c7872c7	6da85c8b-88b4-49a6-9b4e-5af18fb5c4e6
531	71787fd3-18e9-4093-b74d-d0966c7872c7	be710963-6fb9-46e4-ad7d-b6acfd3680c5
532	71787fd3-18e9-4093-b74d-d0966c7872c7	fc7725e3-4093-441f-b970-d6ae63fdce01
533	71787fd3-18e9-4093-b74d-d0966c7872c7	32e3d1cd-205f-47ed-875c-8def3452ac67
534	ce5dba86-d252-497e-82be-9ddce6d30f30	cf2029a3-77b5-4d88-a53c-6566b2e43b4c
535	ce5dba86-d252-497e-82be-9ddce6d30f30	e5a9b7ec-e08e-4d14-9d69-1ae41c69b031
536	ce5dba86-d252-497e-82be-9ddce6d30f30	34f81210-db82-461f-a6bc-fcae55ae8347
537	ce5dba86-d252-497e-82be-9ddce6d30f30	ac34aaa4-2a67-4009-a50d-690242a3a5fc
538	ce5dba86-d252-497e-82be-9ddce6d30f30	2dea6d8b-5f99-40cb-8694-3b536598ac92
539	ce5dba86-d252-497e-82be-9ddce6d30f30	512ce0d9-015b-4ad3-ba4a-137885b0afa6
540	ce5dba86-d252-497e-82be-9ddce6d30f30	0c5d1c94-ad83-4b8e-8fac-e0ca0fd2f662
541	ce5dba86-d252-497e-82be-9ddce6d30f30	226be80c-bf3a-4363-81cd-4f1258edb198
542	ce5dba86-d252-497e-82be-9ddce6d30f30	7d0812a1-4245-41aa-97fa-d4d210e31749
543	b2f5c1ea-5835-4c1e-9c29-805b2c2d322b	b4dbe7bf-429a-434f-be05-e2e575d3c07d
544	b2f5c1ea-5835-4c1e-9c29-805b2c2d322b	7d0812a1-4245-41aa-97fa-d4d210e31749
545	b2f5c1ea-5835-4c1e-9c29-805b2c2d322b	e375a577-aae1-4b5c-8b2d-ac10544f7c5a
546	b2f5c1ea-5835-4c1e-9c29-805b2c2d322b	6e4ec282-c897-46c1-83a6-3752906c8ed2
547	b2f5c1ea-5835-4c1e-9c29-805b2c2d322b	7851fd91-efb9-4789-a143-ffc79b74c5b2
548	8ba10eec-7416-4b9a-93f1-3bd09f5c7778	cc34ed10-d089-4277-98dd-83da090e668b
549	8ba10eec-7416-4b9a-93f1-3bd09f5c7778	98873274-3e71-480f-a413-c1d9f67c9ef3
550	8ba10eec-7416-4b9a-93f1-3bd09f5c7778	68ac1ef5-748f-4b7b-b8f3-0220b80a446d
551	8ba10eec-7416-4b9a-93f1-3bd09f5c7778	54d59619-7ea4-442e-acdc-d7bf889db197
552	8ba10eec-7416-4b9a-93f1-3bd09f5c7778	2ae0b982-4711-4907-b730-11af1c5c3442
553	8ba10eec-7416-4b9a-93f1-3bd09f5c7778	ffd27b46-d313-49b3-ae8c-1e3f82f9542f
554	8ba10eec-7416-4b9a-93f1-3bd09f5c7778	0367d5d7-cbc0-41d7-9c59-79585f913713
555	8ba10eec-7416-4b9a-93f1-3bd09f5c7778	28838538-aa47-465f-ba5f-9a5a3cd37eb5
556	f51aed81-7ebf-428f-bdb4-70b0d54514a2	c8a7eb61-b116-4520-bd6b-79be1527006b
557	f51aed81-7ebf-428f-bdb4-70b0d54514a2	68ac1ef5-748f-4b7b-b8f3-0220b80a446d
558	f51aed81-7ebf-428f-bdb4-70b0d54514a2	35bab76b-ec3b-4d07-ac43-690a6877837b
559	f51aed81-7ebf-428f-bdb4-70b0d54514a2	bf084cb0-3784-49e2-bb79-1204f517e307
560	f51aed81-7ebf-428f-bdb4-70b0d54514a2	ffab6ca2-b33c-46ec-a2bb-a1e891bbeb2e
561	f51aed81-7ebf-428f-bdb4-70b0d54514a2	98873274-3e71-480f-a413-c1d9f67c9ef3
562	f51aed81-7ebf-428f-bdb4-70b0d54514a2	0f42e3d1-dd0b-423e-8b0c-5fb34c52199f
563	f51aed81-7ebf-428f-bdb4-70b0d54514a2	face5f20-0b59-44af-bf12-2e38a3c19be3
564	e68cb480-9541-41b4-b9b0-5a248684757d	0b907f34-5577-4226-86ae-08c9a3de704c
565	e68cb480-9541-41b4-b9b0-5a248684757d	fe798f1b-bed2-484a-a86d-e60dbfdbead5
566	e68cb480-9541-41b4-b9b0-5a248684757d	75209019-28db-43fb-8af8-3c931d99ccb2
567	e68cb480-9541-41b4-b9b0-5a248684757d	21c8a90a-8f4a-4d1c-a625-27053fe234e1
568	e68cb480-9541-41b4-b9b0-5a248684757d	d47074e2-20e0-4dfd-b3f0-bfa8374d0cb2
569	e68cb480-9541-41b4-b9b0-5a248684757d	4c47f16e-54d0-4fc4-8daa-41f422249d1f
570	e68cb480-9541-41b4-b9b0-5a248684757d	a87206a4-f121-4d04-9482-e32c94e0d228
571	1ce9b61f-1e94-4c61-bc68-de6f6eabab89	3bbcef97-6036-4c47-8947-a14f01b192f5
572	1ce9b61f-1e94-4c61-bc68-de6f6eabab89	364707e1-750d-45ae-94a7-fa4e7e100609
573	1ce9b61f-1e94-4c61-bc68-de6f6eabab89	80737dd8-c572-48bd-854d-9322665a61c6
574	1ce9b61f-1e94-4c61-bc68-de6f6eabab89	04f132ec-5cbf-4bee-8aa9-01f41474c723
575	1ce9b61f-1e94-4c61-bc68-de6f6eabab89	bcdd5165-1a48-4cbc-915f-df623139ea26
576	1ce9b61f-1e94-4c61-bc68-de6f6eabab89	62bbe225-bf28-454f-bce8-36437563e028
577	a14a0b20-9b70-4821-970e-e6f505bdbcb9	ba603109-c9c6-4d4a-9a78-8c0a4c064f1e
578	a14a0b20-9b70-4821-970e-e6f505bdbcb9	0b907f34-5577-4226-86ae-08c9a3de704c
579	a14a0b20-9b70-4821-970e-e6f505bdbcb9	28493c63-5d45-4971-81f0-49ac10164050
580	a14a0b20-9b70-4821-970e-e6f505bdbcb9	24c51332-105e-4a5f-9938-9ad9e6381b02
581	a14a0b20-9b70-4821-970e-e6f505bdbcb9	50575516-5213-4dd9-a455-546788d6cd27
582	a14a0b20-9b70-4821-970e-e6f505bdbcb9	42b567f9-2d16-4677-84dc-536d9fc97e83
583	a14a0b20-9b70-4821-970e-e6f505bdbcb9	4c47f16e-54d0-4fc4-8daa-41f422249d1f
584	a14a0b20-9b70-4821-970e-e6f505bdbcb9	082c1ce5-a8f9-461c-86c8-6b9ead38c73c
585	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	cc34ed10-d089-4277-98dd-83da090e668b
586	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	68ac1ef5-748f-4b7b-b8f3-0220b80a446d
587	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	98873274-3e71-480f-a413-c1d9f67c9ef3
588	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	8dc2183f-9354-4e5a-818c-532e5559e329
589	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	7f2618b3-c1f9-48a6-a25d-23d021448572
590	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	c0f12626-e9d0-4b04-ac9d-c79da4bdbcb6
591	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	9caf182a-6033-43cb-9eae-18df6830f468
592	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	ac34aaa4-2a67-4009-a50d-690242a3a5fc
593	1548f376-7bd3-455c-a18c-6ae017a08383	c8a7eb61-b116-4520-bd6b-79be1527006b
594	1548f376-7bd3-455c-a18c-6ae017a08383	68ac1ef5-748f-4b7b-b8f3-0220b80a446d
595	1548f376-7bd3-455c-a18c-6ae017a08383	c0f12626-e9d0-4b04-ac9d-c79da4bdbcb6
596	1548f376-7bd3-455c-a18c-6ae017a08383	98873274-3e71-480f-a413-c1d9f67c9ef3
597	1548f376-7bd3-455c-a18c-6ae017a08383	cc34ed10-d089-4277-98dd-83da090e668b
598	1548f376-7bd3-455c-a18c-6ae017a08383	28838538-aa47-465f-ba5f-9a5a3cd37eb5
599	1548f376-7bd3-455c-a18c-6ae017a08383	41c78ac1-77b8-40a2-a72b-c0b36614d1bb
600	1548f376-7bd3-455c-a18c-6ae017a08383	be3a9b66-a72a-4f9c-9187-087576e141e6
\.


--
-- TOC entry 6412 (class 0 OID 312454)
-- Dependencies: 288
-- Data for Name: expert_expert_research_areas; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_expert_research_areas (id, expert_id, researcharea_id) FROM stdin;
1	cc2c8d15-3a91-4485-81ef-8fcef5ea4a25	90153c0d-0e83-4a93-8396-7b10fc3a4054
2	cc2c8d15-3a91-4485-81ef-8fcef5ea4a25	34eaf735-6af7-46b6-95ad-b817ca2c8556
3	4bfedb13-2989-40cb-a435-0c3314c0f5c3	0abb7a07-8b4d-42c6-b3b2-cfb87c47e73b
4	4bfedb13-2989-40cb-a435-0c3314c0f5c3	ec6f9c69-fd83-47c7-9f15-c5ca7897823d
5	162d63f1-2d74-436c-b497-12b6f71fd9f7	803303a1-5704-4823-a8b3-6b1b91efb7b5
6	162d63f1-2d74-436c-b497-12b6f71fd9f7	ec6f9c69-fd83-47c7-9f15-c5ca7897823d
7	8b00b6e5-4263-492f-9dde-866efa62f049	bf821fe1-65a6-4b88-b9d7-7b5eb938e41b
8	8b00b6e5-4263-492f-9dde-866efa62f049	34eaf735-6af7-46b6-95ad-b817ca2c8556
9	5bcb6772-6263-4add-a5f3-95054fd00246	6ddddd4a-fd62-4fe2-9c9d-a8c8cc740a08
10	82f35f80-7d8e-4b7c-9dfc-e0c27c6abf22	df5fd549-8bbe-4ced-80e8-ff28b3f80acf
11	b79cdef4-3435-4990-9252-1791aedd6d2e	bf821fe1-65a6-4b88-b9d7-7b5eb938e41b
12	b79cdef4-3435-4990-9252-1791aedd6d2e	90153c0d-0e83-4a93-8396-7b10fc3a4054
13	e2f886bb-a017-458f-b4f8-311f0d800fee	803303a1-5704-4823-a8b3-6b1b91efb7b5
14	e2f886bb-a017-458f-b4f8-311f0d800fee	ec6f9c69-fd83-47c7-9f15-c5ca7897823d
15	b9ff32bd-2aa8-49e7-9586-379c75f33e28	df5fd549-8bbe-4ced-80e8-ff28b3f80acf
16	b9ff32bd-2aa8-49e7-9586-379c75f33e28	90153c0d-0e83-4a93-8396-7b10fc3a4054
17	88999316-8f8d-4ca0-9438-82d9df238d59	90153c0d-0e83-4a93-8396-7b10fc3a4054
18	88999316-8f8d-4ca0-9438-82d9df238d59	34eaf735-6af7-46b6-95ad-b817ca2c8556
19	95eef455-b009-4c6f-907e-91673dd3f1a8	bf821fe1-65a6-4b88-b9d7-7b5eb938e41b
20	95eef455-b009-4c6f-907e-91673dd3f1a8	34eaf735-6af7-46b6-95ad-b817ca2c8556
21	a502b2c7-b3b8-4383-a12e-9c069de367c9	803303a1-5704-4823-a8b3-6b1b91efb7b5
22	a502b2c7-b3b8-4383-a12e-9c069de367c9	ec6f9c69-fd83-47c7-9f15-c5ca7897823d
23	d53433ba-b9d8-4441-83e8-14f9693736b5	bf821fe1-65a6-4b88-b9d7-7b5eb938e41b
24	d53433ba-b9d8-4441-83e8-14f9693736b5	df5fd549-8bbe-4ced-80e8-ff28b3f80acf
25	7c089591-38b6-43a5-a990-f7b03c9d6d21	0abb7a07-8b4d-42c6-b3b2-cfb87c47e73b
26	7c089591-38b6-43a5-a990-f7b03c9d6d21	ec6f9c69-fd83-47c7-9f15-c5ca7897823d
27	eb7bef3e-f94f-49f9-87f3-37f367ab994e	6ddddd4a-fd62-4fe2-9c9d-a8c8cc740a08
28	e661b4e7-3380-4305-9404-c2f437fe1aba	bf821fe1-65a6-4b88-b9d7-7b5eb938e41b
29	e661b4e7-3380-4305-9404-c2f437fe1aba	df5fd549-8bbe-4ced-80e8-ff28b3f80acf
30	06f55fd9-7ccb-4bda-83d3-8d96d3ac8a69	803303a1-5704-4823-a8b3-6b1b91efb7b5
31	06f55fd9-7ccb-4bda-83d3-8d96d3ac8a69	ec6f9c69-fd83-47c7-9f15-c5ca7897823d
32	a77bf886-849b-455b-852a-2df8b6b58fa0	bf821fe1-65a6-4b88-b9d7-7b5eb938e41b
33	a77bf886-849b-455b-852a-2df8b6b58fa0	90153c0d-0e83-4a93-8396-7b10fc3a4054
34	2664691b-c5df-4ae9-b521-0185b31cce4d	df5fd549-8bbe-4ced-80e8-ff28b3f80acf
35	2664691b-c5df-4ae9-b521-0185b31cce4d	34eaf735-6af7-46b6-95ad-b817ca2c8556
36	f545466a-f5e5-4312-b277-5beb577cfa3d	0abb7a07-8b4d-42c6-b3b2-cfb87c47e73b
37	f545466a-f5e5-4312-b277-5beb577cfa3d	90153c0d-0e83-4a93-8396-7b10fc3a4054
38	d37db12f-a3b6-4dc9-aa60-b475590ed25f	df5fd549-8bbe-4ced-80e8-ff28b3f80acf
39	d37db12f-a3b6-4dc9-aa60-b475590ed25f	0abb7a07-8b4d-42c6-b3b2-cfb87c47e73b
40	96d80975-dbfe-4f48-95df-2d31e6cc6ede	803303a1-5704-4823-a8b3-6b1b91efb7b5
41	96d80975-dbfe-4f48-95df-2d31e6cc6ede	34eaf735-6af7-46b6-95ad-b817ca2c8556
42	0dac0759-934b-4704-97eb-527515f578ea	6ddddd4a-fd62-4fe2-9c9d-a8c8cc740a08
43	a7438e8f-5301-453e-b2be-212f786a8802	803303a1-5704-4823-a8b3-6b1b91efb7b5
44	a7438e8f-5301-453e-b2be-212f786a8802	ec6f9c69-fd83-47c7-9f15-c5ca7897823d
45	6c3770a1-da0e-40ca-bd75-c37091d43431	6ddddd4a-fd62-4fe2-9c9d-a8c8cc740a08
46	6c3770a1-da0e-40ca-bd75-c37091d43431	bf821fe1-65a6-4b88-b9d7-7b5eb938e41b
53	11a4ef9f-bb10-487a-8ced-a0d0caacbf1e	5802b75c-5a77-46f7-8684-f47d383d86e8
61	6a85721a-54d2-4a99-9426-c22f31b4b26a	5802b75c-5a77-46f7-8684-f47d383d86e8
62	722d2f3a-b0f0-48c0-a162-e69c53923476	5802b75c-5a77-46f7-8684-f47d383d86e8
63	722d2f3a-b0f0-48c0-a162-e69c53923476	5b525573-2282-4e28-99b2-6973ee6a5fb5
64	55dae78f-50c7-4bec-8975-998d7d55dba2	5b525573-2282-4e28-99b2-6973ee6a5fb5
65	1548f376-7bd3-455c-a18c-6ae017a08383	5b525573-2282-4e28-99b2-6973ee6a5fb5
66	1548f376-7bd3-455c-a18c-6ae017a08383	5cb2ba38-6f48-4a25-9983-1a89f5b2fa9c
67	3bdbf9f6-a569-4a6d-81e4-7ad65f06149a	5b525573-2282-4e28-99b2-6973ee6a5fb5
72	9ee63c75-b024-4fbb-90a8-1798cb6ceaaa	5b525573-2282-4e28-99b2-6973ee6a5fb5
73	1ce9b61f-1e94-4c61-bc68-de6f6eabab89	5b525573-2282-4e28-99b2-6973ee6a5fb5
74	858ac4bd-6f40-4bc3-b726-50c42d9cfe32	5b525573-2282-4e28-99b2-6973ee6a5fb5
76	a78667f1-f6cc-407c-8079-eb9a2beed0d1	4620940e-0da6-4724-8a33-0e0d24163b90
77	bb812c25-fe79-4803-a18f-91e2f890dead	4620940e-0da6-4724-8a33-0e0d24163b90
78	765a906e-fd8b-4b8b-9788-07cc411e2854	4620940e-0da6-4724-8a33-0e0d24163b90
79	765a906e-fd8b-4b8b-9788-07cc411e2854	e1001ed3-66d1-46ef-81b0-128d1856740d
80	765a906e-fd8b-4b8b-9788-07cc411e2854	9851d2de-686d-4b59-aacd-29292ca7f013
81	032459a4-fa62-412f-8b8e-88e11b17a173	4620940e-0da6-4724-8a33-0e0d24163b90
82	eb0fa648-67ab-4716-84ae-9e28c7e9e779	4620940e-0da6-4724-8a33-0e0d24163b90
83	7c7ad3df-ccd0-49c6-a73b-58eb01eb7cc2	4620940e-0da6-4724-8a33-0e0d24163b90
84	c262cfba-f4c8-4c29-b13b-924f195aace4	4620940e-0da6-4724-8a33-0e0d24163b90
85	8083be18-e5b7-4a0f-a1d9-68f8a0135d05	4620940e-0da6-4724-8a33-0e0d24163b90
86	8083be18-e5b7-4a0f-a1d9-68f8a0135d05	e1001ed3-66d1-46ef-81b0-128d1856740d
88	0b8fec46-7f9c-485e-9e61-2e36704a3d88	e1001ed3-66d1-46ef-81b0-128d1856740d
91	d65bf112-2363-4863-90af-c2290e38552a	9851d2de-686d-4b59-aacd-29292ca7f013
93	71787fd3-18e9-4093-b74d-d0966c7872c7	9851d2de-686d-4b59-aacd-29292ca7f013
94	71787fd3-18e9-4093-b74d-d0966c7872c7	e795f2fe-d973-400a-84ae-4567b5cbcfbf
95	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	eeb17ba2-3b1a-41c3-8b81-96b765776c67
96	2486a510-13b5-40c4-aafe-d016ee99a05f	eeb17ba2-3b1a-41c3-8b81-96b765776c67
97	2316b863-f75c-4f1c-947d-c92ff5630f80	5cb2ba38-6f48-4a25-9983-1a89f5b2fa9c
98	ce5dba86-d252-497e-82be-9ddce6d30f30	5cb2ba38-6f48-4a25-9983-1a89f5b2fa9c
99	b2f5c1ea-5835-4c1e-9c29-805b2c2d322b	5cb2ba38-6f48-4a25-9983-1a89f5b2fa9c
100	8ba10eec-7416-4b9a-93f1-3bd09f5c7778	5cb2ba38-6f48-4a25-9983-1a89f5b2fa9c
101	e68cb480-9541-41b4-b9b0-5a248684757d	5cb2ba38-6f48-4a25-9983-1a89f5b2fa9c
105	577f79a5-e422-41bf-9e99-0724e93c88ff	4620940e-0da6-4724-8a33-0e0d24163b90
109	e4f1b232-f338-4822-a71a-dc7108e34ff2	9851d2de-686d-4b59-aacd-29292ca7f013
112	f51aed81-7ebf-428f-bdb4-70b0d54514a2	5cb2ba38-6f48-4a25-9983-1a89f5b2fa9c
117	616eb172-f424-4e66-b503-be9b2bf1aa14	4620940e-0da6-4724-8a33-0e0d24163b90
121	a14a0b20-9b70-4821-970e-e6f505bdbcb9	5b525573-2282-4e28-99b2-6973ee6a5fb5
128	81d5f380-1962-4904-bd36-7b02753156b3	039d7d34-cc8a-445c-b867-e29d717f87d4
129	81d5f380-1962-4904-bd36-7b02753156b3	c497e561-8c38-485b-9d7d-339d425bfaf4
130	81d5f380-1962-4904-bd36-7b02753156b3	20ec8865-4874-4b20-8277-37d3b8540767
131	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	20ec8865-4874-4b20-8277-37d3b8540767
132	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	3fe7dd74-a8c3-4a2d-8c56-99a9f6252a62
133	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	6126b35f-9fe8-415d-a02b-dc84ede3c592
134	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	1780795b-b3c0-4b13-8fdd-a89e298c0f1e
135	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	11e1b709-54e6-4319-b847-713d7c5054d2
136	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	5d84a13c-abd5-4b17-b1f3-1a25ee853642
137	7a442992-c910-47e8-b627-afd0e7ce4c83	2787d14e-fde3-4220-a181-ac7a878f6626
138	7a442992-c910-47e8-b627-afd0e7ce4c83	7a09b2e0-85f3-42ab-9981-fc0d72083993
139	7a442992-c910-47e8-b627-afd0e7ce4c83	882a1399-69c4-47ab-86a2-32a120af5c39
140	5e834e6b-7d63-4416-b323-80a1758300b1	87104716-3c20-40b8-80b1-b0e8cc93b6e6
141	5e834e6b-7d63-4416-b323-80a1758300b1	3fe7dd74-a8c3-4a2d-8c56-99a9f6252a62
142	5e834e6b-7d63-4416-b323-80a1758300b1	882a1399-69c4-47ab-86a2-32a120af5c39
143	767afe2b-67b0-4078-88ad-28d0d8bc209f	882a1399-69c4-47ab-86a2-32a120af5c39
144	767afe2b-67b0-4078-88ad-28d0d8bc209f	5fc008a3-db50-4ef7-b125-07a8492a3e3b
145	767afe2b-67b0-4078-88ad-28d0d8bc209f	3fe7dd74-a8c3-4a2d-8c56-99a9f6252a62
146	d65bf112-2363-4863-90af-c2290e38552a	3fe7dd74-a8c3-4a2d-8c56-99a9f6252a62
147	d65bf112-2363-4863-90af-c2290e38552a	20ec8865-4874-4b20-8277-37d3b8540767
148	d65bf112-2363-4863-90af-c2290e38552a	6126b35f-9fe8-415d-a02b-dc84ede3c592
149	577f79a5-e422-41bf-9e99-0724e93c88ff	2787d14e-fde3-4220-a181-ac7a878f6626
150	577f79a5-e422-41bf-9e99-0724e93c88ff	fd76c511-20a5-4b3e-88db-7c5e3008b3d9
151	577f79a5-e422-41bf-9e99-0724e93c88ff	dd234f0e-9c5a-4f46-867d-ff0baf577aa2
152	55dae78f-50c7-4bec-8975-998d7d55dba2	1780795b-b3c0-4b13-8fdd-a89e298c0f1e
153	55dae78f-50c7-4bec-8975-998d7d55dba2	faa8b82b-f913-47f9-8dde-d0637e3ccf87
154	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	f130202b-4bbb-4402-9258-85d359ba9762
155	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	2126df8a-2a6c-4d17-9257-df2fa2be3367
156	b75f4486-d125-4a65-80e5-b9d4f2a6eb52	92b94ac8-987f-453c-b990-9a61951734c3
157	0b8fec46-7f9c-485e-9e61-2e36704a3d88	039d7d34-cc8a-445c-b867-e29d717f87d4
158	0b8fec46-7f9c-485e-9e61-2e36704a3d88	c497e561-8c38-485b-9d7d-339d425bfaf4
159	0b8fec46-7f9c-485e-9e61-2e36704a3d88	2787d14e-fde3-4220-a181-ac7a878f6626
163	577f79a5-e422-41bf-9e99-0724e93c88ff	9851d2de-686d-4b59-aacd-29292ca7f013
164	97f9bd96-bca8-4cd9-8b4c-dc62c3b1d81e	9851d2de-686d-4b59-aacd-29292ca7f013
165	a78667f1-f6cc-407c-8079-eb9a2beed0d1	5b525573-2282-4e28-99b2-6973ee6a5fb5
166	0320a7f6-ea8e-434e-b1b5-b1492092aff7	8e0deda3-e38f-4838-bf05-4c47dd741d41
167	0320a7f6-ea8e-434e-b1b5-b1492092aff7	dd234f0e-9c5a-4f46-867d-ff0baf577aa2
168	0320a7f6-ea8e-434e-b1b5-b1492092aff7	3fe7dd74-a8c3-4a2d-8c56-99a9f6252a62
169	81d5f380-1962-4904-bd36-7b02753156b3	e1001ed3-66d1-46ef-81b0-128d1856740d
170	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	e795f2fe-d973-400a-84ae-4567b5cbcfbf
171	dd4d7f32-1eaa-4a4e-8ea6-6a48ccf87e3c	9851d2de-686d-4b59-aacd-29292ca7f013
172	e4f1b232-f338-4822-a71a-dc7108e34ff2	e795f2fe-d973-400a-84ae-4567b5cbcfbf
173	04752e52-8b5d-4379-80ba-efa6089aa752	e1001ed3-66d1-46ef-81b0-128d1856740d
174	04752e52-8b5d-4379-80ba-efa6089aa752	4620940e-0da6-4724-8a33-0e0d24163b90
175	b2f5c1ea-5835-4c1e-9c29-805b2c2d322b	e1001ed3-66d1-46ef-81b0-128d1856740d
176	77df01e0-f60e-4ddc-8a92-9786fcb9b30b	3fe7dd74-a8c3-4a2d-8c56-99a9f6252a62
\.


--
-- TOC entry 6414 (class 0 OID 312461)
-- Dependencies: 290
-- Data for Name: expert_expertgroup; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_expertgroup (id, is_active, display_order, created_at, updated_at, name, slug, description) FROM stdin;
0122e571-d2d9-4085-81ac-6cce3df19edf	t	0	2026-07-28 22:12:24.682336+07	2026-07-28 22:12:24.682345+07	Giáo dục	giao-dc	Giáo dục
99a07c82-ec65-4666-b9a2-bb32ba7d1007	t	0	2026-07-28 22:12:49.353899+07	2026-07-28 22:12:49.353915+07	Chính sách	chinh-sach	Chính sách
0b2c289e-a16f-495e-9b56-9ec3a1a0be5b	t	1	2026-07-27 17:43:38.918539+07	2026-07-28 23:36:07.611678+07	Nhà khoa học & Nghiên cứu viên	nha-khoa-hoc	
f5b73ea9-c9e3-4f8a-908f-e725e2123cba	t	2	2026-07-27 17:43:38.922118+07	2026-07-28 23:36:07.612529+07	Chuyên gia tư vấn doanh nghiệp	tu-van-doanh-nghiep	
0490c13d-38a8-445a-9c19-a93227978afd	t	3	2026-07-27 17:43:38.923559+07	2026-07-28 23:36:07.613577+07	Giảng viên & Học giả	giang-vien	
07ba59c7-7723-41bc-8673-77c08c791b6c	t	4	2026-07-27 17:43:38.924721+07	2026-07-28 23:36:07.614558+07	Chuyên gia chính sách	chuyen-gia-chinh-sach	
53d588f5-b4ad-4059-bbcb-2a6f54b67150	t	5	2026-07-27 17:43:38.926028+07	2026-07-28 23:36:07.615342+07	Chuyên gia quốc tế	chuyen-gia-quoc-te	
\.


--
-- TOC entry 6415 (class 0 OID 312475)
-- Dependencies: 291
-- Data for Name: expert_expertlistingpage; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_expertlistingpage (id, is_active, display_order, created_at, updated_at, hero_eyebrow, hero_heading, hero_description, hero_image, hero_btn1_label, hero_btn1_url, hero_btn2_label, hero_btn2_url, process_heading, process_description, senior_heading, senior_cta_label, senior_cta_url, map_heading, map_description, directory_heading, topic_heading, topic_description, cta_eyebrow, cta_heading, cta_description, cta_bg_image, cta_btn1_label, cta_btn1_url, cta_btn2_label, cta_btn2_url, meta_title, meta_description, hero_badge_color, hero_badge_icon, hero_badge_show, hero_badge_text, hero_bottom_badge_bg, hero_bottom_badge_icon, hero_bottom_badge_show, hero_bottom_badge_text, hero_btn1_icon, hero_btn1_target, hero_btn2_icon, hero_btn2_target, hero_bottom_badge_logo, process_section_label, senior_description, senior_section_label, map_cta1_label, map_cta1_url, map_cta2_label, map_cta2_url, map_section_label, directory_description, directory_section_label, info_group_section_description, info_group_section_heading, info_group_section_label) FROM stdin;
ff2599d0-4f06-4a6e-80fd-2d8586b722f7	t	0	2026-07-27 17:43:38.909609+07	2026-07-28 23:36:07.600839+07	MẠNG LƯỚI CHUYÊN GIA IRDM	MẠNG LƯỚI NHÀ KHOA HỌC & CHUYÊN GIA LIÊN NGÀNH	Viện IRDM quy tụ đội ngũ hơn 200 nhà khoa học và chuyên gia đầu ngành, kết nối tri thức liên ngành để giải quyết những thách thức phức tạp của xã hội và doanh nghiệp.	expert/hero/ChuyenGia_MangLuoi.png	TÌM HIỂU THÊM	#ket-noi	ĐĂNG KÝ CHUYÊN GIA	/lien-he/	VIỆN IRDM KẾT NỐI CHUYÊN GIA NHƯ THẾ NÀO?	Viện IRDM không tiếp cận đối tác bằng một danh sách chuyên gia rời rạc. Chúng tôi bắt đầu từ bài toán cần giải quyết, xác định tổ hợp chuyên môn cần thiết, sau đó kết nối nhà khoa học/chuyên gia phù hợp để đồng thiết kế hướng đi và hỗ trợ triển khai.	CHUYÊN GIA CAO CẤP CỦA VIỆN IRDM	Xem tất cả chuyên gia	#tim-kiem	BẢN ĐỒ CHUYÊN MÔN LIÊN NGÀNH	Mỗi bài toán thực tiễn cần nhiều góc nhìn chuyên môn cùng tham gia. Mỗi cụm chuyên môn phản ánh một nhóm năng lực mà IRDM có thể huy động trong nghiên cứu, đào tạo, tư vấn, phản biện, thiết kế giải pháp hoặc triển khai chương trình — giúp nhận diện lĩnh vực phù hợp, khám phá các hướng giải pháp liên quan hoặc tìm nhóm chuyên gia có thể đồng hành.	TÌM NHÀ KHOA HỌC/CHUYÊN GIA	CÁC CHỦ ĐỀ THÔNG TIN CHUYÊN MÔN	Khám phá các chủ đề nghiên cứu và tìm hiểu đội ngũ chuyên gia đang nghiên cứu trong từng lĩnh vực.	KẾT NỐI VỚI IRDM	BẠN ĐANG TÌM KIẾM CHUYÊN GIA?	Liên hệ với Viện IRDM để được tư vấn và kết nối với chuyên gia phù hợp với nhu cầu của bạn.		LIÊN HỆ NGAY	/lien-he/	ĐĂNG KÝ CHUYÊN GIA	/lien-he/	Đội Ngũ Chuyên Gia Liên Ngành | Viện IRDM	Khám phá mạng lưới nhà khoa học và chuyên gia liên ngành của Viện IRDM. Tìm chuyên gia phù hợp theo lĩnh vực nghiên cứu.	#ffffff1a		t	Đội ngũ chuyên gia	#ffffff14		t	ĐÚNG CHUYÊN MÔN CHO ĐÚNG BÀI TOÁN		_self		_self	expert/hero/badges/Group.png	PHƯƠNG THỨC TIẾP CẬN	Một số hồ sơ đại diện cho các trục chuyên môn chính trong mạng lưới chuyên gia của Viện IRDM.	CHUYÊN GIA CẤP CAO	Tìm chuyên gia	#tim-kiem	Khám phá giải pháp	/giai-phap/	BẢN ĐỒ CHUYÊN MÔN	Sử dụng bộ lọc bên dưới để tìm nhà khoa học/chuyên gia theo vai trò, lĩnh vực chuyên môn và hình thức đồng hành phù hợp. Mỗi kết quả sẽ dẫn đến hồ sơ chuyên môn chi tiết của chuyên gia.	TÌM KIẾM		CÁC NHÓM THÔNG TIN CHUYÊN MÔN	CÁC NHÓM THÔNG TIN CHUYÊN MÔN
\.


--
-- TOC entry 6416 (class 0 OID 312540)
-- Dependencies: 292
-- Data for Name: expert_infogroup; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_infogroup (id, is_active, display_order, created_at, updated_at, name, slug, icon, icon_bg_color, header_description, section_label, section_heading, section_description, expert_grid_cta_label, show_expert_grid, expert_grid_flat, show_association_grid) FROM stdin;
7caaa961-8430-4661-bc97-e8a597712671	t	1	2026-07-29 14:31:20.4865+07	2026-07-29 16:48:47.053825+07	Cơ cấu tổ chức	co-cau-to-chuc	building-office-2	#EFF6FF	Giới thiệu các vị trí quản trị và điều hành chính của IRDM, thể hiện vai trò, trách nhiệm và mối liên kết giữa quản trị viện, chuyên môn và triển khai.	CƠ CẤU TỔ CHỨC	Mô hình tổ chức tinh gọn, linh hoạt và chuyên môn hóa, kết nối hiệu quả giữa quản trị chiến lược, điều hành chuyên nghiệp, năng lực chuyên môn và mạng lưới chuyên gia liên ngành.	Viện IRDM vận hành theo mô hình tổ chức tinh gọn, hiệu quả và bền vững, bảo đảm nguyên tắc đúng người, đúng việc, đúng giá trị trong mọi hoạt động.	Xem hồ sơ chuyên môn	f	f	f
d2f33967-6923-4ad9-bc65-2a8cc962a2ce	t	3	2026-07-29 14:31:20.499625+07	2026-07-29 22:08:33.81856+07	Nhà khoa học & Chuyên gia	nha-khoa-hoc-chuyen-gia		#FFF7ED	Mạng lưới nhà khoa học và chuyên gia liên ngành, sẵn sàng đồng hành cùng doanh nghiệp, tổ chức trong giải quyết bài toán thực tiễn.	NHÀ KHOA HỌC & CHUYÊN GIA	Đội ngũ chuyên gia đa dạng, có thể đồng hành từ nghiên cứu đến triển khai thực tiễn.	Viện IRDM kết nối với hàng trăm nhà khoa học và chuyên gia trong nhiều lĩnh vực, từ kinh tế, quản trị đến công nghệ và y tế.	Xem hồ sơ chuyên môn	t	f	f
ddc96b7a-5154-4bd2-8b3d-76e34929943f	t	4	2026-07-29 23:27:17.337552+07	2026-07-29 23:27:17.337562+07	Giảng viên & Chuyên gia học tập ứng dụng	giang-vien-chuyen-gia-hoc-tap	book-open	#EFF6FF	Đội ngũ trực tiếp chuyên hóa tri thức thành trải nghiệm học tập, tập huấn, coaching, workshop, E-Learning và microlearning.			Đội ngũ chuyên gia học tập ứng dụng trực tiếp chuyên hóa tri thức thành trải nghiệm học tập, tập huấn, coaching, workshop, E-Learning và microlearning.	Xem hồ sơ chuyên môn	t	t	f
99b923e5-bc93-482a-a0a7-25eb89887fd0	t	2	2026-07-29 14:31:20.497567+07	2026-08-03 22:36:06.34053+07	Hội đồng khoa học	hoi-dong-khoa-hoc	academic-cap	#F0FDF4	Hội đồng tư vấn khoa học độc lập, đảm bảo chất lượng nghiên cứu và định hướng phát triển học thuật của Viện IRDM.	HỘI ĐỒNG KHOA HỌC	Bảo chứng chuyên môn cấp cao cho các hoạt động nghiên cứu khoa học & công nghệ, đào tạo, tư vấn và đổi mới sáng tạo của Viện IRDM.	Hội đồng Khoa học của Viện IRDM đồng hành trong việc định hướng học thuật, tư vấn về các nhiệm vụ khoa học – công nghệ, đồng thời tham gia đánh giá, thẩm định và phản biện các đề tài, dự án, chương trình và kết quả hoạt động chuyên môn.	Xem hồ sơ chuyên môn	f	f	f
e23ebc4e-6d8d-4070-b204-51f85793e29e	t	5	2026-07-29 23:47:53.564619+07	2026-08-03 23:27:53.988551+07	Hiệp hội & Mạng lưới chuyên môn	hiep-hoi-mang-luoi-chuyen-mon	globe-alt	#EFF6FF	Các hội khoa học, hiệp hội nghề nghiệp và mạng lưới chuyên môn mà IRDM tham gia nhằm duy trì kết nối học thuật, cập nhật tri thức mới và mở rộng hợp tác liên ngành.			Các hội khoa học, hiệp hội nghề nghiệp và mạng lưới chuyên môn mà IRDM tham gia nhằm duy trì kết nối học thuật, cập nhật tri thức mới và mở rộng hợp tác liên ngành.	Xem hồ sơ chuyên môn	f	f	t
\.


--
-- TOC entry 6417 (class 0 OID 312563)
-- Dependencies: 293
-- Data for Name: expert_infogroup_expert_direct_members; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_infogroup_expert_direct_members (id, infogroup_id, expert_id) FROM stdin;
3	ddc96b7a-5154-4bd2-8b3d-76e34929943f	577f79a5-e422-41bf-9e99-0724e93c88ff
7	ddc96b7a-5154-4bd2-8b3d-76e34929943f	e4f1b232-f338-4822-a71a-dc7108e34ff2
10	ddc96b7a-5154-4bd2-8b3d-76e34929943f	f51aed81-7ebf-428f-bdb4-70b0d54514a2
15	ddc96b7a-5154-4bd2-8b3d-76e34929943f	616eb172-f424-4e66-b503-be9b2bf1aa14
19	ddc96b7a-5154-4bd2-8b3d-76e34929943f	a14a0b20-9b70-4821-970e-e6f505bdbcb9
\.


--
-- TOC entry 6419 (class 0 OID 312570)
-- Dependencies: 295
-- Data for Name: expert_infogroup_expert_research_areas; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_infogroup_expert_research_areas (id, infogroup_id, researcharea_id) FROM stdin;
2	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	e1001ed3-66d1-46ef-81b0-128d1856740d
3	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	4620940e-0da6-4724-8a33-0e0d24163b90
4	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	9851d2de-686d-4b59-aacd-29292ca7f013
5	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	e795f2fe-d973-400a-84ae-4567b5cbcfbf
6	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	5b525573-2282-4e28-99b2-6973ee6a5fb5
7	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	5cb2ba38-6f48-4a25-9983-1a89f5b2fa9c
8	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	5802b75c-5a77-46f7-8684-f47d383d86e8
9	d2f33967-6923-4ad9-bc65-2a8cc962a2ce	eeb17ba2-3b1a-41c3-8b81-96b765776c67
\.


--
-- TOC entry 6421 (class 0 OID 312577)
-- Dependencies: 297
-- Data for Name: expert_infogroupblock; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_infogroupblock (id, is_active, display_order, created_at, updated_at, title, function_label, function_text, duties_label, duties, icon, info_group_id) FROM stdin;
08510bc4-f410-4c0b-80a9-6c2b174f03b0	t	1	2026-07-29 16:05:09.833743+07	2026-07-29 16:48:47.082235+07	Hội đồng Quản lý	CHỨC NĂNG	Định hướng chiến lược và giám sát hoạt động chung của Viện.	NHIỆM VỤ CHÍNH	Phê duyệt định hướng phát triển và kế hoạch trọng tâm.\nGiám sát nguyên tắc vận hành và quản trị rủi ro.\nBảo đảm sự nhất quán giữa sứ mệnh và hoạt động.		7caaa961-8430-4661-bc97-e8a597712671
d42fb601-3641-4290-aab0-15f3913402ee	t	0	2026-07-29 21:37:09.011697+07	2026-07-29 21:37:09.011705+07	Y Tế & Quản Trị Y Tế	CHỨC NĂNG	Chuyên môn về hệ thống y tế, quản trị bệnh viện, chất lượng chăm sóc và phát triển dịch vụ	NHIỆM VỤ CHÍNH			d2f33967-6923-4ad9-bc65-2a8cc962a2ce
559b64c6-82db-48ef-ae92-c9a73f47faa2	t	0	2026-07-29 21:39:59.283636+07	2026-07-29 21:39:59.283646+07	AI, Dữ liệu & Chuyển đổi số	CHỨC NĂNG	Hỗ trợ nhận diện use case, đánh giá dữ liệu, thiết kế dashboard, công cụ số và lộ trình thí điểm	NHIỆM VỤ CHÍNH			d2f33967-6923-4ad9-bc65-2a8cc962a2ce
088a5008-e36e-4d0b-bee5-09950bc2adda	t	0	2026-07-29 21:43:53.499119+07	2026-07-29 21:43:53.499125+07	Giáo dục & Phát triển năng lực	CHỨC NĂNG	Thiết kế chương trình học tập, đào tạo, E-Learning, microlearning và phát triển năng lực đội ngũ.	NHIỆM VỤ CHÍNH			d2f33967-6923-4ad9-bc65-2a8cc962a2ce
e67973f3-edaa-498b-b9f0-2a12588aa8ad	t	0	2026-07-29 21:43:53.49947+07	2026-07-29 21:43:53.499474+07	Tâm lý & Sức khỏe tâm thần	CHỨC NĂNG	Nghiên cứu, thiết kế sáng kiến phòng ngừa, nâng đỡ tâm lý - xã hội và wellbeing	NHIỆM VỤ CHÍNH			d2f33967-6923-4ad9-bc65-2a8cc962a2ce
23471433-f79f-4b73-bdda-ff12030f3729	t	0	2026-07-29 21:43:53.499822+07	2026-07-29 21:43:53.49983+07	Xã hội học & Chính sách công	CHỨC NĂNG	Phân tích bối cảnh xã hội, nhóm thụ hưởng, tác động chính sách và các vấn đề phát triển hệ thống.	NHIỆM VỤ CHÍNH			d2f33967-6923-4ad9-bc65-2a8cc962a2ce
6fd19635-78db-47b8-bcc7-352c4f2fac74	t	0	2026-07-29 21:43:53.500121+07	2026-07-29 21:43:53.500125+07	Môi trường & Phát triển bền vững	CHỨC NĂNG	Kết nối môi trường sống, ESG, Green University, Green Hospital và các sáng kiến bền vững	NHIỆM VỤ CHÍNH			d2f33967-6923-4ad9-bc65-2a8cc962a2ce
6d8be6e1-3cea-4819-8790-56ca21e54f12	t	0	2026-07-29 21:43:53.5004+07	2026-07-29 21:43:53.500406+07	Quản trị nhân sự & Tổ chức	CHỨC NĂNG	Phát triển lãnh đạo, năng lực phối hợp, văn hóa tổ chức và hiệu quả làm việc	NHIỆM VỤ CHÍNH			d2f33967-6923-4ad9-bc65-2a8cc962a2ce
10114aeb-03ed-4ee1-bfb9-f456c89c8ce6	t	0	2026-07-29 21:43:53.500655+07	2026-07-29 21:43:53.500659+07	Quản trị kinh tế & Tác động xã hộ	CHỨC NĂNG	Hỗ trợ phân tích hiệu quả, nguồn lực, mô hình vận hành và giá trị xã hội của sáng kiến.	NHIỆM VỤ CHÍNH			d2f33967-6923-4ad9-bc65-2a8cc962a2ce
\.


--
-- TOC entry 6422 (class 0 OID 312595)
-- Dependencies: 298
-- Data for Name: expert_infogroupmember; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_infogroupmember (id, is_active, display_order, created_at, updated_at, role_label, academic_title, name, "position", email, avatar, cta_text, cta_url, info_group_id) FROM stdin;
8ca0e16a-6e29-41b5-80d2-2ae899186908	t	1	2026-07-29 16:48:47.088975+07	2026-08-03 22:36:06.348296+07	Chủ tịch Hội đồng	PGS.TS.	Lê Quang Minh		quangminh.le@irdm.edu.vn	expert/council/PGS_LeQuangMinh.jpg	Xem hồ sơ chuyên môn	#	99b923e5-bc93-482a-a0a7-25eb89887fd0
c20f0113-5972-409c-8c61-8fd8d6190b3a	t	2	2026-07-29 16:48:47.093901+07	2026-08-03 22:36:06.350072+07	Thư ký Hội đồng	ThS.	Tạ Thị Phấn		hongphan.ta@irdm.edu.vn	expert/council/TaThiPhan.png	Xem hồ sơ chuyên môn	#	99b923e5-bc93-482a-a0a7-25eb89887fd0
\.


--
-- TOC entry 6423 (class 0 OID 312615)
-- Dependencies: 299
-- Data for Name: expert_knowledgetopic; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_knowledgetopic (id, is_active, display_order, created_at, updated_at, name, slug, description, color, cta_label, cta_url, icon) FROM stdin;
31fa99d3-215a-4f3b-a9ff-776756a9b901	t	1	2026-07-27 17:43:38.960938+07	2026-07-28 23:36:07.637605+07	Chuyển đổi số và đổi mới sáng tạo	chuyen-doi-so-doi-moi-sang-tao	Các nghiên cứu và ứng dụng về chuyển đổi số trong tổ chức, doanh nghiệp và khu vực công.				
88f1757b-c60b-4d56-bc82-7281e375b2df	t	2	2026-07-27 17:43:38.965969+07	2026-07-28 23:36:07.6387+07	Phát triển kinh tế bền vững	phat-trien-kinh-te-ben-vung	Nghiên cứu các mô hình kinh tế bền vững, tăng trưởng xanh và tác động xã hội.				
2d7bdbd6-befc-47c3-980f-fd44685e42ca	t	3	2026-07-27 17:43:38.9675+07	2026-07-28 23:36:07.63936+07	Quản trị tổ chức & Lãnh đạo chiến lược	quan-tri-to-chuc-lanh-dao-chien-luoc	Khung lý thuyết và thực tiễn về quản trị hiệu quả, lãnh đạo thay đổi và xây dựng năng lực tổ chức.				
61814c89-4232-48f6-9bc4-8d4895a0d775	t	4	2026-07-27 17:43:38.968853+07	2026-07-28 23:36:07.639982+07	Giáo dục & Phát triển nhân lực	giao-duc-phat-trien-nhan-luc	Chính sách giáo dục, đào tạo nghề và phát triển nguồn nhân lực chất lượng cao.				
8440df2b-91f6-475c-b4bc-14579c6e67dc	t	5	2026-07-27 17:43:38.970117+07	2026-07-28 23:36:07.64058+07	Chính sách công & Thể chế	chinh-sach-cong-the-che	Phân tích chính sách, cải cách thể chế và quản trị nhà nước hiện đại.				
2374e014-73a2-434c-bc38-b8de2f6a5d13	t	6	2026-07-27 17:43:38.971348+07	2026-07-28 23:36:07.641174+07	Sức khỏe cộng đồng & Y tế	suc-khoe-cong-dong-y-te	Nghiên cứu y tế công cộng, hệ thống y tế và các can thiệp sức khỏe cộng đồng.				
4d3bf782-5347-40da-928b-3d89be9c2174	f	0	2026-08-05 22:20:18.960334+07	2026-08-05 22:20:18.960343+07	Phân tích dược chất	phan-tich-dc-cht	Phân tích dược chất				
64116546-b287-4874-a917-60c790eded7f	f	0	2026-08-05 22:17:46.223982+07	2026-08-05 22:20:35.818676+07	Kiểm nghiệm thuốc	kim-nghim-thuc	Kiểm nghiệm thuốc				
bcd6a166-de4e-4fc6-a665-22ac90ae6f29	f	0	2026-08-05 22:20:58.905846+07	2026-08-05 22:20:58.905857+07	Dược phẩm	dc-phm	Dược phẩm				
2aa1d421-e6fd-49cb-9018-8adb4c878dc3	f	0	2026-08-05 22:21:19.006656+07	2026-08-05 22:21:19.006665+07	Quản lý chất lượng giáo dục	qun-ly-cht-lng-giao-dc	Quản lý chất lượng giáo dục				
dfc52589-b833-45aa-b480-98e622f460ea	f	0	2026-08-05 22:21:37.736543+07	2026-08-05 22:21:37.736552+07	Giáo dục đại học	giao-dc-dji-hc	Giáo dục đại học				
7435e3c0-aa94-47f7-a7f6-0850d4dd5ddb	f	0	2026-08-05 22:21:48.686751+07	2026-08-05 22:21:48.68676+07	HPLC	hplc	HPLC				
e864fd9d-7062-4f0c-b1ff-0a76f224282e	f	0	2026-08-05 22:22:06.379332+07	2026-08-05 22:22:06.379349+07	LC-MS/MS	lc-msms	LC-MS/MS				
004bda91-e522-4bdd-a795-1ad2fa053001	f	0	2026-08-05 22:22:22.679407+07	2026-08-05 22:22:22.679416+07	Dược điển	dc-djin	Dược điển				
b0f1d473-6e9d-406d-83fc-70c74eecfa01	f	0	2026-08-05 22:22:33.563428+07	2026-08-05 22:22:33.563438+07	Pharmaceutical Analysis	pharmaceutical-analysis	Pharmaceutical Analysis				
9a1d5c83-1ad1-4b15-ad45-8250e3b97f70	f	0	2026-08-05 22:22:47.940773+07	2026-08-05 22:22:47.940782+07	Quality Assurance	quality-assurance	Quality Assurance				
9ee1d1c7-af25-494c-a5c2-6870dd4d1627	f	0	2026-08-05 22:49:47.277809+07	2026-08-05 22:49:47.277819+07	Trí tuệ nhân tạo (AI)	tri-tu-nhan-to-ai	Trí tuệ nhân tạo (AI)				
d351e629-7281-47c0-8af7-a5ad445fced9	f	0	2026-08-05 22:50:04.115674+07	2026-08-05 22:50:04.115683+07	Machine Learning	machine-learning	Machine Learning				
b1e34afc-58bd-4a11-8e58-2e38aae98d86	f	0	2026-08-05 22:50:15.172091+07	2026-08-05 22:50:15.172106+07	Deep Learning	deep-learning	Deep Learning				
2c2fbbfa-5fec-48fe-a5fa-5e0c0bcb1b46	f	0	2026-08-05 22:50:27.227484+07	2026-08-05 22:50:27.227493+07	Toán học ứng dụng	toan-hc-ng-dng	Toán học ứng dụng				
08667282-0ec3-4f62-9d22-3b6cf067e3ae	f	0	2026-08-05 22:50:40.030012+07	2026-08-05 22:50:40.030025+07	Khoa học dữ liệu	khoa-hc-d-liu	Khoa học dữ liệu				
c0ba013b-4741-4efe-a52d-a4aca5c22f8b	f	0	2026-08-05 22:50:50.1275+07	2026-08-05 22:50:50.12751+07	Computer Vision	computer-vision	Computer Vision				
b778bfd7-5910-4d4c-ac88-b6513b6b2f61	f	0	2026-08-05 22:51:05.096837+07	2026-08-05 22:51:05.096851+07	NLP	nlp	NLP				
c00b6e42-4be8-42ef-b6a0-4e977161cc70	f	0	2026-08-05 22:51:15.563568+07	2026-08-05 22:51:15.563578+07	AI công nghiệp	ai-cong-nghip	AI công nghiệp				
2f44528b-51e8-4b79-acb4-f3fa6d42f7d2	f	0	2026-08-05 22:51:25.487714+07	2026-08-05 22:51:25.487722+07	AI môi trường	ai-moi-trng	AI môi trường				
2126a220-8fc1-46ab-a283-ed63816b3445	f	0	2026-08-05 22:51:36.658032+07	2026-08-05 22:51:36.658041+07	AI ứng dụng	ai-ng-dng	AI ứng dụng				
baed0ba6-a206-4e60-8e9f-7aea7b5d9ab4	t	0	2026-08-05 23:45:38.909195+07	2026-08-05 23:45:38.909212+07	Quản trị đại học	qun-tr-dji-hc	Quản trị đại học				
fa3e65cc-6337-40de-888e-013e530c2a38	f	0	2026-08-05 23:46:01.19269+07	2026-08-05 23:46:01.1927+07	Đảm bảo chất lượng Giáo dục	djm-bo-cht-lng-giao-dc	Đảm bảo chất lượng Giáo dục				
953b3e71-d0dc-4816-a69d-b0fe1d21ff63	f	0	2026-08-05 23:46:15.632025+07	2026-08-05 23:46:15.632033+07	AUN-QA	aun-qa	AUN-QA				
154ee17b-3296-4023-ad7b-7505f476ba25	f	0	2026-08-05 23:46:34.463466+07	2026-08-05 23:46:34.463483+07	Chính sách công	chinh-sach-cong	Chính sách công				
26d0af55-3d57-4a63-8b1a-db225d483d83	f	0	2026-08-05 23:47:24.894093+07	2026-08-05 23:47:24.894109+07	Quản lý môi trường	qun-ly-moi-trng	Quản lý môi trường				
79309c79-5bbf-4d49-8e20-d38e7506ea21	f	0	2026-08-05 23:47:37.405971+07	2026-08-05 23:47:37.405979+07	Strategic Planning	strategic-planning	Strategic Planning				
03e3ef2d-a5e7-4231-b487-8a38fd4ad6e7	f	0	2026-08-05 23:49:14.740652+07	2026-08-05 23:49:14.74066+07	Outcome-Based Education	outcome-based-education	Outcome-Based Education				
49562603-d4d9-416c-a763-56589e046afa	f	0	2026-08-06 21:51:48.212306+07	2026-08-06 21:51:48.212315+07	Xã hội học du lịch	xa-hi-hc-du-lch	Xã hội học du lịch				
5018cd4d-1146-4c98-9469-a9f3a69f5672	f	0	2026-08-06 21:52:02.57359+07	2026-08-06 21:52:02.573604+07	Du lịch bền vững	du-lch-bn-vng	Du lịch bền vững				
7875f415-20ec-4332-b46d-0cb934052e67	f	0	2026-08-06 21:52:28.579343+07	2026-08-06 21:52:28.579352+07	Du lịch thông minh	du-lch-thong-minh	Du lịch thông minh				
df9856f5-3078-4086-8d97-5ed2dbb94417	f	0	2026-08-06 21:52:43.804425+07	2026-08-06 21:52:43.804438+07	Công nghệ trong du lịch	cong-ngh-trong-du-lch	Công nghệ trong du lịch				
d052ac03-7323-4097-982c-1b68a12263b4	f	0	2026-08-06 21:52:59.169307+07	2026-08-06 21:52:59.169317+07	Hành vi du khách	hanh-vi-du-khach	Hành vi du khách				
9237b016-d22e-415c-891f-49a7c9bcbada	f	0	2026-08-06 21:53:12.639682+07	2026-08-06 21:53:12.639698+07	Du lịch thực tế ảo	du-lch-thc-t-o	Du lịch thực tế ảo				
a9d96996-5e55-41af-b899-84d198aa3f91	f	0	2026-08-06 21:53:30.139714+07	2026-08-06 21:53:30.139723+07	Giới trong quản lý và du lịch	gii-trong-qun-ly-va-du-lch	Giới trong quản lý và du lịch				
ada3a2e4-9a88-450d-b536-04a15a268981	f	0	2026-08-06 21:53:46.879874+07	2026-08-06 21:53:46.879882+07	Phát triển năng lực nghiên cứu	phat-trin-nang-lc-nghien-cu	Phát triển năng lực nghiên cứu				
e4fa8d9b-e223-4846-a1ea-d5e4fc955b22	f	0	2026-08-06 22:12:37.337007+07	2026-08-06 22:12:37.337017+07	Tâm lý học	tam-ly-hc	Tâm lý học				
10560ebc-c885-44b5-a57b-b7f24ba02f07	f	0	2026-08-06 22:12:55.734716+07	2026-08-06 22:12:55.734728+07	Sức khỏe tinh thần	sc-khe-tinh-thn	Sức khỏe tinh thần				
b4dbe7bf-429a-434f-be05-e2e575d3c07d	f	0	2026-08-06 22:13:15.408489+07	2026-08-06 22:13:15.408499+07	Wellbeing	wellbeing	Wellbeing				
74158a94-8b65-4638-bea3-b059b23e55b1	f	0	2026-08-06 22:13:30.102471+07	2026-08-06 22:13:30.102482+07	Trí tuệ cảm xúc	tri-tu-cm-xuc	Trí tuệ cảm xúc				
a119d58a-f9f1-435e-be79-4ea85baae961	f	0	2026-08-06 22:13:47.596671+07	2026-08-06 22:13:47.59668+07	Hạnh phúc học đường	hnh-phuc-hc-djng	Hạnh phúc học đường				
936739fc-d997-47cd-8892-c84531e4ffd9	f	0	2026-08-06 22:14:46.762353+07	2026-08-06 22:14:46.762366+07	Cảm xúc tại nơi làm việc	cm-xuc-ti-ni-lam-vic	Cảm xúc tại nơi làm việc				
77ad0ee5-ce14-47dc-bbe7-db4e0f491762	f	0	2026-08-06 22:15:04.404035+07	2026-08-06 22:15:04.404044+07	Kiệt sức nghề nghiệp	kit-sc-ngh-nghip	Kiệt sức nghề nghiệp				
cbf7003b-dda4-4a27-aceb-ee38d282d9b6	f	0	2026-08-06 22:15:23.052983+07	2026-08-06 22:15:23.052993+07	Chất lượng cuộc sống	cht-lng-cuc-sng	Chất lượng cuộc sống				
7558be27-1816-4f53-bd5f-8d16ff56b70f	f	0	2026-08-06 22:30:21.357596+07	2026-08-06 22:30:21.357606+07	Dinh dưỡng cộng đồng	dinh-dng-cng-djng	Dinh dưỡng cộng đồng				
8fabf6f2-3263-4732-95c8-75e433c543ec	f	0	2026-08-06 22:30:39.262638+07	2026-08-06 22:30:39.262647+07	Sức khỏe học đường	sc-khe-hc-djng	Sức khỏe học đường				
43cb7461-e81f-4bc5-b47b-1320419d3924	f	0	2026-08-06 22:30:53.321782+07	2026-08-06 22:30:53.321792+07	Y tế công cộng	y-t-cong-cng	Y tế công cộng				
2415d132-80e4-46fb-b804-fa98cf8d617f	f	0	2026-08-06 22:31:08.430559+07	2026-08-06 22:31:08.430567+07	Dinh dưỡng lâm sàng	dinh-dng-lam-sang	Dinh dưỡng lâm sàng				
e3696a0c-6dce-4813-aeb7-763d0c24899d	f	0	2026-08-06 22:31:22.28826+07	2026-08-06 22:31:22.28827+07	Sức khỏe trẻ em	sc-khe-tr-em	Sức khỏe trẻ em				
48b43deb-301a-40c8-a735-e788a4591364	f	0	2026-08-06 22:31:36.425963+07	2026-08-06 22:31:36.425981+07	Sức khỏe phụ nữ	sc-khe-ph-n	Sức khỏe phụ nữ				
d4edd0fe-5be7-4ab8-9427-e13a37e785a8	f	0	2026-08-06 22:31:49.214125+07	2026-08-06 22:31:49.214139+07	Community Health	community-health	Community Health				
9000957d-8eba-4757-8881-9269a11d4517	f	0	2026-08-06 22:32:01.774819+07	2026-08-06 22:32:01.774828+07	School Health	school-health	School Health				
9e6f6a9a-d65d-4b2e-af05-3e1884ffc6b5	f	0	2026-08-06 22:32:12.796546+07	2026-08-06 22:32:12.796556+07	Nutrition	nutrition	Nutrition				
cf7987a0-e2d5-47eb-abb1-f652156b82be	t	0	2026-08-06 22:32:24.907516+07	2026-08-06 22:32:24.907533+07	Đào tạo	djao-to	Đào tạo				
bfa765cd-e586-4d16-abbe-dfe50a1a9b79	f	0	2026-08-06 22:41:10.31034+07	2026-08-06 22:41:10.31035+07	Quản trị y tế	qun-tr-y-t	Quản trị y tế				
432d9bf6-d2ff-4c30-aa41-30238adf3290	f	0	2026-08-06 22:41:24.527492+07	2026-08-06 22:41:24.5275+07	Quản trị bệnh viện	qun-tr-bnh-vin	Quản trị bệnh viện				
1638aa77-ce0e-4a96-8334-0831094df6c5	f	0	2026-08-06 22:41:37.543579+07	2026-08-06 22:41:37.543589+07	Kinh tế y tế	kinh-t-y-t	Kinh tế y tế				
ea374086-771f-4da3-a843-b789a92e1f03	f	0	2026-08-06 22:41:48.591912+07	2026-08-06 22:41:48.591921+07	Đào tạo nhân lực Y – Dược	djao-to-nhan-lc-y-dc	Đào tạo nhân lực Y – Dược				
365443de-d4b5-4f38-833c-7e2dd21080b2	f	0	2026-08-06 22:42:01.879467+07	2026-08-06 22:42:01.879476+07	Phát triển chương trình đào tạo	phat-trin-chng-trinh-djao-to	Phát triển chương trình đào tạo				
b41aba38-290f-4a46-b4dc-8f9cf0fe5fa6	f	0	2026-08-06 22:42:14.12935+07	2026-08-06 22:42:14.129368+07	Quản trị tổ chức học tập	qun-tr-t-chc-hc-tp	Quản trị tổ chức học tập				
bd331573-097a-4b50-8ae8-a25c603ff6e9	f	0	2026-08-06 22:42:25.743167+07	2026-08-06 22:42:25.743181+07	Phân tích hiệu quả dịch vụ y tế	phan-tich-hiu-qu-dch-v-y-t	Phân tích hiệu quả dịch vụ y tế				
cc7d3946-cf34-4068-b73e-147f513ecf2c	f	0	2026-08-06 22:42:37.063727+07	2026-08-06 22:42:37.063739+07	Phát triển hệ thống y tế bền vững	phat-trin-h-thng-y-t-bn-vng	Phát triển hệ thống y tế bền vững				
15b186f4-f352-4a3f-a283-9fce2e2fa1ec	f	0	2026-08-08 23:17:27.204567+07	2026-08-08 23:17:27.204579+07	Xã hội học ứng dụng	xa-hi-hc-ng-dng	Xã hội học ứng dụng				
b7a0ffad-d8c5-4c32-9290-8a0a5d48167c	f	0	2026-08-08 23:17:43.637009+07	2026-08-08 23:17:43.63702+07	Chính sách Y tế cộng đồng	chinh-sach-y-t-cng-djng	Chính sách Y tế cộng đồng				
4fc1292d-e705-4c72-ae62-a494fc41f39a	f	0	2026-08-08 23:17:58.11469+07	2026-08-08 23:17:58.114706+07	HIV/AIDS	hivaids	HIV/AIDS				
4bcc1e36-6ff7-4371-be2d-22c857bdfef2	f	0	2026-08-08 23:18:10.304292+07	2026-08-08 23:18:10.304302+07	Đánh giá tác động xã hội	djanh-gia-tac-djng-xa-hi	Đánh giá tác động xã hội				
acb98897-86a4-4c16-b4f0-b462a544f580	f	0	2026-08-08 23:18:24.486449+07	2026-08-08 23:18:24.486459+07	Nghiên cứu cộng đồng	nghien-cu-cng-djng	Nghiên cứu cộng đồng				
f47826c2-8648-4bdc-9fb0-8cd23f42f9a8	f	0	2026-08-08 23:18:38.809644+07	2026-08-08 23:18:38.809654+07	Hành vi sức khỏe	hanh-vi-sc-khe	Hành vi sức khỏe				
e1af6052-53d3-460e-95e0-593ba9f3c7a8	f	0	2026-08-08 23:18:52.59089+07	2026-08-08 23:18:52.5909+07	Public Health	public-health	Public Health				
5f837ab7-48ed-4c32-8794-edb96d2cf282	f	0	2026-08-08 23:19:05.782359+07	2026-08-08 23:19:05.782369+07	Social Development	social-development	Social Development				
98873274-3e71-480f-a413-c1d9f67c9ef3	f	0	2026-08-08 23:46:20.430955+07	2026-08-08 23:46:20.430964+07	Phát triển năng lực lãnh đạo	phat-trin-nang-lc-lanh-djo	Phát triển năng lực lãnh đạo				
25bfa583-2e3a-4a2c-a464-8774ec7167d4	t	0	2026-08-08 23:46:35.860424+07	2026-08-08 23:46:35.86044+07	Giao tiếp trong tổ chức	giao-tip-trong-t-chc	Giao tiếp trong tổ chức				
193516b7-6f76-41ba-bffa-0e3ebf356cd7	t	0	2026-08-08 23:46:53.286136+07	2026-08-08 23:46:53.286145+07	Thuyết trình và nói trước công chúng	thuyt-trinh-va-noi-trc-cong-chung	Thuyết trình và nói trước công chúng				
f220350d-d53a-4fe3-bd24-67eb197de678	f	0	2026-08-08 23:47:14.007897+07	2026-08-08 23:47:14.007906+07	Quản lý con người	qun-ly-con-ngi	Quản lý con người				
e5a9b7ec-e08e-4d14-9d69-1ae41c69b031	f	0	2026-08-08 23:47:27.315791+07	2026-08-08 23:47:27.31581+07	Quản trị cảm xúc	qun-tr-cm-xuc	Quản trị cảm xúc				
0c5d1c94-ad83-4b8e-8fac-e0ca0fd2f662	f	0	2026-08-08 23:47:56.466835+07	2026-08-08 23:47:56.466846+07	Hiệu suất làm việc	hiu-sut-lam-vic	Hiệu suất làm việc				
0f911e91-9682-443b-9e4b-11f8f41e0b1b	f	0	2026-08-08 23:48:14.375189+07	2026-08-08 23:48:14.375205+07	Truyền thông tổ chức	truyn-thong-t-chc	Truyền thông tổ chức				
ac34aaa4-2a67-4009-a50d-690242a3a5fc	f	0	2026-08-08 23:48:27.768278+07	2026-08-08 23:48:27.76829+07	Coaching	coaching	Coaching				
93c03593-0266-405a-96a2-ede734026a44	f	0	2026-08-09 00:12:17.207148+07	2026-08-09 00:12:17.207158+07	Tâm lý học ứng dụng	tam-ly-hc-ng-dng	Tâm lý học ứng dụng				
5b7bde81-7a17-4d55-9e21-0970ead66bfa	f	0	2026-08-09 00:12:34.975242+07	2026-08-09 00:12:34.975251+07	Tâm lý học trường học	tam-ly-hc-trng-hc	Tâm lý học trường học				
e254cd71-1694-4b7a-8fa4-ca41471fbabd	f	0	2026-08-09 00:12:46.377374+07	2026-08-09 00:12:46.377382+07	Kỹ năng mềm	k-nang-mm	Kỹ năng mềm				
1494abde-8f59-4879-821f-bad8e8dbc2fb	t	0	2026-08-09 00:13:00.597816+07	2026-08-09 00:13:00.597825+07	SEL	sel	SEL				
263f7067-6044-4fa6-95c7-9ec6a7f627d9	f	0	2026-08-09 00:13:34.945999+07	2026-08-09 00:13:34.946017+07	School Counseling	school-counseling	School Counseling				
bb801df2-6e64-448e-8b00-98f47e38ae64	f	0	2026-08-09 00:13:52.70308+07	2026-08-09 00:13:52.703089+07	Leadership	leadership	Leadership				
d4e020fd-a86f-4cc1-84fb-4585bcd5d655	f	0	2026-08-09 00:14:06.74705+07	2026-08-09 00:14:06.747068+07	Giáo dục kỹ năng sống	giao-dc-k-nang-sng	Giáo dục kỹ năng sống				
5155add1-431a-4895-8fb2-b9dcea956e31	f	0	2026-08-09 15:35:04.975786+07	2026-08-09 15:35:04.9758+07	Xử lý ngôn ngữ tự nhiên (NLP)	x-ly-ngon-ng-t-nhien-nlp	Xử lý ngôn ngữ tự nhiên (NLP)				
5d308d0d-5cf1-4bf2-a0a1-329e6b005f75	f	0	2026-08-09 15:35:46.08236+07	2026-08-09 15:35:46.082373+07	Đào tạo AI	djao-to-ai	Đào tạo AI				
471244e8-5264-48ef-a982-729ef1092705	f	0	2026-08-09 15:43:54.460669+07	2026-08-09 15:43:54.460684+07	Giáo dục gia đình	giao-dc-gia-djinh	Giáo dục gia đình				
a56965df-5cfd-48f3-8362-7b5b81de0df5	f	0	2026-08-09 15:44:26.411694+07	2026-08-09 15:44:26.411716+07	Kỹ năng sống	k-nang-sng	Kỹ năng sống				
f7a8b534-cb7b-4b54-9bfa-e3ed1e5060a6	f	0	2026-08-09 15:44:41.272109+07	2026-08-09 15:44:41.272123+07	Thai giáo	thai-giao	Thai giáo				
4db97b13-01b3-4326-a681-de25bfa98ba7	f	0	2026-08-09 15:44:57.626324+07	2026-08-09 15:44:57.626337+07	Parenting Education	parenting-education	Parenting Education				
a269ddd8-4b1f-4199-a40b-eeb9472b1dc6	f	0	2026-08-09 15:45:23.030281+07	2026-08-09 15:45:23.030292+07	Tâm lý học đường	tam-ly-hc-djng	Tâm lý học đường				
7851fd91-efb9-4789-a143-ffc79b74c5b2	f	0	2026-08-09 15:45:37.350952+07	2026-08-09 15:45:37.350965+07	Giáo dục cảm xúc – xã hội	giao-dc-cm-xuc-xa-hi	Giáo dục cảm xúc – xã hội				
92181c93-d161-4af8-aa3e-e2d8709fe4bd	t	0	2026-08-09 15:45:50.581803+07	2026-08-09 15:45:50.581815+07	Tham vấn tâm lý	tham-vn-tam-ly	Tham vấn tâm lý				
2144f359-b48c-419d-b140-21a36f92ade6	f	0	2026-08-09 16:01:31.372167+07	2026-08-09 16:01:31.372179+07	Xã hội học đô thị	xa-hi-hc-djo-th	Xã hội học đô thị				
0ce4cc26-0fa6-46dd-83c6-f007a5411d18	f	0	2026-08-09 16:01:49.460218+07	2026-08-09 16:01:49.46023+07	Quản trị đô thị	qun-tr-djo-th	Quản trị đô thị				
be710963-6fb9-46e4-ad7d-b6acfd3680c5	f	0	2026-08-09 16:02:06.698506+07	2026-08-09 16:02:06.698519+07	Phát triển cộng đồng	phat-trin-cng-djng	Phát triển cộng đồng				
03c7320b-7bba-4895-a439-bf0282fa4b09	f	0	2026-08-09 16:02:18.891286+07	2026-08-09 16:02:18.8913+07	Chính quyền địa phương	chinh-quyn-dja-phng	Chính quyền địa phương				
f2f76abf-5d25-4f9d-91d0-3c7c958f08bd	f	0	2026-08-09 16:02:30.318563+07	2026-08-09 16:02:30.318582+07	Biến đổi khí hậu dựa vào cộng đồng	bin-dji-khi-hu-da-vao-cng-djng	Biến đổi khí hậu dựa vào cộng đồng				
7976e42f-4cc2-481d-a2a0-c4258e37779b	t	0	2026-08-09 16:02:45.282707+07	2026-08-09 16:02:45.28272+07	Bảo vệ trẻ em	bo-v-tr-em	Bảo vệ trẻ em				
8a57f289-91f9-4abb-9a90-bc6af674ad8e	f	0	2026-08-09 16:03:00.971896+07	2026-08-09 16:03:00.971918+07	Đánh giá tác động chính sách	djanh-gia-tac-djng-chinh-sach	Đánh giá tác động chính sách				
4ff29a48-fa6d-490f-943d-2c6dde786af7	f	0	2026-08-09 16:09:36.139127+07	2026-08-09 16:09:36.139139+07	Kinh tế tuần hoàn	kinh-t-tun-hoan	Kinh tế tuần hoàn				
fb0ddb1c-eebd-4512-9d5a-078021de499d	f	0	2026-08-09 16:09:50.862969+07	2026-08-09 16:09:50.862983+07	GHG	ghg	GHG				
faf62711-1224-473f-87f4-d7478c1e8d05	f	0	2026-08-09 16:10:01.13134+07	2026-08-09 16:10:01.131352+07	CBAM	cbam	CBAM				
a5f50d08-8c13-459b-a064-75bfbcaae831	f	0	2026-08-09 16:10:17.79344+07	2026-08-09 16:10:17.793452+07	ESG	esg	ESG				
d87d43fb-8ace-48bf-be62-e762344bf2be	f	0	2026-08-09 16:10:33.035685+07	2026-08-09 16:10:33.035698+07	Carbon Market	carbon-market	Carbon Market				
25074aa6-8222-4311-9b5f-ab351ec250b6	f	0	2026-08-09 16:10:57.515806+07	2026-08-09 16:10:57.515819+07	Vật liệu sinh học	vt-liu-sinh-hc	Vật liệu sinh học				
10ab82e1-ac1e-4d3a-a87f-1d9319741a54	f	0	2026-08-09 16:11:09.197263+07	2026-08-09 16:11:09.197276+07	Công nghệ môi trường	cong-ngh-moi-trng	Công nghệ môi trường				
ba7b8678-61e6-4712-969c-9cc1f8432d1e	f	0	2026-08-09 16:11:22.537198+07	2026-08-09 16:11:22.537211+07	Green Innovation	green-innovation	Green Innovation				
5468c8c5-55f1-41ca-86cd-9b373d8247d4	f	0	2026-08-09 16:11:34.25431+07	2026-08-09 16:11:34.254324+07	Sustainability	sustainability	Sustainability				
6beea87c-3293-4ba5-aba4-366163827745	f	0	2026-08-09 16:11:47.702526+07	2026-08-09 16:11:47.702538+07	Chuyển giao công nghệ	chuyn-giao-cong-ngh	Chuyển giao công nghệ				
11e5fe84-a109-4509-bdd5-7dfea6ffe874	f	0	2026-08-09 16:18:57.567387+07	2026-08-09 16:18:57.567399+07	Giao tiếp liên văn hóa	giao-tip-lien-van-hoa	Giao tiếp liên văn hóa				
0549154a-29f1-4bbf-bdd5-e4f2638e073a	f	0	2026-08-09 16:19:11.399171+07	2026-08-09 16:19:11.399183+07	Năng lực thích ứng văn hóa	nang-lc-thich-ng-van-hoa	Năng lực thích ứng văn hóa				
2cdf1876-d580-4ff5-b23c-83172ded3c84	f	0	2026-08-09 16:19:26.260236+07	2026-08-09 16:19:26.260248+07	Giao tiếp quốc tế	giao-tip-quc-t	Giao tiếp quốc tế				
fb2e06ed-fcdf-4010-89ee-4bd96d26ba8a	f	0	2026-08-09 16:19:38.90795+07	2026-08-09 16:19:38.907963+07	Đa dạng văn hóa	dja-dng-van-hoa	Đa dạng văn hóa				
6d2767b2-c771-4689-9fa5-6bf8506705bd	f	0	2026-08-09 16:19:52.092656+07	2026-08-09 16:19:52.092669+07	Thấu cảm liên văn hóa	thu-cm-lien-van-hoa	Thấu cảm liên văn hóa				
62b7228c-393f-47cd-84b0-9eb69a2f12a4	f	0	2026-08-09 16:20:04.632506+07	2026-08-09 16:20:04.632526+07	Quan hệ trong tổ chức	quan-h-trong-t-chc	Quan hệ trong tổ chức				
204bcdbf-f24b-4905-916d-ff6d2b9820ef	f	0	2026-08-09 16:20:16.145239+07	2026-08-09 16:20:16.145268+07	Hợp tác đa văn hóa	hp-tac-dja-van-hoa	Hợp tác đa văn hóa				
511fd457-0ba5-4b1b-8392-1aa65c0090ae	f	0	2026-08-09 16:20:30.18971+07	2026-08-09 16:20:30.189722+07	Thuyết trình tương tác	thuyt-trinh-tng-tac	Thuyết trình tương tác				
f45e7705-a90d-4da7-a4a6-f55dafa703ea	f	0	2026-08-09 16:27:21.799047+07	2026-08-09 16:27:21.79906+07	Xã hội học số	xa-hi-hc-s	Xã hội học số				
32e3d1cd-205f-47ed-875c-8def3452ac67	f	0	2026-08-09 16:27:34.659447+07	2026-08-09 16:27:34.659459+07	Chuyển đổi số xã hội	chuyn-dji-s-xa-hi	Chuyển đổi số xã hội				
1eaf36b5-8098-490e-91ab-1460457ab1d0	f	0	2026-08-09 16:27:46.984068+07	2026-08-09 16:27:46.984094+07	Quản trị công	qun-tr-cong	Quản trị công				
3dd45923-49bc-4e09-9406-c00bde675a2c	f	0	2026-08-09 16:27:58.006216+07	2026-08-09 16:27:58.006228+07	Dịch vụ công trực tuyến	dch-v-cong-trc-tuyn	Dịch vụ công trực tuyến				
65146668-1df7-482a-aa21-1f14c5b8c9f3	f	0	2026-08-09 16:33:22.931863+07	2026-08-09 16:33:22.931882+07	Răng Hàm Mặt	rang-ham-mt	Răng Hàm Mặt				
3dcd408a-e6b2-4093-9c07-d4a2a7cf8577	f	0	2026-08-09 16:33:35.144051+07	2026-08-09 16:33:35.144064+07	Giáo dục Y khoa	giao-dc-y-khoa	Giáo dục Y khoa				
ac5bc09b-b06a-4c34-83cc-2ae001cdc752	f	0	2026-08-09 16:33:48.743692+07	2026-08-09 16:33:48.743704+07	Oral Medicine	oral-medicine	Oral Medicine				
885fd976-ebf7-4165-a4d8-33b8dcdd871e	f	0	2026-08-09 16:34:00.95049+07	2026-08-09 16:34:00.950518+07	Healthcare Education	healthcare-education	Healthcare Education				
030b1d35-6bd6-438e-9c99-86dd91a01b48	f	0	2026-08-09 16:34:13.553985+07	2026-08-09 16:34:13.553997+07	Professional Development	professional-development	Professional Development				
469d77c5-3ec2-46ef-b7cc-f5defbf80851	f	0	2026-08-09 16:34:25.806752+07	2026-08-09 16:34:25.806766+07	Medical Collaboration	medical-collaboration	Medical Collaboration				
d2ef8d85-b62a-4e57-b01f-fb68bc3a1500	f	0	2026-08-09 16:34:38.565153+07	2026-08-09 16:34:38.565165+07	Healthcare Leadership	healthcare-leadership	Healthcare Leadership				
ba603109-c9c6-4d4a-9a78-8c0a4c064f1e	f	0	2026-08-09 16:43:25.171293+07	2026-08-09 16:43:25.171312+07	Quản trị doanh nghiệp	qun-tr-doanh-nghip	Quản trị doanh nghiệp				
24c51332-105e-4a5f-9938-9ad9e6381b02	f	0	2026-08-09 16:43:39.076829+07	2026-08-09 16:43:39.076842+07	Chiến lược kinh doanh	chin-lc-kinh-doanh	Chiến lược kinh doanh				
90a48300-ab9e-46e5-a30f-7fa11877e905	f	0	2026-08-09 16:44:06.074252+07	2026-08-09 16:44:06.074265+07	Hệ thống y tế	h-thng-y-t	Hệ thống y tế				
c8a7eb61-b116-4520-bd6b-79be1527006b	f	0	2026-08-09 16:44:18.4379+07	2026-08-09 16:44:18.437913+07	Quản trị thay đổi	qun-tr-thay-dji	Quản trị thay đổi				
cc34ed10-d089-4277-98dd-83da090e668b	f	0	2026-08-09 16:44:39.061224+07	2026-08-09 16:44:39.06125+07	Quản trị nhân sự	qun-tr-nhan-s	Quản trị nhân sự				
16460166-33ad-4578-a81d-4bc0f9070b76	f	0	2026-08-09 16:44:51.713822+07	2026-08-09 16:44:51.713842+07	Tăng trưởng doanh nghiệp	tang-trng-doanh-nghip	Tăng trưởng doanh nghiệp				
0db45da2-e1eb-430a-9723-3613884caa59	f	0	2026-08-09 20:24:07.492577+07	2026-08-09 20:24:07.492593+07	Công nghệ thông tin y tế	cong-ngh-thong-tin-y-t	Công nghệ thông tin y tế				
3ced7fe5-5778-4609-ae86-e7309d89c22b	f	0	2026-08-09 20:24:20.326524+07	2026-08-09 20:24:20.326543+07	Chuyển đổi số bệnh viện	chuyn-dji-s-bnh-vin	Chuyển đổi số bệnh viện				
3fb0bc8e-3279-4178-8264-99e9f448f0c6	f	0	2026-08-09 20:24:31.201207+07	2026-08-09 20:24:31.201216+07	Quản trị dữ liệu y tế	qun-tr-d-liu-y-t	Quản trị dữ liệu y tế				
3c3aaa40-9337-4ae9-93a1-fae3ca3a0629	f	0	2026-08-09 20:24:43.549696+07	2026-08-09 20:24:43.549705+07	Hệ thống thông tin bệnh viện	h-thng-thong-tin-bnh-vin	Hệ thống thông tin bệnh viện				
b53a4cd4-14e5-4569-8aa7-78d73f9a48eb	f	0	2026-08-09 20:24:54.051823+07	2026-08-09 20:24:54.051833+07	Hỗ trợ ra quyết định lâm sàng	h-tr-ra-quyt-djnh-lam-sang	Hỗ trợ ra quyết định lâm sàng				
81ff75df-d125-416d-b101-5c93cad4705b	f	0	2026-08-09 20:25:05.239231+07	2026-08-09 20:25:05.239242+07	Trung tâm dữ liệu	trung-tam-d-liu	Trung tâm dữ liệu				
fc9b0ed2-2303-4b65-86a4-1229d364abe7	f	0	2026-08-09 20:25:16.301796+07	2026-08-09 20:25:16.301809+07	Y tin học	y-tin-hc	Y tin học				
eb95f406-d6d4-4fe7-a4a4-4842743487cb	f	0	2026-08-09 20:25:28.864649+07	2026-08-09 20:25:28.864658+07	SNOMED CT	snomed-ct	SNOMED CT				
16c03e2f-5966-4431-857b-90b1b9389b96	f	0	2026-08-09 20:25:39.45257+07	2026-08-09 20:25:39.452579+07	Tư vấn chiến lược	t-vn-chin-lc	Tư vấn chiến lược				
640ea237-8629-4786-ab2e-25790295b4f1	f	0	2026-08-09 20:25:50.488562+07	2026-08-09 20:25:50.488572+07	Đào tạo & tập huấn	djao-to-tp-hun	Đào tạo & tập huấn				
56ffbe1f-789a-439f-acce-3b39f1b59e64	f	0	2026-08-09 20:26:02.970006+07	2026-08-09 20:26:02.970021+07	Đồng thiết kế giải pháp	djng-thit-k-gii-phap	Đồng thiết kế giải pháp				
19167bf9-c0f8-4ec4-a84e-7589b0990d84	f	0	2026-08-09 20:33:14.968311+07	2026-08-09 20:33:14.968329+07	Digital Transformation	digital-transformation	Digital Transformation				
07a8e4e3-a684-43ad-aa02-493fc120c207	f	0	2026-08-09 20:33:26.40135+07	2026-08-09 20:33:26.401359+07	Smart Governance	smart-governance	Smart Governance				
2bf211b3-f9f1-462b-b91c-04eb2c00fd8d	f	0	2026-08-09 20:33:35.417332+07	2026-08-09 20:33:35.41734+07	System Development	system-development	System Development				
b507e92a-afe6-495b-b1ef-04e289b0ecc7	f	0	2026-08-09 20:33:46.927897+07	2026-08-09 20:33:46.927909+07	Digital Platform	digital-platform	Digital Platform				
9d9d7ee4-6d9b-4647-8786-bee0edf9921d	f	0	2026-08-09 20:33:57.180083+07	2026-08-09 20:33:57.180093+07	Data Management	data-management	Data Management				
4c67e15e-f448-4a5b-b806-a074b3bc6dcb	f	0	2026-08-09 20:34:10.035885+07	2026-08-09 20:34:10.035894+07	Digital Operations	digital-operations	Digital Operations				
a2ed8cdc-25a4-46f9-89f5-028823769f83	f	0	2026-08-09 20:34:20.431277+07	2026-08-09 20:34:20.431287+07	Technology Solutions	technology-solutions	Technology Solutions				
c6cdabf0-8a3e-4d77-8f6e-df1afb878cb4	f	0	2026-08-09 20:40:31.0406+07	2026-08-09 20:40:31.040607+07	AI tạo sinh	ai-to-sinh	AI tạo sinh				
30a4c55e-b2bb-446e-8225-433d49abb0a6	f	0	2026-08-09 20:40:40.480257+07	2026-08-09 20:40:40.480269+07	Mô hình ngôn ngữ lớn	mo-hinh-ngon-ng-ln	Mô hình ngôn ngữ lớn				
9ddd126c-f094-430a-b1de-b5a8e169ed40	f	0	2026-08-09 20:40:51.875018+07	2026-08-09 20:40:51.875036+07	Kỹ thuật xây dựng prompt	k-thut-xay-dng-prompt	Kỹ thuật xây dựng prompt				
babf9b06-b0f5-4e77-86c0-eeb31039c7cf	f	0	2026-08-09 20:41:03.000187+07	2026-08-09 20:41:03.000197+07	Năng lực tư duy cùng AI	nang-lc-t-duy-cung-ai	Năng lực tư duy cùng AI				
790b5c62-0a06-49fa-8db1-52176be72619	f	0	2026-08-09 20:41:14.750876+07	2026-08-09 20:41:14.750886+07	AI trong giáo dục	ai-trong-giao-dc	AI trong giáo dục				
784fbe9d-dfc5-4c05-9aa1-f648726e8eec	f	0	2026-08-09 20:41:26.27275+07	2026-08-09 20:41:26.272766+07	AI trong doanh nghiệp	ai-trong-doanh-nghip	AI trong doanh nghiệp				
e51ecf59-154a-4a72-8d20-17bef3864db8	f	0	2026-08-09 20:41:37.36724+07	2026-08-09 20:41:37.367254+07	Thiết kế học tập	thit-k-hc-tp	Thiết kế học tập				
39ec3d44-27e6-40e5-80a7-0e4c499efef5	f	0	2026-08-09 20:41:47.258268+07	2026-08-09 20:41:47.258277+07	Phát triển năng lực số	phat-trin-nang-lc-s	Phát triển năng lực số				
7429ee8a-9b79-4a55-8f17-50dede8cbe4a	f	0	2026-08-09 20:47:10.177254+07	2026-08-09 20:47:10.177264+07	Fintech	fintech	Fintech				
364707e1-750d-45ae-94a7-fa4e7e100609	f	0	2026-08-09 20:47:24.375168+07	2026-08-09 20:47:24.375182+07	Chuyển đổi số	chuyn-dji-s	Chuyển đổi số				
9a2899d7-19ac-4a15-99ca-352a5fde48cf	f	0	2026-08-09 20:47:37.764596+07	2026-08-09 20:47:37.764607+07	Đổi mới sáng tạo	dji-mi-sang-to	Đổi mới sáng tạo				
a7d3b119-a47f-4c86-966d-352ee6118763	f	0	2026-08-09 20:47:50.423061+07	2026-08-09 20:47:50.423078+07	Khởi nghiệp đổi mới sáng tạo	khi-nghip-dji-mi-sang-to	Khởi nghiệp đổi mới sáng tạo				
ea82535d-473e-4bf1-a1b6-003b9471fcab	f	0	2026-08-09 20:48:06.001505+07	2026-08-09 20:48:06.001515+07	Thiết kế mô hình kinh doanh	thit-k-mo-hinh-kinh-doanh	Thiết kế mô hình kinh doanh				
200bfb41-effb-4580-b8a5-5f63bd6dc30b	f	0	2026-08-09 21:00:16.140356+07	2026-08-09 21:00:16.140366+07	Tâm lý giáo dục	tam-ly-giao-dc	Tâm lý giáo dục				
abeaba43-04fa-4aaa-8b27-593919254546	f	0	2026-08-09 21:00:36.387969+07	2026-08-09 21:00:36.387978+07	Hướng nghiệp	hng-nghip	Hướng nghiệp				
3aa3313e-040e-4600-abc8-113e413acd27	f	0	2026-08-09 21:00:44.256451+07	2026-08-09 21:00:44.256466+07	Kỹ năng cảm xúc – xã hội	k-nang-cm-xuc-xa-hi	Kỹ năng cảm xúc – xã hội				
546d4d08-4755-4779-be11-8080e0be557f	f	0	2026-08-09 21:00:56.088338+07	2026-08-09 21:00:56.088347+07	Phát triển bản thân	phat-trin-bn-than	Phát triển bản thân				
145c59ae-059e-48c3-bcd3-67e304ba6b7d	f	0	2026-08-09 21:01:05.224115+07	2026-08-09 21:01:05.224133+07	Giáo dục khai phóng	giao-dc-khai-phong	Giáo dục khai phóng				
1d3d6e49-b2f1-4d82-9433-e97d69324db7	f	0	2026-08-09 21:01:22.139398+07	2026-08-09 21:01:22.139407+07	Phát triển năng lực	phat-trin-nang-lc	Phát triển năng lực				
4d8c6fe6-a280-4861-86a1-6f6e2b045e90	f	0	2026-08-09 21:01:34.160919+07	2026-08-09 21:01:34.160938+07	Thiết kế chương trình học tập	thit-k-chng-trinh-hc-tp	Thiết kế chương trình học tập				
dd8d69c2-9e51-4151-bdc7-c254d47f4f6c	f	0	2026-08-09 21:25:28.807898+07	2026-08-09 21:25:28.807907+07	Sức khỏe tâm thần	sc-khe-tam-thn	Sức khỏe tâm thần				
695df05b-97e7-478a-a488-7e092df89c14	f	0	2026-08-09 21:25:52.581926+07	2026-08-09 21:25:52.581941+07	Giáo dục cảm xúc – xã hội (SEL)	giao-dc-cm-xuc-xa-hi-sel	Giáo dục cảm xúc – xã hội (SEL)				
60672869-0497-45c3-b214-4c9751ffad36	f	0	2026-08-09 21:26:06.122301+07	2026-08-09 21:26:06.122316+07	Tâm lý tổ chức	tam-ly-t-chc	Tâm lý tổ chức				
7f013dfb-b494-42ac-ab4e-5021620ad0c6	f	0	2026-08-09 21:26:36.341123+07	2026-08-09 21:26:36.341139+07	Phát triển nguồn nhân lực	phat-trin-ngun-nhan-lc	Phát triển nguồn nhân lực				
87ad2c6d-2904-4bb0-9ba6-962939f97f44	f	0	2026-08-09 21:26:46.635098+07	2026-08-09 21:26:46.635107+07	Quản lý stress	qun-ly-stress	Quản lý stress				
d969d581-da40-48d7-a534-b7c15c849e9e	f	0	2026-08-09 21:32:34.70002+07	2026-08-09 21:32:34.700036+07	Chính sách xã hội	chinh-sach-xa-hi	Chính sách xã hội				
fc7725e3-4093-441f-b970-d6ae63fdce01	f	0	2026-08-09 21:32:52.475193+07	2026-08-09 21:32:52.475209+07	Lao động nhập cư	lao-djng-nhp-c	Lao động nhập cư				
6da85c8b-88b4-49a6-9b4e-5af18fb5c4e6	f	0	2026-08-09 21:33:18.797389+07	2026-08-09 21:33:18.797399+07	Phát triển bền vững	phat-trin-bn-vng	Phát triển bền vững				
43deb429-41de-4ab2-b3bf-89de77209e8c	f	0	2026-08-09 21:33:36.507507+07	2026-08-09 21:33:36.507523+07	Văn hóa xã hội	van-hoa-xa-hi	Văn hóa xã hội				
512ce0d9-015b-4ad3-ba4a-137885b0afa6	f	0	2026-08-09 21:39:24.111817+07	2026-08-09 21:39:24.111825+07	Truyền thông	truyn-thong	Truyền thông				
34f81210-db82-461f-a6bc-fcae55ae8347	f	0	2026-08-09 21:39:33.175008+07	2026-08-09 21:39:33.175021+07	Marketing	marketing	Marketing				
7d0812a1-4245-41aa-97fa-d4d210e31749	f	0	2026-08-09 21:39:42.825961+07	2026-08-09 21:39:42.825969+07	Phát triển con người	phat-trin-con-ngi	Phát triển con người				
cf2029a3-77b5-4d88-a53c-6566b2e43b4c	f	0	2026-08-09 21:39:56.007647+07	2026-08-09 21:39:56.007661+07	Kỹ năng lãnh đạo	k-nang-lanh-djo	Kỹ năng lãnh đạo				
226be80c-bf3a-4363-81cd-4f1258edb198	f	0	2026-08-09 21:40:09.485705+07	2026-08-09 21:40:09.485722+07	Kỹ năng giao tiếp	k-nang-giao-tip	Kỹ năng giao tiếp				
2dea6d8b-5f99-40cb-8694-3b536598ac92	f	0	2026-08-09 21:40:23.217173+07	2026-08-09 21:40:23.217183+07	Thuyết trình	thuyt-trinh	Thuyết trình				
e375a577-aae1-4b5c-8b2d-ac10544f7c5a	f	0	2026-08-09 21:49:32.841218+07	2026-08-09 21:49:32.841227+07	Giá trị sống	gia-tr-sng	Giá trị sống				
6e4ec282-c897-46c1-83a6-3752906c8ed2	f	0	2026-08-09 21:50:06.966412+07	2026-08-09 21:50:06.966422+07	Quản trị bản thân	qun-tr-bn-than	Quản trị bản thân				
68ac1ef5-748f-4b7b-b8f3-0220b80a446d	f	0	2026-08-09 21:56:27.755471+07	2026-08-09 21:56:27.755482+07	Phát triển tổ chức	phat-trin-t-chc	Phát triển tổ chức				
54d59619-7ea4-442e-acdc-d7bf889db197	f	0	2026-08-09 21:56:40.545647+07	2026-08-09 21:56:40.545663+07	Trí tuệ cảm xúc (EQ)	tri-tu-cm-xuc-eq	Trí tuệ cảm xúc (EQ)				
ffd27b46-d313-49b3-ae8c-1e3f82f9542f	f	0	2026-08-09 21:56:50.872429+07	2026-08-09 21:56:50.872437+07	Lãnh đạo khai phóng	lanh-djo-khai-phong	Lãnh đạo khai phóng				
0367d5d7-cbc0-41d7-9c59-79585f913713	f	0	2026-08-09 21:57:00.94249+07	2026-08-09 21:57:00.942502+07	Lãnh đạo thấu cảm	lanh-djo-thu-cm	Lãnh đạo thấu cảm				
28838538-aa47-465f-ba5f-9a5a3cd37eb5	f	0	2026-08-09 21:57:10.860318+07	2026-08-09 21:57:10.860336+07	Phát triển đội ngũ	phat-trin-dji-ng	Phát triển đội ngũ				
2ae0b982-4711-4907-b730-11af1c5c3442	f	0	2026-08-09 21:57:23.805037+07	2026-08-09 21:57:23.805046+07	Năng lực lãnh đạo	nang-lc-lanh-djo	Năng lực lãnh đạo				
bf084cb0-3784-49e2-bb79-1204f517e307	f	0	2026-08-09 22:05:50.537211+07	2026-08-09 22:05:50.53722+07	Quản trị nhân sự chiến lược	qun-tr-nhan-s-chin-lc	Quản trị nhân sự chiến lược				
face5f20-0b59-44af-bf12-2e38a3c19be3	f	0	2026-08-09 22:06:29.617997+07	2026-08-09 22:06:29.618005+07	Trách nhiệm xã hội doanh nghiệp	trach-nhim-xa-hi-doanh-nghip	Trách nhiệm xã hội doanh nghiệp				
ffab6ca2-b33c-46ec-a2bb-a1e891bbeb2e	f	0	2026-08-09 22:06:40.417548+07	2026-08-09 22:06:40.417558+07	Sản xuất bền vững	sn-xut-bn-vng	Sản xuất bền vững				
35bab76b-ec3b-4d07-ac43-690a6877837b	f	0	2026-08-09 22:06:51.376756+07	2026-08-09 22:06:51.376772+07	Quan hệ lao động	quan-h-lao-djng	Quan hệ lao động				
0f42e3d1-dd0b-423e-8b0c-5fb34c52199f	f	0	2026-08-09 22:07:02.103269+07	2026-08-09 22:07:02.103279+07	Chuỗi cung ứng có trách nhiệm	chui-cung-ng-co-trach-nhim	Chuỗi cung ứng có trách nhiệm				
21c8a90a-8f4a-4d1c-a625-27053fe234e1	f	0	2026-08-09 22:12:17.035612+07	2026-08-09 22:12:17.035629+07	Quản lý doanh nghiệp	qun-ly-doanh-nghip	Quản lý doanh nghiệp				
4c47f16e-54d0-4fc4-8daa-41f422249d1f	f	0	2026-08-09 22:12:26.59478+07	2026-08-09 22:12:26.594789+07	Quản trị điều hành	qun-tr-djiu-hanh	Quản trị điều hành				
0b907f34-5577-4226-86ae-08c9a3de704c	f	0	2026-08-09 22:12:37.902308+07	2026-08-09 22:12:37.902318+07	Lãnh đạo doanh nghiệp	lanh-djo-doanh-nghip	Lãnh đạo doanh nghiệp				
a87206a4-f121-4d04-9482-e32c94e0d228	f	0	2026-08-09 22:12:51.883766+07	2026-08-09 22:12:51.883777+07	Quản trị tổ chức	qun-tr-t-chc	Quản trị tổ chức				
75209019-28db-43fb-8af8-3c931d99ccb2	f	0	2026-08-09 22:13:01.805085+07	2026-08-09 22:13:01.8051+07	Doanh nghiệp đa quốc gia	doanh-nghip-dja-quc-gia	Doanh nghiệp đa quốc gia				
fe798f1b-bed2-484a-a86d-e60dbfdbead5	t	0	2026-08-09 22:13:59.363709+07	2026-08-09 22:13:59.363718+07	Doanh nghiệp khởi nghiệp	doanh-nghip-khi-nghip	Doanh nghiệp khởi nghiệp				
d47074e2-20e0-4dfd-b3f0-bfa8374d0cb2	f	0	2026-08-09 22:14:13.390551+07	2026-08-09 22:14:13.390559+07	Phát triển kinh doanh	phat-trin-kinh-doanh	Phát triển kinh doanh				
04f132ec-5cbf-4bee-8aa9-01f41474c723	f	0	2026-08-09 22:20:26.16935+07	2026-08-09 22:20:26.169359+07	AI	ai	AI				
3bbcef97-6036-4c47-8947-a14f01b192f5	f	0	2026-08-09 22:20:35.946579+07	2026-08-09 22:20:35.946588+07	Blockchain	blockchain	Blockchain				
80737dd8-c572-48bd-854d-9322665a61c6	f	0	2026-08-09 22:20:54.073483+07	2026-08-09 22:20:54.073492+07	Công nghệ thông tin	cong-ngh-thong-tin	Công nghệ thông tin				
62bbe225-bf28-454f-bce8-36437563e028	f	0	2026-08-09 22:21:04.10284+07	2026-08-09 22:21:04.102849+07	Hệ thống mạng	h-thng-mng	Hệ thống mạng				
bcdd5165-1a48-4cbc-915f-df623139ea26	f	0	2026-08-09 22:21:13.818861+07	2026-08-09 22:21:13.818871+07	Hạ tầng CNTT	h-tng-cntt	Hạ tầng CNTT				
28493c63-5d45-4971-81f0-49ac10164050	f	0	2026-08-09 22:26:44.050414+07	2026-08-09 22:26:44.050426+07	Quản trị tài chính	qun-tr-tai-chinh	Quản trị tài chính				
50575516-5213-4dd9-a455-546788d6cd27	f	0	2026-08-09 22:27:00.562828+07	2026-08-09 22:27:00.562836+07	Quản trị rủi ro	qun-tr-ri-ro	Quản trị rủi ro				
42b567f9-2d16-4677-84dc-536d9fc97e83	f	0	2026-08-09 22:27:10.504879+07	2026-08-09 22:27:10.504888+07	Kế toán – kiểm toán	k-toan-kim-toan	Kế toán – kiểm toán				
082c1ce5-a8f9-461c-86c8-6b9ead38c73c	f	0	2026-08-09 22:29:23.168661+07	2026-08-09 22:29:23.168671+07	Phát triển năng lực quản lý	phat-trin-nang-lc-qun-ly	Phát triển năng lực quản lý				
8dc2183f-9354-4e5a-818c-532e5559e329	t	0	2026-08-09 22:34:57.985989+07	2026-08-09 22:34:57.985999+07	Đào tạo quản lý	djao-to-qun-ly	Đào tạo quản lý				
c0f12626-e9d0-4b04-ac9d-c79da4bdbcb6	f	0	2026-08-09 22:35:08.109001+07	2026-08-09 22:35:08.109017+07	Văn hóa doanh nghiệp	van-hoa-doanh-nghip	Văn hóa doanh nghiệp				
9caf182a-6033-43cb-9eae-18df6830f468	f	0	2026-08-09 22:35:18.476273+07	2026-08-09 22:35:18.476287+07	Quản trị nhân tài	qun-tr-nhan-tai	Quản trị nhân tài				
7f2618b3-c1f9-48a6-a25d-23d021448572	f	0	2026-08-09 22:35:41.524567+07	2026-08-09 22:35:41.524575+07	Leadership Development	leadership-development	Leadership Development				
be3a9b66-a72a-4f9c-9187-087576e141e6	t	0	2026-08-09 22:42:50.728222+07	2026-08-09 22:42:50.72823+07	Đào tạo lãnh đạo	djao-to-lanh-djo	Đào tạo lãnh đạo				
41c78ac1-77b8-40a2-a72b-c0b36614d1bb	f	0	2026-08-09 22:43:03.72406+07	2026-08-09 22:43:03.724071+07	Employee Experience	employee-experience	Employee Experience				
\.


--
-- TOC entry 6424 (class 0 OID 312633)
-- Dependencies: 300
-- Data for Name: expert_orgnode; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_orgnode (id, is_active, display_order, created_at, updated_at, name, level, style, color, url, info_group_id, parent_id) FROM stdin;
bc97b34a-a718-45b7-ac98-e186f394a43a	t	1	2026-07-29 16:05:09.81645+07	2026-07-29 16:48:47.064305+07	HỘI ĐỒNG QUẢN LÝ	0	filled			7caaa961-8430-4661-bc97-e8a597712671	\N
42f5b392-635b-4e94-800e-1a75791eba1f	t	1	2026-07-29 16:05:09.820973+07	2026-07-29 16:48:47.067168+07	Viện trưởng	1	outlined			7caaa961-8430-4661-bc97-e8a597712671	\N
95663894-1e56-4729-8736-85e0e744a49d	t	1	2026-07-29 16:05:09.822241+07	2026-07-29 16:48:47.068731+07	Phòng Tổ chức – Hành chính	2	default			7caaa961-8430-4661-bc97-e8a597712671	\N
d14cb9af-9341-44ae-b2c1-da2edd7ef52c	t	2	2026-07-29 16:05:09.82338+07	2026-07-29 16:48:47.070343+07	Phòng Truyền thông – Marketing	2	default			7caaa961-8430-4661-bc97-e8a597712671	\N
ae03e5bc-6d99-49f7-b6e1-5a3f72567413	t	3	2026-07-29 16:05:09.824498+07	2026-07-29 16:48:47.071638+07	Phòng Tài chính – Kế toán	2	default			7caaa961-8430-4661-bc97-e8a597712671	\N
4bd3920d-1886-4d08-8cbf-819e000fd50d	t	4	2026-07-29 16:05:09.826353+07	2026-07-29 16:48:47.073157+07	Phòng Công nghệ thông tin	2	default			7caaa961-8430-4661-bc97-e8a597712671	\N
33e22f30-4588-4f4c-88b1-487155fd3de4	t	5	2026-07-29 16:05:09.827768+07	2026-07-29 16:48:47.075047+07	Phòng Đào tạo	2	default			7caaa961-8430-4661-bc97-e8a597712671	\N
c2faf6f8-2701-434b-bd1e-99988baf0e39	t	6	2026-07-29 16:05:09.829384+07	2026-07-29 16:48:47.07702+07	Phòng Khoa học Công nghệ	2	default			7caaa961-8430-4661-bc97-e8a597712671	\N
\.


--
-- TOC entry 6425 (class 0 OID 312651)
-- Dependencies: 301
-- Data for Name: expert_processstep; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_processstep (id, is_active, display_order, created_at, updated_at, step_number, title, description, icon) FROM stdin;
515747bc-7628-4a12-8cf9-835252f34884	t	1	2026-07-28 23:36:07.634211+07	2026-07-28 23:36:07.634218+07	1	Làm rõ bài toán	Xác định vấn đề cốt lõi, nhóm thụ hưởng, bối cảnh vận hành và mục tiêu hợp tác.	document-text
ae13f790-816c-4bff-a3a5-e321ff8da81b	t	2	2026-07-28 23:36:07.634641+07	2026-07-28 23:36:07.634644+07	2	Kết nối chuyên gia phù hợp	Huy động nhà khoa học/chuyên gia theo lĩnh vực, vai trò và kinh nghiệm triển khai.	magnifying-glass
dbf12b34-93a5-4e52-80ec-e27f43d4eece	t	3	2026-07-28 23:36:07.6349+07	2026-07-28 23:36:07.634903+07	3	Đồng thiết kế giải pháp	Kết nối bằng chứng khoa học, hiểu biết thực tiễn và điều kiện triển khai của đối tác.	user-group
1fdb098d-9471-4b7d-bf02-82fd64592f87	t	4	2026-07-28 23:36:07.63514+07	2026-07-28 23:36:07.635143+07	4	Đồng hành triển khai & cải tiến	Hỗ trợ thực hiện, theo dõi, điều chỉnh và chuyển hóa kết quả thành giá trị sử dụng.	chart-bar-square
\.


--
-- TOC entry 6426 (class 0 OID 312667)
-- Dependencies: 302
-- Data for Name: expert_researcharea; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.expert_researcharea (id, is_active, display_order, created_at, updated_at, name, slug, icon, color, card_tags, description, card_cta_label, card_cta_url, card_icon) FROM stdin;
5802b75c-5a77-46f7-8684-f47d383d86e8	t	1	2026-07-29 22:39:48.424368+07	2026-07-29 22:39:48.42438+07	Y tế & Quản trị y tế	y-te-quan-tri-y-te	heart	#be123c		Chuyên môn về hệ thống y tế, quản trị bệnh viện, chất lượng chăm sóc và phát triển dịch vụ.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=y-te-quan-tri-y-te	
5b525573-2282-4e28-99b2-6973ee6a5fb5	t	2	2026-07-29 22:39:48.4272+07	2026-07-29 22:39:48.427206+07	AI, Dữ liệu & Chuyển đổi số	ai-du-lieu-chuyen-doi-so	cpu	#0891b2		Hỗ trợ nhận diện use case, đánh giá dữ liệu, thiết kế dashboard, công cụ số và lộ trình thí điểm.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=ai-du-lieu-chuyen-doi-so	
4620940e-0da6-4724-8a33-0e0d24163b90	t	3	2026-07-29 22:39:48.4283+07	2026-07-29 22:39:48.428304+07	Giáo dục & Phát triển năng lực	giao-duc-phat-trien-nang-luc	academic-cap	#b45309		Thiết kế chương trình học tập, đào tạo, E-Learning, microlearning và phát triển năng lực đội ngũ.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=giao-duc-phat-trien-nang-luc	
e1001ed3-66d1-46ef-81b0-128d1856740d	t	4	2026-07-29 22:39:48.429305+07	2026-07-29 22:39:48.42931+07	Tâm lý & Sức khỏe tâm thần	tam-ly-suc-khoe-tam-than	heart	#7c3aed		Nghiên cứu, thiết kế sáng kiến phòng ngừa, nâng đỡ tâm lý - xã hội và wellbeing.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=tam-ly-suc-khoe-tam-than	
9851d2de-686d-4b59-aacd-29292ca7f013	t	5	2026-07-29 22:39:48.430317+07	2026-07-29 22:39:48.430322+07	Xã hội học & Chính sách công	xa-hoi-hoc-chinh-sach-cong	building-library	#0f766e		Phân tích bối cảnh xã hội, nhóm thụ hưởng, tác động chính sách và các vấn đề phát triển hệ thống.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=xa-hoi-hoc-chinh-sach-cong	
eeb17ba2-3b1a-41c3-8b81-96b765776c67	t	6	2026-07-29 22:39:48.431322+07	2026-07-29 22:39:48.431327+07	Môi trường & Phát triển bền vững	moi-truong-phat-trien-ben-vung	leaf	#15803d		Kết nối môi trường sống, ESG, Green University, Green Hospital và các sáng kiến bền vững.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=moi-truong-phat-trien-ben-vung	
5cb2ba38-6f48-4a25-9983-1a89f5b2fa9c	t	7	2026-07-29 22:39:48.432254+07	2026-07-29 22:39:48.432258+07	Quản trị nhân sự & Tổ chức	quan-tri-nhan-su-to-chuc	briefcase	#7c3aed		Phát triển lãnh đạo, năng lực phối hợp, văn hóa tổ chức và hiệu quả làm việc.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=quan-tri-nhan-su-to-chuc	
e795f2fe-d973-400a-84ae-4567b5cbcfbf	t	8	2026-07-29 22:39:48.433255+07	2026-07-29 22:39:48.433259+07	Quản trị kinh tế & Tác động xã hội	quan-tri-kinh-te-tac-dong-xa-hoi	chart-bar	#1d4ed8		Hỗ trợ phân tích hiệu quả, nguồn lực, mô hình vận hành và giá trị xã hội của sáng kiến.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=quan-tri-kinh-te-tac-dong-xa-hoi	
32ed1fd7-4f41-4fd7-a9a8-26ee188bee20	f	0	2026-07-29 22:04:33.071775+07	2026-07-31 22:41:48.973595+07	Y Tế & Quản Trị Y Tế	y-t-qun-tr-y-t	heart	#1d4ed8		Chuyên môn về hệ thống y tế, quản trị bệnh viện, chất lượng chăm sóc và phát triển dịch vụ.	Tìm chuyên gia liên quan	/chuyen-gia/	
dd234f0e-9c5a-4f46-867d-ff0baf577aa2	f	0	2026-07-31 22:12:20.440286+07	2026-07-31 22:41:48.975611+07	Giáo dục	giao-dc		#1d4ed8	Giáo dục	Giáo dục	Tìm chuyên gia liên quan	/chuyen-gia/	
3fe7dd74-a8c3-4a2d-8c56-99a9f6252a62	f	0	2026-07-31 22:12:37.703194+07	2026-07-31 22:41:48.976233+07	Chinh sách	chinh-sach		#1d4ed8	Chinh sách	Chinh sách	Tìm chuyên gia liên quan	/chuyen-gia/	
8e0deda3-e38f-4838-bf05-4c47dd741d41	f	0	2026-07-31 22:12:51.400117+07	2026-07-31 22:41:48.977432+07	Đại học	dji-hc		#1d4ed8	Đại học	Đại học	Tìm chuyên gia liên quan	/chuyen-gia/	
c497e561-8c38-485b-9d7d-339d425bfaf4	f	0	2026-07-31 22:14:13.009176+07	2026-07-31 22:41:48.978101+07	Wellbeing	wellbeing		#1d4ed8	Wellbeing	Wellbeing	Tìm chuyên gia liên quan	/chuyen-gia/	
039d7d34-cc8a-445c-b867-e29d717f87d4	f	0	2026-07-31 22:14:43.705029+07	2026-07-31 22:41:48.978767+07	Tâm lý	tam-ly		#1d4ed8	Tâm lý	Tâm lý	Tìm chuyên gia liên quan	/chuyen-gia/	
20ec8865-4874-4b20-8277-37d3b8540767	f	0	2026-07-31 22:15:04.923835+07	2026-07-31 22:41:48.979466+07	Nghiên cứu	nghien-cu		#1d4ed8	Nghiên cứu	Nghiên cứu	Tìm chuyên gia liên quan	/chuyen-gia/	
6126b35f-9fe8-415d-a02b-dc84ede3c592	f	0	2026-07-31 22:15:34.883678+07	2026-07-31 22:41:48.980182+07	Xã hội học	xa-hi-hc		#1d4ed8	Xã hội học	Xã hội học	Tìm chuyên gia liên quan	/chuyen-gia/	
7a09b2e0-85f3-42ab-9981-fc0d72083993	f	0	2026-07-31 22:15:52.576915+07	2026-07-31 22:41:48.980905+07	E-Learning	e-learning		#1d4ed8	E-Learning	E-Learning	Tìm chuyên gia liên quan	/chuyen-gia/	
882a1399-69c4-47ab-86a2-32a120af5c39	f	0	2026-07-31 22:16:26.494463+07	2026-07-31 22:41:48.981487+07	Y tế	y-t		#1d4ed8	Y tế	Y tế	Tìm chuyên gia liên quan	/chuyen-gia/	
1780795b-b3c0-4b13-8fdd-a89e298c0f1e	f	0	2026-07-31 22:16:50.448029+07	2026-07-31 22:41:48.982083+07	Dữ liệu	d-liu		#1d4ed8	Dữ liệu	Dữ liệu	Tìm chuyên gia liên quan	/chuyen-gia/	
11e1b709-54e6-4319-b847-713d7c5054d2	f	0	2026-07-31 22:17:16.315644+07	2026-07-31 22:41:48.982601+07	Điều phối	djiu-phi		#1d4ed8	Điều phối	Điều phối	Tìm chuyên gia liên quan	/chuyen-gia/	
5d84a13c-abd5-4b17-b1f3-1a25ee853642	f	0	2026-07-31 22:17:33.627461+07	2026-07-31 22:41:48.983256+07	Chuyển đổi số	chuyn-dji-s		#1d4ed8	Chuyển đổi số	Chuyển đổi số	Tìm chuyên gia liên quan	/chuyen-gia/	
2787d14e-fde3-4220-a181-ac7a878f6626	f	0	2026-07-31 22:25:46.864792+07	2026-07-31 22:41:48.98392+07	Đào tạo	djao-to		#1d4ed8	Đào tạo	Đào tạo	Tìm chuyên gia liên quan	/chuyen-gia/	
34eaf735-6af7-46b6-95ad-b817ca2c8556	f	1	2026-07-27 17:43:38.933495+07	2026-07-31 22:41:48.984575+07	Kinh tế học liên ngành	kinh-te-hoc-lien-nganh	chart-bar	#1d4ed8	Kinh tế học\nChính sách kinh tế\nPhát triển bền vững	Phân tích kinh tế từ nhiều góc nhìn: hành vi, thể chế, phúc lợi xã hội và tác động chính sách — hỗ trợ thiết kế giải pháp tăng trưởng bền vững.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=kinh-te-hoc-lien-nganh	
0abb7a07-8b4d-42c6-b3b2-cfb87c47e73b	f	2	2026-07-27 17:43:38.937284+07	2026-07-31 22:41:48.985305+07	Quản trị & Lãnh đạo	quan-tri-lanh-dao	briefcase	#7c3aed	Lãnh đạo\nQuản trị tổ chức\nDoanh nghiệp	Khung lý thuyết và thực tiễn về quản trị hiệu quả, lãnh đạo thay đổi và xây dựng năng lực tổ chức trong bối cảnh chuyển đổi.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=quan-tri-lanh-dao	
803303a1-5704-4823-a8b3-6b1b91efb7b5	f	3	2026-07-27 17:43:38.938444+07	2026-07-31 22:41:48.986086+07	Khoa học dữ liệu & AI	khoa-hoc-du-lieu-ai	cpu	#0891b2	AI dữ liệu & chuyển đổi số\nY tế\nCơ quan quản lý	Hỗ trợ nhận diện use case, đánh giá dữ liệu, thiết kế dashboard, công cụ số và lộ trình thí điểm ứng dụng AI trong tổ chức.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=khoa-hoc-du-lieu-ai	expert/area-icons/brain-icon_icon_ai_dexuat.png
bf821fe1-65a6-4b88-b9d7-7b5eb938e41b	f	4	2026-07-27 17:43:38.939747+07	2026-07-31 22:41:48.986888+07	Chính sách công & Quản lý nhà nước	chinh-sach-cong	building-library	#0f766e	Cơ quan quản lý\nTổ chức quốc tế\nNguồn nhân lực	Phân tích bối cảnh xã hội, nhóm thụ hưởng, tác động chính sách và các vấn đề hệ thống trong quản trị nhà nước và cải cách thể chế.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=chinh-sach-cong	
90153c0d-0e83-4a93-8396-7b10fc3a4054	f	5	2026-07-27 17:43:38.940966+07	2026-07-31 22:41:48.987611+07	Phát triển bền vững	phat-trien-ben-vung	leaf	#15803d	Môi trường & phát triển bền vững\nGiáo dục\nHệ thống y tế	Kết nối môi trường sống, ESG, Green University, Green Hospital và các sáng kiến kinh tế tuần hoàn và phát triển bền vững.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=phat-trien-ben-vung	
df5fd549-8bbe-4ced-80e8-ff28b3f80acf	f	6	2026-07-27 17:43:38.942077+07	2026-07-31 22:41:48.988363+07	Giáo dục & Đào tạo	giao-duc-dao-tao	academic-cap	#b45309	Giáo dục\nNguồn nhân lực\nTrường đại học	Thiết kế chương trình học tập, đào tạo, E-Learning, microlearning và phát triển năng lực đội ngũ theo hướng thực hành.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=giao-duc-dao-tao	
6ddddd4a-fd62-4fe2-9c9d-a8c8cc740a08	f	7	2026-07-27 17:43:38.943284+07	2026-07-31 22:41:48.989629+07	Y tế & Sức khỏe cộng đồng	y-te-suc-khoe-cong-dong	heart	#be123c	Y tế\nHệ thống y tế\nSức khỏe cộng đồng	Chuyên môn về hệ thống y tế, quản trị bệnh viện, chất lượng chăm sóc sức khỏe và phát triển dịch vụ y tế cộng đồng.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=y-te-suc-khoe-cong-dong	expert/area-icons/icon_ai_thietke.png
ec6f9c69-fd83-47c7-9f15-c5ca7897823d	f	8	2026-07-27 17:43:38.9449+07	2026-07-31 22:41:48.990518+07	Công nghệ & Đổi mới sáng tạo	cong-nghe-doi-moi	light-bulb	#ea580c	Công nghệ\nĐổi mới sáng tạo\nChuyển đổi số	Phát triển năng lực đổi mới sáng tạo, chuyển đổi số trong doanh nghiệp, hệ sinh thái khởi nghiệp và ứng dụng công nghệ vào thực tiễn.	Tìm chuyên gia liên quan	/chuyen-gia/?linh-vuc=cong-nghe-doi-moi	
87104716-3c20-40b8-80b1-b0e8cc93b6e6	f	0	2026-07-31 23:36:30.171171+07	2026-07-31 23:36:30.17118+07	KHCN	khcn		#1d4ed8	KHCN	KHCN	Tìm chuyên gia liên quan	/chuyen-gia/	
5fc008a3-db50-4ef7-b125-07a8492a3e3b	f	0	2026-07-31 23:40:01.983867+07	2026-07-31 23:40:01.983875+07	Kinh tế	kinh-t		#1d4ed8	Kinh tế	Kinh tế	Tìm chuyên gia liên quan	/chuyen-gia/	
fd76c511-20a5-4b3e-88db-7c5e3008b3d9	f	0	2026-07-31 23:52:09.11148+07	2026-07-31 23:52:09.111489+07	Kỹ năng	k-nang		#1d4ed8		Kỹ năng	Tìm chuyên gia liên quan	/chuyen-gia/	
faa8b82b-f913-47f9-8dde-d0637e3ccf87	f	0	2026-07-31 23:56:21.163872+07	2026-07-31 23:56:21.163882+07	AI	ai		#1d4ed8	AI	AI	Tìm chuyên gia liên quan	/chuyen-gia/	
2126df8a-2a6c-4d17-9257-df2fa2be3367	f	0	2026-08-01 00:00:14.943806+07	2026-08-01 00:00:14.943814+07	ESG	esg		#1d4ed8	ESG	ESG	Tìm chuyên gia liên quan	/chuyen-gia/	
f130202b-4bbb-4402-9258-85d359ba9762	f	0	2026-08-01 00:00:27.069437+07	2026-08-01 00:00:27.06945+07	Bền vững	bn-vng		#1d4ed8	Bền vững	Bền vững	Tìm chuyên gia liên quan	/chuyen-gia/	
58fe82ec-38e4-4e5d-99d9-60204eae6ae3	f	0	2026-07-31 23:57:22.330067+07	2026-08-01 00:00:55.634526+07	Công nghệ	cong-ngh		#1d4ed8	Công nghệ	Công nghệ	Tìm chuyên gia liên quan	/chuyen-gia/	
92b94ac8-987f-453c-b990-9a61951734c3	f	0	2026-07-31 23:59:52.457044+07	2026-08-01 00:00:55.636623+07	Môi trường	moi-trng		#1d4ed8	Môi trường	Môi trường	Tìm chuyên gia liên quan	/chuyen-gia/	
\.


--
-- TOC entry 6427 (class 0 OID 312687)
-- Dependencies: 303
-- Data for Name: home_audiencesectionheader; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_audiencesectionheader (id, is_active, display_order, created_at, updated_at, section_label, heading, description, cta_label, cta_url) FROM stdin;
31746b2c-0faf-41b9-9406-56f4ab2b6dc2	t	0	2026-07-03 22:44:05.484691+07	2026-07-03 22:44:05.484696+07	IRDM ĐỒNG HÀNH VỚI AI?	IRDM đồng hành với ai?	Các bài toán IRDM tham gia thường không nằm trong một chuyên môn đơn lẻ. Đó là những vấn đề cần đồng thời hiểu bối cảnh, tổ chức dữ liệu, huy động tri thức liên ngành và thiết kế cách triển khai phù hợp.	Khám phá tất cả Giải pháp	/giai-phap/
\.


--
-- TOC entry 6428 (class 0 OID 312703)
-- Dependencies: 304
-- Data for Name: home_audiencesegment; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_audiencesegment (id, is_active, display_order, created_at, updated_at, icon, title, description, cta_label, cta_url, image, icon_image) FROM stdin;
271e7b1e-4949-47d2-935b-8c749d75114d	t	10	2026-07-03 22:44:05.486596+07	2026-07-07 21:15:44.202906+07	building-office	Cơ quan quản lý & Chính sách	Cung cố căn cứ khoa học, dữ liệu và cơ chế phối hợp cho các chương trình, dự án và nhiệm vụ KHCN & MST.	Khám phá Giải pháp	/giai-phap/co-quan-quan-ly/	home/audience/home/audience/271e7b1e-4949-47d2-935b-8c749d75114d.png	
77a8ffff-bff5-4c7c-849e-bdde84c827c7	t	20	2026-07-03 22:44:05.490145+07	2026-07-07 21:15:44.212538+07	heart	Hệ thống y tế	Làm rõ bài toán ưu tiên, dữ liệu sẵn có và lộ trình thí điểm phù hợp để hỗ trợ quản trị, chất lượng dịch vụ, phát triển năng lực.	Khám phá Giải pháp	/giai-phap/he-thong-y-te/	home/audience/home/audience/77a8ffff-bff5-4c7c-849e-bdde84c827c7.png	
ffb74786-3469-45ab-a810-239becf719f8	t	30	2026-07-03 22:44:05.491944+07	2026-07-07 21:15:44.221224+07	academic-cap	Trường Đại học & Giáo dục	Hỗ trợ nhà trường đổi mới chương trình, phát triển người học, khai thác dữ liệu giáo dục và xây dựng môi trường học tập.	Khám phá Giải pháp	/giai-phap/giao-duc/	home/audience/home/audience/ffb74786-3469-45ab-a810-239becf719f8.png	
9315c568-4567-4428-a483-a624cb63ca9d	t	40	2026-07-03 22:44:05.494825+07	2026-07-07 21:15:44.229422+07	briefcase	Doanh nghiệp	Thiết kế các sáng kiến phát triển con người, năng lực làm việc, văn hóa phối hợp và trách nhiệm xã hội gắn với mục tiêu.	Khám phá Giải pháp	/giai-phap/doanh-nghiep/	home/audience/home/audience/9315c568-4567-4428-a483-a624cb63ca9d.png	
9dda942c-a236-460b-8f44-5d3bd17feea8	t	50	2026-07-03 22:44:05.497141+07	2026-07-07 21:15:44.237638+07	globe-alt	Tổ chức quốc tế	Kết nối tri thức quốc tế với bối cảnh Việt Nam để thiết kế, triển khai và đánh giá các sáng kiến liên ngành có khả năng nhân rộng.	Khám phá Giải pháp	/giai-phap/to-chuc-quoc-te/	home/audience/home/audience/9dda942c-a236-460b-8f44-5d3bd17feea8.png	
\.


--
-- TOC entry 6429 (class 0 OID 312721)
-- Dependencies: 305
-- Data for Name: home_audiencetag; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_audiencetag (id, is_active, display_order, created_at, updated_at, label, segment_id) FROM stdin;
eaf55685-6eb2-4e37-9e25-d6bde7f5cdb3	t	100	2026-07-03 22:44:05.487308+07	2026-07-03 22:44:05.487312+07	Chính sách	271e7b1e-4949-47d2-935b-8c749d75114d
bcb200de-b7b6-4658-9c0a-1c324d7f96a2	t	110	2026-07-03 22:44:05.488965+07	2026-07-03 22:44:05.48897+07	Dữ liệu	271e7b1e-4949-47d2-935b-8c749d75114d
bf3d3458-b685-418c-aef0-14b9822e5019	t	120	2026-07-03 22:44:05.489291+07	2026-07-03 22:44:05.489294+07	Điều hành	271e7b1e-4949-47d2-935b-8c749d75114d
1cdf1181-6f4e-4f8d-968b-6fc2d754c342	t	130	2026-07-03 22:44:05.489583+07	2026-07-03 22:44:05.489586+07	KHCN & MST	271e7b1e-4949-47d2-935b-8c749d75114d
677da859-44b9-4d0b-b97a-e54de30169bd	t	100	2026-07-03 22:44:05.490462+07	2026-07-03 22:44:05.490465+07	Bệnh viện số	77a8ffff-bff5-4c7c-849e-bdde84c827c7
dd97912d-3e4e-4511-8034-d6dacf7d950c	t	110	2026-07-03 22:44:05.490734+07	2026-07-03 22:44:05.490737+07	Dữ liệu y tế	77a8ffff-bff5-4c7c-849e-bdde84c827c7
2c69c751-c3d3-4ebf-ac6a-5d9263408b9a	t	120	2026-07-03 22:44:05.491005+07	2026-07-03 22:44:05.491008+07	Workforce	77a8ffff-bff5-4c7c-849e-bdde84c827c7
4c874083-5fd2-4458-b906-d8596590d688	t	130	2026-07-03 22:44:05.491234+07	2026-07-03 22:44:05.491236+07	Wellbeing	77a8ffff-bff5-4c7c-849e-bdde84c827c7
352b9c56-a357-463c-897c-8fd956c3fdd2	t	140	2026-07-03 22:44:05.491455+07	2026-07-03 22:44:05.491458+07	Chuyển đổi số	77a8ffff-bff5-4c7c-849e-bdde84c827c7
b32fff35-4cd7-4406-9a07-7238c8845119	t	100	2026-07-03 22:44:05.492249+07	2026-07-03 22:44:05.492252+07	Giáo dục	ffb74786-3469-45ab-a810-239becf719f8
9a615bcd-0909-4815-8189-66d9911b2e4e	t	110	2026-07-03 22:44:05.49276+07	2026-07-03 22:44:05.49277+07	Người học	ffb74786-3469-45ab-a810-239becf719f8
cb843617-9492-4fe9-8296-028996c4d04b	t	120	2026-07-03 22:44:05.49338+07	2026-07-03 22:44:05.493385+07	E-Learning	ffb74786-3469-45ab-a810-239becf719f8
d83e4d10-5aee-4ecb-8dc0-3afb6bd004a7	t	130	2026-07-03 22:44:05.493815+07	2026-07-03 22:44:05.49382+07	Green University	ffb74786-3469-45ab-a810-239becf719f8
e065b808-3dbc-42c2-aca4-e359b4f638be	t	100	2026-07-03 22:44:05.495393+07	2026-07-03 22:44:05.495398+07	Lãnh đạo	9315c568-4567-4428-a483-a624cb63ca9d
568da3aa-13c2-424c-b607-9be7475b8e88	t	110	2026-07-03 22:44:05.495798+07	2026-07-03 22:44:05.495803+07	Hiệu quả Đội nhóm	9315c568-4567-4428-a483-a624cb63ca9d
b86f5d06-3bcc-49f1-945c-ad920925c6f4	t	120	2026-07-03 22:44:05.496135+07	2026-07-03 22:44:05.496138+07	Wellbeing	9315c568-4567-4428-a483-a624cb63ca9d
06d7f382-ae8a-472e-9ab0-f53771719e3b	t	130	2026-07-03 22:44:05.496446+07	2026-07-03 22:44:05.496451+07	ESG	9315c568-4567-4428-a483-a624cb63ca9d
b2f51988-8efc-4bfa-a794-984c40755088	t	100	2026-07-03 22:44:05.497477+07	2026-07-03 22:44:05.49748+07	Bối cảnh địa phương	9dda942c-a236-460b-8f44-5d3bd17feea8
89117320-a340-41cb-a979-fae13741ee2d	t	110	2026-07-03 22:44:05.497727+07	2026-07-03 22:44:05.49773+07	Nghiên cứu	9dda942c-a236-460b-8f44-5d3bd17feea8
92143693-aeeb-449e-9fae-f943d6c47260	t	120	2026-07-03 22:44:05.497961+07	2026-07-03 22:44:05.497963+07	Đồng thiết kế	9dda942c-a236-460b-8f44-5d3bd17feea8
6cdbd4ec-25b9-4f13-8798-839bbcb9c623	t	130	2026-07-03 22:44:05.498195+07	2026-07-03 22:44:05.498198+07	Triển khai	9dda942c-a236-460b-8f44-5d3bd17feea8
\.


--
-- TOC entry 6430 (class 0 OID 312732)
-- Dependencies: 306
-- Data for Name: home_capabilitiessectionheader; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_capabilitiessectionheader (id, is_active, display_order, created_at, updated_at, section_label, heading, description, cta_label, cta_url) FROM stdin;
c9ba92b7-14e9-47bc-94cc-f044694b1508	t	0	2026-07-03 22:44:05.506391+07	2026-07-03 22:44:05.506395+07	NỀN TẢNG CHUYÊN MÔN	NĂNG LỰC CỐT LÕI	Các năng lực dưới đây tạo nên nền tảng chuyên môn của IRDM — là cơ sở để đồng hành, thiết kế và triển khai các giải pháp.	Xem tất cả Năng lực	/ve-irdm/
\.


--
-- TOC entry 6431 (class 0 OID 312748)
-- Dependencies: 307
-- Data for Name: home_corecapability; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_corecapability (id, is_active, display_order, created_at, updated_at, icon, title, description, background_image, link_url, icon_image) FROM stdin;
a15d2df5-d269-46ef-8e19-3c0714f6e965	t	70	2026-07-03 22:44:05.513245+07	2026-07-11 16:52:55.251661+07		Sức khỏe môi trường & mô hình can thiệp phục hồi	Kết nối môi trường sống, sức khỏe thể chất, sức khỏe tâm thần và trải nghiệm phục hồi để phát triển các chương trình can thiệp.	home/capabilities/Homepage_SucKhoe_MoiTruong_IBF5BE3.png	/capabilities/suc-khoe-moi-truong-va-mo-hinh-can-thiep-phuc-hoi/	home/capability_icons/Wind.png
d14ea039-8c25-4e8f-8a4b-6055d4dd951b	t	10	2026-07-03 22:44:05.508253+07	2026-07-11 16:50:38.839421+07		Nghiên cứu ứng dụng & khoa học dữ liệu	Chuyển hóa vấn đề thực tiễn thành câu hỏi nghiên cứu, dữ liệu thành tri thức, và kết quả phân tích thành căn cứ cho quyết định.	home/capabilities/Homepage_nghiencuu_khoahoa_HnGvKcm.png	/capabilities/nghien-cuu-ung-dung-va-khoa-hoc-du-lieu/	home/capability_icons/light-bulb-icon.png
f313a59b-0682-463d-97d0-98e0fb34f673	t	20	2026-07-03 22:44:05.50924+07	2026-07-11 16:51:32.353661+07		AI, y tế số & hỗ trợ ra quyết định	Hỗ trợ tổ chức nhận diện use case, đánh giá dữ liệu, thiết kế lộ trình thí điểm và phối hợp phát triển công cụ số.	home/capabilities/homepage_AI.png	/capabilities/ai-y-te-so-va-ho-tro-ra-quyet-dinh/	home/capability_icons/brain-icon.png
34f66b62-0ead-4e7c-ad92-fc403a710655	t	30	2026-07-03 22:44:05.509967+07	2026-07-11 16:51:44.875355+07		Giáo dục & phát triển năng lực	Thiết kế chương trình học tập, tập huấn và phát triển năng lực theo hướng ứng dụng, gắn với thay đổi hành vi và mục tiêu.	home/capabilities/Homepage_GiaoDuc_lRspON5.png	/capabilities/giao-duc-va-phat-trien-nang-luc/	home/capability_icons/Vector.png
01ebd488-d641-4d50-bf37-f6577fc7ffeb	t	40	2026-07-03 22:44:05.511016+07	2026-07-11 16:52:07.342709+07		Sức khỏe tâm thần & wellbeing	Phát triển các sáng kiến phòng ngừa, nâng đỡ tâm lý - xã hội, năng lực phục hồi và môi trường học tập - làm việc lành mạnh.	home/capabilities/Homepage_SucKhoe_TamThan_yg2Tkd6.png	/capabilities/suc-khoe-tam-than-va-wellbeing/	home/capability_icons/heart-hand-icon.png
57745ce9-009a-4ad0-94ce-3c5d2e82b0c1	t	50	2026-07-03 22:44:05.511845+07	2026-07-11 16:52:22.701373+07		ESG, Green University & Green Hospital	Đồng hành cùng tổ chức xây dựng lộ trình phát triển bền vững, kết nối quản trị, con người, môi trường và trách nhiệm xã hội.	home/capabilities/Homepage_DaiHoc_w8iLQCp.png	/capabilities/esg-green-university-va-green-hospital/	home/capability_icons/univer_icon.png
6f7149be-3ebe-465c-a861-19034a3b3efd	t	60	2026-07-03 22:44:05.512656+07	2026-07-11 16:52:40.961333+07		Phổ biến tri thức & truyền thông cộng đồng	Chuyển hóa nghiên cứu, dữ liệu và hiểu biết chuyên môn thành nội dung dễ tiếp cận, có giá trị ứng dụng cho cộng đồng và đối tác.	home/capabilities/Homepage_PhoBienKienThuc_NK04S8w.png	/capabilities/pho-bien-tri-thuc-va-truyen-thong-cong-dong/	home/capability_icons/heroicons_book-open.png
\.


--
-- TOC entry 6432 (class 0 OID 312765)
-- Dependencies: 308
-- Data for Name: home_ctabanner; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_ctabanner (id, is_active, display_order, created_at, updated_at, section_label, heading, description, cta_label, cta_url, background_image) FROM stdin;
81f49a6e-949c-4134-8471-23cd1beb26ae	t	0	2026-07-03 22:44:05.543904+07	2026-07-07 21:15:44.3706+07	KẾT NỐI VỚI IRDM	CÙNG THIẾT KẾ GIẢI PHÁP PHÙ HỢP VỚI BỐI CẢNH VÀ MỤC TIÊU PHÁT TRIỂN CỦA TỔ CHỨC	Kết nối với Viện IRDM để cùng thiết kế giải pháp phù hợp với bối cảnh, dữ liệu và mục tiêu phát triển của tổ chức của bạn.	Liên hệ hợp tác	/lien-he/	home/cta/home/cta/cta-banner_vwsGwVL.png
\.


--
-- TOC entry 6433 (class 0 OID 312782)
-- Dependencies: 309
-- Data for Name: home_evidencesectionheader; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_evidencesectionheader (id, is_active, display_order, created_at, updated_at, section_label, heading, description, cta_label, cta_url, partners_label) FROM stdin;
753460ee-4c43-427f-bbbf-621a398d9d20	t	0	2026-07-03 22:44:05.520686+07	2026-07-03 22:44:05.520691+07	BẰNG CHỨNG NĂNG LỰC	Các tổ chức IRDM đã đồng hành	Viện IRDM đã đồng hành cùng cơ quan quản lý, tổ chức y tế, trường đại học, doanh nghiệp và đối tác trong các bài toán thực tiễn.	Xem Tin IRDM	/tri-thuc/	ĐỐI TÁC TIÊU BIỂU
\.


--
-- TOC entry 6434 (class 0 OID 312799)
-- Dependencies: 310
-- Data for Name: home_featuredsectionconfig; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_featuredsectionconfig (id, is_active, display_order, created_at, updated_at, section_key, title, subtitle, cta_label, cta_url, is_visible) FROM stdin;
\.


--
-- TOC entry 6435 (class 0 OID 312816)
-- Dependencies: 311
-- Data for Name: home_heropilltag; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_heropilltag (id, is_active, display_order, created_at, updated_at, label, hero_id) FROM stdin;
a010f9b7-70e2-4bbd-adb4-e871c02d33d7	t	10	2026-07-11 21:48:51.225736+07	2026-07-11 21:48:51.225745+07	Nghiên cứu ứng dụng	82ebdedb-573b-4242-93bd-d969207fb5ef
678477c7-35ef-4d42-991c-415f3a9d60af	t	20	2026-07-11 21:48:51.227776+07	2026-07-11 21:48:51.227781+07	Khoa học dữ liệu	82ebdedb-573b-4242-93bd-d969207fb5ef
6072a3d3-3ff2-4019-b787-558e280caa9f	t	30	2026-07-11 21:48:51.228894+07	2026-07-11 21:48:51.228899+07	Đổi mới sáng tạo	82ebdedb-573b-4242-93bd-d969207fb5ef
ad840739-8ba7-4e60-8a94-c1cec8bc1802	t	40	2026-07-11 21:48:51.229891+07	2026-07-11 21:48:51.229895+07	Phát triển năng lực	82ebdedb-573b-4242-93bd-d969207fb5ef
\.


--
-- TOC entry 6436 (class 0 OID 312827)
-- Dependencies: 312
-- Data for Name: home_herosection; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_herosection (id, is_active, display_order, created_at, updated_at, heading, subheading, description, primary_cta_label, primary_cta_url, secondary_cta_label, secondary_cta_url, background_image, eyebrow_text, quote_strip_text, heading_accent, hero_image, quote_icon) FROM stdin;
82ebdedb-573b-4242-93bd-d969207fb5ef	t	0	2026-07-11 21:48:51.213477+07	2026-07-11 23:15:28.881788+07	KIẾN TẠO GIẢI PHÁP TỪ		Viện IRDM đồng hành cùng cơ quan quản lý, hệ thống y tế, cơ sở giáo dục, doanh nghiệp và tổ chức quốc tế trong các bài toán liên ngành. Từ nhận diện vấn đề đến thiết kế mô hình, thí điểm và chuyển giao, Viện IRDM hướng tới những giải pháp có thể ứng dụng thực tiễn.	Khám phá thêm Giải pháp	/giai-phap/	Xem Năng lực IRDM	/capabilities/	home/hero/homepage_chatgpt.png	VIỆN NGHIÊN CỨU, KHOA HỌC, CÔNG NGHỆ VÀ ĐỔI MỚI SÁNG TẠO ĐỊNH HƯỚNG ỨNG DỤNG	Từ nghiên cứu đến tác động ở tầm hệ thống	NGHIÊN CỨU, DỮ LIỆU VÀ TRI THỨC LIÊN NGÀNH	home/hero/homepage_chatgpt_StKnZlu.png	home/hero/icons/home_page_iconoir_quote-message.png
\.


--
-- TOC entry 6437 (class 0 OID 312851)
-- Dependencies: 313
-- Data for Name: home_knowledgecategory; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_knowledgecategory (id, is_active, display_order, created_at, updated_at, icon, category_label, title, cta_label, cta_url, image) FROM stdin;
39cdc344-cf89-4053-b28b-e6903c1a62bb	t	10	2026-07-03 22:44:05.53784+07	2026-07-07 21:15:44.34119+07	document-text	XUẤT BẢN & TÀI LIỆU	Bài viết, báo cáo & policy brief	Xem tài liệu	/tri-thuc/tai-lieu/	home/knowledge/home/knowledge/39cdc344-cf89-4053-b28b-e6903c1a62bb.png
012a8f47-c9ba-47cd-9be5-9ea4371025a5	t	20	2026-07-03 22:44:05.540859+07	2026-07-07 21:15:44.348252+07	calendar	SỰ KIỆN & DIỄN ĐÀN	Hội thảo, tọa đàm & diễn đàn chuyên môn	Xem sự kiện	/tri-thuc/su-kien/	home/knowledge/home/knowledge/012a8f47-c9ba-47cd-9be5-9ea4371025a5.png
56ee9c96-4a13-488c-bd10-ebd170c665f4	t	30	2026-07-03 22:44:05.541487+07	2026-07-07 21:15:44.354451+07	chat-bubble-left-ellipsis	GÓC NHÌN TỪ ĐỐI TÁC	Cảm nhận từ đối tác & người học	Đọc chia sẻ	/tri-thuc/doi-tac/	home/knowledge/home/knowledge/56ee9c96-4a13-488c-bd10-ebd170c665f4.png
04601715-d68b-41cf-92be-418fa35245f8	t	40	2026-07-03 22:44:05.542068+07	2026-07-07 21:15:44.361069+07	newspaper	TRUYỀN THÔNG	Báo chí & diễn đàn chuyên môn	Xem trên báo chí	/tri-thuc/truyen-thong/	home/knowledge/home/knowledge/04601715-d68b-41cf-92be-418fa35245f8.png
\.


--
-- TOC entry 6438 (class 0 OID 312868)
-- Dependencies: 314
-- Data for Name: home_knowledgesectionheader; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_knowledgesectionheader (id, is_active, display_order, created_at, updated_at, section_label, heading, description, cta_label, cta_url) FROM stdin;
49d8dbf2-a4c1-4da5-86b8-88a9d1b57aa3	t	0	2026-07-03 22:44:05.535795+07	2026-07-03 22:44:05.535799+07	TRI THỨC & GÓC NHÌN	Tri thức & Diễn đàn chuyên môn	Viện IRDM tham gia các diễn đàn chuyên môn, hội thảo và hoạt động phổ biến tri thức với vai trò tổ chức chủ trì nghiên cứu và ứng dụng.	Xem Tri thức & Góc nhìn	/tri-thuc/
\.


--
-- TOC entry 6439 (class 0 OID 312884)
-- Dependencies: 315
-- Data for Name: home_methodologysectionheader; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_methodologysectionheader (id, is_active, display_order, created_at, updated_at, section_label, heading, description, cta_label, cta_url) FROM stdin;
c964b47d-24b2-416d-972b-a2a8de64c3cd	t	0	2026-07-03 22:44:05.50001+07	2026-07-04 22:34:04.536918+07	PHƯƠNG PHÁP LÀM VIỆC	Cách IRDM tạo ra tác động	Viện IRDM tiếp cận mỗi dự án như một tiến trình đi từ bằng chứng, đồng thiết kế và chuyển hóa thành giải pháp có thể tác động ở tầm hệ thống.	Tìm hiểu Năng lực cốt lõi	/capabilities/
\.


--
-- TOC entry 6440 (class 0 OID 312900)
-- Dependencies: 316
-- Data for Name: home_methodologystep; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_methodologystep (id, is_active, display_order, created_at, updated_at, step_number, icon, title, body) FROM stdin;
d0835ee7-f600-45c9-8b5e-8d4103726c12	t	10	2026-07-03 22:44:05.502007+07	2026-07-03 22:44:05.502011+07	1	magnifying-glass	Nhận diện đúng vấn đề	Làm rõ bài toán cốt lõi, nhóm liên quan, bối cảnh vận hành và ưu tiên hành động.
470d701b-bbf0-4cff-a7f3-deb7f9c150d2	t	20	2026-07-03 22:44:05.503041+07	2026-07-03 22:44:05.503045+07	2	chart-bar	Tạo bằng chứng đáng tin cậy	Thiết kế nghiên cứu, khảo sát, phân tích dữ liệu và tổng hợp thông tin trên nền tảng khoa học.
39dec902-7e40-44c6-8ac3-36efaf2d1f05	t	30	2026-07-03 22:44:05.50365+07	2026-07-03 22:44:05.503653+07	3	squares-2x2	Đồng thiết kế giải pháp	Kết nối chuyên gia, dữ liệu, công nghệ và kinh nghiệm triển khai để hình thành mô hình, chương trình, công cụ.
ece16e5a-4e7f-4fd1-80ab-530b8896b5a5	t	40	2026-07-03 22:44:05.504223+07	2026-07-03 22:44:05.504227+07	4	beaker	Thí điểm và đánh giá	Triển khai thí trong điều kiện thực tế, theo dõi kết quả, điều chỉnh cách làm và rút ra bài học.
5a915df5-6012-4dea-a2f9-0555424e4aa7	t	50	2026-07-03 22:44:05.504859+07	2026-07-03 22:44:05.504863+07	5	arrow-trending-up	Tối ưu để mở rộng hoặc chuyển giao	Chuyển kết quả thành giải pháp có thể sử dụng lâu dài trong tổ chức hoặc hệ thống.
\.


--
-- TOC entry 6441 (class 0 OID 312916)
-- Dependencies: 317
-- Data for Name: home_partnerlogo; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_partnerlogo (id, is_active, display_order, created_at, updated_at, name, logo, website_url) FROM stdin;
5439b661-a4ab-40a9-bc39-46e6f69942f0	t	10	2026-07-03 22:44:05.522537+07	2026-07-07 21:15:44.2594+07	Sở Khoa học và Công nghệ TP.HCM	home/partners/home/partners/5439b661-a4ab-40a9-bc39-46e6f69942f0.png	
7782fe92-1575-4cc1-906d-8aaa8ffcd07f	t	20	2026-07-03 22:44:05.523506+07	2026-07-07 21:15:44.265696+07	Sở Y tế TP.HCM	home/partners/home/partners/7782fe92-1575-4cc1-906d-8aaa8ffcd07f.png	
9dfb65cb-737e-4c2b-b382-414f11f1b47d	t	30	2026-07-03 22:44:05.524077+07	2026-07-07 21:15:44.27163+07	Đại học Bách Khoa TP.HCM	home/partners/home/partners/9dfb65cb-737e-4c2b-b382-414f11f1b47d.png	
bed15543-e156-4f9d-9c69-91b8cd55fbbd	t	40	2026-07-03 22:44:05.524618+07	2026-07-07 21:15:44.277727+07	Đại học Y Dược TP.HCM	home/partners/home/partners/bed15543-e156-4f9d-9c69-91b8cd55fbbd.png	
617a2af1-cb28-4c2a-a1c2-03c737990c7a	t	50	2026-07-03 22:44:05.525173+07	2026-07-07 21:15:44.284167+07	Đại học Y Khoa Phạm Ngọc Thạch	home/partners/home/partners/617a2af1-cb28-4c2a-a1c2-03c737990c7a.png	
26c465da-1188-4c5a-8df2-7e685e87c534	t	60	2026-07-03 22:44:05.525828+07	2026-07-07 21:15:44.289818+07	Bệnh viện Nguyễn Tri Phương	home/partners/home/partners/26c465da-1188-4c5a-8df2-7e685e87c534.png	
bde0d51c-78c2-4293-bc9f-dc391731940f	t	70	2026-07-03 22:44:05.52647+07	2026-07-07 21:15:44.296005+07	Bệnh viện Chấn thương Chỉnh hình	home/partners/home/partners/bde0d51c-78c2-4293-bc9f-dc391731940f.png	
6df033ec-6c90-4561-8f67-00576b79be1e	t	80	2026-07-03 22:44:05.527646+07	2026-07-07 21:15:44.302653+07	Bệnh viện Bệnh Nhiệt đới	home/partners/home/partners/6df033ec-6c90-4561-8f67-00576b79be1e.png	
d551796c-2130-4e33-8321-428b82d6a8ac	t	90	2026-07-03 22:44:05.528557+07	2026-07-07 21:15:44.309096+07	Bệnh viện Răng Hàm Mặt TP.HCM	home/partners/home/partners/d551796c-2130-4e33-8321-428b82d6a8ac.png	
8220b688-c7de-4f13-a041-5e6905845ed4	t	100	2026-07-03 22:44:05.529212+07	2026-07-07 21:15:44.315473+07	TalentNet	home/partners/home/partners/8220b688-c7de-4f13-a041-5e6905845ed4.png	
12f085a0-3fcd-43a7-94fc-a8367498f5f2	t	110	2026-07-03 22:44:05.529771+07	2026-07-07 21:15:44.321589+07	Sanofi	home/partners/home/partners/12f085a0-3fcd-43a7-94fc-a8367498f5f2.png	
78092e47-8f06-4c30-adae-60b015e090e1	t	120	2026-07-07 21:15:44.323232+07	2026-07-07 21:15:44.329468+07	Merit Medica	home/partners/home/partners/78092e47-8f06-4c30-adae-60b015e090e1.png	
\.


--
-- TOC entry 6442 (class 0 OID 312930)
-- Dependencies: 318
-- Data for Name: home_philosophyprinciple; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_philosophyprinciple (id, is_active, display_order, created_at, updated_at, number, icon, title, body) FROM stdin;
98025b9c-fc49-4edb-811c-834a74c42b40	t	10	2026-07-03 22:44:05.517026+07	2026-07-03 22:44:05.51703+07	1	link	Gắn nghiên cứu với triển khai	Viện IRDM không dừng ở mô tả hiện trạng, mà chuyển hóa tri thức khoa học thành bằng chứng, công cụ, chương trình, mô hình có thể triển khai thực tế.
154756f2-6750-4d6d-98fa-9d2b12288dd9	t	20	2026-07-03 22:44:05.518001+07	2026-07-03 22:44:05.518006+07	2	share	Kết nối năng lực liên ngành	Viện IRDM tiếp cận mỗi sáng kiến từ nhiều lớp chuyên môn, bao gồm lĩnh vực, dữ liệu, công nghệ, xã hội học, tâm lý học và chính sách.
df5c164e-628e-4433-86cc-08589109c8c9	t	30	2026-07-03 22:44:05.518603+07	2026-07-03 22:44:05.518607+07	3	hand-raised	Đồng hành bằng trách nhiệm	Viện IRDM xem trọng hiệu quả sử dụng nguồn lực, giá trị con người, tác động dài hạn và khả năng duy trì sau giai đoạn can thiệp.
8defb20f-c869-4f13-bac1-40eefb7f1fea	t	40	2026-07-03 22:44:05.519195+07	2026-07-03 22:44:05.519198+07	4	star	Hành động từ giá trị cốt lõi	Viện IRDM sống và làm việc trên nền tảng chính trực, cam kết, thấu cảm và chuyên hóa.
\.


--
-- TOC entry 6443 (class 0 OID 312946)
-- Dependencies: 319
-- Data for Name: home_philosophysectionheader; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_philosophysectionheader (id, is_active, display_order, created_at, updated_at, section_label, heading, description) FROM stdin;
e29b148f-c0bd-41de-b2da-92d1d2f12f48	t	0	2026-07-03 22:44:05.51505+07	2026-07-03 22:44:05.515055+07	TRIẾT LÝ & HƯỚNG TIẾP CẬN	Hướng tiếp cận đặc biệt của IRDM	Viện IRDM kết nối tư duy khoa học, năng lực triển khai và trách nhiệm đồng hành để tạo ra các giải pháp không chỉ đúng mà còn có thể triển khai được.
\.


--
-- TOC entry 6444 (class 0 OID 312960)
-- Dependencies: 320
-- Data for Name: home_statisticitem; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.home_statisticitem (id, is_active, display_order, created_at, updated_at, value, label, description, icon) FROM stdin;
2050ebe0-c7f3-44d1-93ed-648cec8b0db7	t	10	2026-07-03 22:44:05.531596+07	2026-07-03 22:44:05.531601+07	11+	Đối tác & tổ chức		
e68863aa-2e26-4fab-8abb-dc8fd071948e	t	20	2026-07-03 22:44:05.532834+07	2026-07-03 22:44:05.532838+07	5+	Lĩnh vực chuyên môn		
c2efee3b-804d-4ef8-989d-a59fdaa440bf	t	30	2026-07-03 22:44:05.533571+07	2026-07-03 22:44:05.533576+07	7	Năng lực cốt lõi		
18f7f3ae-c53e-4949-9ac6-173f03b9d4cf	t	40	2026-07-03 22:44:05.534152+07	2026-07-03 22:44:05.534156+07	TP.HCM	Trụ sở chính		
\.


--
-- TOC entry 6445 (class 0 OID 312975)
-- Dependencies: 321
-- Data for Name: knowledge_knowledgeaccordionitem; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgeaccordionitem (id, is_active, display_order, created_at, updated_at, accordion_type, title, content, is_published) FROM stdin;
cac295bb-b75d-487b-882c-dd9dcad2a312	t	1	2026-07-19 16:16:15.740914+07	2026-07-19 16:16:15.740924+07	post_event	Hội thảo Wellbeing trong y tế và giáo dục 2024	Tóm tắt hội thảo với sự tham gia của hơn 120 chuyên gia và nhà quản lý.\nCác chủ đề chính: sức khỏe tâm thần nhân viên y tế, môi trường học đường lành mạnh, các mô hình can thiệp sớm.	t
01ceca89-d02b-4b31-8a43-2ad75931df60	t	2	2026-07-19 16:16:15.74987+07	2026-07-19 16:16:15.749884+07	post_event	Workshop Chuyển đổi số Bệnh viện — Thoái tất và triển vọ ngày 14/07	Tóm lược các bài trình bày và kết quả thảo luận nhóm trong workshop.\nCác quyết định hành động mà các đại biểu cam kết sau sự kiện.	t
51109d08-2dd8-4f6f-957b-52de1b084872	t	1	2026-07-19 16:16:15.7525+07	2026-07-19 16:16:15.752511+07	cooperation	IRDM và Đại học Y Dược TP.HCM công bố hợp tác nghiên cứu 2024–2026	Hai bên chính thức công bố hợp tác trong lĩnh vực nghiên cứu ứng dụng và đào tạo năng lực.\nThời gian: 2024–2026. Phạm vi: nghiên cứu hỗn hợp, thực tập sinh, hội thảo chung.	t
3636c35f-e70a-4cc2-a010-9b97854e41a8	t	2	2026-07-19 16:16:15.755068+07	2026-07-19 16:16:15.755079+07	cooperation	Hợp tác với Tổ chức Y tế Thế giới (WHO) và UNICEF trong chương trình wellbeing	Công bố bản ghi nhớ hợp tác (MOU) với WHO và UNICEF.\nNội dung: triển khai chương trình wellbeing tại các tỉnh thành phíển Bắc 2025.	t
\.


--
-- TOC entry 6446 (class 0 OID 312990)
-- Dependencies: 322
-- Data for Name: knowledge_knowledgeactivitynews; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgeactivitynews (id, is_active, display_order, created_at, updated_at, thumbnail, title, summary, published_date, cta_text, cta_icon, cta_url, is_published, category_id, cta_target) FROM stdin;
24b9c715-2ce9-4719-979c-f4550d97f5e4	t	1	2026-07-19 16:16:15.678586+07	2026-07-19 16:16:15.678596+07		IRDM cung cấp dịch vụ thư ký khoa học cho Bệnh viện Nguyễn Tri Phương	Hỗ trợ thiết kế và triển khai nhiệm vụ KH,CN & ĐMST tại đơn vị y tế.	2024-06-15	Xem chi tiết	arrow-right		t	0cb0cf05-8816-4776-a57c-860432aa5fac	_self
26647418-7fef-46f7-9f99-41299c2613e8	t	2	2026-07-19 16:16:15.683131+07	2026-07-19 16:16:15.683143+07		IRDM ký kết hợp tác với Đại học Y Dược TP.HCM trong nghiên cứu ứng dụng	Phối hợp triển khai các nghiên cứu về sức khỏe cộng đồng và chuyển đổi số.	2024-05-10	Xem chi tiết	arrow-right		t	0cb0cf05-8816-4776-a57c-860432aa5fac	_self
e6a0b4c2-12cc-47b2-9f51-a2231dff61a5	t	3	2026-07-19 16:16:15.687075+07	2026-07-19 16:16:15.687087+07		Tóm lược Hội thảo Wellbeing trong y tế và giáo dục 2024	Những phát hiện chính và khuyến nghị từ 3 phiên thảo luận chuyên sâu.	2024-04-20	Xem chi tiết	arrow-right		t	0cb0cf05-8816-4776-a57c-860432aa5fac	_self
0445a5d0-22a4-46ee-8624-26753b5d1e44	t	4	2026-07-19 16:16:15.689903+07	2026-07-19 16:16:15.689913+07		IRDM hoàn thành báo cáo đánh giá nhu cầu năng lực nhân lực y tế TP.HCM	Kết quả phân tích từ khảo sát 420 nhân viên y tế tại 8 bệnh viện.	2024-05-28	Xem chi tiết	arrow-right		t	ac329527-ac0d-4f05-bf29-4d96a03f54c9	_self
\.


--
-- TOC entry 6447 (class 0 OID 313009)
-- Dependencies: 323
-- Data for Name: knowledge_knowledgearticle; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgearticle (id, is_active, display_order, created_at, updated_at, title, slug, summary, body, thumbnail, hero_image, author_name, published_date, read_time, is_featured, is_published, meta_title, meta_description, meta_keywords, category_id) FROM stdin;
d3fbc854-e31d-45db-98f9-21759ab402ca	t	4	2026-07-07 21:16:06.825114+07	2026-07-19 16:16:15.57094+07	Các sự kiện chuyên môn sắp diễn ra tại Viện IRDM	cac-su-kien-chuyen-mon-sap-dien-ra-irdm	Tổng hợp các hội thảo, tọa đàm và chương trình đào tạo sắp diễn ra tại Viện IRDM trong quý III/2024.	Viện IRDM sẽ tổ chức loạt sự kiện chuyên môn nhằm kết nối các chuyên gia trong lĩnh vực y tế và giáo dục...	knowledge/articles/thumbnails/knowledge/articles/thumbnails/cac-su-kien-chuyen-mon-sap-d_37R8jBC.png		Ban Truyền thông IRDM	2024-07-01	5	t	t				0cb0cf05-8816-4776-a57c-860432aa5fac
87f80728-6318-4325-90b7-3d3085207709	t	1	2026-07-07 21:16:06.836267+07	2026-07-19 16:16:15.573581+07	Cải cách hệ thống bảo hiểm y tế: Bài học từ các mô hình quốc tế	cai-cach-he-thong-bao-hiem-y-te-bai-hoc-quoc-te	Phân tích so sánh mô hình bảo hiểm y tế của Hàn Quốc, Đài Loan và Singapore, rút ra bài học cho Việt Nam.	Hệ thống bảo hiểm y tế toàn dân là nền tảng của hệ thống y tế hiện đại...	knowledge/articles/thumbnails/knowledge/articles/thumbnails/cai-cach-he-thong-bao-hiem-y_EwMf92v.png		TS. Phạm Đức Mạnh	2024-04-05	15	f	t				2677a27f-169f-4749-816c-234a8075dd0b
e0fa3f97-31a5-4353-8a38-93e86d8673fb	t	2	2026-07-07 21:16:06.874347+07	2026-07-19 16:16:15.575859+07	Thiết kế chương trình đào tạo năng lực lãnh đạo y tế theo chuẩn năng lực	thiet-ke-chuong-trinh-dao-tao-nang-luc-lanh-dao-y-te	Quy trình 6 bước thiết kế chương trình đào tạo dựa trên khung năng lực lãnh đạo y tế quốc tế.	Năng lực lãnh đạo là yếu tố quyết định thành công của hệ thống y tế...	knowledge/articles/thumbnails/knowledge/articles/thumbnails/thiet-ke-chuong-trinh-dao-ta_qmXV43b.png		TS. Bùi Thị Mai	2024-03-15	14	f	t				ac329527-ac0d-4f05-bf29-4d96a03f54c9
389fa27c-7c15-4291-8002-0302395a8c3b	t	2	2026-07-07 21:16:06.951538+07	2026-07-19 16:16:15.581167+07	Nhân lực y tế tương lai: Kỹ năng cần thiết trong thời đại chuyển đổi số	nhan-luc-y-te-tuong-lai-ky-nang-can-thiet	Phác thảo bộ năng lực cần thiết cho nhân viên y tế trong thập kỷ tới, theo góc nhìn chính sách và thực tiễn.	Cuộc cách mạng công nghiệp lần thứ tư đang đặt ra những yêu cầu mới cho lực lượng lao động y tế...	knowledge/articles/thumbnails/knowledge/articles/thumbnails/nhan-luc-y-te-tuong-lai-ky-n_TVaVYfH.png		TS. Lê Văn Khoa	2024-05-18	11	f	t				2677a27f-169f-4749-816c-234a8075dd0b
a2a9cac5-e458-400b-b88f-5c23309f1e3e	t	1	2026-07-07 21:16:06.762967+07	2026-07-19 16:16:15.554695+07	Vì sao dữ liệu bệnh viện chưa dễ chuyển thành nhiệm vụ KH,CN&ĐMST?	vi-sao-du-lieu-benh-vien-chua-de-chuyen-thanh-khcn	Phân tích rào cản chuyển đổi dữ liệu bệnh viện thành nhiệm vụ khoa học, công nghệ và đổi mới sáng tạo trong bối cảnh y tế số.	Dữ liệu bệnh viện ngày càng phong phú nhưng khoảng cách giữa dữ liệu thô và ứng dụng thực tiễn vẫn còn rất lớn...	knowledge/articles/thumbnails/knowledge/articles/thumbnails/vi-sao-du-lieu-benh-vien-chu_wpvDTcX.png		TS. Nguyễn Minh Tuấn	2024-05-10	8	t	t				ac329527-ac0d-4f05-bf29-4d96a03f54c9
cdbceec4-6019-4f66-9d47-1bc5bed11fc9	t	3	2026-07-07 21:16:06.815062+07	2026-07-19 16:16:15.567616+07	Green University và Green Hospital: từ định hướng xanh đến mô hình quản trị bền vững	green-university-green-hospital-quan-tri-ben-vung	Khung tư duy và lộ trình thực tiễn để các trường đại học và bệnh viện chuyển đổi sang mô hình quản trị xanh và bền vững.	Phong trào Green University và Green Hospital không chỉ là xu hướng mà là tất yếu trong bối cảnh biến đổi khí hậu...	knowledge/articles/thumbnails/knowledge/articles/thumbnails/green-university-green-hospi_0EgmJyW.png		ThS. Trần Thị Hoa	2024-06-01	12	t	t				cb345c35-f226-4e3b-9c82-a18d41ea53cb
4a490da7-6e24-4ae9-a381-1d4d4bc8ed2a	t	2	2026-07-07 21:16:06.913645+07	2026-07-19 16:16:15.578251+07	AI trong chẩn đoán hình ảnh y tế: Tiềm năng và thách thức triển khai	ai-trong-chan-doan-hinh-anh-y-te	Đánh giá các mô hình AI hiện tại trong chẩn đoán X-quang, MRI và siêu âm, cùng rào cản triển khai thực tế.	Trí tuệ nhân tạo đang cách mạng hóa chẩn đoán hình ảnh y tế trên toàn cầu...	knowledge/articles/thumbnails/knowledge/articles/thumbnails/ai-trong-chan-doan-hinh-anh-_egzBmUY.png		ThS. Nguyễn Văn Hiếu	2024-06-20	12	f	t				cb345c35-f226-4e3b-9c82-a18d41ea53cb
eca018e3-78a1-43e5-b5ef-6bd8cd5d8c04	t	2	2026-07-07 21:16:06.77607+07	2026-08-09 23:11:30.013081+07	Sức khỏe tâm thần nhân viên y tế: khi "chịu đựng tốt" không còn là chiến lược bền vững	suc-khoe-tam-than-nhan-vien-y-te-chiu-dung-khong-ben-vung	Nghiên cứu về tình trạng kiệt sức và sức khỏe tâm thần của nhân viên y tế sau đại dịch — và tại sao cần thay đổi tư duy quản lý.	Sau nhiều năm làm việc trong môi trường áp lực cao, nhân viên y tế đang đối mặt với khủng hoảng sức khỏe tâm thần nghiêm trọng...	knowledge/articles/thumbnails/Sức_khỏe_tâm_thần_nhân_viên_y_tế__khi_chịu_đựng_tốt_không__VQftZQg.png	knowledge/articles/hero/Sức_khỏe_tâm_thần_nhân_viên_y_tế__khi_chịu_đựng_tốt_không_còn_là_NnfTw5s.png	PGS.TS. Đinh Thị Lan	2024-04-22	10	t	t				cb345c35-f226-4e3b-9c82-a18d41ea53cb
\.


--
-- TOC entry 6448 (class 0 OID 313034)
-- Dependencies: 324
-- Data for Name: knowledge_knowledgearticle_related_capabilities; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgearticle_related_capabilities (id, knowledgearticle_id, capability_id) FROM stdin;
\.


--
-- TOC entry 6450 (class 0 OID 313041)
-- Dependencies: 326
-- Data for Name: knowledge_knowledgearticle_topics; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgearticle_topics (id, knowledgearticle_id, knowledgetopic_id) FROM stdin;
1	a2a9cac5-e458-400b-b88f-5c23309f1e3e	66c6582a-7970-4996-9f05-9d788cdec6cb
2	a2a9cac5-e458-400b-b88f-5c23309f1e3e	15beced7-8d20-4c4a-89c6-fc013e2bed92
3	eca018e3-78a1-43e5-b5ef-6bd8cd5d8c04	15beced7-8d20-4c4a-89c6-fc013e2bed92
4	eca018e3-78a1-43e5-b5ef-6bd8cd5d8c04	762639d2-de93-496a-9b79-305f6d775c9d
5	cdbceec4-6019-4f66-9d47-1bc5bed11fc9	d0266422-5241-4b31-b70d-c90025cd6417
6	cdbceec4-6019-4f66-9d47-1bc5bed11fc9	c9824ad1-b71a-4d6d-a839-0bd628e3819f
7	d3fbc854-e31d-45db-98f9-21759ab402ca	d0266422-5241-4b31-b70d-c90025cd6417
8	d3fbc854-e31d-45db-98f9-21759ab402ca	15beced7-8d20-4c4a-89c6-fc013e2bed92
9	87f80728-6318-4325-90b7-3d3085207709	15beced7-8d20-4c4a-89c6-fc013e2bed92
10	e0fa3f97-31a5-4353-8a38-93e86d8673fb	d0266422-5241-4b31-b70d-c90025cd6417
11	e0fa3f97-31a5-4353-8a38-93e86d8673fb	15beced7-8d20-4c4a-89c6-fc013e2bed92
12	4a490da7-6e24-4ae9-a381-1d4d4bc8ed2a	66c6582a-7970-4996-9f05-9d788cdec6cb
13	4a490da7-6e24-4ae9-a381-1d4d4bc8ed2a	15beced7-8d20-4c4a-89c6-fc013e2bed92
14	389fa27c-7c15-4291-8002-0302395a8c3b	d0266422-5241-4b31-b70d-c90025cd6417
15	389fa27c-7c15-4291-8002-0302395a8c3b	79293fb2-e89e-43ad-831c-dd7b7206411b
\.


--
-- TOC entry 6452 (class 0 OID 313048)
-- Dependencies: 328
-- Data for Name: knowledge_knowledgecategory; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgecategory (id, is_active, display_order, created_at, updated_at, label, slug, heading, description, icon, cover_image, is_published) FROM stdin;
4ff5e077-aec3-46b8-83e4-b8ce3fb2cd89	t	0	2026-07-18 10:44:17.879565+07	2026-07-18 10:44:17.879574+07	Hệ thống Y tế	h-thng-y-t	Hệ thống y tế	Hệ thống y tế			f
ac329527-ac0d-4f05-bf29-4d96a03f54c9	t	1	2026-07-07 21:16:06.513091+07	2026-07-19 16:16:15.543148+07	Công bố nghiên cứu	cong-bo-nghien-cuu	Công bố nghiên cứu	Các nghiên cứu ứng dụng và bằng chứng khoa học từ đội ngũ IRDM.		knowledge/categories/knowledge/categories/cong-bo-nghien-cuu_r6eucQ7.png	t
cb345c35-f226-4e3b-9c82-a18d41ea53cb	t	2	2026-07-07 21:16:06.580561+07	2026-07-19 16:16:15.545492+07	Góc nhìn ngành	goc-nhin-nganh	Góc nhìn ngành	Phân tích, bình luận chuyên môn về xu hướng y tế, giáo dục và phát triển nguồn lực.		knowledge/categories/knowledge/categories/goc-nhin-nganh_Du1HsMb.png	t
2677a27f-169f-4749-816c-234a8075dd0b	t	3	2026-07-07 21:16:06.638753+07	2026-07-19 16:16:15.546913+07	Tóm lược chính sách	tom-luoc-chinh-sach	Tóm lược chính sách	Tóm tắt và phân tích các chính sách y tế, giáo dục và phát triển bền vững.		knowledge/categories/knowledge/categories/tom-luoc-chinh-sach_piPEtAn.png	t
0cb0cf05-8816-4776-a57c-860432aa5fac	t	4	2026-07-07 21:16:06.703553+07	2026-07-19 16:16:15.548277+07	Tin IRDM	tin-irdm	Tin tức IRDM	Hoạt động, hợp tác và sự kiện từ Viện IRDM.		knowledge/categories/knowledge/categories/tin-irdm_cjlzsbS.png	t
\.


--
-- TOC entry 6453 (class 0 OID 313066)
-- Dependencies: 329
-- Data for Name: knowledge_knowledgecontenttypecard; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgecontenttypecard (id, is_active, display_order, created_at, updated_at, cover_image, title, summary, cta_text, cta_icon, cta_url, is_published, category_id, listing_page_id) FROM stdin;
9def6369-aedf-495b-ab35-d99ff3cb2d9d	t	1	2026-07-18 23:05:38.560009+07	2026-07-19 16:16:15.76643+07	knowledge/content_type/cards/khamphanoidung_congbonghiencuu.png	Công bố nghiên cứu	Các công bố và kết quả nghiên cứu của Viện IRDM, được trình bày theo hướng dễ tiếp cận hơn cho người đọc ngoài chuyên ngành hẹp.	Xem nội dung liên quan	arrow-right	?ctype=cong-bo-nghien-cuu	t	ac329527-ac0d-4f05-bf29-4d96a03f54c9	32c588b5-da2e-41a1-b498-0b08a6dbec44
4b0ab8d1-720e-4c43-9c56-477b034cdce3	t	2	2026-07-18 23:05:38.566393+07	2026-07-19 16:16:15.7737+07	knowledge/content_type/cards/khamphanoidung_gocnhinnganh.png	Góc nhìn ngành	Các bài viết phân tích những vấn đề đang nổi bật trong y tế, giáo dục, môi trường, dữ liệu, AI, wellbeing và phát triển nguồn lực.	Xem nội dung liên quan	arrow-right	?ctype=goc-nhin-nganh	t	cb345c35-f226-4e3b-9c82-a18d41ea53cb	32c588b5-da2e-41a1-b498-0b08a6dbec44
361b164e-0339-4d11-8cc6-99a971131115	t	3	2026-07-18 23:05:38.56874+07	2026-07-19 16:16:15.776218+07	knowledge/content_type/cards/khamphanoidung_tomluotchinhsach.png	Tóm lược chính sách	Các tóm lược ngắn, cô đọng, giúp chuyển hóa bằng chứng, dữ liệu và kinh nghiệm triển khai thành hàm ý cho quản lý, chính sách hoặc chương trình hành động.	Xem nội dung liên quan	arrow-right	?ctype=tom-luoc-chinh-sach	t	2677a27f-169f-4749-816c-234a8075dd0b	32c588b5-da2e-41a1-b498-0b08a6dbec44
22bd5b61-a62f-466f-b01e-41dc2e071d7a	t	4	2026-07-18 23:05:38.571072+07	2026-07-19 16:16:15.778804+07	knowledge/content_type/cards/khamphanoidung_baocaovatailieu.png	Báo cáo & tài liệu	Các tài liệu ứng dụng giúp người đọc tìm hiểu vấn đề, tham khảo khung tiếp cận, chuẩn bị hợp tác hoặc lựa chọn hướng triển khai phù hợp.	Xem nội dung liên quan	arrow-right	?ctype=bao-cao-tai-lieu	t	ac329527-ac0d-4f05-bf29-4d96a03f54c9	32c588b5-da2e-41a1-b498-0b08a6dbec44
5100f9f5-6a4d-42f1-91c7-06f98c33e973	t	5	2026-07-18 23:05:38.57408+07	2026-07-19 16:16:15.781143+07	knowledge/content_type/cards/khamphanoidung_tinirdm.png	Tin IRDM	Cập nhật các hoạt động nghiên cứu, hợp tác, tập huấn, hội thảo và những dấu mốc chuyên môn của Viện IRDM.	Xem nội dung liên quan	arrow-right	?ctype=tin-irdm	t	0cb0cf05-8816-4776-a57c-860432aa5fac	32c588b5-da2e-41a1-b498-0b08a6dbec44
8c0ef1d8-d8f8-4111-b4b6-76e326e50a15	t	6	2026-07-18 23:05:38.5765+07	2026-07-19 16:16:15.783287+07	knowledge/content_type/cards/khamphanoidung_sukien.png	Sự kiện	Thông tin về các hội thảo, tọa đàm, workshop, lớp tập huấn và diễn đàn chuyên môn do Viện IRDM tổ chức hoặc tham gia.	Xem nội dung liên quan	arrow-right	/su-kien/	t	0cb0cf05-8816-4776-a57c-860432aa5fac	32c588b5-da2e-41a1-b498-0b08a6dbec44
\.


--
-- TOC entry 6454 (class 0 OID 313085)
-- Dependencies: 330
-- Data for Name: knowledge_knowledgecontenttypecard_tags; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgecontenttypecard_tags (id, knowledgecontenttypecard_id, knowledgetopic_id) FROM stdin;
1	9def6369-aedf-495b-ab35-d99ff3cb2d9d	d0266422-5241-4b31-b70d-c90025cd6417
2	9def6369-aedf-495b-ab35-d99ff3cb2d9d	66c6582a-7970-4996-9f05-9d788cdec6cb
3	9def6369-aedf-495b-ab35-d99ff3cb2d9d	15beced7-8d20-4c4a-89c6-fc013e2bed92
4	9def6369-aedf-495b-ab35-d99ff3cb2d9d	c9824ad1-b71a-4d6d-a839-0bd628e3819f
5	4b0ab8d1-720e-4c43-9c56-477b034cdce3	d0266422-5241-4b31-b70d-c90025cd6417
6	4b0ab8d1-720e-4c43-9c56-477b034cdce3	66c6582a-7970-4996-9f05-9d788cdec6cb
7	4b0ab8d1-720e-4c43-9c56-477b034cdce3	15beced7-8d20-4c4a-89c6-fc013e2bed92
8	4b0ab8d1-720e-4c43-9c56-477b034cdce3	762639d2-de93-496a-9b79-305f6d775c9d
9	361b164e-0339-4d11-8cc6-99a971131115	d0266422-5241-4b31-b70d-c90025cd6417
10	361b164e-0339-4d11-8cc6-99a971131115	15beced7-8d20-4c4a-89c6-fc013e2bed92
11	361b164e-0339-4d11-8cc6-99a971131115	c9824ad1-b71a-4d6d-a839-0bd628e3819f
12	22bd5b61-a62f-466f-b01e-41dc2e071d7a	d0266422-5241-4b31-b70d-c90025cd6417
13	22bd5b61-a62f-466f-b01e-41dc2e071d7a	15beced7-8d20-4c4a-89c6-fc013e2bed92
14	22bd5b61-a62f-466f-b01e-41dc2e071d7a	79293fb2-e89e-43ad-831c-dd7b7206411b
15	22bd5b61-a62f-466f-b01e-41dc2e071d7a	c9824ad1-b71a-4d6d-a839-0bd628e3819f
16	5100f9f5-6a4d-42f1-91c7-06f98c33e973	d0266422-5241-4b31-b70d-c90025cd6417
17	5100f9f5-6a4d-42f1-91c7-06f98c33e973	66c6582a-7970-4996-9f05-9d788cdec6cb
18	5100f9f5-6a4d-42f1-91c7-06f98c33e973	15beced7-8d20-4c4a-89c6-fc013e2bed92
19	5100f9f5-6a4d-42f1-91c7-06f98c33e973	c9824ad1-b71a-4d6d-a839-0bd628e3819f
20	8c0ef1d8-d8f8-4111-b4b6-76e326e50a15	d0266422-5241-4b31-b70d-c90025cd6417
21	8c0ef1d8-d8f8-4111-b4b6-76e326e50a15	66c6582a-7970-4996-9f05-9d788cdec6cb
22	8c0ef1d8-d8f8-4111-b4b6-76e326e50a15	15beced7-8d20-4c4a-89c6-fc013e2bed92
23	8c0ef1d8-d8f8-4111-b4b6-76e326e50a15	762639d2-de93-496a-9b79-305f6d775c9d
\.


--
-- TOC entry 6456 (class 0 OID 313092)
-- Dependencies: 332
-- Data for Name: knowledge_knowledgectabutton; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgectabutton (id, is_active, display_order, created_at, updated_at, text, url, target, style, icon, is_published, listing_page_id) FROM stdin;
9193e116-dd15-4ae1-8c4f-5136a717398b	t	1	2026-07-20 00:33:51.815983+07	2026-07-20 00:33:51.815991+07	Khám phá tri thức	/tri-thuc-goc-nhin/	_self	primary		t	32c588b5-da2e-41a1-b498-0b08a6dbec44
f45d91ac-b850-4de4-927c-269855c2d978	t	2	2026-07-20 00:33:51.817612+07	2026-07-20 00:33:51.817618+07	Đăng ký tải tài liệu	/tri-thuc-goc-nhin/#tai-lieu-tai-ve	_self	outline		t	32c588b5-da2e-41a1-b498-0b08a6dbec44
53d48d68-4363-44ab-9ec3-fda798391dfb	t	3	2026-07-20 00:33:51.818526+07	2026-07-20 00:33:51.81853+07	Liên hệ trao đổi với IRDM	/lien-he/	_self	outline	arrow-right	t	32c588b5-da2e-41a1-b498-0b08a6dbec44
\.


--
-- TOC entry 6457 (class 0 OID 313110)
-- Dependencies: 333
-- Data for Name: knowledge_knowledgedownload; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgedownload (id, is_active, display_order, created_at, updated_at, title, slug, summary, cover_image, file, file_type_label, file_size_label, published_date, is_published, category_id) FROM stdin;
c67d0edc-0290-483d-954e-f18cc0fe5219	t	1	2026-07-07 21:16:07.019189+07	2026-07-19 16:16:15.629481+07	Báo cáo thường niên IRDM 2024	bao-cao-thuong-nien-irdm-2024	Tổng kết hoạt động nghiên cứu, hợp tác và tác động của Viện IRDM trong năm 2024.	knowledge/downloads/knowledge/downloads/bao-cao-thuong-nien-irdm-2024_UMCjb1T.png		PDF	4.2 MB	2024-01-15	t	0cb0cf05-8816-4776-a57c-860432aa5fac
97f89c84-9e57-4185-8793-cdc62afd0576	t	2	2026-07-07 21:16:07.025605+07	2026-07-19 16:16:15.631191+07	Khung năng lực quản lý y tế	khung-nang-luc-quan-ly-y-te	Bộ khung năng lực chuẩn dành cho lãnh đạo cấp trung và cấp cao trong lĩnh vực y tế.	knowledge/downloads/knowledge/downloads/khung-nang-luc-quan-ly-y-te_NsZX0NX.png		PDF	1.8 MB	2024-02-20	t	ac329527-ac0d-4f05-bf29-4d96a03f54c9
192a0b2b-7c21-44e6-957b-158a4cdcbf02	t	3	2026-07-07 21:16:07.03209+07	2026-07-19 16:16:15.632633+07	Hướng dẫn triển khai ESG cho doanh nghiệp	huong-dan-trien-khai-esg-doanh-nghiep	Tài liệu thực hành với bộ chỉ số và mẫu báo cáo ESG cho tổ chức y tế và doanh nghiệp.	knowledge/downloads/knowledge/downloads/huong-dan-trien-khai-esg-doanh-nghiep_0KZ5XFP.png		PDF	2.5 MB	2024-03-10	t	2677a27f-169f-4749-816c-234a8075dd0b
a67bdcda-5056-4e73-9b35-8b98c2e43e47	t	4	2026-07-07 21:16:07.037902+07	2026-07-19 16:16:15.634059+07	Bộ công cụ đánh giá wellbeing	bo-cong-cu-danh-gia-wellbeing	Thang đo và phương pháp đánh giá toàn diện sức khỏe tâm thần, thể chất và nghề nghiệp.	knowledge/downloads/knowledge/downloads/bo-cong-cu-danh-gia-wellbeing_CZQOX3H.png		XLSX	0.9 MB	2024-04-05	t	ac329527-ac0d-4f05-bf29-4d96a03f54c9
\.


--
-- TOC entry 6458 (class 0 OID 313129)
-- Dependencies: 334
-- Data for Name: knowledge_knowledgedownloadrequest; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgedownloadrequest (id, full_name, organization, email, note, submitted_at) FROM stdin;
1	111	111	bluesky775177@gmail.com	11	2026-07-19 11:17:20.666629+07
\.


--
-- TOC entry 6460 (class 0 OID 313141)
-- Dependencies: 336
-- Data for Name: knowledge_knowledgeevent; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgeevent (id, is_active, display_order, created_at, updated_at, cover_image, event_date, title, description, location, cta_text, cta_icon, cta_url, is_published, category_id, cta_target) FROM stdin;
41e77083-3a3b-49b3-bd34-476794cc5767	t	1	2026-07-19 16:16:15.715559+07	2026-07-19 16:16:15.715566+07		08/07/2026 - 11/07/2026	Xây dựng đề xuất, thuyết minh & dự toán nhiệm vụ KH&CN & ĐMST cấp tỉnh/thành phố	Khóa chuyên sâu hỗ trợ viên ngọi quy trình xây dựng đề xuất, thuyết minh và dự toán nhiệm vụ KH&CN & ĐMST cấp tỉnh/thành phố theo các yêu cầu thực tiễn.	Viện IRDM (Thực tế)	Xem sự kiện	arrow-right		t	0cb0cf05-8816-4776-a57c-860432aa5fac	_self
a0c83566-0b7d-4a92-a21c-addfd5d066e8	t	2	2026-07-19 16:16:15.728054+07	2026-07-19 16:16:15.728064+07		14/07/2026	Chuyển đổi số Bệnh viện: Từ chiến lược đến vận hành	Tập trung vào chiến lược chuyển hóa định hướng chuyển đổi số bệnh viện thành các buộc triển khai thực tế, gắn với dữ liệu, văn hóa và hỗ trợ quyết định.	Viện IRDM (Thực tế)	Xem sự kiện	arrow-right		t	0cb0cf05-8816-4776-a57c-860432aa5fac	_self
a952651c-b31c-4b57-a587-7b2cf01781c4	t	3	2026-07-19 16:16:15.731706+07	2026-07-19 16:16:15.731713+07		Di Động 7, 2024	Nghiệp vụ Thư ký Khoa học đề tài KH, Công nghệ & Đổi mới sáng tạo cấp tỉnh/thành phố	Hỗ trợ nắm vững vai trò và nghiệp vụ của thư ký khoa học trong quản lý hồ sơ, theo dõi quy trình và hỗ trợ triển khai nhiệm vụ KH&CN & ĐMST cấp tỉnh/thành phố.	Viện IRDM (Thực tế)	Xem sự kiện	arrow-right		t	0cb0cf05-8816-4776-a57c-860432aa5fac	_self
\.


--
-- TOC entry 6461 (class 0 OID 313162)
-- Dependencies: 337
-- Data for Name: knowledge_knowledgeevent_tags; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgeevent_tags (id, knowledgeevent_id, knowledgeeventtag_id) FROM stdin;
1	41e77083-3a3b-49b3-bd34-476794cc5767	0019467a-a1d4-4a54-b364-825c88840487
2	41e77083-3a3b-49b3-bd34-476794cc5767	e615549f-f63a-4d10-aa08-b6f5c5cb3aef
3	41e77083-3a3b-49b3-bd34-476794cc5767	01b584c0-cad6-422d-a03d-0bebd1492ae2
4	41e77083-3a3b-49b3-bd34-476794cc5767	ddc2d822-2087-4a33-a019-e8edde7360e3
5	a0c83566-0b7d-4a92-a21c-addfd5d066e8	edb0e9e5-ac73-4b81-80e4-f7150eb5a23c
6	a0c83566-0b7d-4a92-a21c-addfd5d066e8	9ad33128-af7d-4b4b-94c8-6b8bcc5c11aa
7	a0c83566-0b7d-4a92-a21c-addfd5d066e8	01b584c0-cad6-422d-a03d-0bebd1492ae2
8	a0c83566-0b7d-4a92-a21c-addfd5d066e8	e615549f-f63a-4d10-aa08-b6f5c5cb3aef
9	a952651c-b31c-4b57-a587-7b2cf01781c4	0019467a-a1d4-4a54-b364-825c88840487
10	a952651c-b31c-4b57-a587-7b2cf01781c4	e615549f-f63a-4d10-aa08-b6f5c5cb3aef
11	a952651c-b31c-4b57-a587-7b2cf01781c4	01b584c0-cad6-422d-a03d-0bebd1492ae2
12	a952651c-b31c-4b57-a587-7b2cf01781c4	ddc2d822-2087-4a33-a019-e8edde7360e3
\.


--
-- TOC entry 6463 (class 0 OID 313169)
-- Dependencies: 339
-- Data for Name: knowledge_knowledgeeventtag; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgeeventtag (id, is_active, display_order, created_at, updated_at, label, slug, color) FROM stdin;
ddc2d822-2087-4a33-a019-e8edde7360e3	t	1	2026-07-19 16:16:15.69937+07	2026-07-19 16:16:15.699386+07	Nguồn nhân lực	nguon-nhan-luc-evt	#3b82f6
01b584c0-cad6-422d-a03d-0bebd1492ae2	t	2	2026-07-19 16:16:15.704242+07	2026-07-19 16:16:15.704254+07	Cơ quan quản lý	co-quan-quan-ly-evt	#f97316
0019467a-a1d4-4a54-b364-825c88840487	t	3	2026-07-19 16:16:15.7059+07	2026-07-19 16:16:15.705906+07	Trường đại học	truong-dai-hoc-evt	#10b981
e615549f-f63a-4d10-aa08-b6f5c5cb3aef	t	4	2026-07-19 16:16:15.70715+07	2026-07-19 16:16:15.707156+07	Hệ thống y tế	he-thong-y-te-evt	#06b6d4
edb0e9e5-ac73-4b81-80e4-f7150eb5a23c	t	5	2026-07-19 16:16:15.7086+07	2026-07-19 16:16:15.708612+07	Y tế	y-te-evt	#ef4444
9ad33128-af7d-4b4b-94c8-6b8bcc5c11aa	t	6	2026-07-19 16:16:15.710098+07	2026-07-19 16:16:15.710105+07	AI, dữ liệu & chuyển đổi số	ai-du-lieu-evt	#6366f1
\.


--
-- TOC entry 6464 (class 0 OID 313181)
-- Dependencies: 340
-- Data for Name: knowledge_knowledgefeaturedarticle; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgefeaturedarticle (id, is_active, display_order, created_at, updated_at, article_id, listing_page_id, badge_text, cta_icon, cta_text, cta_url) FROM stdin;
489b7b52-2d36-4f72-ab51-13ba2ea1db08	t	1	2026-07-07 21:16:07.01414+07	2026-07-19 16:16:15.599334+07	a2a9cac5-e458-400b-b88f-5c23309f1e3e	32c588b5-da2e-41a1-b498-0b08a6dbec44	Góc nhìn ngành	arrow-right	Đọc bài viết	
102a5a1d-4976-452e-ad3e-6f8c971dad5a	t	2	2026-07-07 21:16:07.015738+07	2026-07-19 16:16:15.601863+07	eca018e3-78a1-43e5-b5ef-6bd8cd5d8c04	32c588b5-da2e-41a1-b498-0b08a6dbec44	Tóm lược chính sách	arrow-right	Đọc bài viết	
018b1cd8-f832-4637-9c8f-cb885f9e768c	t	3	2026-07-07 21:16:07.016557+07	2026-07-19 16:16:15.618504+07	cdbceec4-6019-4f66-9d47-1bc5bed11fc9	32c588b5-da2e-41a1-b498-0b08a6dbec44	Báo cáo & Tài liệu	download	Đăng ký tải tài liệu	#downloads
fd945536-f5b0-4a50-8610-3c9ad4691718	t	4	2026-07-18 10:09:12.729468+07	2026-07-19 16:16:15.621063+07	d3fbc854-e31d-45db-98f9-21759ab402ca	32c588b5-da2e-41a1-b498-0b08a6dbec44	Sự kiện	arrow-right	Xem sự kiện	/su-kien/
\.


--
-- TOC entry 6465 (class 0 OID 313198)
-- Dependencies: 341
-- Data for Name: knowledge_knowledgefiltergroup; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgefiltergroup (id, is_active, display_order, created_at, updated_at, title, param_key) FROM stdin;
40060a69-8781-4948-b608-91acd371f111	t	1	2026-07-18 00:13:59.539346+07	2026-07-19 16:16:15.834491+07	THEO LOẠI NỘI DUNG	ctype
aaa13e37-edc4-469c-a4aa-f2e70ab0e3aa	t	2	2026-07-18 00:14:28.58492+07	2026-07-19 16:16:15.847187+07	THEO CHỦ ĐỀ	topic
ab2a1c92-e3a1-48d5-92b6-3ee7fc3abecc	t	3	2026-07-18 00:14:28.593139+07	2026-07-19 16:16:15.857151+07	THEO NHÓM ĐỐI TÁC	partner
\.


--
-- TOC entry 6466 (class 0 OID 313209)
-- Dependencies: 342
-- Data for Name: knowledge_knowledgefilteritem; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgefilteritem (id, is_active, display_order, created_at, updated_at, label, value, color_default, color_active, group_id) FROM stdin;
ad856c17-8848-408b-97c6-391959b24d50	t	1	2026-07-18 00:13:59.542496+07	2026-07-19 16:16:15.839345+07	Công bố nghiên cứu	cong-bo-nghien-cuu	#6b7280	#f97316	40060a69-8781-4948-b608-91acd371f111
dec07d3c-aa56-41a7-a48b-a69b844201df	t	2	2026-07-18 00:13:59.544252+07	2026-07-19 16:16:15.840901+07	Góc nhìn ngành	goc-nhin-nganh	#6b7280	#f97316	40060a69-8781-4948-b608-91acd371f111
279ab95e-fb92-4994-94f8-67112a5a178a	t	3	2026-07-18 00:13:59.545394+07	2026-07-19 16:16:15.842185+07	Tóm lược chính sách	tom-luoc-chinh-sach	#6b7280	#f97316	40060a69-8781-4948-b608-91acd371f111
2733d700-1cea-402e-ad2d-1c10ac84fccb	t	4	2026-07-18 00:13:59.546468+07	2026-07-19 16:16:15.843434+07	Báo cáo & tài liệu	bao-cao-tai-lieu	#6b7280	#f97316	40060a69-8781-4948-b608-91acd371f111
0b0b2efd-591d-447c-85e7-bcb945f888ec	t	5	2026-07-18 00:13:59.547489+07	2026-07-19 16:16:15.844662+07	Tin IRDM	tin-irdm	#6b7280	#f97316	40060a69-8781-4948-b608-91acd371f111
813d6db9-b732-48f5-a8ec-ad52f9eef66e	t	6	2026-07-18 00:13:59.548498+07	2026-07-19 16:16:15.845879+07	Sự kiện	su-kien	#6b7280	#f97316	40060a69-8781-4948-b608-91acd371f111
e89e8304-0b12-456a-81ea-ab75e1bee7a1	t	1	2026-07-18 00:14:28.586262+07	2026-07-19 16:16:15.848529+07	Y tế	y-te	#6b7280	#f97316	aaa13e37-edc4-469c-a4aa-f2e70ab0e3aa
c770845c-ea33-48e6-95f2-05a03037c398	t	2	2026-07-18 00:14:28.587764+07	2026-07-19 16:16:15.84989+07	Giáo dục	giao-duc	#6b7280	#f97316	aaa13e37-edc4-469c-a4aa-f2e70ab0e3aa
5b887acf-7358-4a4b-87e2-8c2ef546b9b8	t	3	2026-07-18 00:14:28.58893+07	2026-07-19 16:16:15.851173+07	Môi trường & phát triển bền vững	moi-truong-phat-trien-ben-vung	#6b7280	#f97316	aaa13e37-edc4-469c-a4aa-f2e70ab0e3aa
2b4c9561-b326-414b-b9b4-8dfd24f759a0	t	4	2026-07-18 00:14:28.589983+07	2026-07-19 16:16:15.852846+07	AI, dữ liệu & chuyển đổi số	ai-du-lieu-chuyen-doi-so	#6b7280	#f97316	aaa13e37-edc4-469c-a4aa-f2e70ab0e3aa
96600362-fcc5-4306-864a-0f0cffaf9905	t	5	2026-07-18 00:14:28.591011+07	2026-07-19 16:16:15.854389+07	Sức khỏe tâm thần & wellbeing	suc-khoe-tam-than-wellbeing	#6b7280	#f97316	aaa13e37-edc4-469c-a4aa-f2e70ab0e3aa
c8cdaff6-0528-4458-b8b7-7c82073e8ac8	t	6	2026-07-18 00:14:28.592139+07	2026-07-19 16:16:15.855756+07	Nguồn nhân lực	nguon-nhan-luc	#6b7280	#f97316	aaa13e37-edc4-469c-a4aa-f2e70ab0e3aa
2f4df5a0-f587-4cef-be36-319876066b55	t	1	2026-07-18 00:14:28.594309+07	2026-07-19 16:16:15.858699+07	Cơ quan quản lý	co-quan-quan-ly	#6b7280	#f97316	ab2a1c92-e3a1-48d5-92b6-3ee7fc3abecc
18e0fde5-87ee-441f-8eb5-bf453409de76	t	2	2026-07-18 00:14:28.595388+07	2026-07-19 16:16:15.860132+07	Hệ thống y tế	he-thong-y-te	#6b7280	#f97316	ab2a1c92-e3a1-48d5-92b6-3ee7fc3abecc
b1343bc9-df2a-4fe6-9db7-810979b112e4	t	3	2026-07-18 00:14:28.5964+07	2026-07-19 16:16:15.861334+07	Trường đại học	truong-dai-hoc	#6b7280	#f97316	ab2a1c92-e3a1-48d5-92b6-3ee7fc3abecc
15aa0a03-fa52-401c-868c-012800bff4ec	t	4	2026-07-18 00:14:28.597449+07	2026-07-19 16:16:15.8626+07	Doanh nghiệp	doanh-nghiep	#6b7280	#f97316	ab2a1c92-e3a1-48d5-92b6-3ee7fc3abecc
33b16f66-ba2b-4923-baeb-306e2eb28cfc	t	5	2026-07-18 00:14:28.598441+07	2026-07-19 16:16:15.863989+07	Tổ chức quốc tế	to-chuc-quoc-te	#6b7280	#f97316	ab2a1c92-e3a1-48d5-92b6-3ee7fc3abecc
\.


--
-- TOC entry 6467 (class 0 OID 313223)
-- Dependencies: 343
-- Data for Name: knowledge_knowledgelistingpage; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgelistingpage (id, is_active, display_order, created_at, updated_at, section_label, heading, description, hero_image, search_enabled, featured_section_label, featured_section_heading, cta_sub, cta_heading, cta_background_image, cta_primary_label, cta_primary_url, cta_secondary_label, cta_secondary_url, meta_title, meta_description, filter_section_description, filter_section_heading, hero_cta_primary_label, hero_cta_primary_url, hero_cta_secondary_label, hero_cta_secondary_url, search_placeholder, featured_bg_decoration, featured_bg_image, featured_section_description, content_type_section_bg_decoration, content_type_section_bg_image, content_type_section_cta_icon, content_type_section_cta_text, content_type_section_cta_url, content_type_section_description, content_type_section_heading, content_type_section_label, topic_section_bg_decoration, topic_section_bg_image, topic_section_description, topic_section_heading, topic_section_label, pub_contact_address, pub_contact_city_image, pub_contact_cta_icon, pub_contact_cta_text, pub_contact_cta_url, pub_contact_description, pub_contact_email, pub_contact_phone, pub_contact_title, pub_form_button_icon, pub_form_button_text, pub_form_description, pub_form_email_label, pub_form_email_placeholder, pub_form_name_label, pub_form_name_placeholder, pub_form_note_label, pub_form_note_placeholder, pub_form_org_label, pub_form_org_placeholder, pub_form_privacy_note, pub_form_success_message, pub_form_title, pub_section_bg_decoration, pub_section_bg_image, pub_section_description, pub_section_heading, pub_section_label, news_activity_heading, news_events_heading, news_section_bg_decoration, news_section_bg_image, news_section_description, news_section_heading, news_section_label, press_section_bg_image, press_section_description, press_section_heading, press_section_label, ready_section_bg_image, ready_section_description, ready_section_is_active, ready_section_overlay_color, ready_section_overlay_opacity, ready_section_subtitle, ready_section_text_color, ready_section_title) FROM stdin;
32c588b5-da2e-41a1-b498-0b08a6dbec44	t	0	2026-07-07 21:16:06.990382+07	2026-07-19 16:16:15.589563+07	Knowledge Hub	Tri thức & Góc nhìn ngành	Nơi Viện IRDM chia sẻ nghiên cứu, phân tích bối cảnh, tóm lược chính sách và tài liệu ứng dụng trong y tế, giáo dục, môi trường và phát triển nguồn lực.\nCác nội dung được biên soạn nhằm hỗ trợ người đọc tiếp cận vấn đề một cách ngắn gọn, có cơ sở và hữu ích cho quá trình ra quyết định, thiết kế chương trình hoặc tìm kiếm cơ hội hợp tác.	knowledge/listing/knowledge/listing/hero_5DXdGB8.png	t	Nội dung nổi bật	Nội dung nổi bật	Hợp tác cùng IRDM	Bắt đầu hành trình chuyển đổi của bạn	knowledge/cta/knowledge/cta/cta_B0FYlX9.png	Liên hệ ngay	/lien-he/	Xem giải pháp	/giai-phap/	Tri thức & Góc nhìn ngành — IRDM	Nghiên cứu, phân tích chính sách và góc nhìn ngành từ IRDM.	Bộ lọc giúp người đọc tìm nhanh nội dung theo mục đích sử dụng, chủ đề quan tâm và nhóm đối tác liên quan.	Tìm nội dung phù hợp với nhu cầu của bạn	Khám phá tri thức →	#featured	Đăng ký tải tài liệu →	#downloads		knowledge/featured/deco/TriThuc_NoiDungNoiBat.png	knowledge/featured/bg/TriThuc_NoiDungNoiBat.png	Các bài viết, báo cáo và tài liệu được chọn lọc nhằm giúp người đọc tiếp cận nhanh những vấn đề chuyên môn có giá trị ứng dụng cao.			arrow-right	Xem tất cả năng lực	/tri-thuc-goc-nhin/	Các nhóm nội dung được Viện IRDM biên soạn và hệ thống hóa nhằm hỗ trợ người đọc tiếp cận tri thức theo nhu cầu: nghiên cứu, phân tích, chính sách, tài liệu ứng dụng, tin chuyên môn và sự kiện.	Khám phá theo Loại Nội Dung	KHÁM PHÁ THEO LOẠI NỘI DUNG			Các chủ đề trọng tâm phản ánh định hướng nghiên cứu, phổ biến tri thức và đồng hành triển khai của Viện IRDM trong y tế, giáo dục, môi trường, dữ liệu, wellbeing và phát triển nguồn lực.	Khám phá theo Chủ đề	KHÁM PHÁ THEO CHỦ ĐỀ	8C Trần Huy Liệu, Phường Phú Nhuận, TP.HCM		arrow-right	Liên hệ hợp tác	/lien-he/	Bạn cần thêm thông tin hoặc chưa rõ tài liệu nào phù hợp? Liên hệ với Viện IRDM để được hỗ trợ và gợi ý tài liệu theo nhu cầu.	vienncptnlv@irdm.edu.vn	(+84) 33 656 7701	Liên hệ trao đổi với Viện IRDM	send	Gửi yêu cầu	Vui lòng để lại thông tin cơ bản và ghi chú tài liệu bạn quan tâm. Viện IRDM sẽ ghi nhận yêu cầu và gửi tài liệu phù hợp tới email bạn cung cấp.	Email	Nhập email nhận tài liệu	Họ và tên	Nhập họ và tên của bạn	Ghi chú	Bạn có thể ghi loại tài liệu muốn nhận, lĩnh vực quan tâm hoặc lời nhắn cho Viện IRDM	Đơn vị công tác	Tên cơ quan, tổ chức, trường, bệnh viện hoặc doanh nghiệp	Viện IRDM sử dụng thông tin này để phản hồi yêu cầu tài liệu và hỗ trợ trao đổi chuyên môn khi phù hợp.	Cảm ơn bạn! Viện IRDM đã nhận được yêu cầu và sẽ gửi tài liệu phù hợp đến email của bạn.	Gửi yêu cầu nhận tài liệu			Các tài liệu được chọn lọc nhằm hỗ trợ người đọc ứng dụng tri thức vào quá trình ra quyết định, thiết kế chương trình hoặc trao đổi hợp tác.	Tài liệu tải về	Ấn phẩm & Báo cáo	Tin hoạt động IRDM	Sự kiện sắp diễn ra			Tin tức và sự kiện hỗ trợ người đọc theo dõi các hoạt động chuyên môn, hợp tác và diễn đàn mà IRDM tham gia hoặc tổ chức.	Tin tức & Sự kiện	IRDM trên báo chí và diễn đàn chuyên môn							t	#0d1e4a	0.82		light	
\.


--
-- TOC entry 6468 (class 0 OID 313328)
-- Dependencies: 344
-- Data for Name: knowledge_knowledgenewsitem; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgenewsitem (id, is_active, display_order, created_at, updated_at, title, slug, summary, thumbnail, published_date, source_url, is_published, category_id, cta_target, cta_text, is_press_article) FROM stdin;
b9110896-1e6c-4526-9d67-3c981c4b3e91	t	1	2026-07-07 21:16:07.045782+07	2026-07-19 16:16:15.640931+07	IRDM cung cấp dịch vụ thư ký khoa học cho Bệnh viện Nguyễn Tri Phương	irdm-cung-cap-dich-vu-thu-ky-khoa-hoc-nguyen-tri-phuong	Viện IRDM ký kết hợp đồng cung cấp dịch vụ thư ký khoa học, hỗ trợ nghiên cứu và quản lý tri thức tại Bệnh viện Nguyễn Tri Phương.	knowledge/news/knowledge/news/irdm-cung-cap-dich-vu-thu-ky-khoa-hoc-nguyen-tri-phuong_xwkfhEI.png	2024-06-15		t	0cb0cf05-8816-4776-a57c-860432aa5fac	_blank	Xem chi tiết	f
3d230c3c-c03d-4c9c-9b47-9775c2d958bd	t	2	2026-07-07 21:16:07.057952+07	2026-07-19 16:16:15.64723+07	IRDM hoàn thành báo cáo đánh giá nhu cầu năng lực nhân lực y tế TP.HCM	irdm-hoan-thanh-bao-cao-nhu-cau-nhan-luc-y-te-tphcm	Báo cáo đánh giá toàn diện về nhu cầu đào tạo và phát triển năng lực nhân lực y tế tại TP.HCM giai đoạn 2024-2030.	knowledge/news/knowledge/news/irdm-hoan-thanh-bao-cao-nhu-cau-nhan-luc-y-te-tphcm_5IYk1DH.png	2024-05-28		t	0cb0cf05-8816-4776-a57c-860432aa5fac	_blank	Xem chi tiết	f
d4855ea0-1c40-4055-8dd9-51ccb89e7278	t	3	2026-07-07 21:16:07.068232+07	2026-07-19 16:16:15.650876+07	IRDM ký kết hợp tác với Đại học Y Dược TP.HCM trong nghiên cứu ứng dụng	irdm-ky-ket-hop-tac-dai-hoc-y-duoc-tphcm	Lễ ký kết biên bản ghi nhớ hợp tác nghiên cứu ứng dụng giữa Viện IRDM và Đại học Y Dược TP.HCM.	knowledge/news/knowledge/news/irdm-ky-ket-hop-tac-dai-hoc-y-duoc-tphcm_Rde4Etn.png	2024-05-10		t	0cb0cf05-8816-4776-a57c-860432aa5fac	_blank	Xem chi tiết	f
decc660b-f349-42ec-bc0e-5728e6535406	t	4	2026-07-07 21:16:07.077347+07	2026-07-19 16:16:15.655644+07	Tóm lược Hội thảo Wellbeing trong y tế và giáo dục 2024	tom-luoc-hoi-thao-wellbeing-y-te-giao-duc-2024	Những điểm nhấn từ hội thảo quốc gia về wellbeing nhân viên y tế và giáo dục, tổ chức tháng 4/2024.	knowledge/news/knowledge/news/tom-luoc-hoi-thao-wellbeing-y-te-giao-duc-2024_KdcqKeq.png	2024-04-20		t	0cb0cf05-8816-4776-a57c-860432aa5fac	_blank	Xem chi tiết	f
fa1b9905-6cd4-4427-801c-25f714eaab59	t	5	2026-07-07 21:16:07.089805+07	2026-07-19 16:16:15.659678+07	Chuyên gia IRDM: 'Wellbeing không phải là phúc lợi, mà là đầu tư cho năng lực phục hồi'	chuyen-gia-irdm-wellbeing-dau-tu-nang-luc-phuc-hoi	Phỏng vấn chuyên gia IRDM về tầm quan trọng của wellbeing trong tổ chức y tế và giáo dục.	knowledge/news/knowledge/news/chuyen-gia-irdm-wellbeing-dau-tu-nang-luc-phuc-hoi_SSOsAbx.png	2024-06-05		t	cb345c35-f226-4e3b-9c82-a18d41ea53cb	_blank	Xem chi tiết	f
84afad0a-d000-4281-b03f-25edb954ebbf	t	6	2026-07-07 21:16:07.100533+07	2026-07-19 16:16:15.663442+07	Dữ liệu bệnh viện và bài toán chuyển đổi số: góc nhìn từ nghiên cứu ứng dụng	du-lieu-benh-vien-bai-toan-chuyen-doi-so-nghien-cuu-ung-dung	Bài viết trên diễn đàn chuyên môn về hành trình chuyển đổi số dữ liệu bệnh viện từ góc nhìn nghiên cứu ứng dụng.	knowledge/news/knowledge/news/du-lieu-benh-vien-bai-toan-chuyen-doi-so-nghien-cuu-ung-du_rKpm2q1.png	2024-05-25		t	ac329527-ac0d-4f05-bf29-4d96a03f54c9	_blank	Xem chi tiết	f
dce5f7ee-1332-46b0-9f2a-3b0166a10add	t	7	2026-07-07 21:16:07.109641+07	2026-07-19 16:16:15.667008+07	IRDM tham luận tại Hội nghị Quốc gia về đổi mới sáng tạo trong y tế và giáo dục 2024	irdm-tham-luan-hoi-nghi-quoc-gia-doi-moi-sang-tao-2024	Đại diện Viện IRDM trình bày tham luận về ứng dụng nghiên cứu và đổi mới sáng tạo trong phát triển hệ thống y tế.	knowledge/news/knowledge/news/irdm-tham-luan-hoi-nghi-quoc-gia-doi-moi-sang-tao-2024_MkWeoy9.png	2024-05-12		t	0cb0cf05-8816-4776-a57c-860432aa5fac	_blank	Xem chi tiết	f
8ac83a5a-2b90-4c83-a261-72149d2e553f	t	8	2026-07-07 21:16:07.119831+07	2026-07-19 16:16:15.670795+07	Báo cáo mới về xu hướng ESG tại Việt Nam 2024	bao-cao-moi-esg-viet-nam-2024	Tổng quan các xu hướng ESG đang định hình hoạt động của tổ chức y tế và doanh nghiệp tại Việt Nam.	knowledge/news/knowledge/news/bao-cao-moi-esg-viet-nam-2024_5Z8hDt0.png	2024-04-30		t	2677a27f-169f-4749-816c-234a8075dd0b	_blank	Xem chi tiết	f
\.


--
-- TOC entry 6469 (class 0 OID 313348)
-- Dependencies: 345
-- Data for Name: knowledge_knowledgenewsitem_topics; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgenewsitem_topics (id, knowledgenewsitem_id, knowledgetopic_id) FROM stdin;
1	b9110896-1e6c-4526-9d67-3c981c4b3e91	15beced7-8d20-4c4a-89c6-fc013e2bed92
2	3d230c3c-c03d-4c9c-9b47-9775c2d958bd	15beced7-8d20-4c4a-89c6-fc013e2bed92
3	3d230c3c-c03d-4c9c-9b47-9775c2d958bd	79293fb2-e89e-43ad-831c-dd7b7206411b
4	d4855ea0-1c40-4055-8dd9-51ccb89e7278	d0266422-5241-4b31-b70d-c90025cd6417
5	d4855ea0-1c40-4055-8dd9-51ccb89e7278	15beced7-8d20-4c4a-89c6-fc013e2bed92
6	decc660b-f349-42ec-bc0e-5728e6535406	762639d2-de93-496a-9b79-305f6d775c9d
7	fa1b9905-6cd4-4427-801c-25f714eaab59	762639d2-de93-496a-9b79-305f6d775c9d
8	84afad0a-d000-4281-b03f-25edb954ebbf	66c6582a-7970-4996-9f05-9d788cdec6cb
9	84afad0a-d000-4281-b03f-25edb954ebbf	15beced7-8d20-4c4a-89c6-fc013e2bed92
10	dce5f7ee-1332-46b0-9f2a-3b0166a10add	d0266422-5241-4b31-b70d-c90025cd6417
11	dce5f7ee-1332-46b0-9f2a-3b0166a10add	15beced7-8d20-4c4a-89c6-fc013e2bed92
12	8ac83a5a-2b90-4c83-a261-72149d2e553f	c9824ad1-b71a-4d6d-a839-0bd628e3819f
\.


--
-- TOC entry 6471 (class 0 OID 313355)
-- Dependencies: 347
-- Data for Name: knowledge_knowledgetopic; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgetopic (id, is_active, display_order, created_at, updated_at, label, slug, description, icon, is_published, cover_image) FROM stdin;
84998d33-9fbb-486f-b6be-7bea52ca274e	t	0	2026-07-18 22:26:55.643597+07	2026-07-18 22:26:55.643615+07	Hệ thống y tế	h-thng-y-t	Hệ thống y tế		f	
d0266422-5241-4b31-b70d-c90025cd6417	t	2	2026-07-07 21:16:06.468469+07	2026-07-19 16:16:15.525948+07	Giáo dục	giao-duc			t	knowledge/topics/knowledge/topics/giao-duc_JLd4mSC.png
c9824ad1-b71a-4d6d-a839-0bd628e3819f	t	3	2026-07-07 21:16:06.476832+07	2026-07-19 16:16:15.527433+07	Môi trường & phát triển bền vững	moi-truong-phat-trien-ben-vung			t	knowledge/topics/knowledge/topics/moi-truong-phat-trien-ben-vung_tr3aLsN.png
66c6582a-7970-4996-9f05-9d788cdec6cb	t	4	2026-07-07 21:16:06.486719+07	2026-07-19 16:16:15.529002+07	AI, dữ liệu & chuyển đổi số	ai-du-lieu-chuyen-doi-so			t	knowledge/topics/knowledge/topics/ai-du-lieu-chuyen-doi-so_v0BkMA4.png
762639d2-de93-496a-9b79-305f6d775c9d	t	5	2026-07-07 21:16:06.495227+07	2026-07-19 16:16:15.531166+07	Sức khỏe tâm thần & wellbeing	suc-khoe-tam-than-wellbeing			t	knowledge/topics/knowledge/topics/suc-khoe-tam-than-wellbeing_6IIILCz.png
79293fb2-e89e-43ad-831c-dd7b7206411b	t	6	2026-07-07 21:16:06.503292+07	2026-07-19 16:16:15.533998+07	Nguồn nhân lực	nguon-nhan-luc			t	knowledge/topics/knowledge/topics/nguon-nhan-luc_jONxLW3.png
15beced7-8d20-4c4a-89c6-fc013e2bed92	t	1	2026-07-07 21:16:06.456803+07	2026-08-09 22:51:35.926318+07	Y tế	y-te			t	knowledge/topics/knowledge/topics/y-te_UHg8po9.png
\.


--
-- TOC entry 6472 (class 0 OID 313372)
-- Dependencies: 348
-- Data for Name: knowledge_knowledgetopiccard; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgetopiccard (id, is_active, display_order, created_at, updated_at, cover_image, icon, title, description, cta_text, cta_icon, cta_url, is_published, listing_page_id, topic_id) FROM stdin;
cd36258d-69c7-4ff6-b94e-a2037918c94b	t	1	2026-07-18 23:57:04.835406+07	2026-08-09 23:01:09.193973+07	knowledge/topic_cards/Y_tế.png	heart	Y tế	Dữ liệu y tế, quản trị bệnh viện, chuyển đổi số, sức khỏe nhân viên y tế và cải tiến hệ thống.	Xem nội dung liên quan	arrow-right	?topic=y-te	t	32c588b5-da2e-41a1-b498-0b08a6dbec44	15beced7-8d20-4c4a-89c6-fc013e2bed92
dccc4005-14fc-4500-abb2-f9a9e2c42a4a	t	2	2026-07-18 23:57:04.840372+07	2026-08-09 23:01:20.875325+07	knowledge/topic_cards/Giáo_dục.png	academic-cap	Giáo dục	Môi trường học thuật, phát triển người học, năng lực nghề nghiệp, E-Learning, đổi mới đào tạo, sức khỏe tâm thần sinh viên và phát triển đội ngũ.	Xem nội dung liên quan	arrow-right	?topic=giao-duc	t	32c588b5-da2e-41a1-b498-0b08a6dbec44	d0266422-5241-4b31-b70d-c90025cd6417
34647d7f-952c-496a-8c80-fe9d439a49c5	t	3	2026-07-18 23:57:04.842965+07	2026-08-09 23:01:31.298009+07	knowledge/topic_cards/Môi_trường__phát_triển_bền_vững.png	globe-alt	Môi trường & phát triển bền vững	ESG, Green University, Green Hospital, sức khỏe môi trường và mô hình phục hồi.	Xem nội dung liên quan	arrow-right	?topic=moi-truong-phat-trien-ben-vung	t	32c588b5-da2e-41a1-b498-0b08a6dbec44	c9824ad1-b71a-4d6d-a839-0bd628e3819f
75b848fc-1adf-4f43-a315-23be0a6df481	t	4	2026-07-18 23:57:04.845707+07	2026-08-09 23:01:58.382911+07	knowledge/topic_cards/AI_dữ_liệu__chuyển_đổi_số.png	cpu-chip	AI, dữ liệu & chuyển đổi số	Use case, dashboard, nền tảng dữ liệu, hỗ trợ ra quyết định và lộ trình thí điểm công nghệ.	Xem nội dung liên quan	arrow-right	?topic=ai-du-lieu-chuyen-doi-so	t	32c588b5-da2e-41a1-b498-0b08a6dbec44	66c6582a-7970-4996-9f05-9d788cdec6cb
20758bc8-6c42-454a-86d5-1b7152f55da7	t	5	2026-07-18 23:57:04.84796+07	2026-08-09 23:02:07.944247+07	knowledge/topic_cards/Sức_khỏe_tâm_thần__wellbeing.png	heart-pulse	Sức khỏe tâm thần & wellbeing	Nghiên cứu, truyền thống, hỗ trợ sớm, hỗ trợ đồng đẳng và môi trường học tập – làm việc lành mạnh.	Xem nội dung liên quan	arrow-right	?topic=suc-khoe-tam-than-wellbeing	t	32c588b5-da2e-41a1-b498-0b08a6dbec44	762639d2-de93-496a-9b79-305f6d775c9d
df11e1bf-9dd1-47df-8ef2-2184eb5eafc0	t	6	2026-07-18 23:57:04.849992+07	2026-08-09 23:02:19.580651+07	knowledge/topic_cards/Nguồn_nhân_lực.png	users	Nguồn nhân lực	Phát triển năng lực, học tập suốt đời, quản trị con người và chuyển hóa hành vi trong tổ chức.	Xem nội dung liên quan	arrow-right	?topic=nguon-nhan-luc	t	32c588b5-da2e-41a1-b498-0b08a6dbec44	79293fb2-e89e-43ad-831c-dd7b7206411b
\.


--
-- TOC entry 6473 (class 0 OID 313392)
-- Dependencies: 349
-- Data for Name: knowledge_knowledgetopiccard_tags; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgetopiccard_tags (id, knowledgetopiccard_id, knowledgetopiccardtag_id) FROM stdin;
1	cd36258d-69c7-4ff6-b94e-a2037918c94b	77c46a1f-ac4e-4ff8-9f51-e43463179868
2	cd36258d-69c7-4ff6-b94e-a2037918c94b	5dcd2674-5e15-4d90-a01c-5e53b67e855f
3	cd36258d-69c7-4ff6-b94e-a2037918c94b	763b266b-4f8d-43a8-99f4-dea20bc5d3e4
4	cd36258d-69c7-4ff6-b94e-a2037918c94b	222c10b2-1b66-4109-9c16-417d691a771a
5	dccc4005-14fc-4500-abb2-f9a9e2c42a4a	dfd31bbc-b89f-4fd7-9d98-a1400b77e725
6	dccc4005-14fc-4500-abb2-f9a9e2c42a4a	8d010ef4-3112-4d03-a462-54d920a1d144
7	dccc4005-14fc-4500-abb2-f9a9e2c42a4a	78954923-d12e-422b-a6f6-0fa22605fd33
8	dccc4005-14fc-4500-abb2-f9a9e2c42a4a	763b266b-4f8d-43a8-99f4-dea20bc5d3e4
9	34647d7f-952c-496a-8c80-fe9d439a49c5	8d010ef4-3112-4d03-a462-54d920a1d144
10	34647d7f-952c-496a-8c80-fe9d439a49c5	97e2e565-3f18-478e-833a-e2c159b28d20
11	34647d7f-952c-496a-8c80-fe9d439a49c5	7f022f5b-88d2-4536-a657-f72b467e2208
12	34647d7f-952c-496a-8c80-fe9d439a49c5	222c10b2-1b66-4109-9c16-417d691a771a
13	75b848fc-1adf-4f43-a315-23be0a6df481	97e2e565-3f18-478e-833a-e2c159b28d20
14	75b848fc-1adf-4f43-a315-23be0a6df481	5dcd2674-5e15-4d90-a01c-5e53b67e855f
15	75b848fc-1adf-4f43-a315-23be0a6df481	7f022f5b-88d2-4536-a657-f72b467e2208
16	75b848fc-1adf-4f43-a315-23be0a6df481	222c10b2-1b66-4109-9c16-417d691a771a
17	20758bc8-6c42-454a-86d5-1b7152f55da7	8d010ef4-3112-4d03-a462-54d920a1d144
18	20758bc8-6c42-454a-86d5-1b7152f55da7	78954923-d12e-422b-a6f6-0fa22605fd33
19	20758bc8-6c42-454a-86d5-1b7152f55da7	222c10b2-1b66-4109-9c16-417d691a771a
20	20758bc8-6c42-454a-86d5-1b7152f55da7	97e2e565-3f18-478e-833a-e2c159b28d20
21	20758bc8-6c42-454a-86d5-1b7152f55da7	7f022f5b-88d2-4536-a657-f72b467e2208
22	df11e1bf-9dd1-47df-8ef2-2184eb5eafc0	8d010ef4-3112-4d03-a462-54d920a1d144
23	df11e1bf-9dd1-47df-8ef2-2184eb5eafc0	763b266b-4f8d-43a8-99f4-dea20bc5d3e4
24	df11e1bf-9dd1-47df-8ef2-2184eb5eafc0	222c10b2-1b66-4109-9c16-417d691a771a
25	df11e1bf-9dd1-47df-8ef2-2184eb5eafc0	787b12ec-b40a-4a0d-a879-fa5f62ac790e
26	df11e1bf-9dd1-47df-8ef2-2184eb5eafc0	7f022f5b-88d2-4536-a657-f72b467e2208
\.


--
-- TOC entry 6475 (class 0 OID 313399)
-- Dependencies: 351
-- Data for Name: knowledge_knowledgetopiccardtag; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.knowledge_knowledgetopiccardtag (id, is_active, display_order, created_at, updated_at, label, slug, color) FROM stdin;
77c46a1f-ac4e-4ff8-9f51-e43463179868	t	1	2026-07-18 23:57:04.824461+07	2026-07-19 16:16:15.792766+07	AI, dữ liệu & chuyển đổi số	tc-ai-du-lieu	#3b82f6
763b266b-4f8d-43a8-99f4-dea20bc5d3e4	t	2	2026-07-18 23:57:04.826989+07	2026-07-19 16:16:15.794219+07	Sức khỏe tâm thần & wellbeing	tc-suc-khoe-tam-than	#8b5cf6
222c10b2-1b66-4109-9c16-417d691a771a	t	3	2026-07-18 23:57:04.827958+07	2026-07-19 16:16:15.795364+07	Hệ thống y tế	tc-he-thong-y-te	#06b6d4
5dcd2674-5e15-4d90-a01c-5e53b67e855f	t	4	2026-07-18 23:57:04.828666+07	2026-07-19 16:16:15.796482+07	Cơ quan quản lý	tc-co-quan-quan-ly	#f97316
8d010ef4-3112-4d03-a462-54d920a1d144	t	5	2026-07-18 23:57:04.829353+07	2026-07-19 16:16:15.79755+07	Trường đại học	tc-truong-dai-hoc	#10b981
dfd31bbc-b89f-4fd7-9d98-a1400b77e725	t	6	2026-07-18 23:57:04.830031+07	2026-07-19 16:16:15.798608+07	Tổ chức quốc tế	tc-to-chuc-quoc-te	#6366f1
787b12ec-b40a-4a0d-a879-fa5f62ac790e	t	7	2026-07-18 23:57:04.83069+07	2026-07-19 16:16:15.800148+07	Doanh nghiệp	tc-doanh-nghiep	#f59e0b
78954923-d12e-422b-a6f6-0fa22605fd33	t	8	2026-07-18 23:57:04.831351+07	2026-07-19 16:16:15.801273+07	Nguồn nhân lực	tc-nguon-nhan-luc	#84cc16
97e2e565-3f18-478e-833a-e2c159b28d20	t	9	2026-07-18 23:57:04.832008+07	2026-07-19 16:16:15.802734+07	Y tế	tc-y-te	#ef4444
7f022f5b-88d2-4536-a657-f72b467e2208	t	10	2026-07-18 23:57:04.832669+07	2026-07-19 16:16:15.804618+07	Giáo dục	tc-giao-duc	#22d3ee
\.


--
-- TOC entry 6476 (class 0 OID 313411)
-- Dependencies: 352
-- Data for Name: solution_solution; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.solution_solution (id, is_active, display_order, created_at, updated_at, title, slug, section_label, summary, thumbnail, hero_image, description, challenge_label, methodology_label, output_label, capability_label, cta_heading, cta_sub, cta_primary_label, cta_primary_url, cta_secondary_label, cta_secondary_url, is_published, meta_title, meta_description, meta_keywords, cta_image, card_color) FROM stdin;
7c8bba25-4029-42eb-b006-5f16d7492174	t	2	2026-07-05 00:28:32.961005+07	2026-08-10 23:04:24.011783+07	Hệ thống y tế	he-thong-y-te	Giải pháp	Làm rõ bài toán ưu tiên, dữ liệu sẵn có và lộ trình thí điểm phù hợp để hỗ trợ quản trị, chất lượng dịch vụ, phát triển đội ngũ và nhiệm vụ KHCN & ĐMST.	solution/thumbnails/solution-thumb-he-thong-y-te_eL25rox.png	solution/hero/solution-hero-he-thong-y-te_2CZHF1j.png	Viện IRDM đồng hành cùng bệnh viện và các tổ chức y tế trong việc làm rõ bài toán vận hành, dữ liệu, chất lượng dịch vụ, phát triển đội ngũ và định hướng đổi mới phù hợp với điều kiện triển khai thực tế.	Các thách thức trọng tâm	Viện IRDM đồng hành như thế nào?	Đầu ra có thể bao gồm	Năng lực liên quan	Trao đổi về bài toán y tế	Sẵn sàng trao đổi?	Liên hệ trao đổi	/lien-he/	Khám phá năng lực nghiên cứu & dữ liệu	/capabilities/nghien-cuu-ung-dung-va-khoa-hoc-du-lieu/	t	Giải pháp cho Hệ thống y tế — IRDM	Hỗ trợ bệnh viện và tổ chức y tế làm rõ bài toán dữ liệu, chất lượng dịch vụ và phát triển đội ngũ.		solution/cta/solution-cta-he-thong-y-te_TuMDSx6.png	from-teal-900 to-cyan-800
6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	t	4	2026-07-05 00:28:32.983928+07	2026-08-10 23:04:58.881867+07	Doanh nghiệp	doanh-nghiep	Giải pháp	Thiết kế các sáng kiến phát triển con người, năng lực làm việc, văn hóa phối hợp và trách nhiệm xã hội gắn với mục tiêu tổ chức.	solution/thumbnails/solution-thumb-doanh-nghiep_b4kKjG6.png	solution/hero/solution-hero-doanh-nghiep_mb9JVdv.png	Viện IRDM đồng hành cùng doanh nghiệp trong các nội dung phù hợp với định hướng hoạt động của Viện, đặc biệt là phát triển năng lực đội ngũ, khai thác dữ liệu tổ chức, xây dựng môi trường làm việc lành mạnh và tích hợp yếu tố con người vào phát triển bền vững.	Các thách thức trọng tâm	Viện IRDM đồng hành như thế nào?	Đầu ra có thể bao gồm	Năng lực liên quan	Trao đổi về bài toán doanh nghiệp	Sẵn sàng trao đổi?	Liên hệ trao đổi	/lien-he/	Khám phá năng lực phát triển năng lực	/capabilities/giao-duc-va-phat-trien-nang-luc/	t	Giải pháp cho Doanh nghiệp — IRDM	Phát triển năng lực đội ngũ, wellbeing và chuyển đổi lấy con người làm trung tâm cho doanh nghiệp.		solution/cta/solution-cta-doanh-nghiep_tvTgKlZ.png	from-amber-950 to-orange-900
2f00571a-2c96-46fa-ad12-3aabfd52de57	t	5	2026-07-05 00:28:32.994882+07	2026-08-10 23:05:23.375498+07	Tổ chức quốc tế & NGO	to-chuc-quoc-te-va-ngo	Giải pháp	Kết nối tri thức quốc tế với bối cảnh Việt Nam để thiết kế, triển khai và đánh giá các sáng kiến liên ngành có khả năng duy trì.	solution/thumbnails/solution-thumb-to-chuc-quoc-te-va-ngo_fWdrqc2.png	solution/hero/solution-hero-to-chuc-quoc-te-va-ngo_qT9uvcU.png	Viện IRDM đồng hành cùng tổ chức quốc tế và NGO trong việc điều phối nghiên cứu, thiết kế và đánh giá các chương trình can thiệp phù hợp bối cảnh địa phương, kết nối bằng chứng toàn cầu với thực tiễn triển khai tại Việt Nam.	Các thách thức trọng tâm	Viện IRDM đồng hành như thế nào?	Đầu ra có thể bao gồm	Năng lực liên quan	Trao đổi về hợp tác quốc tế	Sẵn sàng trao đổi?	Liên hệ trao đổi	/lien-he/	Khám phá năng lực nghiên cứu & dữ liệu	/capabilities/nghien-cuu-ung-dung-va-khoa-hoc-du-lieu/	t	Giải pháp cho Tổ chức quốc tế & NGO — IRDM	Kết nối tri thức quốc tế với bối cảnh Việt Nam cho các sáng kiến liên ngành có khả năng duy trì.		solution/cta/solution-cta-to-chuc-quoc-te-va-ngo_dL8H3eO.png	from-emerald-950 to-teal-900
b1610548-78b7-41e9-94e5-5aeccd0cb124	t	1	2026-07-05 00:28:32.935264+07	2026-08-10 23:03:35.646997+07	Cơ quan quản lý & Chính sách	co-quan-quan-ly-va-chinh-sach	Giải pháp	Củng cố căn cứ khoa học, dữ liệu và cơ chế phối hợp cho các chương trình, đề án và nhiệm vụ KHCN & ĐMST.	solution/thumbnails/solution-thumb-co-quan-quan-ly-va-chinh-sach_9YQBjG9.png	solution/hero/solution-hero-co-quan-quan-ly-va-chinh-sach_uPLjc0t.png	Viện IRDM đồng hành cùng cơ quan quản lý trong việc chuyển hóa vấn đề thực tiễn, dữ liệu hiện có và ưu tiên phát triển thành căn cứ ra quyết định, đề án hành động, mô hình thí điểm và nhiệm vụ khoa học, công nghệ và đổi mới sáng tạo có khả năng triển khai.	Các thách thức trọng tâm	Viện IRDM đồng hành như thế nào?	Đầu ra có thể bao gồm	Năng lực liên quan	Trao đổi về bài toán chính sách	Sẵn sàng trao đổi?	Liên hệ trao đổi	/lien-he/	Khám phá năng lực nghiên cứu & dữ liệu	/capabilities/nghien-cuu-ung-dung-va-khoa-hoc-du-lieu/	t	Giải pháp cho Cơ quan quản lý & Chính sách — IRDM	Củng cố căn cứ khoa học, dữ liệu và cơ chế phối hợp cho chương trình, đề án và nhiệm vụ KHCN & ĐMST.		solution/cta/solution-cta-co-quan-quan-ly-va-chinh-sach_kTRW7G9.png	from-blue-950 to-blue-800
004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	t	3	2026-07-05 00:28:32.971831+07	2026-08-10 23:04:40.760099+07	Trường đại học & Giáo dục	truong-dai-hoc-va-giao-duc	Giải pháp	Hỗ trợ nhà trường đổi mới chương trình, phát triển người học, khai thác dữ liệu giáo dục và xây dựng môi trường học thuật lành mạnh.	solution/thumbnails/solution-thumb-truong-dai-hoc-va-giao-duc_rggtJP8.png	solution/hero/solution-hero-truong-dai-hoc-va-giao-duc_FalhB7N.png	Viện IRDM đồng hành cùng trường đại học và các cơ sở giáo dục trong việc kết nối dữ liệu, chương trình đào tạo, trải nghiệm người học, phát triển đội ngũ và định hướng bền vững thành các giải pháp giáo dục phù hợp với bối cảnh triển khai thực tế.	Các thách thức trọng tâm	Viện IRDM đồng hành như thế nào?	Đầu ra có thể bao gồm	Năng lực liên quan	Trao đổi về bài toán giáo dục	Sẵn sàng trao đổi?	Liên hệ trao đổi	/lien-he/	Khám phá năng lực giáo dục & phát triển năng lực	/capabilities/giao-duc-va-phat-trien-nang-luc/	t	Giải pháp cho Trường đại học & Giáo dục — IRDM	Hỗ trợ đổi mới chương trình, phát triển người học và xây dựng môi trường học thuật lành mạnh.		solution/cta/solution-cta-truong-dai-hoc-va-giao-duc_NiBrNJy.png	from-purple-900 to-violet-800
\.


--
-- TOC entry 6477 (class 0 OID 313445)
-- Dependencies: 353
-- Data for Name: solution_solution_related_capabilities; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.solution_solution_related_capabilities (id, solution_id, capability_id) FROM stdin;
136	b1610548-78b7-41e9-94e5-5aeccd0cb124	7e373022-f6d5-4fe4-8011-b2a84b1e0126
137	b1610548-78b7-41e9-94e5-5aeccd0cb124	5c66a894-c096-431f-812d-5700d3c94cc7
138	b1610548-78b7-41e9-94e5-5aeccd0cb124	692ac4e1-bc3d-4186-a610-92fe26fa7638
139	7c8bba25-4029-42eb-b006-5f16d7492174	7e373022-f6d5-4fe4-8011-b2a84b1e0126
140	7c8bba25-4029-42eb-b006-5f16d7492174	5c66a894-c096-431f-812d-5700d3c94cc7
141	7c8bba25-4029-42eb-b006-5f16d7492174	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
142	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	692ac4e1-bc3d-4186-a610-92fe26fa7638
143	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	7e373022-f6d5-4fe4-8011-b2a84b1e0126
144	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
145	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	692ac4e1-bc3d-4186-a610-92fe26fa7638
146	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	5ab16d24-513c-49d2-b2d8-4e63575d6ca5
147	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	6be3c227-fe07-4f5d-94cc-d5e2332ecf02
148	2f00571a-2c96-46fa-ad12-3aabfd52de57	7e373022-f6d5-4fe4-8011-b2a84b1e0126
149	2f00571a-2c96-46fa-ad12-3aabfd52de57	303c00b4-4917-41d4-8fa4-c014a9c0da18
150	2f00571a-2c96-46fa-ad12-3aabfd52de57	2c2afc67-a579-4f42-ab1c-53491b6e6666
\.


--
-- TOC entry 6479 (class 0 OID 313452)
-- Dependencies: 355
-- Data for Name: solution_solutionapproachstep; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.solution_solutionapproachstep (id, is_active, display_order, created_at, updated_at, number, title, description, icon) FROM stdin;
23fb7ff9-eb44-465b-8a32-f163c7b4b42a	t	1	2026-07-05 00:28:32.928094+07	2026-07-11 15:18:08.423798+07	1	Bối cảnh thực tế	Hiểu đúng bối cảnh vận hành, nhu cầu và điều kiện triển khai của từng đối tác.	magnifying-glass
33cc3356-1cfa-44a0-9ccd-dedd10861c9d	t	2	2026-07-05 00:28:32.929642+07	2026-07-11 15:18:08.425215+07	2	Bằng chứng & dữ liệu	Rà soát dữ liệu, tổng hợp bằng chứng và thiết kế khung phân tích phù hợp.	chart-bar
8da9b419-9ca1-42a8-845c-46947acf2432	t	3	2026-07-05 00:28:32.930595+07	2026-07-11 15:18:08.426179+07	3	Đồng thiết kế giải pháp	Kết nối chuyên gia, dữ liệu và kinh nghiệm triển khai để hình thành giải pháp.	squares-2x2
22a62fb0-d242-4109-b9e3-619cd8f6f99b	t	4	2026-07-05 00:28:32.931518+07	2026-07-11 15:18:08.427163+07	4	Thí điểm & đánh giá	Triển khai thí điểm trong điều kiện thực tế, theo dõi kết quả và điều chỉnh.	beaker
8474d2d5-c513-4e83-91c8-a4c0059f34d2	t	5	2026-07-05 00:28:32.932478+07	2026-07-11 15:18:08.428108+07	5	Chuyển giao / mở rộng	Chuyển kết quả thành giải pháp có thể sử dụng lâu dài trong tổ chức hoặc hệ thống.	arrow-trending-up
\.


--
-- TOC entry 6480 (class 0 OID 313468)
-- Dependencies: 356
-- Data for Name: solution_solutionchallenge; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.solution_solutionchallenge (id, is_active, display_order, created_at, updated_at, number, content, solution_id) FROM stdin;
986d6bca-bc69-43f7-a85d-c1a7bf196fa3	t	1	2026-07-11 15:18:08.473779+07	2026-07-11 15:18:08.473784+07	1	Dữ liệu và kinh nghiệm thực tiễn chưa được chuyển hóa thành căn cứ chính sách rõ ràng.	b1610548-78b7-41e9-94e5-5aeccd0cb124
3c133bd9-7447-4d54-a95f-030e309f631a	t	2	2026-07-11 15:18:08.480244+07	2026-07-11 15:18:08.480253+07	2	Nhu cầu đặt hàng nhiệm vụ KHCN & ĐMST cần được thiết kế sát với năng lực thực thi.	b1610548-78b7-41e9-94e5-5aeccd0cb124
adac1d33-b565-458e-822f-32163208b970	t	3	2026-07-11 15:18:08.480791+07	2026-07-11 15:18:08.480795+07	3	Các bài toán chính sách ngày càng mang tính liên ngành.	b1610548-78b7-41e9-94e5-5aeccd0cb124
bc0c448d-2743-4f66-9a74-a9984fee5f6d	t	4	2026-07-11 15:18:08.481131+07	2026-07-11 15:18:08.481134+07	4	Thiếu framework đánh giá tác động và hiệu quả chương trình sau triển khai.	b1610548-78b7-41e9-94e5-5aeccd0cb124
b6d98ca8-7c6d-48d3-a5d3-748907c90b99	t	5	2026-07-11 15:18:08.481489+07	2026-07-11 15:18:08.481493+07	5	Nhu cầu phát triển năng lực đội ngũ cho tư duy dữ liệu và phân tích chính sách.	b1610548-78b7-41e9-94e5-5aeccd0cb124
621b270a-bbc7-4669-a8a3-930082bce42f	t	1	2026-07-11 15:18:08.756342+07	2026-07-11 15:18:08.756346+07	1	Dữ liệu y tế và dữ liệu vận hành còn phân tán.	7c8bba25-4029-42eb-b006-5f16d7492174
2fb8f073-af4c-4779-8c20-83ff965d6f45	t	2	2026-07-11 15:18:08.756797+07	2026-07-11 15:18:08.756801+07	2	Chưa xác định rõ bài toán ưu tiên trước khi đầu tư vào công nghệ, dashboard hoặc AI.	7c8bba25-4029-42eb-b006-5f16d7492174
c8ddffc1-9fa3-4a83-9a11-7af50deeabdb	t	3	2026-07-11 15:18:08.757177+07	2026-07-11 15:18:08.757181+07	3	Áp lực nâng cao chất lượng dịch vụ đi cùng yêu cầu tối ưu nguồn lực.	7c8bba25-4029-42eb-b006-5f16d7492174
a43ef904-e6be-4268-93eb-a4e9d1e22f8d	t	4	2026-07-11 15:18:08.757537+07	2026-07-11 15:18:08.757542+07	4	Nhu cầu phát triển năng lực nhân viên y tế trong bối cảnh đổi mới.	7c8bba25-4029-42eb-b006-5f16d7492174
7fbd81bc-ca09-4da0-9a78-7e161ab23bf7	t	5	2026-07-11 15:18:08.757925+07	2026-07-11 15:18:08.757928+07	5	Sức khỏe tâm thần và wellbeing của đội ngũ y tế là vấn đề cần được quan tâm hơn.	7c8bba25-4029-42eb-b006-5f16d7492174
debb33ec-74b2-4921-ab6c-657ec908ca86	t	1	2026-07-11 15:18:08.964626+07	2026-07-11 15:18:08.96463+07	1	Chất lượng đào tạo cần nâng cao theo hướng thực tiễn, liên ngành và gắn với nhu cầu xã hội.	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59
88185e10-0924-4f66-adcc-aedd030c3f7a	t	2	2026-07-11 15:18:08.964953+07	2026-07-11 15:18:08.964956+07	2	Dữ liệu về người học và chương trình đào tạo chưa được khai thác đầy đủ.	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59
9c7b742a-7885-45d6-8de2-16b39502139c	t	3	2026-07-11 15:18:08.965225+07	2026-07-11 15:18:08.965228+07	3	Nhu cầu phát triển năng lực cho sinh viên, giảng viên và đội ngũ quản lý ngày càng đa dạng.	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59
400ea40a-e464-433a-aca3-11aa77622abf	t	4	2026-07-11 15:18:08.965529+07	2026-07-11 15:18:08.965532+07	4	Sức khỏe tâm thần và wellbeing của người học ngày càng được chú trọng.	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59
20c39e71-4f68-46fa-846c-8ab78a064fcb	t	5	2026-07-11 15:18:08.965882+07	2026-07-11 15:18:08.965886+07	5	Yêu cầu tích hợp định hướng ESG và phát triển bền vững vào hoạt động nhà trường.	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59
b434a927-d401-48dd-845a-74d076f25bd4	t	1	2026-07-11 15:18:09.172675+07	2026-07-11 15:18:09.172679+07	1	Năng lực đội ngũ cần được cập nhật để đáp ứng yêu cầu công việc ngày càng phức hợp.	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3
49c3dc83-f91f-43fb-b80a-5ee90c418c08	t	2	2026-07-11 15:18:09.172999+07	2026-07-11 15:18:09.173002+07	2	Nhiều chương trình đào tạo chưa gắn đủ chặt với hành vi làm việc và mục tiêu phát triển tổ chức.	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3
1efc0a22-72be-4a79-b91b-af3f9ed5f162	t	3	2026-07-11 15:18:09.173303+07	2026-07-11 15:18:09.173305+07	3	Nhu cầu phát triển lãnh đạo, giao tiếp và phối hợp nội bộ ngày càng rõ.	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3
a5f52aa7-af7f-40e1-8292-a913bdfbfa75	t	4	2026-07-11 15:18:09.17359+07	2026-07-11 15:18:09.173592+07	4	Áp lực wellbeing và sức khỏe tâm thần tại nơi làm việc ngày càng tăng.	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3
c88fd505-0b7f-4525-96d4-df91220c6154	t	5	2026-07-11 15:18:09.173923+07	2026-07-11 15:18:09.173927+07	5	Yêu cầu tích hợp ESG và trách nhiệm xã hội vào chiến lược kinh doanh.	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3
51294b47-859b-44ee-8e3f-cb53c6dc74f9	t	1	2026-07-11 15:18:09.350865+07	2026-07-11 15:18:09.350869+07	1	Khoảng cách giữa bằng chứng toàn cầu và bối cảnh triển khai địa phương.	2f00571a-2c96-46fa-ad12-3aabfd52de57
0cfdcde6-6a60-4c38-a3fb-e3ee44c3fc4d	t	2	2026-07-11 15:18:09.351217+07	2026-07-11 15:18:09.35122+07	2	Cần đối tác hiểu hệ thống địa phương để đồng thiết kế và triển khai chương trình.	2f00571a-2c96-46fa-ad12-3aabfd52de57
87071abb-0856-48c8-85c0-be8cfa2d115c	t	3	2026-07-11 15:18:09.351493+07	2026-07-11 15:18:09.351496+07	3	Yêu cầu đánh giá tác động và chứng minh tính hiệu quả theo chuẩn quốc tế.	2f00571a-2c96-46fa-ad12-3aabfd52de57
e415b2b9-dbee-4f32-bd84-7cc3fe81e315	t	4	2026-07-11 15:18:09.351754+07	2026-07-11 15:18:09.351756+07	4	Nhu cầu xây dựng năng lực địa phương bền vững sau khi dự án kết thúc.	2f00571a-2c96-46fa-ad12-3aabfd52de57
\.


--
-- TOC entry 6481 (class 0 OID 313483)
-- Dependencies: 357
-- Data for Name: solution_solutionfeature; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.solution_solutionfeature (id, is_active, display_order, created_at, updated_at, label, solution_id) FROM stdin;
790f80c7-3c94-4897-a111-162eb80440d4	t	1	2026-07-11 15:18:08.461398+07	2026-07-11 15:18:08.461406+07	Chính sách	b1610548-78b7-41e9-94e5-5aeccd0cb124
0e16542b-8a32-4cd6-bba8-60f6739233da	t	2	2026-07-11 15:18:08.470025+07	2026-07-11 15:18:08.470034+07	Dữ liệu	b1610548-78b7-41e9-94e5-5aeccd0cb124
4b46273d-2e2b-4694-b7a7-5bec57b9fe65	t	3	2026-07-11 15:18:08.4705+07	2026-07-11 15:18:08.470504+07	Điều hành	b1610548-78b7-41e9-94e5-5aeccd0cb124
898ebef9-4690-458a-9ed5-31f6e23de7b5	t	4	2026-07-11 15:18:08.470847+07	2026-07-11 15:18:08.47085+07	KHCN & ĐMST	b1610548-78b7-41e9-94e5-5aeccd0cb124
e13ffdbd-bb83-43ab-81ab-8779da5b3e8b	t	1	2026-07-11 15:18:08.753552+07	2026-07-11 15:18:08.753557+07	Bệnh viện số	7c8bba25-4029-42eb-b006-5f16d7492174
a629f9a0-0eb9-48fb-bd1c-f1e4bfce9224	t	2	2026-07-11 15:18:08.754059+07	2026-07-11 15:18:08.754064+07	Dữ liệu y tế	7c8bba25-4029-42eb-b006-5f16d7492174
c12b91ca-d0ff-4cda-a5c6-17f8ba6b48ec	t	3	2026-07-11 15:18:08.754506+07	2026-07-11 15:18:08.754513+07	Workforce	7c8bba25-4029-42eb-b006-5f16d7492174
42ccef0a-bdf6-4d9b-8823-ba5e393d6402	t	4	2026-07-11 15:18:08.754898+07	2026-07-11 15:18:08.754902+07	Wellbeing	7c8bba25-4029-42eb-b006-5f16d7492174
e3eeb83b-14f3-42d4-b098-261abbf30cd7	t	5	2026-07-11 15:18:08.755305+07	2026-07-11 15:18:08.755309+07	Chuyển đổi số	7c8bba25-4029-42eb-b006-5f16d7492174
b927b16e-344e-498f-9f90-cf2276685415	t	1	2026-07-11 15:18:08.962605+07	2026-07-11 15:18:08.962612+07	Giáo dục	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59
29a7e83d-c1fa-41c7-9d97-2fb1b173f39f	t	2	2026-07-11 15:18:08.963017+07	2026-07-11 15:18:08.96302+07	Người học	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59
9cfc7978-a124-43b8-975f-6e79103190d9	t	3	2026-07-11 15:18:08.963319+07	2026-07-11 15:18:08.963322+07	E-Learning	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59
69b17324-497c-4ac4-aaf8-8aa94efcd2e8	t	4	2026-07-11 15:18:08.963658+07	2026-07-11 15:18:08.963662+07	Green University	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59
f83aeb3c-4944-49b1-b62a-ce453e103a2c	t	1	2026-07-11 15:18:09.170767+07	2026-07-11 15:18:09.170772+07	Lãnh đạo	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3
36406dbd-d347-4545-86bd-1eb6a4076169	t	2	2026-07-11 15:18:09.171159+07	2026-07-11 15:18:09.171162+07	Hiệu quả đội nhóm	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3
9ff1eeba-4573-48ab-b822-7b83fdf80da5	t	3	2026-07-11 15:18:09.171442+07	2026-07-11 15:18:09.171445+07	Wellbeing	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3
d45223f0-66d7-43ac-9df5-0aa9c2bf2dfa	t	4	2026-07-11 15:18:09.171732+07	2026-07-11 15:18:09.171735+07	ESG	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3
3b4223bd-0269-4409-abd5-5aa4c209c6a5	t	1	2026-07-11 15:18:09.349038+07	2026-07-11 15:18:09.349042+07	Bối cảnh địa phương	2f00571a-2c96-46fa-ad12-3aabfd52de57
460b5690-f6e6-4dd6-8549-4a966ffe522f	t	2	2026-07-11 15:18:09.349391+07	2026-07-11 15:18:09.349394+07	Nghiên cứu	2f00571a-2c96-46fa-ad12-3aabfd52de57
71f43128-2e06-4601-a82a-6b2e30da7ab7	t	3	2026-07-11 15:18:09.349666+07	2026-07-11 15:18:09.349669+07	Đồng thiết kế	2f00571a-2c96-46fa-ad12-3aabfd52de57
d5b5dbed-8c8f-48f8-b3d1-609820585354	t	4	2026-07-11 15:18:09.349943+07	2026-07-11 15:18:09.349946+07	Triển khai	2f00571a-2c96-46fa-ad12-3aabfd52de57
\.


--
-- TOC entry 6482 (class 0 OID 313494)
-- Dependencies: 358
-- Data for Name: solution_solutionlistingpage; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.solution_solutionlistingpage (id, is_active, display_order, created_at, updated_at, section_label, heading, description, cta_primary_label, cta_primary_url, cta_secondary_label, cta_secondary_url, quicknav_heading, approach_label, approach_heading, approach_description, hero_image, meta_description, meta_keywords, meta_title) FROM stdin;
48d32921-c6db-4f80-b7d6-8b0675c9a473	t	0	2026-07-05 00:28:32.924287+07	2026-08-10 23:08:59.879581+07	Giải pháp theo nhóm đối tác	Giải pháp	Viện IRDM đồng hành cùng cơ quan quản lý, hệ thống y tế, trường đại học, doanh nghiệp và tổ chức quốc tế trong việc chuyển hóa nghiên cứu, dữ liệu và năng lực liên ngành thành các giải pháp khoa học, công nghệ và đổi mới sáng tạo phù hợp với bối cảnh triển khai thực tế.	Liên hệ hợp tác	/lien-he/	Xem nhóm giải pháp	#quicknav	Chọn nhóm đối tác phù hợp	Hướng tiếp cận	Một cách tiếp cận, nhiều bối cảnh triển khai	IRDM tiếp cận mỗi nhóm đối tác từ bối cảnh riêng, bài toán ưu tiên, dữ liệu hiện có và điều kiện triển khai thực tế.	solution/listing/solution-listing-hero_DE8TnL8.png			
\.


--
-- TOC entry 6483 (class 0 OID 313520)
-- Dependencies: 359
-- Data for Name: solution_solutionmethodologystep; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.solution_solutionmethodologystep (id, is_active, display_order, created_at, updated_at, title, icon, solution_id, description) FROM stdin;
7032ba63-6bd1-40de-b195-e559fadc274b	t	1	2026-07-11 15:18:08.484243+07	2026-07-11 15:18:08.484248+07	Làm rõ vấn đề ưu tiên, nhóm đối tượng liên quan, dữ liệu hiện có và khoảng trống bằng chứng.	magnifying-glass	b1610548-78b7-41e9-94e5-5aeccd0cb124	
52ef4db1-fd2a-4b8c-94df-e5626c9c4420	t	2	2026-07-11 15:18:08.490001+07	2026-07-11 15:18:08.490007+07	Rà soát bối cảnh, tổng hợp bằng chứng, thiết kế nghiên cứu ứng dụng và phân tích dữ liệu.	chart-bar	b1610548-78b7-41e9-94e5-5aeccd0cb124	
889dfc29-bd25-43d7-843e-52a887968250	t	3	2026-07-11 15:18:08.490583+07	2026-07-11 15:18:08.490591+07	Hỗ trợ xây dựng concept note, policy brief, đề án hoặc đề xuất nhiệm vụ KHCN & ĐMST.	document-text	b1610548-78b7-41e9-94e5-5aeccd0cb124	
3d056b7c-4a7b-4711-89f6-e50e7b1f5e6c	t	4	2026-07-11 15:18:08.491046+07	2026-07-11 15:18:08.491049+07	Theo dõi, đánh giá và điều chỉnh theo phản hồi thực tiễn triển khai.	arrow-trending-up	b1610548-78b7-41e9-94e5-5aeccd0cb124	
a5f0cbc2-f3c7-4d91-b165-49219805e330	t	1	2026-07-11 15:18:08.759092+07	2026-07-11 15:18:08.759127+07	Làm rõ điểm nghẽn ưu tiên, nguồn dữ liệu hiện có, nhu cầu cải tiến và năng lực triển khai.	magnifying-glass	7c8bba25-4029-42eb-b006-5f16d7492174	
97c70709-6a44-4b39-8c66-2bd164e7230e	t	2	2026-07-11 15:18:08.759801+07	2026-07-11 15:18:08.759807+07	Rà soát bối cảnh, phân tích dữ liệu, đánh giá mức độ sẵn sàng và định hình use case.	chart-bar	7c8bba25-4029-42eb-b006-5f16d7492174	
5439924b-ee4f-4088-b700-fb8fc310b574	t	3	2026-07-11 15:18:08.76034+07	2026-07-11 15:18:08.760345+07	Xây dựng concept note, lộ trình thí điểm hoặc đề xuất nhiệm vụ KHCN & ĐMST.	document-text	7c8bba25-4029-42eb-b006-5f16d7492174	
feacc754-abc3-4647-aea1-ce91482f0a80	t	4	2026-07-11 15:18:08.760843+07	2026-07-11 15:18:08.760848+07	Hỗ trợ kết nối bài toán thực tiễn với dữ liệu và chuyên gia phù hợp.	users	7c8bba25-4029-42eb-b006-5f16d7492174	
a910a4c1-4af7-4f76-9a7c-46eb4f8491a5	t	5	2026-07-11 15:18:08.761262+07	2026-07-11 15:18:08.761267+07	Thiết kế chương trình phát triển năng lực, wellbeing, giao tiếp và phối hợp nội bộ.	light-bulb	7c8bba25-4029-42eb-b006-5f16d7492174	
9c9e7dea-43bd-4128-90b4-75b240e37007	t	1	2026-07-11 15:18:08.966747+07	2026-07-11 15:18:08.966751+07	Làm rõ nhu cầu người học và điểm nghẽn trong chương trình đào tạo.	magnifying-glass	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	
d00d35c2-f818-41da-ae86-07a242737f42	t	2	2026-07-11 15:18:08.967067+07	2026-07-11 15:18:08.96707+07	Khảo sát, nghiên cứu nhu cầu, phân tích dữ liệu và đánh giá trải nghiệm người học.	chart-bar	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	
078cb243-ee20-4740-b09a-fea86e105322	t	3	2026-07-11 15:18:08.967429+07	2026-07-11 15:18:08.967432+07	Đồng thiết kế chương trình phát triển năng lực, E-Learning, microlearning hoặc mô hình hỗ trợ sinh viên.	light-bulb	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	
abddfa03-19b4-4e25-8181-545c85f66df9	t	4	2026-07-11 15:18:08.967722+07	2026-07-11 15:18:08.967725+07	Định hình bài toán dữ liệu, dashboard hoặc lộ trình thí điểm công cụ số.	document-text	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	
2f03ff28-0b00-416d-b5c3-967cb5b8e289	t	5	2026-07-11 15:18:08.967988+07	2026-07-11 15:18:08.967991+07	Thiết kế sáng kiến wellbeing, môi trường học thuật và định hướng Green University / ESG.	arrow-trending-up	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	
b54e08f8-b897-4646-a301-c8c0978ffb65	t	1	2026-07-11 15:18:09.174808+07	2026-07-11 15:18:09.174812+07	Làm rõ nhóm năng lực ưu tiên, hành vi cần cải thiện và điểm nghẽn phối hợp nội bộ.	magnifying-glass	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	
5e998950-0555-4ac0-82a2-7c0212f4e6c2	t	2	2026-07-11 15:18:09.175113+07	2026-07-11 15:18:09.175116+07	Khảo sát nhu cầu, phân tích khoảng trống năng lực và thiết kế chương trình đào tạo.	chart-bar	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	
5f0f3854-a632-4163-ba0e-7e8536677bf2	t	3	2026-07-11 15:18:09.175443+07	2026-07-11 15:18:09.175446+07	Phát triển nội dung về lãnh đạo, giao tiếp, phối hợp, quản trị cảm xúc và tư duy dữ liệu.	light-bulb	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	
7beb8e57-199b-4ec2-840c-9d3a23816c3a	t	4	2026-07-11 15:18:09.176167+07	2026-07-11 15:18:09.176173+07	Đánh giá nhu cầu wellbeing, văn hóa tổ chức hoặc ESG lấy con người làm trung tâm.	users	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	
b22fa384-f550-4dbc-97fc-bdc9c3be8166	t	5	2026-07-11 15:18:09.176671+07	2026-07-11 15:18:09.176677+07	Thiết kế sáng kiến hỗ trợ đội ngũ và phát triển năng lực phục hồi.	arrow-trending-up	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	
8969699c-e7f8-4dde-bffa-ef243eea15ae	t	1	2026-07-11 15:18:09.352721+07	2026-07-11 15:18:09.352725+07	Tìm hiểu bối cảnh địa phương, xác định đối tác chiến lược và đánh giá nhu cầu.	magnifying-glass	2f00571a-2c96-46fa-ad12-3aabfd52de57	
0c807f61-94db-42e6-9c05-3500acf58d27	t	2	2026-07-11 15:18:09.353028+07	2026-07-11 15:18:09.353031+07	Tổng hợp bằng chứng quốc tế và điều chỉnh theo bối cảnh Việt Nam.	chart-bar	2f00571a-2c96-46fa-ad12-3aabfd52de57	
30bebdd8-b23e-4f6d-8cbb-8b666510b2aa	t	3	2026-07-11 15:18:09.353306+07	2026-07-11 15:18:09.353309+07	Đồng thiết kế chương trình can thiệp với các bên liên quan địa phương.	light-bulb	2f00571a-2c96-46fa-ad12-3aabfd52de57	
5957cf01-fba2-4442-886b-1b81795bd20a	t	4	2026-07-11 15:18:09.353567+07	2026-07-11 15:18:09.35357+07	Triển khai thí điểm, theo dõi và đánh giá theo khung M&E.	beaker	2f00571a-2c96-46fa-ad12-3aabfd52de57	
72a55173-ccda-413a-a3fa-8f49e5f9d49f	t	5	2026-07-11 15:18:09.353829+07	2026-07-11 15:18:09.353832+07	Xây dựng năng lực địa phương và hỗ trợ nhân rộng hoặc chuyển giao.	arrow-trending-up	2f00571a-2c96-46fa-ad12-3aabfd52de57	
\.


--
-- TOC entry 6484 (class 0 OID 313535)
-- Dependencies: 360
-- Data for Name: solution_solutionoutput; Type: TABLE DATA; Schema: public; Owner: irdm_user
--

COPY public.solution_solutionoutput (id, is_active, display_order, created_at, updated_at, number, content, solution_id, image) FROM stdin;
694a3716-2a02-403a-8f7a-7f62fb606116	t	1	2026-07-11 15:18:08.498601+07	2026-07-11 15:18:08.562944+07	1	Báo cáo nghiên cứu ứng dụng / phân tích bối cảnh / tổng hợp bằng chứng	b1610548-78b7-41e9-94e5-5aeccd0cb124	solution/outputs/solution-output-co-quan-quan-ly-va-chinh-sach-01_Cm4AGD3.png
ca053a38-b6fc-4b6d-bac4-a147300aca82	t	2	2026-07-11 15:18:08.50427+07	2026-07-11 15:18:08.592139+07	2	Policy brief, concept note, đề án hoặc khuyến nghị hành động	b1610548-78b7-41e9-94e5-5aeccd0cb124	solution/outputs/solution-output-co-quan-quan-ly-va-chinh-sach-02_w0ClgW6.png
2a0e743e-8fde-498b-b47a-483b6afa66d0	t	3	2026-07-11 15:18:08.504878+07	2026-07-11 15:18:08.619779+07	3	Đề xuất nhiệm vụ KHCN & ĐMST	b1610548-78b7-41e9-94e5-5aeccd0cb124	solution/outputs/solution-output-co-quan-quan-ly-va-chinh-sach-03_9P0OmcU.png
701a5bb8-9a30-49d4-989b-fab1a02997a9	t	4	2026-07-11 15:18:08.505377+07	2026-07-11 15:18:08.653819+07	4	Khung chỉ số, dashboard định hướng hoặc công cụ theo dõi	b1610548-78b7-41e9-94e5-5aeccd0cb124	solution/outputs/solution-output-co-quan-quan-ly-va-chinh-sach-04_PxWgSmV.png
8f5c285f-f254-4ffe-b523-83462866b637	t	5	2026-07-11 15:18:08.505843+07	2026-07-11 15:18:08.683895+07	5	Khung đánh giá nhu cầu năng lực hoặc chương trình phát triển đội ngũ	b1610548-78b7-41e9-94e5-5aeccd0cb124	solution/outputs/solution-output-co-quan-quan-ly-va-chinh-sach-05_qvFCLlT.png
019bf541-d663-48b4-857a-3eeb91e7f4b3	t	6	2026-07-11 15:18:08.506256+07	2026-07-11 15:18:08.713844+07	6	Workshop, phiên tham vấn hoặc bộ công cụ chuyển hóa vấn đề quản lý thành hướng triển khai	b1610548-78b7-41e9-94e5-5aeccd0cb124	solution/outputs/solution-output-co-quan-quan-ly-va-chinh-sach-06_gE8Zeq7.png
dd1d0fb7-4950-4074-b529-c6bd2bfb751f	t	1	2026-07-11 15:18:08.762455+07	2026-07-11 15:18:08.794314+07	1	Báo cáo rà soát bối cảnh, dữ liệu và danh mục use case ưu tiên	7c8bba25-4029-42eb-b006-5f16d7492174	solution/outputs/solution-output-he-thong-y-te-01_rKUE6Fs.png
d5ef34bb-d52e-400c-bf6f-71ae95ad6d85	t	2	2026-07-11 15:18:08.762879+07	2026-07-11 15:18:08.824197+07	2	Concept note, lộ trình thí điểm hoặc đề xuất nhiệm vụ KHCN & ĐMST	7c8bba25-4029-42eb-b006-5f16d7492174	solution/outputs/solution-output-he-thong-y-te-02_z50b3Si.png
5155b953-7290-478d-9a0d-419fb1d17f15	t	3	2026-07-11 15:18:08.763279+07	2026-07-11 15:18:08.854483+07	3	Khung dữ liệu, dashboard định hướng hoặc công cụ hỗ trợ quản trị	7c8bba25-4029-42eb-b006-5f16d7492174	solution/outputs/solution-output-he-thong-y-te-03_KDcyQhw.png
685c52fd-fc3b-4354-9a0c-572616e49b2a	t	4	2026-07-11 15:18:08.76367+07	2026-07-11 15:18:08.882288+07	4	Chương trình hỗ trợ sức khỏe tâm thần và phòng ngừa kiệt sức nghề nghiệp	7c8bba25-4029-42eb-b006-5f16d7492174	solution/outputs/solution-output-he-thong-y-te-04_esboA4N.png
24ec0e28-63ff-42cd-8556-0faa9cb68e91	t	5	2026-07-11 15:18:08.764076+07	2026-07-11 15:18:08.914033+07	5	Chương trình phát triển năng lực đội ngũ	7c8bba25-4029-42eb-b006-5f16d7492174	solution/outputs/solution-output-he-thong-y-te-05_zUeXw7C.png
15852cb8-c5d9-4663-8eeb-1b76d6ca0126	t	6	2026-07-11 15:18:08.764455+07	2026-07-11 15:18:08.943466+07	6	Định hướng Green Hospital hoặc cải thiện môi trường chăm sóc	7c8bba25-4029-42eb-b006-5f16d7492174	solution/outputs/solution-output-he-thong-y-te-06_CMGaeYa.png
4113162d-3365-4f86-98d3-428750363ab5	t	1	2026-07-11 15:18:08.968848+07	2026-07-11 15:18:09.0007+07	1	Báo cáo khảo sát nhu cầu hoặc đánh giá trải nghiệm người học	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	solution/outputs/solution-output-truong-dai-hoc-va-giao-duc-01_d5fyZzi.png
37dff750-926a-4b2a-9510-281d2082b89c	t	2	2026-07-11 15:18:08.96932+07	2026-07-11 15:18:09.030633+07	2	Khung chương trình kỹ năng nghề nghiệp, phát triển cá nhân và định hướng nghề nghiệp	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	solution/outputs/solution-output-truong-dai-hoc-va-giao-duc-02_aylpJGd.png
d313d609-aad5-4cea-8967-7a1fdbd7a7cf	t	3	2026-07-11 15:18:08.969753+07	2026-07-11 15:18:09.060574+07	3	Nội dung E-Learning, microlearning, tập huấn hoặc bộ học liệu	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	solution/outputs/solution-output-truong-dai-hoc-va-giao-duc-03_ZLi9Xrl.png
cd32e871-0929-4756-a70e-37a3898fb618	t	4	2026-07-11 15:18:08.970095+07	2026-07-11 15:18:09.090737+07	4	Khung dữ liệu, dashboard định hướng hoặc bộ chỉ số theo dõi	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	solution/outputs/solution-output-truong-dai-hoc-va-giao-duc-04_hIIRGFf.png
32f66ea1-a717-4d7b-9daa-aa006e74b8c3	t	5	2026-07-11 15:18:08.970379+07	2026-07-11 15:18:09.119069+07	5	Sáng kiến hỗ trợ sức khỏe tâm thần và cải thiện môi trường học thuật	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	solution/outputs/solution-output-truong-dai-hoc-va-giao-duc-05_JJzkxzg.png
053b296f-d1d6-4167-a547-caf1dec9356f	t	6	2026-07-11 15:18:08.970662+07	2026-07-11 15:18:09.150751+07	6	Định hướng Green University, ESG hoặc phát triển bền vững	004c7fe8-39cd-4dc8-b4a2-8598fcdd9c59	solution/outputs/solution-output-truong-dai-hoc-va-giao-duc-06_oD04GvA.png
fe74adb8-51f4-4346-a99c-ef3ef79e12cb	t	1	2026-07-11 15:18:09.17781+07	2026-07-11 15:18:09.206557+07	1	Báo cáo khảo sát nhu cầu năng lực và phân tích văn hóa tổ chức	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	solution/outputs/solution-output-doanh-nghiep-01_PaSwIvI.png
b105ce2f-e8af-470f-add1-9c2c440998d5	t	2	2026-07-11 15:18:09.17815+07	2026-07-11 15:18:09.238582+07	2	Chương trình đào tạo, tập huấn hoặc lộ trình phát triển năng lực	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	solution/outputs/solution-output-doanh-nghiep-02_L1cPxyy.png
c50d8c77-6694-4fc3-a1c8-9ef1537a23fd	t	3	2026-07-11 15:18:09.178442+07	2026-07-11 15:18:09.269284+07	3	Nội dung E-Learning, microlearning hoặc bộ học liệu ứng dụng	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	solution/outputs/solution-output-doanh-nghiep-03_xlioNUy.png
8cefeda0-8f64-4539-bc47-c03d2be579e8	t	4	2026-07-11 15:18:09.178789+07	2026-07-11 15:18:09.29992+07	4	Chương trình wellbeing và hỗ trợ sức khỏe tâm thần tại nơi làm việc	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	solution/outputs/solution-output-doanh-nghiep-04_P2uet5F.png
8e814055-befd-41fb-aeda-e10a157c6681	t	5	2026-07-11 15:18:09.179118+07	2026-07-11 15:18:09.327757+07	5	Lộ trình ESG hoặc sáng kiến phát triển bền vững lấy con người làm trung tâm	6b1bee8c-0eeb-4cee-bb4f-4f1682a623d3	solution/outputs/solution-output-doanh-nghiep-05_D7ZhgzH.png
a7181b5a-c0b4-45b2-a4f7-68d7974c93b9	t	1	2026-07-11 15:18:09.354756+07	2026-07-11 15:18:09.385731+07	1	Báo cáo đánh giá nhu cầu và phân tích bối cảnh địa phương	2f00571a-2c96-46fa-ad12-3aabfd52de57	solution/outputs/solution-output-to-chuc-quoc-te-va-ngo-01_hUuD8Jc.png
7aa0579f-1900-4371-b542-42e432d4289a	t	2	2026-07-11 15:18:09.355077+07	2026-07-11 15:18:09.413665+07	2	Thiết kế chương trình can thiệp và khung M&E	2f00571a-2c96-46fa-ad12-3aabfd52de57	solution/outputs/solution-output-to-chuc-quoc-te-va-ngo-02_UrG9yDx.png
40637544-894d-4d53-9654-c425136f4c58	t	3	2026-07-11 15:18:09.35537+07	2026-07-11 15:18:09.444928+07	3	Tài liệu tập huấn và hỗ trợ triển khai cho đối tác địa phương	2f00571a-2c96-46fa-ad12-3aabfd52de57	solution/outputs/solution-output-to-chuc-quoc-te-va-ngo-03_v3drVoX.png
08547d5f-ff9f-4de3-b48f-109968e92f22	t	4	2026-07-11 15:18:09.355668+07	2026-07-11 15:18:09.47435+07	4	Báo cáo đánh giá tác động theo chuẩn quốc tế	2f00571a-2c96-46fa-ad12-3aabfd52de57	solution/outputs/solution-output-to-chuc-quoc-te-va-ngo-04_DwDPdkc.png
da55ad77-bd87-49e7-b6e0-90bdb67d35c0	t	5	2026-07-11 15:18:09.356032+07	2026-07-11 15:18:09.501817+07	5	Lộ trình nhân rộng và khuyến nghị chuyển giao	2f00571a-2c96-46fa-ad12-3aabfd52de57	solution/outputs/solution-output-to-chuc-quoc-te-va-ngo-05_pdEmZt7.png
\.


--
-- TOC entry 6494 (class 0 OID 0)
-- Dependencies: 251
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 6495 (class 0 OID 0)
-- Dependencies: 253
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 6496 (class 0 OID 0)
-- Dependencies: 255
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 428, true);


--
-- TOC entry 6497 (class 0 OID 0)
-- Dependencies: 258
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- TOC entry 6498 (class 0 OID 0)
-- Dependencies: 259
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- TOC entry 6499 (class 0 OID 0)
-- Dependencies: 261
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 6500 (class 0 OID 0)
-- Dependencies: 361
-- Name: contact_contactrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.contact_contactrequest_id_seq', 1, true);


--
-- TOC entry 6501 (class 0 OID 0)
-- Dependencies: 275
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 629, true);


--
-- TOC entry 6502 (class 0 OID 0)
-- Dependencies: 277
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 107, true);


--
-- TOC entry 6503 (class 0 OID 0)
-- Dependencies: 279
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 96, true);


--
-- TOC entry 6504 (class 0 OID 0)
-- Dependencies: 285
-- Name: expert_expert_engagement_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.expert_expert_engagement_types_id_seq', 72, true);


--
-- TOC entry 6505 (class 0 OID 0)
-- Dependencies: 287
-- Name: expert_expert_knowledge_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.expert_expert_knowledge_topics_id_seq', 600, true);


--
-- TOC entry 6506 (class 0 OID 0)
-- Dependencies: 289
-- Name: expert_expert_research_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.expert_expert_research_areas_id_seq', 176, true);


--
-- TOC entry 6507 (class 0 OID 0)
-- Dependencies: 294
-- Name: expert_infogroup_expert_direct_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.expert_infogroup_expert_direct_members_id_seq', 22, true);


--
-- TOC entry 6508 (class 0 OID 0)
-- Dependencies: 296
-- Name: expert_infogroup_expert_research_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.expert_infogroup_expert_research_areas_id_seq', 9, true);


--
-- TOC entry 6509 (class 0 OID 0)
-- Dependencies: 325
-- Name: knowledge_knowledgearticle_related_capabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.knowledge_knowledgearticle_related_capabilities_id_seq', 1, false);


--
-- TOC entry 6510 (class 0 OID 0)
-- Dependencies: 327
-- Name: knowledge_knowledgearticle_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.knowledge_knowledgearticle_topics_id_seq', 16, true);


--
-- TOC entry 6511 (class 0 OID 0)
-- Dependencies: 331
-- Name: knowledge_knowledgecontenttypecard_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.knowledge_knowledgecontenttypecard_tags_id_seq', 23, true);


--
-- TOC entry 6512 (class 0 OID 0)
-- Dependencies: 335
-- Name: knowledge_knowledgedownloadrequest_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.knowledge_knowledgedownloadrequest_id_seq', 1, true);


--
-- TOC entry 6513 (class 0 OID 0)
-- Dependencies: 338
-- Name: knowledge_knowledgeevent_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.knowledge_knowledgeevent_tags_id_seq', 12, true);


--
-- TOC entry 6514 (class 0 OID 0)
-- Dependencies: 346
-- Name: knowledge_knowledgenewsitem_topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.knowledge_knowledgenewsitem_topics_id_seq', 12, true);


--
-- TOC entry 6515 (class 0 OID 0)
-- Dependencies: 350
-- Name: knowledge_knowledgetopiccard_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.knowledge_knowledgetopiccard_tags_id_seq', 26, true);


--
-- TOC entry 6516 (class 0 OID 0)
-- Dependencies: 354
-- Name: solution_solution_related_capabilities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: irdm_user
--

SELECT pg_catalog.setval('public.solution_solution_related_capabilities_id_seq', 150, true);


--
-- TOC entry 5479 (class 2606 OID 313601)
-- Name: about_aboutcapabilityecosystem about_aboutcapabilityecosystem_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutcapabilityecosystem
    ADD CONSTRAINT about_aboutcapabilityecosystem_pkey PRIMARY KEY (id);


--
-- TOC entry 5483 (class 2606 OID 313603)
-- Name: about_aboutcontactbanner about_aboutcontactbanner_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutcontactbanner
    ADD CONSTRAINT about_aboutcontactbanner_pkey PRIMARY KEY (id);


--
-- TOC entry 5488 (class 2606 OID 313605)
-- Name: about_aboutcontactbannerstat about_aboutcontactbannerstat_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutcontactbannerstat
    ADD CONSTRAINT about_aboutcontactbannerstat_pkey PRIMARY KEY (id);


--
-- TOC entry 5492 (class 2606 OID 313607)
-- Name: about_aboutcorevalue about_aboutcorevalue_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutcorevalue
    ADD CONSTRAINT about_aboutcorevalue_pkey PRIMARY KEY (id);


--
-- TOC entry 5496 (class 2606 OID 313609)
-- Name: about_aboutcorevaluesection about_aboutcorevaluesection_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutcorevaluesection
    ADD CONSTRAINT about_aboutcorevaluesection_pkey PRIMARY KEY (id);


--
-- TOC entry 5500 (class 2606 OID 313611)
-- Name: about_aboutctabanner about_aboutctabanner_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutctabanner
    ADD CONSTRAINT about_aboutctabanner_pkey PRIMARY KEY (id);


--
-- TOC entry 5505 (class 2606 OID 313613)
-- Name: about_aboutecosystempartnergroup about_aboutecosystempartnergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutecosystempartnergroup
    ADD CONSTRAINT about_aboutecosystempartnergroup_pkey PRIMARY KEY (id);


--
-- TOC entry 5510 (class 2606 OID 313615)
-- Name: about_aboutecosystempartneritem about_aboutecosystempartneritem_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutecosystempartneritem
    ADD CONSTRAINT about_aboutecosystempartneritem_pkey PRIMARY KEY (id);


--
-- TOC entry 5515 (class 2606 OID 313617)
-- Name: about_aboutecosystemstatistic about_aboutecosystemstatistic_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutecosystemstatistic
    ADD CONSTRAINT about_aboutecosystemstatistic_pkey PRIMARY KEY (id);


--
-- TOC entry 5519 (class 2606 OID 313619)
-- Name: about_abouthero about_abouthero_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_abouthero
    ADD CONSTRAINT about_abouthero_pkey PRIMARY KEY (id);


--
-- TOC entry 5524 (class 2606 OID 313621)
-- Name: about_aboutherostatistic about_aboutherostatistic_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutherostatistic
    ADD CONSTRAINT about_aboutherostatistic_pkey PRIMARY KEY (id);


--
-- TOC entry 5529 (class 2606 OID 313623)
-- Name: about_abouthighlightcard about_abouthighlightcard_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_abouthighlightcard
    ADD CONSTRAINT about_abouthighlightcard_pkey PRIMARY KEY (id);


--
-- TOC entry 5533 (class 2606 OID 313625)
-- Name: about_aboutintroduction about_aboutintroduction_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutintroduction
    ADD CONSTRAINT about_aboutintroduction_pkey PRIMARY KEY (id);


--
-- TOC entry 5538 (class 2606 OID 313627)
-- Name: about_aboutlegalbadge about_aboutlegalbadge_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutlegalbadge
    ADD CONSTRAINT about_aboutlegalbadge_pkey PRIMARY KEY (id);


--
-- TOC entry 5542 (class 2606 OID 313629)
-- Name: about_aboutlegalinfo about_aboutlegalinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutlegalinfo
    ADD CONSTRAINT about_aboutlegalinfo_pkey PRIMARY KEY (id);


--
-- TOC entry 5547 (class 2606 OID 313631)
-- Name: about_aboutlegalorgattribute about_aboutlegalorgattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutlegalorgattribute
    ADD CONSTRAINT about_aboutlegalorgattribute_pkey PRIMARY KEY (id);


--
-- TOC entry 5552 (class 2606 OID 313633)
-- Name: about_aboutlegaltimelineitem about_aboutlegaltimelineitem_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutlegaltimelineitem
    ADD CONSTRAINT about_aboutlegaltimelineitem_pkey PRIMARY KEY (id);


--
-- TOC entry 5556 (class 2606 OID 313635)
-- Name: about_aboutnetworksectionheader about_aboutnetworksectionheader_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutnetworksectionheader
    ADD CONSTRAINT about_aboutnetworksectionheader_pkey PRIMARY KEY (id);


--
-- TOC entry 5561 (class 2606 OID 313637)
-- Name: about_aboutorgstructurebulletitem about_aboutorgstructurebulletitem_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutorgstructurebulletitem
    ADD CONSTRAINT about_aboutorgstructurebulletitem_pkey PRIMARY KEY (id);


--
-- TOC entry 5565 (class 2606 OID 313639)
-- Name: about_aboutorgstructurecard about_aboutorgstructurecard_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutorgstructurecard
    ADD CONSTRAINT about_aboutorgstructurecard_pkey PRIMARY KEY (id);


--
-- TOC entry 5570 (class 2606 OID 313641)
-- Name: about_aboutorgstructuresection about_aboutorgstructuresection_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutorgstructuresection
    ADD CONSTRAINT about_aboutorgstructuresection_pkey PRIMARY KEY (id);


--
-- TOC entry 5574 (class 2606 OID 313643)
-- Name: about_aboutpageseo about_aboutpageseo_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutpageseo
    ADD CONSTRAINT about_aboutpageseo_pkey PRIMARY KEY (id);


--
-- TOC entry 5578 (class 2606 OID 313645)
-- Name: about_aboutpartnerbenefit about_aboutpartnerbenefit_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutpartnerbenefit
    ADD CONSTRAINT about_aboutpartnerbenefit_pkey PRIMARY KEY (id);


--
-- TOC entry 5583 (class 2606 OID 313647)
-- Name: about_aboutpartnerbenefitsection about_aboutpartnerbenefitsection_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutpartnerbenefitsection
    ADD CONSTRAINT about_aboutpartnerbenefitsection_pkey PRIMARY KEY (id);


--
-- TOC entry 5587 (class 2606 OID 313649)
-- Name: about_aboutprofessionalnetwork about_aboutprofessionalnetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutprofessionalnetwork
    ADD CONSTRAINT about_aboutprofessionalnetwork_pkey PRIMARY KEY (id);


--
-- TOC entry 5591 (class 2606 OID 313651)
-- Name: about_aboutpurpose about_aboutpurpose_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutpurpose
    ADD CONSTRAINT about_aboutpurpose_pkey PRIMARY KEY (id);


--
-- TOC entry 5595 (class 2606 OID 313653)
-- Name: about_abouttargetaudience about_abouttargetaudience_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_abouttargetaudience
    ADD CONSTRAINT about_abouttargetaudience_pkey PRIMARY KEY (id);


--
-- TOC entry 5600 (class 2606 OID 313655)
-- Name: about_abouttargetaudiencesection about_abouttargetaudiencesection_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_abouttargetaudiencesection
    ADD CONSTRAINT about_abouttargetaudiencesection_pkey PRIMARY KEY (id);


--
-- TOC entry 5604 (class 2606 OID 313657)
-- Name: about_aboutvisionmission about_aboutvisionmission_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutvisionmission
    ADD CONSTRAINT about_aboutvisionmission_pkey PRIMARY KEY (id);


--
-- TOC entry 5608 (class 2606 OID 313659)
-- Name: about_aboutvisionmissioncard about_aboutvisionmissioncard_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutvisionmissioncard
    ADD CONSTRAINT about_aboutvisionmissioncard_pkey PRIMARY KEY (id);


--
-- TOC entry 5613 (class 2606 OID 313661)
-- Name: about_aboutvisionmissionicon about_aboutvisionmissionicon_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutvisionmissionicon
    ADD CONSTRAINT about_aboutvisionmissionicon_pkey PRIMARY KEY (id);


--
-- TOC entry 5617 (class 2606 OID 313663)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 5622 (class 2606 OID 313665)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 5625 (class 2606 OID 313667)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 5619 (class 2606 OID 313669)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 5628 (class 2606 OID 313671)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 5630 (class 2606 OID 313673)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 5638 (class 2606 OID 313675)
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 5641 (class 2606 OID 313677)
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 5632 (class 2606 OID 313679)
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- TOC entry 5644 (class 2606 OID 313681)
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 5647 (class 2606 OID 313683)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 5635 (class 2606 OID 313685)
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- TOC entry 5652 (class 2606 OID 313687)
-- Name: capability_capability capability_capability_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capability
    ADD CONSTRAINT capability_capability_pkey PRIMARY KEY (id);


--
-- TOC entry 5655 (class 2606 OID 313689)
-- Name: capability_capability capability_capability_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capability
    ADD CONSTRAINT capability_capability_slug_key UNIQUE (slug);


--
-- TOC entry 5660 (class 2606 OID 313691)
-- Name: capability_capabilitycasestudy capability_capabilitycasestudy_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capabilitycasestudy
    ADD CONSTRAINT capability_capabilitycasestudy_pkey PRIMARY KEY (id);


--
-- TOC entry 5665 (class 2606 OID 313693)
-- Name: capability_capabilitycasestudytag capability_capabilitycasestudytag_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capabilitycasestudytag
    ADD CONSTRAINT capability_capabilitycasestudytag_pkey PRIMARY KEY (id);


--
-- TOC entry 5670 (class 2606 OID 313695)
-- Name: capability_capabilityfeature capability_capabilityfeature_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capabilityfeature
    ADD CONSTRAINT capability_capabilityfeature_pkey PRIMARY KEY (id);


--
-- TOC entry 5675 (class 2606 OID 313697)
-- Name: capability_capabilityhowstep capability_capabilityhowstep_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capabilityhowstep
    ADD CONSTRAINT capability_capabilityhowstep_pkey PRIMARY KEY (id);


--
-- TOC entry 5679 (class 2606 OID 313699)
-- Name: capability_capabilitylistingpage capability_capabilitylistingpage_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capabilitylistingpage
    ADD CONSTRAINT capability_capabilitylistingpage_pkey PRIMARY KEY (id);


--
-- TOC entry 5684 (class 2606 OID 313701)
-- Name: capability_capabilityneeditem capability_capabilityneeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capabilityneeditem
    ADD CONSTRAINT capability_capabilityneeditem_pkey PRIMARY KEY (id);


--
-- TOC entry 5689 (class 2606 OID 313703)
-- Name: capability_capabilityoutput capability_capabilityoutput_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capabilityoutput
    ADD CONSTRAINT capability_capabilityoutput_pkey PRIMARY KEY (id);


--
-- TOC entry 6112 (class 2606 OID 334711)
-- Name: contact_contactrequest contact_contactrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.contact_contactrequest
    ADD CONSTRAINT contact_contactrequest_pkey PRIMARY KEY (id);


--
-- TOC entry 5693 (class 2606 OID 313705)
-- Name: core_footerlink core_footerlink_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.core_footerlink
    ADD CONSTRAINT core_footerlink_pkey PRIMARY KEY (id);


--
-- TOC entry 5698 (class 2606 OID 313707)
-- Name: core_footersection core_footersection_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.core_footersection
    ADD CONSTRAINT core_footersection_pkey PRIMARY KEY (id);


--
-- TOC entry 5705 (class 2606 OID 313709)
-- Name: core_menuitem core_menuitem_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.core_menuitem
    ADD CONSTRAINT core_menuitem_pkey PRIMARY KEY (id);


--
-- TOC entry 5709 (class 2606 OID 313711)
-- Name: core_sitesettings core_sitesettings_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.core_sitesettings
    ADD CONSTRAINT core_sitesettings_pkey PRIMARY KEY (id);


--
-- TOC entry 5712 (class 2606 OID 313713)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 5715 (class 2606 OID 313715)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 5717 (class 2606 OID 313717)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 5719 (class 2606 OID 313719)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 5722 (class 2606 OID 313721)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 5728 (class 2606 OID 313723)
-- Name: expert_association expert_association_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_association
    ADD CONSTRAINT expert_association_pkey PRIMARY KEY (id);


--
-- TOC entry 5732 (class 2606 OID 313725)
-- Name: expert_engagementtype expert_engagementtype_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_engagementtype
    ADD CONSTRAINT expert_engagementtype_pkey PRIMARY KEY (id);


--
-- TOC entry 5735 (class 2606 OID 313727)
-- Name: expert_engagementtype expert_engagementtype_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_engagementtype
    ADD CONSTRAINT expert_engagementtype_slug_key UNIQUE (slug);


--
-- TOC entry 5748 (class 2606 OID 313729)
-- Name: expert_expert_engagement_types expert_expert_engagement_expert_id_engagementtype_d56e81b9_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert_engagement_types
    ADD CONSTRAINT expert_expert_engagement_expert_id_engagementtype_d56e81b9_uniq UNIQUE (expert_id, engagementtype_id);


--
-- TOC entry 5752 (class 2606 OID 313731)
-- Name: expert_expert_engagement_types expert_expert_engagement_types_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert_engagement_types
    ADD CONSTRAINT expert_expert_engagement_types_pkey PRIMARY KEY (id);


--
-- TOC entry 5754 (class 2606 OID 313733)
-- Name: expert_expert_knowledge_topics expert_expert_knowledge__expert_id_knowledgetopic_a7909b1f_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert_knowledge_topics
    ADD CONSTRAINT expert_expert_knowledge__expert_id_knowledgetopic_a7909b1f_uniq UNIQUE (expert_id, knowledgetopic_id);


--
-- TOC entry 5758 (class 2606 OID 313735)
-- Name: expert_expert_knowledge_topics expert_expert_knowledge_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert_knowledge_topics
    ADD CONSTRAINT expert_expert_knowledge_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 5743 (class 2606 OID 313737)
-- Name: expert_expert expert_expert_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert
    ADD CONSTRAINT expert_expert_pkey PRIMARY KEY (id);


--
-- TOC entry 5760 (class 2606 OID 313739)
-- Name: expert_expert_research_areas expert_expert_research_a_expert_id_researcharea_i_b978855d_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert_research_areas
    ADD CONSTRAINT expert_expert_research_a_expert_id_researcharea_i_b978855d_uniq UNIQUE (expert_id, researcharea_id);


--
-- TOC entry 5763 (class 2606 OID 313741)
-- Name: expert_expert_research_areas expert_expert_research_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert_research_areas
    ADD CONSTRAINT expert_expert_research_areas_pkey PRIMARY KEY (id);


--
-- TOC entry 5746 (class 2606 OID 313743)
-- Name: expert_expert expert_expert_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert
    ADD CONSTRAINT expert_expert_slug_key UNIQUE (slug);


--
-- TOC entry 5768 (class 2606 OID 313745)
-- Name: expert_expertgroup expert_expertgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expertgroup
    ADD CONSTRAINT expert_expertgroup_pkey PRIMARY KEY (id);


--
-- TOC entry 5771 (class 2606 OID 313747)
-- Name: expert_expertgroup expert_expertgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expertgroup
    ADD CONSTRAINT expert_expertgroup_slug_key UNIQUE (slug);


--
-- TOC entry 5775 (class 2606 OID 313749)
-- Name: expert_expertlistingpage expert_expertlistingpage_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expertlistingpage
    ADD CONSTRAINT expert_expertlistingpage_pkey PRIMARY KEY (id);


--
-- TOC entry 5784 (class 2606 OID 313751)
-- Name: expert_infogroup_expert_direct_members expert_infogroup_expert__infogroup_id_expert_id_575ed38e_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroup_expert_direct_members
    ADD CONSTRAINT expert_infogroup_expert__infogroup_id_expert_id_575ed38e_uniq UNIQUE (infogroup_id, expert_id);


--
-- TOC entry 5790 (class 2606 OID 313753)
-- Name: expert_infogroup_expert_research_areas expert_infogroup_expert__infogroup_id_researchare_2e26b323_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroup_expert_research_areas
    ADD CONSTRAINT expert_infogroup_expert__infogroup_id_researchare_2e26b323_uniq UNIQUE (infogroup_id, researcharea_id);


--
-- TOC entry 5788 (class 2606 OID 313755)
-- Name: expert_infogroup_expert_direct_members expert_infogroup_expert_direct_members_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroup_expert_direct_members
    ADD CONSTRAINT expert_infogroup_expert_direct_members_pkey PRIMARY KEY (id);


--
-- TOC entry 5793 (class 2606 OID 313757)
-- Name: expert_infogroup_expert_research_areas expert_infogroup_expert_research_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroup_expert_research_areas
    ADD CONSTRAINT expert_infogroup_expert_research_areas_pkey PRIMARY KEY (id);


--
-- TOC entry 5779 (class 2606 OID 313759)
-- Name: expert_infogroup expert_infogroup_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroup
    ADD CONSTRAINT expert_infogroup_pkey PRIMARY KEY (id);


--
-- TOC entry 5782 (class 2606 OID 313761)
-- Name: expert_infogroup expert_infogroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroup
    ADD CONSTRAINT expert_infogroup_slug_key UNIQUE (slug);


--
-- TOC entry 5799 (class 2606 OID 313763)
-- Name: expert_infogroupblock expert_infogroupblock_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroupblock
    ADD CONSTRAINT expert_infogroupblock_pkey PRIMARY KEY (id);


--
-- TOC entry 5804 (class 2606 OID 313765)
-- Name: expert_infogroupmember expert_infogroupmember_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroupmember
    ADD CONSTRAINT expert_infogroupmember_pkey PRIMARY KEY (id);


--
-- TOC entry 5808 (class 2606 OID 313767)
-- Name: expert_knowledgetopic expert_knowledgetopic_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_knowledgetopic
    ADD CONSTRAINT expert_knowledgetopic_pkey PRIMARY KEY (id);


--
-- TOC entry 5811 (class 2606 OID 313769)
-- Name: expert_knowledgetopic expert_knowledgetopic_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_knowledgetopic
    ADD CONSTRAINT expert_knowledgetopic_slug_key UNIQUE (slug);


--
-- TOC entry 5817 (class 2606 OID 313771)
-- Name: expert_orgnode expert_orgnode_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_orgnode
    ADD CONSTRAINT expert_orgnode_pkey PRIMARY KEY (id);


--
-- TOC entry 5821 (class 2606 OID 313773)
-- Name: expert_processstep expert_processstep_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_processstep
    ADD CONSTRAINT expert_processstep_pkey PRIMARY KEY (id);


--
-- TOC entry 5825 (class 2606 OID 313775)
-- Name: expert_researcharea expert_researcharea_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_researcharea
    ADD CONSTRAINT expert_researcharea_pkey PRIMARY KEY (id);


--
-- TOC entry 5828 (class 2606 OID 313777)
-- Name: expert_researcharea expert_researcharea_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_researcharea
    ADD CONSTRAINT expert_researcharea_slug_key UNIQUE (slug);


--
-- TOC entry 5832 (class 2606 OID 313779)
-- Name: home_audiencesectionheader home_audiencesectionheader_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_audiencesectionheader
    ADD CONSTRAINT home_audiencesectionheader_pkey PRIMARY KEY (id);


--
-- TOC entry 5836 (class 2606 OID 313781)
-- Name: home_audiencesegment home_audiencesegment_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_audiencesegment
    ADD CONSTRAINT home_audiencesegment_pkey PRIMARY KEY (id);


--
-- TOC entry 5840 (class 2606 OID 313783)
-- Name: home_audiencetag home_audiencetag_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_audiencetag
    ADD CONSTRAINT home_audiencetag_pkey PRIMARY KEY (id);


--
-- TOC entry 5845 (class 2606 OID 313785)
-- Name: home_capabilitiessectionheader home_capabilitiessectionheader_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_capabilitiessectionheader
    ADD CONSTRAINT home_capabilitiessectionheader_pkey PRIMARY KEY (id);


--
-- TOC entry 5849 (class 2606 OID 313787)
-- Name: home_corecapability home_corecapability_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_corecapability
    ADD CONSTRAINT home_corecapability_pkey PRIMARY KEY (id);


--
-- TOC entry 5853 (class 2606 OID 313789)
-- Name: home_ctabanner home_ctabanner_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_ctabanner
    ADD CONSTRAINT home_ctabanner_pkey PRIMARY KEY (id);


--
-- TOC entry 5857 (class 2606 OID 313791)
-- Name: home_evidencesectionheader home_evidencesectionheader_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_evidencesectionheader
    ADD CONSTRAINT home_evidencesectionheader_pkey PRIMARY KEY (id);


--
-- TOC entry 5861 (class 2606 OID 313793)
-- Name: home_featuredsectionconfig home_featuredsectionconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_featuredsectionconfig
    ADD CONSTRAINT home_featuredsectionconfig_pkey PRIMARY KEY (id);


--
-- TOC entry 5864 (class 2606 OID 313795)
-- Name: home_featuredsectionconfig home_featuredsectionconfig_section_key_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_featuredsectionconfig
    ADD CONSTRAINT home_featuredsectionconfig_section_key_key UNIQUE (section_key);


--
-- TOC entry 5869 (class 2606 OID 313797)
-- Name: home_heropilltag home_heropilltag_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_heropilltag
    ADD CONSTRAINT home_heropilltag_pkey PRIMARY KEY (id);


--
-- TOC entry 5873 (class 2606 OID 313799)
-- Name: home_herosection home_herosection_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_herosection
    ADD CONSTRAINT home_herosection_pkey PRIMARY KEY (id);


--
-- TOC entry 5877 (class 2606 OID 313801)
-- Name: home_knowledgecategory home_knowledgecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_knowledgecategory
    ADD CONSTRAINT home_knowledgecategory_pkey PRIMARY KEY (id);


--
-- TOC entry 5881 (class 2606 OID 313803)
-- Name: home_knowledgesectionheader home_knowledgesectionheader_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_knowledgesectionheader
    ADD CONSTRAINT home_knowledgesectionheader_pkey PRIMARY KEY (id);


--
-- TOC entry 5885 (class 2606 OID 313805)
-- Name: home_methodologysectionheader home_methodologysectionheader_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_methodologysectionheader
    ADD CONSTRAINT home_methodologysectionheader_pkey PRIMARY KEY (id);


--
-- TOC entry 5889 (class 2606 OID 313807)
-- Name: home_methodologystep home_methodologystep_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_methodologystep
    ADD CONSTRAINT home_methodologystep_pkey PRIMARY KEY (id);


--
-- TOC entry 5893 (class 2606 OID 313809)
-- Name: home_partnerlogo home_partnerlogo_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_partnerlogo
    ADD CONSTRAINT home_partnerlogo_pkey PRIMARY KEY (id);


--
-- TOC entry 5897 (class 2606 OID 313811)
-- Name: home_philosophyprinciple home_philosophyprinciple_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_philosophyprinciple
    ADD CONSTRAINT home_philosophyprinciple_pkey PRIMARY KEY (id);


--
-- TOC entry 5901 (class 2606 OID 313813)
-- Name: home_philosophysectionheader home_philosophysectionheader_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_philosophysectionheader
    ADD CONSTRAINT home_philosophysectionheader_pkey PRIMARY KEY (id);


--
-- TOC entry 5905 (class 2606 OID 313815)
-- Name: home_statisticitem home_statisticitem_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_statisticitem
    ADD CONSTRAINT home_statisticitem_pkey PRIMARY KEY (id);


--
-- TOC entry 5912 (class 2606 OID 313817)
-- Name: knowledge_knowledgeaccordionitem knowledge_knowledgeaccordionitem_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgeaccordionitem
    ADD CONSTRAINT knowledge_knowledgeaccordionitem_pkey PRIMARY KEY (id);


--
-- TOC entry 5918 (class 2606 OID 313819)
-- Name: knowledge_knowledgeactivitynews knowledge_knowledgeactivitynews_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgeactivitynews
    ADD CONSTRAINT knowledge_knowledgeactivitynews_pkey PRIMARY KEY (id);


--
-- TOC entry 5930 (class 2606 OID 313821)
-- Name: knowledge_knowledgearticle_related_capabilities knowledge_knowledgeartic_knowledgearticle_id_capa_ff7ea31f_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgearticle_related_capabilities
    ADD CONSTRAINT knowledge_knowledgeartic_knowledgearticle_id_capa_ff7ea31f_uniq UNIQUE (knowledgearticle_id, capability_id);


--
-- TOC entry 5936 (class 2606 OID 313823)
-- Name: knowledge_knowledgearticle_topics knowledge_knowledgeartic_knowledgearticle_id_know_f8ce21d1_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgearticle_topics
    ADD CONSTRAINT knowledge_knowledgeartic_knowledgearticle_id_know_f8ce21d1_uniq UNIQUE (knowledgearticle_id, knowledgetopic_id);


--
-- TOC entry 5925 (class 2606 OID 313825)
-- Name: knowledge_knowledgearticle knowledge_knowledgearticle_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgearticle
    ADD CONSTRAINT knowledge_knowledgearticle_pkey PRIMARY KEY (id);


--
-- TOC entry 5934 (class 2606 OID 313827)
-- Name: knowledge_knowledgearticle_related_capabilities knowledge_knowledgearticle_related_capabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgearticle_related_capabilities
    ADD CONSTRAINT knowledge_knowledgearticle_related_capabilities_pkey PRIMARY KEY (id);


--
-- TOC entry 5928 (class 2606 OID 313829)
-- Name: knowledge_knowledgearticle knowledge_knowledgearticle_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgearticle
    ADD CONSTRAINT knowledge_knowledgearticle_slug_key UNIQUE (slug);


--
-- TOC entry 5940 (class 2606 OID 313831)
-- Name: knowledge_knowledgearticle_topics knowledge_knowledgearticle_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgearticle_topics
    ADD CONSTRAINT knowledge_knowledgearticle_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 5945 (class 2606 OID 313833)
-- Name: knowledge_knowledgecategory knowledge_knowledgecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgecategory
    ADD CONSTRAINT knowledge_knowledgecategory_pkey PRIMARY KEY (id);


--
-- TOC entry 5948 (class 2606 OID 313835)
-- Name: knowledge_knowledgecategory knowledge_knowledgecategory_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgecategory
    ADD CONSTRAINT knowledge_knowledgecategory_slug_key UNIQUE (slug);


--
-- TOC entry 5957 (class 2606 OID 313837)
-- Name: knowledge_knowledgecontenttypecard_tags knowledge_knowledgeconte_knowledgecontenttypecard_0adae4b8_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgecontenttypecard_tags
    ADD CONSTRAINT knowledge_knowledgeconte_knowledgecontenttypecard_0adae4b8_uniq UNIQUE (knowledgecontenttypecard_id, knowledgetopic_id);


--
-- TOC entry 5955 (class 2606 OID 313839)
-- Name: knowledge_knowledgecontenttypecard knowledge_knowledgecontenttypecard_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgecontenttypecard
    ADD CONSTRAINT knowledge_knowledgecontenttypecard_pkey PRIMARY KEY (id);


--
-- TOC entry 5961 (class 2606 OID 313841)
-- Name: knowledge_knowledgecontenttypecard_tags knowledge_knowledgecontenttypecard_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgecontenttypecard_tags
    ADD CONSTRAINT knowledge_knowledgecontenttypecard_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 5967 (class 2606 OID 313843)
-- Name: knowledge_knowledgectabutton knowledge_knowledgectabutton_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgectabutton
    ADD CONSTRAINT knowledge_knowledgectabutton_pkey PRIMARY KEY (id);


--
-- TOC entry 5973 (class 2606 OID 313845)
-- Name: knowledge_knowledgedownload knowledge_knowledgedownload_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgedownload
    ADD CONSTRAINT knowledge_knowledgedownload_pkey PRIMARY KEY (id);


--
-- TOC entry 5976 (class 2606 OID 313847)
-- Name: knowledge_knowledgedownload knowledge_knowledgedownload_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgedownload
    ADD CONSTRAINT knowledge_knowledgedownload_slug_key UNIQUE (slug);


--
-- TOC entry 5978 (class 2606 OID 313849)
-- Name: knowledge_knowledgedownloadrequest knowledge_knowledgedownloadrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgedownloadrequest
    ADD CONSTRAINT knowledge_knowledgedownloadrequest_pkey PRIMARY KEY (id);


--
-- TOC entry 5986 (class 2606 OID 313851)
-- Name: knowledge_knowledgeevent_tags knowledge_knowledgeevent_knowledgeevent_id_knowle_14189bdc_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgeevent_tags
    ADD CONSTRAINT knowledge_knowledgeevent_knowledgeevent_id_knowle_14189bdc_uniq UNIQUE (knowledgeevent_id, knowledgeeventtag_id);


--
-- TOC entry 5984 (class 2606 OID 313853)
-- Name: knowledge_knowledgeevent knowledge_knowledgeevent_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgeevent
    ADD CONSTRAINT knowledge_knowledgeevent_pkey PRIMARY KEY (id);


--
-- TOC entry 5990 (class 2606 OID 313855)
-- Name: knowledge_knowledgeevent_tags knowledge_knowledgeevent_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgeevent_tags
    ADD CONSTRAINT knowledge_knowledgeevent_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 5994 (class 2606 OID 313857)
-- Name: knowledge_knowledgeeventtag knowledge_knowledgeeventtag_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgeeventtag
    ADD CONSTRAINT knowledge_knowledgeeventtag_pkey PRIMARY KEY (id);


--
-- TOC entry 5997 (class 2606 OID 313859)
-- Name: knowledge_knowledgeeventtag knowledge_knowledgeeventtag_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgeeventtag
    ADD CONSTRAINT knowledge_knowledgeeventtag_slug_key UNIQUE (slug);


--
-- TOC entry 5999 (class 2606 OID 313861)
-- Name: knowledge_knowledgefeaturedarticle knowledge_knowledgefeatu_listing_page_id_article__50aa8b9c_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgefeaturedarticle
    ADD CONSTRAINT knowledge_knowledgefeatu_listing_page_id_article__50aa8b9c_uniq UNIQUE (listing_page_id, article_id);


--
-- TOC entry 6005 (class 2606 OID 313863)
-- Name: knowledge_knowledgefeaturedarticle knowledge_knowledgefeaturedarticle_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgefeaturedarticle
    ADD CONSTRAINT knowledge_knowledgefeaturedarticle_pkey PRIMARY KEY (id);


--
-- TOC entry 6010 (class 2606 OID 313865)
-- Name: knowledge_knowledgefiltergroup knowledge_knowledgefiltergroup_param_key_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgefiltergroup
    ADD CONSTRAINT knowledge_knowledgefiltergroup_param_key_key UNIQUE (param_key);


--
-- TOC entry 6012 (class 2606 OID 313867)
-- Name: knowledge_knowledgefiltergroup knowledge_knowledgefiltergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgefiltergroup
    ADD CONSTRAINT knowledge_knowledgefiltergroup_pkey PRIMARY KEY (id);


--
-- TOC entry 6016 (class 2606 OID 313869)
-- Name: knowledge_knowledgefilteritem knowledge_knowledgefilteritem_group_id_value_29c1b284_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgefilteritem
    ADD CONSTRAINT knowledge_knowledgefilteritem_group_id_value_29c1b284_uniq UNIQUE (group_id, value);


--
-- TOC entry 6019 (class 2606 OID 313871)
-- Name: knowledge_knowledgefilteritem knowledge_knowledgefilteritem_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgefilteritem
    ADD CONSTRAINT knowledge_knowledgefilteritem_pkey PRIMARY KEY (id);


--
-- TOC entry 6023 (class 2606 OID 313873)
-- Name: knowledge_knowledgelistingpage knowledge_knowledgelistingpage_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgelistingpage
    ADD CONSTRAINT knowledge_knowledgelistingpage_pkey PRIMARY KEY (id);


--
-- TOC entry 6035 (class 2606 OID 313875)
-- Name: knowledge_knowledgenewsitem_topics knowledge_knowledgenewsi_knowledgenewsitem_id_kno_86634e0c_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgenewsitem_topics
    ADD CONSTRAINT knowledge_knowledgenewsi_knowledgenewsitem_id_kno_86634e0c_uniq UNIQUE (knowledgenewsitem_id, knowledgetopic_id);


--
-- TOC entry 6030 (class 2606 OID 313877)
-- Name: knowledge_knowledgenewsitem knowledge_knowledgenewsitem_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgenewsitem
    ADD CONSTRAINT knowledge_knowledgenewsitem_pkey PRIMARY KEY (id);


--
-- TOC entry 6033 (class 2606 OID 313879)
-- Name: knowledge_knowledgenewsitem knowledge_knowledgenewsitem_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgenewsitem
    ADD CONSTRAINT knowledge_knowledgenewsitem_slug_key UNIQUE (slug);


--
-- TOC entry 6039 (class 2606 OID 313881)
-- Name: knowledge_knowledgenewsitem_topics knowledge_knowledgenewsitem_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgenewsitem_topics
    ADD CONSTRAINT knowledge_knowledgenewsitem_topics_pkey PRIMARY KEY (id);


--
-- TOC entry 6056 (class 2606 OID 313883)
-- Name: knowledge_knowledgetopiccard_tags knowledge_knowledgetopic_knowledgetopiccard_id_kn_f430a879_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgetopiccard_tags
    ADD CONSTRAINT knowledge_knowledgetopic_knowledgetopiccard_id_kn_f430a879_uniq UNIQUE (knowledgetopiccard_id, knowledgetopiccardtag_id);


--
-- TOC entry 6044 (class 2606 OID 313885)
-- Name: knowledge_knowledgetopic knowledge_knowledgetopic_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgetopic
    ADD CONSTRAINT knowledge_knowledgetopic_pkey PRIMARY KEY (id);


--
-- TOC entry 6047 (class 2606 OID 313887)
-- Name: knowledge_knowledgetopic knowledge_knowledgetopic_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgetopic
    ADD CONSTRAINT knowledge_knowledgetopic_slug_key UNIQUE (slug);


--
-- TOC entry 6053 (class 2606 OID 313889)
-- Name: knowledge_knowledgetopiccard knowledge_knowledgetopiccard_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgetopiccard
    ADD CONSTRAINT knowledge_knowledgetopiccard_pkey PRIMARY KEY (id);


--
-- TOC entry 6060 (class 2606 OID 313891)
-- Name: knowledge_knowledgetopiccard_tags knowledge_knowledgetopiccard_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgetopiccard_tags
    ADD CONSTRAINT knowledge_knowledgetopiccard_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 6064 (class 2606 OID 313893)
-- Name: knowledge_knowledgetopiccardtag knowledge_knowledgetopiccardtag_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgetopiccardtag
    ADD CONSTRAINT knowledge_knowledgetopiccardtag_pkey PRIMARY KEY (id);


--
-- TOC entry 6067 (class 2606 OID 313895)
-- Name: knowledge_knowledgetopiccardtag knowledge_knowledgetopiccardtag_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgetopiccardtag
    ADD CONSTRAINT knowledge_knowledgetopiccardtag_slug_key UNIQUE (slug);


--
-- TOC entry 6072 (class 2606 OID 313897)
-- Name: solution_solution solution_solution_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solution
    ADD CONSTRAINT solution_solution_pkey PRIMARY KEY (id);


--
-- TOC entry 6077 (class 2606 OID 313899)
-- Name: solution_solution_related_capabilities solution_solution_relate_solution_id_capability_i_3aafcdf0_uniq; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solution_related_capabilities
    ADD CONSTRAINT solution_solution_relate_solution_id_capability_i_3aafcdf0_uniq UNIQUE (solution_id, capability_id);


--
-- TOC entry 6080 (class 2606 OID 313901)
-- Name: solution_solution_related_capabilities solution_solution_related_capabilities_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solution_related_capabilities
    ADD CONSTRAINT solution_solution_related_capabilities_pkey PRIMARY KEY (id);


--
-- TOC entry 6075 (class 2606 OID 313903)
-- Name: solution_solution solution_solution_slug_key; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solution
    ADD CONSTRAINT solution_solution_slug_key UNIQUE (slug);


--
-- TOC entry 6085 (class 2606 OID 313905)
-- Name: solution_solutionapproachstep solution_solutionapproachstep_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solutionapproachstep
    ADD CONSTRAINT solution_solutionapproachstep_pkey PRIMARY KEY (id);


--
-- TOC entry 6089 (class 2606 OID 313907)
-- Name: solution_solutionchallenge solution_solutionchallenge_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solutionchallenge
    ADD CONSTRAINT solution_solutionchallenge_pkey PRIMARY KEY (id);


--
-- TOC entry 6094 (class 2606 OID 313909)
-- Name: solution_solutionfeature solution_solutionfeature_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solutionfeature
    ADD CONSTRAINT solution_solutionfeature_pkey PRIMARY KEY (id);


--
-- TOC entry 6099 (class 2606 OID 313911)
-- Name: solution_solutionlistingpage solution_solutionlistingpage_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solutionlistingpage
    ADD CONSTRAINT solution_solutionlistingpage_pkey PRIMARY KEY (id);


--
-- TOC entry 6103 (class 2606 OID 313913)
-- Name: solution_solutionmethodologystep solution_solutionmethodologystep_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solutionmethodologystep
    ADD CONSTRAINT solution_solutionmethodologystep_pkey PRIMARY KEY (id);


--
-- TOC entry 6108 (class 2606 OID 313915)
-- Name: solution_solutionoutput solution_solutionoutput_pkey; Type: CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solutionoutput
    ADD CONSTRAINT solution_solutionoutput_pkey PRIMARY KEY (id);


--
-- TOC entry 5476 (class 1259 OID 313916)
-- Name: about_aboutcapabilityecosystem_display_order_9752ab22; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutcapabilityecosystem_display_order_9752ab22 ON public.about_aboutcapabilityecosystem USING btree (display_order);


--
-- TOC entry 5477 (class 1259 OID 313917)
-- Name: about_aboutcapabilityecosystem_is_active_27d7d8a6; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutcapabilityecosystem_is_active_27d7d8a6 ON public.about_aboutcapabilityecosystem USING btree (is_active);


--
-- TOC entry 5480 (class 1259 OID 313918)
-- Name: about_aboutcontactbanner_display_order_578cdcd6; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutcontactbanner_display_order_578cdcd6 ON public.about_aboutcontactbanner USING btree (display_order);


--
-- TOC entry 5481 (class 1259 OID 313919)
-- Name: about_aboutcontactbanner_is_active_9ad21cc5; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutcontactbanner_is_active_9ad21cc5 ON public.about_aboutcontactbanner USING btree (is_active);


--
-- TOC entry 5484 (class 1259 OID 313920)
-- Name: about_aboutcontactbannerstat_banner_id_0d445c9d; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutcontactbannerstat_banner_id_0d445c9d ON public.about_aboutcontactbannerstat USING btree (banner_id);


--
-- TOC entry 5485 (class 1259 OID 313921)
-- Name: about_aboutcontactbannerstat_display_order_fc3a1776; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutcontactbannerstat_display_order_fc3a1776 ON public.about_aboutcontactbannerstat USING btree (display_order);


--
-- TOC entry 5486 (class 1259 OID 313922)
-- Name: about_aboutcontactbannerstat_is_active_cba9ebe9; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutcontactbannerstat_is_active_cba9ebe9 ON public.about_aboutcontactbannerstat USING btree (is_active);


--
-- TOC entry 5489 (class 1259 OID 313923)
-- Name: about_aboutcorevalue_display_order_9fb59176; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutcorevalue_display_order_9fb59176 ON public.about_aboutcorevalue USING btree (display_order);


--
-- TOC entry 5490 (class 1259 OID 313924)
-- Name: about_aboutcorevalue_is_active_7281b5cb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutcorevalue_is_active_7281b5cb ON public.about_aboutcorevalue USING btree (is_active);


--
-- TOC entry 5493 (class 1259 OID 313925)
-- Name: about_aboutcorevaluesection_display_order_99c337d7; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutcorevaluesection_display_order_99c337d7 ON public.about_aboutcorevaluesection USING btree (display_order);


--
-- TOC entry 5494 (class 1259 OID 313926)
-- Name: about_aboutcorevaluesection_is_active_c20ae892; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutcorevaluesection_is_active_c20ae892 ON public.about_aboutcorevaluesection USING btree (is_active);


--
-- TOC entry 5497 (class 1259 OID 313927)
-- Name: about_aboutctabanner_display_order_c3a28273; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutctabanner_display_order_c3a28273 ON public.about_aboutctabanner USING btree (display_order);


--
-- TOC entry 5498 (class 1259 OID 313928)
-- Name: about_aboutctabanner_is_active_3a51609e; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutctabanner_is_active_3a51609e ON public.about_aboutctabanner USING btree (is_active);


--
-- TOC entry 5501 (class 1259 OID 313929)
-- Name: about_aboutecosystempartnergroup_display_order_33e8c629; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutecosystempartnergroup_display_order_33e8c629 ON public.about_aboutecosystempartnergroup USING btree (display_order);


--
-- TOC entry 5502 (class 1259 OID 313930)
-- Name: about_aboutecosystempartnergroup_ecosystem_id_eff726e8; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutecosystempartnergroup_ecosystem_id_eff726e8 ON public.about_aboutecosystempartnergroup USING btree (ecosystem_id);


--
-- TOC entry 5503 (class 1259 OID 313931)
-- Name: about_aboutecosystempartnergroup_is_active_67a4bc33; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutecosystempartnergroup_is_active_67a4bc33 ON public.about_aboutecosystempartnergroup USING btree (is_active);


--
-- TOC entry 5506 (class 1259 OID 313932)
-- Name: about_aboutecosystempartneritem_display_order_eac074cb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutecosystempartneritem_display_order_eac074cb ON public.about_aboutecosystempartneritem USING btree (display_order);


--
-- TOC entry 5507 (class 1259 OID 313933)
-- Name: about_aboutecosystempartneritem_group_id_4a0d4b4e; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutecosystempartneritem_group_id_4a0d4b4e ON public.about_aboutecosystempartneritem USING btree (group_id);


--
-- TOC entry 5508 (class 1259 OID 313934)
-- Name: about_aboutecosystempartneritem_is_active_6a536e9b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutecosystempartneritem_is_active_6a536e9b ON public.about_aboutecosystempartneritem USING btree (is_active);


--
-- TOC entry 5511 (class 1259 OID 313935)
-- Name: about_aboutecosystemstatistic_display_order_48f2c0eb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutecosystemstatistic_display_order_48f2c0eb ON public.about_aboutecosystemstatistic USING btree (display_order);


--
-- TOC entry 5512 (class 1259 OID 313936)
-- Name: about_aboutecosystemstatistic_ecosystem_id_dbb1def4; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutecosystemstatistic_ecosystem_id_dbb1def4 ON public.about_aboutecosystemstatistic USING btree (ecosystem_id);


--
-- TOC entry 5513 (class 1259 OID 313937)
-- Name: about_aboutecosystemstatistic_is_active_c01d19ac; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutecosystemstatistic_is_active_c01d19ac ON public.about_aboutecosystemstatistic USING btree (is_active);


--
-- TOC entry 5516 (class 1259 OID 313938)
-- Name: about_abouthero_display_order_f752da4c; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_abouthero_display_order_f752da4c ON public.about_abouthero USING btree (display_order);


--
-- TOC entry 5517 (class 1259 OID 313939)
-- Name: about_abouthero_is_active_f626dc40; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_abouthero_is_active_f626dc40 ON public.about_abouthero USING btree (is_active);


--
-- TOC entry 5520 (class 1259 OID 313940)
-- Name: about_aboutherostatistic_display_order_43299ee0; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutherostatistic_display_order_43299ee0 ON public.about_aboutherostatistic USING btree (display_order);


--
-- TOC entry 5521 (class 1259 OID 313941)
-- Name: about_aboutherostatistic_hero_id_f3dd3aef; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutherostatistic_hero_id_f3dd3aef ON public.about_aboutherostatistic USING btree (hero_id);


--
-- TOC entry 5522 (class 1259 OID 313942)
-- Name: about_aboutherostatistic_is_active_fda64fc3; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutherostatistic_is_active_fda64fc3 ON public.about_aboutherostatistic USING btree (is_active);


--
-- TOC entry 5525 (class 1259 OID 313943)
-- Name: about_abouthighlightcard_display_order_8b33e1ad; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_abouthighlightcard_display_order_8b33e1ad ON public.about_abouthighlightcard USING btree (display_order);


--
-- TOC entry 5526 (class 1259 OID 313944)
-- Name: about_abouthighlightcard_intro_id_9883885b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_abouthighlightcard_intro_id_9883885b ON public.about_abouthighlightcard USING btree (intro_id);


--
-- TOC entry 5527 (class 1259 OID 313945)
-- Name: about_abouthighlightcard_is_active_31a0e107; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_abouthighlightcard_is_active_31a0e107 ON public.about_abouthighlightcard USING btree (is_active);


--
-- TOC entry 5530 (class 1259 OID 313946)
-- Name: about_aboutintroduction_display_order_85117433; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutintroduction_display_order_85117433 ON public.about_aboutintroduction USING btree (display_order);


--
-- TOC entry 5531 (class 1259 OID 313947)
-- Name: about_aboutintroduction_is_active_e81caa92; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutintroduction_is_active_e81caa92 ON public.about_aboutintroduction USING btree (is_active);


--
-- TOC entry 5534 (class 1259 OID 313948)
-- Name: about_aboutlegalbadge_display_order_fcb4cc6a; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutlegalbadge_display_order_fcb4cc6a ON public.about_aboutlegalbadge USING btree (display_order);


--
-- TOC entry 5535 (class 1259 OID 313949)
-- Name: about_aboutlegalbadge_is_active_9d11a65c; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutlegalbadge_is_active_9d11a65c ON public.about_aboutlegalbadge USING btree (is_active);


--
-- TOC entry 5536 (class 1259 OID 313950)
-- Name: about_aboutlegalbadge_legal_info_id_97d065ff; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutlegalbadge_legal_info_id_97d065ff ON public.about_aboutlegalbadge USING btree (legal_info_id);


--
-- TOC entry 5539 (class 1259 OID 313951)
-- Name: about_aboutlegalinfo_display_order_80c423ea; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutlegalinfo_display_order_80c423ea ON public.about_aboutlegalinfo USING btree (display_order);


--
-- TOC entry 5540 (class 1259 OID 313952)
-- Name: about_aboutlegalinfo_is_active_371d1b63; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutlegalinfo_is_active_371d1b63 ON public.about_aboutlegalinfo USING btree (is_active);


--
-- TOC entry 5543 (class 1259 OID 313953)
-- Name: about_aboutlegalorgattribute_display_order_ef4bf721; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutlegalorgattribute_display_order_ef4bf721 ON public.about_aboutlegalorgattribute USING btree (display_order);


--
-- TOC entry 5544 (class 1259 OID 313954)
-- Name: about_aboutlegalorgattribute_is_active_745d7472; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutlegalorgattribute_is_active_745d7472 ON public.about_aboutlegalorgattribute USING btree (is_active);


--
-- TOC entry 5545 (class 1259 OID 313955)
-- Name: about_aboutlegalorgattribute_legal_info_id_4f81322e; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutlegalorgattribute_legal_info_id_4f81322e ON public.about_aboutlegalorgattribute USING btree (legal_info_id);


--
-- TOC entry 5548 (class 1259 OID 313956)
-- Name: about_aboutlegaltimelineitem_display_order_4252c0ee; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutlegaltimelineitem_display_order_4252c0ee ON public.about_aboutlegaltimelineitem USING btree (display_order);


--
-- TOC entry 5549 (class 1259 OID 313957)
-- Name: about_aboutlegaltimelineitem_is_active_8a0a1294; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutlegaltimelineitem_is_active_8a0a1294 ON public.about_aboutlegaltimelineitem USING btree (is_active);


--
-- TOC entry 5550 (class 1259 OID 313958)
-- Name: about_aboutlegaltimelineitem_legal_info_id_74ca4891; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutlegaltimelineitem_legal_info_id_74ca4891 ON public.about_aboutlegaltimelineitem USING btree (legal_info_id);


--
-- TOC entry 5553 (class 1259 OID 313959)
-- Name: about_aboutnetworksectionheader_display_order_cade681b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutnetworksectionheader_display_order_cade681b ON public.about_aboutnetworksectionheader USING btree (display_order);


--
-- TOC entry 5554 (class 1259 OID 313960)
-- Name: about_aboutnetworksectionheader_is_active_b7f06c43; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutnetworksectionheader_is_active_b7f06c43 ON public.about_aboutnetworksectionheader USING btree (is_active);


--
-- TOC entry 5557 (class 1259 OID 313961)
-- Name: about_aboutorgstructurebulletitem_card_id_d4db7d74; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutorgstructurebulletitem_card_id_d4db7d74 ON public.about_aboutorgstructurebulletitem USING btree (card_id);


--
-- TOC entry 5558 (class 1259 OID 313962)
-- Name: about_aboutorgstructurebulletitem_display_order_e683edfb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutorgstructurebulletitem_display_order_e683edfb ON public.about_aboutorgstructurebulletitem USING btree (display_order);


--
-- TOC entry 5559 (class 1259 OID 313963)
-- Name: about_aboutorgstructurebulletitem_is_active_6cea388a; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutorgstructurebulletitem_is_active_6cea388a ON public.about_aboutorgstructurebulletitem USING btree (is_active);


--
-- TOC entry 5562 (class 1259 OID 313964)
-- Name: about_aboutorgstructurecard_display_order_0532fcbc; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutorgstructurecard_display_order_0532fcbc ON public.about_aboutorgstructurecard USING btree (display_order);


--
-- TOC entry 5563 (class 1259 OID 313965)
-- Name: about_aboutorgstructurecard_is_active_27ff6307; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutorgstructurecard_is_active_27ff6307 ON public.about_aboutorgstructurecard USING btree (is_active);


--
-- TOC entry 5566 (class 1259 OID 313966)
-- Name: about_aboutorgstructurecard_section_id_987f12ed; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutorgstructurecard_section_id_987f12ed ON public.about_aboutorgstructurecard USING btree (section_id);


--
-- TOC entry 5567 (class 1259 OID 313967)
-- Name: about_aboutorgstructuresection_display_order_40cea073; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutorgstructuresection_display_order_40cea073 ON public.about_aboutorgstructuresection USING btree (display_order);


--
-- TOC entry 5568 (class 1259 OID 313968)
-- Name: about_aboutorgstructuresection_is_active_0e6e8ddd; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutorgstructuresection_is_active_0e6e8ddd ON public.about_aboutorgstructuresection USING btree (is_active);


--
-- TOC entry 5571 (class 1259 OID 313969)
-- Name: about_aboutpageseo_display_order_5a956ee7; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutpageseo_display_order_5a956ee7 ON public.about_aboutpageseo USING btree (display_order);


--
-- TOC entry 5572 (class 1259 OID 313970)
-- Name: about_aboutpageseo_is_active_58d59959; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutpageseo_is_active_58d59959 ON public.about_aboutpageseo USING btree (is_active);


--
-- TOC entry 5575 (class 1259 OID 313971)
-- Name: about_aboutpartnerbenefit_display_order_26704928; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutpartnerbenefit_display_order_26704928 ON public.about_aboutpartnerbenefit USING btree (display_order);


--
-- TOC entry 5576 (class 1259 OID 313972)
-- Name: about_aboutpartnerbenefit_is_active_2bb931e2; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutpartnerbenefit_is_active_2bb931e2 ON public.about_aboutpartnerbenefit USING btree (is_active);


--
-- TOC entry 5579 (class 1259 OID 313973)
-- Name: about_aboutpartnerbenefit_section_id_0b56fc40; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutpartnerbenefit_section_id_0b56fc40 ON public.about_aboutpartnerbenefit USING btree (section_id);


--
-- TOC entry 5580 (class 1259 OID 313974)
-- Name: about_aboutpartnerbenefitsection_display_order_c093c79f; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutpartnerbenefitsection_display_order_c093c79f ON public.about_aboutpartnerbenefitsection USING btree (display_order);


--
-- TOC entry 5581 (class 1259 OID 313975)
-- Name: about_aboutpartnerbenefitsection_is_active_d11cce30; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutpartnerbenefitsection_is_active_d11cce30 ON public.about_aboutpartnerbenefitsection USING btree (is_active);


--
-- TOC entry 5584 (class 1259 OID 313976)
-- Name: about_aboutprofessionalnetwork_display_order_9fa187e9; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutprofessionalnetwork_display_order_9fa187e9 ON public.about_aboutprofessionalnetwork USING btree (display_order);


--
-- TOC entry 5585 (class 1259 OID 313977)
-- Name: about_aboutprofessionalnetwork_is_active_04fdcaf2; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutprofessionalnetwork_is_active_04fdcaf2 ON public.about_aboutprofessionalnetwork USING btree (is_active);


--
-- TOC entry 5588 (class 1259 OID 313978)
-- Name: about_aboutpurpose_display_order_2ab0d8db; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutpurpose_display_order_2ab0d8db ON public.about_aboutpurpose USING btree (display_order);


--
-- TOC entry 5589 (class 1259 OID 313979)
-- Name: about_aboutpurpose_is_active_c4d3ece4; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutpurpose_is_active_c4d3ece4 ON public.about_aboutpurpose USING btree (is_active);


--
-- TOC entry 5592 (class 1259 OID 313980)
-- Name: about_abouttargetaudience_display_order_e55d0925; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_abouttargetaudience_display_order_e55d0925 ON public.about_abouttargetaudience USING btree (display_order);


--
-- TOC entry 5593 (class 1259 OID 313981)
-- Name: about_abouttargetaudience_is_active_5cc9d88c; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_abouttargetaudience_is_active_5cc9d88c ON public.about_abouttargetaudience USING btree (is_active);


--
-- TOC entry 5596 (class 1259 OID 313982)
-- Name: about_abouttargetaudience_section_id_a00fd946; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_abouttargetaudience_section_id_a00fd946 ON public.about_abouttargetaudience USING btree (section_id);


--
-- TOC entry 5597 (class 1259 OID 313983)
-- Name: about_abouttargetaudiencesection_display_order_df654245; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_abouttargetaudiencesection_display_order_df654245 ON public.about_abouttargetaudiencesection USING btree (display_order);


--
-- TOC entry 5598 (class 1259 OID 313984)
-- Name: about_abouttargetaudiencesection_is_active_d853e085; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_abouttargetaudiencesection_is_active_d853e085 ON public.about_abouttargetaudiencesection USING btree (is_active);


--
-- TOC entry 5601 (class 1259 OID 313985)
-- Name: about_aboutvisionmission_display_order_6501e99d; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutvisionmission_display_order_6501e99d ON public.about_aboutvisionmission USING btree (display_order);


--
-- TOC entry 5602 (class 1259 OID 313986)
-- Name: about_aboutvisionmission_is_active_28bc70b5; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutvisionmission_is_active_28bc70b5 ON public.about_aboutvisionmission USING btree (is_active);


--
-- TOC entry 5605 (class 1259 OID 313987)
-- Name: about_aboutvisionmissioncard_display_order_9fb3aef6; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutvisionmissioncard_display_order_9fb3aef6 ON public.about_aboutvisionmissioncard USING btree (display_order);


--
-- TOC entry 5606 (class 1259 OID 313988)
-- Name: about_aboutvisionmissioncard_is_active_bd685573; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutvisionmissioncard_is_active_bd685573 ON public.about_aboutvisionmissioncard USING btree (is_active);


--
-- TOC entry 5609 (class 1259 OID 313989)
-- Name: about_aboutvisionmissioncard_section_id_5cdaaa96; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutvisionmissioncard_section_id_5cdaaa96 ON public.about_aboutvisionmissioncard USING btree (section_id);


--
-- TOC entry 5610 (class 1259 OID 313990)
-- Name: about_aboutvisionmissionicon_display_order_cea2acbc; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutvisionmissionicon_display_order_cea2acbc ON public.about_aboutvisionmissionicon USING btree (display_order);


--
-- TOC entry 5611 (class 1259 OID 313991)
-- Name: about_aboutvisionmissionicon_is_active_2aa7a9d8; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutvisionmissionicon_is_active_2aa7a9d8 ON public.about_aboutvisionmissionicon USING btree (is_active);


--
-- TOC entry 5614 (class 1259 OID 313992)
-- Name: about_aboutvisionmissionicon_section_id_01e59c26; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX about_aboutvisionmissionicon_section_id_01e59c26 ON public.about_aboutvisionmissionicon USING btree (section_id);


--
-- TOC entry 5615 (class 1259 OID 313993)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 5620 (class 1259 OID 313994)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 5623 (class 1259 OID 313995)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 5626 (class 1259 OID 313996)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 5636 (class 1259 OID 313997)
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- TOC entry 5639 (class 1259 OID 313998)
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- TOC entry 5642 (class 1259 OID 313999)
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- TOC entry 5645 (class 1259 OID 314000)
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- TOC entry 5633 (class 1259 OID 314001)
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- TOC entry 5648 (class 1259 OID 314002)
-- Name: capability_capability_display_order_faf49b0b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capability_display_order_faf49b0b ON public.capability_capability USING btree (display_order);


--
-- TOC entry 5649 (class 1259 OID 314003)
-- Name: capability_capability_is_active_63b1f1c8; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capability_is_active_63b1f1c8 ON public.capability_capability USING btree (is_active);


--
-- TOC entry 5650 (class 1259 OID 314004)
-- Name: capability_capability_is_published_aac414a6; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capability_is_published_aac414a6 ON public.capability_capability USING btree (is_published);


--
-- TOC entry 5653 (class 1259 OID 314005)
-- Name: capability_capability_slug_81eb597b_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capability_slug_81eb597b_like ON public.capability_capability USING btree (slug varchar_pattern_ops);


--
-- TOC entry 5656 (class 1259 OID 314006)
-- Name: capability_capabilitycasestudy_capability_id_22efefff; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilitycasestudy_capability_id_22efefff ON public.capability_capabilitycasestudy USING btree (capability_id);


--
-- TOC entry 5657 (class 1259 OID 314007)
-- Name: capability_capabilitycasestudy_display_order_491c7812; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilitycasestudy_display_order_491c7812 ON public.capability_capabilitycasestudy USING btree (display_order);


--
-- TOC entry 5658 (class 1259 OID 314008)
-- Name: capability_capabilitycasestudy_is_active_f0629aad; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilitycasestudy_is_active_f0629aad ON public.capability_capabilitycasestudy USING btree (is_active);


--
-- TOC entry 5661 (class 1259 OID 314009)
-- Name: capability_capabilitycasestudytag_case_study_id_b5ed7f46; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilitycasestudytag_case_study_id_b5ed7f46 ON public.capability_capabilitycasestudytag USING btree (case_study_id);


--
-- TOC entry 5662 (class 1259 OID 314010)
-- Name: capability_capabilitycasestudytag_display_order_cdf23478; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilitycasestudytag_display_order_cdf23478 ON public.capability_capabilitycasestudytag USING btree (display_order);


--
-- TOC entry 5663 (class 1259 OID 314011)
-- Name: capability_capabilitycasestudytag_is_active_44c1f9be; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilitycasestudytag_is_active_44c1f9be ON public.capability_capabilitycasestudytag USING btree (is_active);


--
-- TOC entry 5666 (class 1259 OID 314012)
-- Name: capability_capabilityfeature_capability_id_2e9982e2; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilityfeature_capability_id_2e9982e2 ON public.capability_capabilityfeature USING btree (capability_id);


--
-- TOC entry 5667 (class 1259 OID 314013)
-- Name: capability_capabilityfeature_display_order_a311821f; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilityfeature_display_order_a311821f ON public.capability_capabilityfeature USING btree (display_order);


--
-- TOC entry 5668 (class 1259 OID 314014)
-- Name: capability_capabilityfeature_is_active_812b04b6; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilityfeature_is_active_812b04b6 ON public.capability_capabilityfeature USING btree (is_active);


--
-- TOC entry 5671 (class 1259 OID 314015)
-- Name: capability_capabilityhowstep_capability_id_bd6ae428; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilityhowstep_capability_id_bd6ae428 ON public.capability_capabilityhowstep USING btree (capability_id);


--
-- TOC entry 5672 (class 1259 OID 314016)
-- Name: capability_capabilityhowstep_display_order_fa19b685; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilityhowstep_display_order_fa19b685 ON public.capability_capabilityhowstep USING btree (display_order);


--
-- TOC entry 5673 (class 1259 OID 314017)
-- Name: capability_capabilityhowstep_is_active_98e4eb2b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilityhowstep_is_active_98e4eb2b ON public.capability_capabilityhowstep USING btree (is_active);


--
-- TOC entry 5676 (class 1259 OID 314018)
-- Name: capability_capabilitylistingpage_display_order_d692357d; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilitylistingpage_display_order_d692357d ON public.capability_capabilitylistingpage USING btree (display_order);


--
-- TOC entry 5677 (class 1259 OID 314019)
-- Name: capability_capabilitylistingpage_is_active_a91726ef; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilitylistingpage_is_active_a91726ef ON public.capability_capabilitylistingpage USING btree (is_active);


--
-- TOC entry 5680 (class 1259 OID 314020)
-- Name: capability_capabilityneeditem_capability_id_7930787f; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilityneeditem_capability_id_7930787f ON public.capability_capabilityneeditem USING btree (capability_id);


--
-- TOC entry 5681 (class 1259 OID 314021)
-- Name: capability_capabilityneeditem_display_order_a0342fdd; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilityneeditem_display_order_a0342fdd ON public.capability_capabilityneeditem USING btree (display_order);


--
-- TOC entry 5682 (class 1259 OID 314022)
-- Name: capability_capabilityneeditem_is_active_4b53d1c6; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilityneeditem_is_active_4b53d1c6 ON public.capability_capabilityneeditem USING btree (is_active);


--
-- TOC entry 5685 (class 1259 OID 314023)
-- Name: capability_capabilityoutput_capability_id_5aa8adef; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilityoutput_capability_id_5aa8adef ON public.capability_capabilityoutput USING btree (capability_id);


--
-- TOC entry 5686 (class 1259 OID 314024)
-- Name: capability_capabilityoutput_display_order_b7fd4799; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilityoutput_display_order_b7fd4799 ON public.capability_capabilityoutput USING btree (display_order);


--
-- TOC entry 5687 (class 1259 OID 314025)
-- Name: capability_capabilityoutput_is_active_b9652615; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX capability_capabilityoutput_is_active_b9652615 ON public.capability_capabilityoutput USING btree (is_active);


--
-- TOC entry 6110 (class 1259 OID 334714)
-- Name: contact_contactrequest_created_at_4f5f86cd; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX contact_contactrequest_created_at_4f5f86cd ON public.contact_contactrequest USING btree (created_at);


--
-- TOC entry 6113 (class 1259 OID 334712)
-- Name: contact_contactrequest_status_ee27ac89; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX contact_contactrequest_status_ee27ac89 ON public.contact_contactrequest USING btree (status);


--
-- TOC entry 6114 (class 1259 OID 334713)
-- Name: contact_contactrequest_status_ee27ac89_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX contact_contactrequest_status_ee27ac89_like ON public.contact_contactrequest USING btree (status varchar_pattern_ops);


--
-- TOC entry 5690 (class 1259 OID 314026)
-- Name: core_footerlink_display_order_cc07f3b0; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX core_footerlink_display_order_cc07f3b0 ON public.core_footerlink USING btree (display_order);


--
-- TOC entry 5691 (class 1259 OID 314027)
-- Name: core_footerlink_is_active_dfa5d4c1; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX core_footerlink_is_active_dfa5d4c1 ON public.core_footerlink USING btree (is_active);


--
-- TOC entry 5694 (class 1259 OID 314028)
-- Name: core_footerlink_section_id_0235b1ac; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX core_footerlink_section_id_0235b1ac ON public.core_footerlink USING btree (section_id);


--
-- TOC entry 5695 (class 1259 OID 314029)
-- Name: core_footersection_display_order_81fc76ff; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX core_footersection_display_order_81fc76ff ON public.core_footersection USING btree (display_order);


--
-- TOC entry 5696 (class 1259 OID 314030)
-- Name: core_footersection_is_active_af5e957b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX core_footersection_is_active_af5e957b ON public.core_footersection USING btree (is_active);


--
-- TOC entry 5699 (class 1259 OID 314031)
-- Name: core_menuitem_display_order_9005eaf1; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX core_menuitem_display_order_9005eaf1 ON public.core_menuitem USING btree (display_order);


--
-- TOC entry 5700 (class 1259 OID 314032)
-- Name: core_menuitem_is_active_a5782edb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX core_menuitem_is_active_a5782edb ON public.core_menuitem USING btree (is_active);


--
-- TOC entry 5701 (class 1259 OID 314033)
-- Name: core_menuitem_menu_ce4244ba; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX core_menuitem_menu_ce4244ba ON public.core_menuitem USING btree (menu);


--
-- TOC entry 5702 (class 1259 OID 314034)
-- Name: core_menuitem_menu_ce4244ba_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX core_menuitem_menu_ce4244ba_like ON public.core_menuitem USING btree (menu varchar_pattern_ops);


--
-- TOC entry 5703 (class 1259 OID 314035)
-- Name: core_menuitem_parent_id_dd02175c; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX core_menuitem_parent_id_dd02175c ON public.core_menuitem USING btree (parent_id);


--
-- TOC entry 5706 (class 1259 OID 314036)
-- Name: core_sitesettings_display_order_7c3f9215; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX core_sitesettings_display_order_7c3f9215 ON public.core_sitesettings USING btree (display_order);


--
-- TOC entry 5707 (class 1259 OID 314037)
-- Name: core_sitesettings_is_active_82c8469a; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX core_sitesettings_is_active_82c8469a ON public.core_sitesettings USING btree (is_active);


--
-- TOC entry 5710 (class 1259 OID 314038)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 5713 (class 1259 OID 314039)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 5720 (class 1259 OID 314040)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 5723 (class 1259 OID 314041)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 5724 (class 1259 OID 314042)
-- Name: expert_association_display_order_b18f81a0; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_association_display_order_b18f81a0 ON public.expert_association USING btree (display_order);


--
-- TOC entry 5725 (class 1259 OID 314043)
-- Name: expert_association_info_group_id_564b3e24; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_association_info_group_id_564b3e24 ON public.expert_association USING btree (info_group_id);


--
-- TOC entry 5726 (class 1259 OID 314044)
-- Name: expert_association_is_active_aa5788bc; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_association_is_active_aa5788bc ON public.expert_association USING btree (is_active);


--
-- TOC entry 5729 (class 1259 OID 314045)
-- Name: expert_engagementtype_display_order_54365722; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_engagementtype_display_order_54365722 ON public.expert_engagementtype USING btree (display_order);


--
-- TOC entry 5730 (class 1259 OID 314046)
-- Name: expert_engagementtype_is_active_b3426735; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_engagementtype_is_active_b3426735 ON public.expert_engagementtype USING btree (is_active);


--
-- TOC entry 5733 (class 1259 OID 314047)
-- Name: expert_engagementtype_slug_4b93110f_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_engagementtype_slug_4b93110f_like ON public.expert_engagementtype USING btree (slug varchar_pattern_ops);


--
-- TOC entry 5736 (class 1259 OID 314048)
-- Name: expert_expert_display_order_0b5b2872; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expert_display_order_0b5b2872 ON public.expert_expert USING btree (display_order);


--
-- TOC entry 5749 (class 1259 OID 314049)
-- Name: expert_expert_engagement_types_engagementtype_id_9803c021; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expert_engagement_types_engagementtype_id_9803c021 ON public.expert_expert_engagement_types USING btree (engagementtype_id);


--
-- TOC entry 5750 (class 1259 OID 314050)
-- Name: expert_expert_engagement_types_expert_id_7187dd67; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expert_engagement_types_expert_id_7187dd67 ON public.expert_expert_engagement_types USING btree (expert_id);


--
-- TOC entry 5737 (class 1259 OID 314051)
-- Name: expert_expert_group_id_408c0f52; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expert_group_id_408c0f52 ON public.expert_expert USING btree (group_id);


--
-- TOC entry 5738 (class 1259 OID 314052)
-- Name: expert_expert_is_active_66e67f5f; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expert_is_active_66e67f5f ON public.expert_expert USING btree (is_active);


--
-- TOC entry 5739 (class 1259 OID 314053)
-- Name: expert_expert_is_featured_71e79ae4; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expert_is_featured_71e79ae4 ON public.expert_expert USING btree (is_featured);


--
-- TOC entry 5740 (class 1259 OID 314054)
-- Name: expert_expert_is_published_21303545; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expert_is_published_21303545 ON public.expert_expert USING btree (is_published);


--
-- TOC entry 5741 (class 1259 OID 314055)
-- Name: expert_expert_is_senior_fd0aebf8; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expert_is_senior_fd0aebf8 ON public.expert_expert USING btree (is_senior);


--
-- TOC entry 5755 (class 1259 OID 314056)
-- Name: expert_expert_knowledge_topics_expert_id_2618f145; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expert_knowledge_topics_expert_id_2618f145 ON public.expert_expert_knowledge_topics USING btree (expert_id);


--
-- TOC entry 5756 (class 1259 OID 314057)
-- Name: expert_expert_knowledge_topics_knowledgetopic_id_93810fe6; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expert_knowledge_topics_knowledgetopic_id_93810fe6 ON public.expert_expert_knowledge_topics USING btree (knowledgetopic_id);


--
-- TOC entry 5761 (class 1259 OID 314058)
-- Name: expert_expert_research_areas_expert_id_831a3435; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expert_research_areas_expert_id_831a3435 ON public.expert_expert_research_areas USING btree (expert_id);


--
-- TOC entry 5764 (class 1259 OID 314059)
-- Name: expert_expert_research_areas_researcharea_id_49d98efd; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expert_research_areas_researcharea_id_49d98efd ON public.expert_expert_research_areas USING btree (researcharea_id);


--
-- TOC entry 5744 (class 1259 OID 314060)
-- Name: expert_expert_slug_1c4843b2_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expert_slug_1c4843b2_like ON public.expert_expert USING btree (slug varchar_pattern_ops);


--
-- TOC entry 5765 (class 1259 OID 314061)
-- Name: expert_expertgroup_display_order_c0c2e92e; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expertgroup_display_order_c0c2e92e ON public.expert_expertgroup USING btree (display_order);


--
-- TOC entry 5766 (class 1259 OID 314062)
-- Name: expert_expertgroup_is_active_517d5be6; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expertgroup_is_active_517d5be6 ON public.expert_expertgroup USING btree (is_active);


--
-- TOC entry 5769 (class 1259 OID 314063)
-- Name: expert_expertgroup_slug_93ff080d_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expertgroup_slug_93ff080d_like ON public.expert_expertgroup USING btree (slug varchar_pattern_ops);


--
-- TOC entry 5772 (class 1259 OID 314064)
-- Name: expert_expertlistingpage_display_order_1d8e5d64; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expertlistingpage_display_order_1d8e5d64 ON public.expert_expertlistingpage USING btree (display_order);


--
-- TOC entry 5773 (class 1259 OID 314065)
-- Name: expert_expertlistingpage_is_active_c1337610; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_expertlistingpage_is_active_c1337610 ON public.expert_expertlistingpage USING btree (is_active);


--
-- TOC entry 5776 (class 1259 OID 314066)
-- Name: expert_infogroup_display_order_1de19fdb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_infogroup_display_order_1de19fdb ON public.expert_infogroup USING btree (display_order);


--
-- TOC entry 5785 (class 1259 OID 314067)
-- Name: expert_infogroup_expert_direct_members_expert_id_f966e1c1; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_infogroup_expert_direct_members_expert_id_f966e1c1 ON public.expert_infogroup_expert_direct_members USING btree (expert_id);


--
-- TOC entry 5786 (class 1259 OID 314068)
-- Name: expert_infogroup_expert_direct_members_infogroup_id_2938bdfb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_infogroup_expert_direct_members_infogroup_id_2938bdfb ON public.expert_infogroup_expert_direct_members USING btree (infogroup_id);


--
-- TOC entry 5791 (class 1259 OID 314069)
-- Name: expert_infogroup_expert_research_areas_infogroup_id_c40d69e0; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_infogroup_expert_research_areas_infogroup_id_c40d69e0 ON public.expert_infogroup_expert_research_areas USING btree (infogroup_id);


--
-- TOC entry 5794 (class 1259 OID 314070)
-- Name: expert_infogroup_expert_research_areas_researcharea_id_86c2644b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_infogroup_expert_research_areas_researcharea_id_86c2644b ON public.expert_infogroup_expert_research_areas USING btree (researcharea_id);


--
-- TOC entry 5777 (class 1259 OID 314071)
-- Name: expert_infogroup_is_active_5a32389b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_infogroup_is_active_5a32389b ON public.expert_infogroup USING btree (is_active);


--
-- TOC entry 5780 (class 1259 OID 314072)
-- Name: expert_infogroup_slug_0e935619_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_infogroup_slug_0e935619_like ON public.expert_infogroup USING btree (slug varchar_pattern_ops);


--
-- TOC entry 5795 (class 1259 OID 314073)
-- Name: expert_infogroupblock_display_order_bc6585d7; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_infogroupblock_display_order_bc6585d7 ON public.expert_infogroupblock USING btree (display_order);


--
-- TOC entry 5796 (class 1259 OID 314074)
-- Name: expert_infogroupblock_info_group_id_4584e64b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_infogroupblock_info_group_id_4584e64b ON public.expert_infogroupblock USING btree (info_group_id);


--
-- TOC entry 5797 (class 1259 OID 314075)
-- Name: expert_infogroupblock_is_active_0d60ecec; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_infogroupblock_is_active_0d60ecec ON public.expert_infogroupblock USING btree (is_active);


--
-- TOC entry 5800 (class 1259 OID 314076)
-- Name: expert_infogroupmember_display_order_b6f66193; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_infogroupmember_display_order_b6f66193 ON public.expert_infogroupmember USING btree (display_order);


--
-- TOC entry 5801 (class 1259 OID 314077)
-- Name: expert_infogroupmember_info_group_id_584f052e; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_infogroupmember_info_group_id_584f052e ON public.expert_infogroupmember USING btree (info_group_id);


--
-- TOC entry 5802 (class 1259 OID 314078)
-- Name: expert_infogroupmember_is_active_51074184; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_infogroupmember_is_active_51074184 ON public.expert_infogroupmember USING btree (is_active);


--
-- TOC entry 5805 (class 1259 OID 314079)
-- Name: expert_knowledgetopic_display_order_ffcb38e9; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_knowledgetopic_display_order_ffcb38e9 ON public.expert_knowledgetopic USING btree (display_order);


--
-- TOC entry 5806 (class 1259 OID 314080)
-- Name: expert_knowledgetopic_is_active_4910a82c; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_knowledgetopic_is_active_4910a82c ON public.expert_knowledgetopic USING btree (is_active);


--
-- TOC entry 5809 (class 1259 OID 314081)
-- Name: expert_knowledgetopic_slug_49b0e2f1_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_knowledgetopic_slug_49b0e2f1_like ON public.expert_knowledgetopic USING btree (slug varchar_pattern_ops);


--
-- TOC entry 5812 (class 1259 OID 314082)
-- Name: expert_orgnode_display_order_0e9471f7; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_orgnode_display_order_0e9471f7 ON public.expert_orgnode USING btree (display_order);


--
-- TOC entry 5813 (class 1259 OID 314083)
-- Name: expert_orgnode_info_group_id_ef0cf562; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_orgnode_info_group_id_ef0cf562 ON public.expert_orgnode USING btree (info_group_id);


--
-- TOC entry 5814 (class 1259 OID 314084)
-- Name: expert_orgnode_is_active_2fe39e91; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_orgnode_is_active_2fe39e91 ON public.expert_orgnode USING btree (is_active);


--
-- TOC entry 5815 (class 1259 OID 314085)
-- Name: expert_orgnode_parent_id_064f017a; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_orgnode_parent_id_064f017a ON public.expert_orgnode USING btree (parent_id);


--
-- TOC entry 5818 (class 1259 OID 314086)
-- Name: expert_processstep_display_order_74217dbb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_processstep_display_order_74217dbb ON public.expert_processstep USING btree (display_order);


--
-- TOC entry 5819 (class 1259 OID 314087)
-- Name: expert_processstep_is_active_f4333711; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_processstep_is_active_f4333711 ON public.expert_processstep USING btree (is_active);


--
-- TOC entry 5822 (class 1259 OID 314088)
-- Name: expert_researcharea_display_order_4f4cbdb6; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_researcharea_display_order_4f4cbdb6 ON public.expert_researcharea USING btree (display_order);


--
-- TOC entry 5823 (class 1259 OID 314089)
-- Name: expert_researcharea_is_active_ecbce1bc; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_researcharea_is_active_ecbce1bc ON public.expert_researcharea USING btree (is_active);


--
-- TOC entry 5826 (class 1259 OID 314090)
-- Name: expert_researcharea_slug_2916cc06_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX expert_researcharea_slug_2916cc06_like ON public.expert_researcharea USING btree (slug varchar_pattern_ops);


--
-- TOC entry 5829 (class 1259 OID 314091)
-- Name: home_audiencesectionheader_display_order_992efedd; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_audiencesectionheader_display_order_992efedd ON public.home_audiencesectionheader USING btree (display_order);


--
-- TOC entry 5830 (class 1259 OID 314092)
-- Name: home_audiencesectionheader_is_active_82f02d39; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_audiencesectionheader_is_active_82f02d39 ON public.home_audiencesectionheader USING btree (is_active);


--
-- TOC entry 5833 (class 1259 OID 314093)
-- Name: home_audiencesegment_display_order_f4271ee6; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_audiencesegment_display_order_f4271ee6 ON public.home_audiencesegment USING btree (display_order);


--
-- TOC entry 5834 (class 1259 OID 314094)
-- Name: home_audiencesegment_is_active_331818e5; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_audiencesegment_is_active_331818e5 ON public.home_audiencesegment USING btree (is_active);


--
-- TOC entry 5837 (class 1259 OID 314095)
-- Name: home_audiencetag_display_order_e01b9461; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_audiencetag_display_order_e01b9461 ON public.home_audiencetag USING btree (display_order);


--
-- TOC entry 5838 (class 1259 OID 314096)
-- Name: home_audiencetag_is_active_9345e3a0; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_audiencetag_is_active_9345e3a0 ON public.home_audiencetag USING btree (is_active);


--
-- TOC entry 5841 (class 1259 OID 314097)
-- Name: home_audiencetag_segment_id_1ca1acab; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_audiencetag_segment_id_1ca1acab ON public.home_audiencetag USING btree (segment_id);


--
-- TOC entry 5842 (class 1259 OID 314098)
-- Name: home_capabilitiessectionheader_display_order_4a034369; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_capabilitiessectionheader_display_order_4a034369 ON public.home_capabilitiessectionheader USING btree (display_order);


--
-- TOC entry 5843 (class 1259 OID 314099)
-- Name: home_capabilitiessectionheader_is_active_f65dca5b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_capabilitiessectionheader_is_active_f65dca5b ON public.home_capabilitiessectionheader USING btree (is_active);


--
-- TOC entry 5846 (class 1259 OID 314100)
-- Name: home_corecapability_display_order_15bbb423; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_corecapability_display_order_15bbb423 ON public.home_corecapability USING btree (display_order);


--
-- TOC entry 5847 (class 1259 OID 314101)
-- Name: home_corecapability_is_active_2f8148e8; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_corecapability_is_active_2f8148e8 ON public.home_corecapability USING btree (is_active);


--
-- TOC entry 5850 (class 1259 OID 314102)
-- Name: home_ctabanner_display_order_d953d423; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_ctabanner_display_order_d953d423 ON public.home_ctabanner USING btree (display_order);


--
-- TOC entry 5851 (class 1259 OID 314103)
-- Name: home_ctabanner_is_active_3c81ffe4; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_ctabanner_is_active_3c81ffe4 ON public.home_ctabanner USING btree (is_active);


--
-- TOC entry 5854 (class 1259 OID 314104)
-- Name: home_evidencesectionheader_display_order_0662424e; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_evidencesectionheader_display_order_0662424e ON public.home_evidencesectionheader USING btree (display_order);


--
-- TOC entry 5855 (class 1259 OID 314105)
-- Name: home_evidencesectionheader_is_active_18099b39; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_evidencesectionheader_is_active_18099b39 ON public.home_evidencesectionheader USING btree (is_active);


--
-- TOC entry 5858 (class 1259 OID 314106)
-- Name: home_featuredsectionconfig_display_order_f673ca39; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_featuredsectionconfig_display_order_f673ca39 ON public.home_featuredsectionconfig USING btree (display_order);


--
-- TOC entry 5859 (class 1259 OID 314107)
-- Name: home_featuredsectionconfig_is_active_609b0412; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_featuredsectionconfig_is_active_609b0412 ON public.home_featuredsectionconfig USING btree (is_active);


--
-- TOC entry 5862 (class 1259 OID 314108)
-- Name: home_featuredsectionconfig_section_key_92d898bb_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_featuredsectionconfig_section_key_92d898bb_like ON public.home_featuredsectionconfig USING btree (section_key varchar_pattern_ops);


--
-- TOC entry 5865 (class 1259 OID 314109)
-- Name: home_heropilltag_display_order_333635c7; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_heropilltag_display_order_333635c7 ON public.home_heropilltag USING btree (display_order);


--
-- TOC entry 5866 (class 1259 OID 314110)
-- Name: home_heropilltag_hero_id_a05a5c49; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_heropilltag_hero_id_a05a5c49 ON public.home_heropilltag USING btree (hero_id);


--
-- TOC entry 5867 (class 1259 OID 314111)
-- Name: home_heropilltag_is_active_b8c8ceed; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_heropilltag_is_active_b8c8ceed ON public.home_heropilltag USING btree (is_active);


--
-- TOC entry 5870 (class 1259 OID 314112)
-- Name: home_herosection_display_order_24446dd2; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_herosection_display_order_24446dd2 ON public.home_herosection USING btree (display_order);


--
-- TOC entry 5871 (class 1259 OID 314113)
-- Name: home_herosection_is_active_ee7f22b1; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_herosection_is_active_ee7f22b1 ON public.home_herosection USING btree (is_active);


--
-- TOC entry 5874 (class 1259 OID 314114)
-- Name: home_knowledgecategory_display_order_81457722; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_knowledgecategory_display_order_81457722 ON public.home_knowledgecategory USING btree (display_order);


--
-- TOC entry 5875 (class 1259 OID 314115)
-- Name: home_knowledgecategory_is_active_d14be25e; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_knowledgecategory_is_active_d14be25e ON public.home_knowledgecategory USING btree (is_active);


--
-- TOC entry 5878 (class 1259 OID 314116)
-- Name: home_knowledgesectionheader_display_order_130c3e5d; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_knowledgesectionheader_display_order_130c3e5d ON public.home_knowledgesectionheader USING btree (display_order);


--
-- TOC entry 5879 (class 1259 OID 314117)
-- Name: home_knowledgesectionheader_is_active_a7560480; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_knowledgesectionheader_is_active_a7560480 ON public.home_knowledgesectionheader USING btree (is_active);


--
-- TOC entry 5882 (class 1259 OID 314118)
-- Name: home_methodologysectionheader_display_order_8a6a881e; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_methodologysectionheader_display_order_8a6a881e ON public.home_methodologysectionheader USING btree (display_order);


--
-- TOC entry 5883 (class 1259 OID 314119)
-- Name: home_methodologysectionheader_is_active_0f99654e; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_methodologysectionheader_is_active_0f99654e ON public.home_methodologysectionheader USING btree (is_active);


--
-- TOC entry 5886 (class 1259 OID 314120)
-- Name: home_methodologystep_display_order_c609ac4f; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_methodologystep_display_order_c609ac4f ON public.home_methodologystep USING btree (display_order);


--
-- TOC entry 5887 (class 1259 OID 314121)
-- Name: home_methodologystep_is_active_499a44e3; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_methodologystep_is_active_499a44e3 ON public.home_methodologystep USING btree (is_active);


--
-- TOC entry 5890 (class 1259 OID 314122)
-- Name: home_partnerlogo_display_order_da766da5; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_partnerlogo_display_order_da766da5 ON public.home_partnerlogo USING btree (display_order);


--
-- TOC entry 5891 (class 1259 OID 314123)
-- Name: home_partnerlogo_is_active_31663fec; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_partnerlogo_is_active_31663fec ON public.home_partnerlogo USING btree (is_active);


--
-- TOC entry 5894 (class 1259 OID 314124)
-- Name: home_philosophyprinciple_display_order_16df7b50; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_philosophyprinciple_display_order_16df7b50 ON public.home_philosophyprinciple USING btree (display_order);


--
-- TOC entry 5895 (class 1259 OID 314125)
-- Name: home_philosophyprinciple_is_active_90a39d1f; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_philosophyprinciple_is_active_90a39d1f ON public.home_philosophyprinciple USING btree (is_active);


--
-- TOC entry 5898 (class 1259 OID 314126)
-- Name: home_philosophysectionheader_display_order_301f8070; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_philosophysectionheader_display_order_301f8070 ON public.home_philosophysectionheader USING btree (display_order);


--
-- TOC entry 5899 (class 1259 OID 314127)
-- Name: home_philosophysectionheader_is_active_3d34de78; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_philosophysectionheader_is_active_3d34de78 ON public.home_philosophysectionheader USING btree (is_active);


--
-- TOC entry 5902 (class 1259 OID 314128)
-- Name: home_statisticitem_display_order_4efacabb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_statisticitem_display_order_4efacabb ON public.home_statisticitem USING btree (display_order);


--
-- TOC entry 5903 (class 1259 OID 314129)
-- Name: home_statisticitem_is_active_e2554d40; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX home_statisticitem_is_active_e2554d40 ON public.home_statisticitem USING btree (is_active);


--
-- TOC entry 5906 (class 1259 OID 314130)
-- Name: knowledge_knowledgeaccordionitem_accordion_type_08644d11; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeaccordionitem_accordion_type_08644d11 ON public.knowledge_knowledgeaccordionitem USING btree (accordion_type);


--
-- TOC entry 5907 (class 1259 OID 314131)
-- Name: knowledge_knowledgeaccordionitem_accordion_type_08644d11_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeaccordionitem_accordion_type_08644d11_like ON public.knowledge_knowledgeaccordionitem USING btree (accordion_type varchar_pattern_ops);


--
-- TOC entry 5908 (class 1259 OID 314132)
-- Name: knowledge_knowledgeaccordionitem_display_order_9a66f800; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeaccordionitem_display_order_9a66f800 ON public.knowledge_knowledgeaccordionitem USING btree (display_order);


--
-- TOC entry 5909 (class 1259 OID 314133)
-- Name: knowledge_knowledgeaccordionitem_is_active_6b30eae5; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeaccordionitem_is_active_6b30eae5 ON public.knowledge_knowledgeaccordionitem USING btree (is_active);


--
-- TOC entry 5910 (class 1259 OID 314134)
-- Name: knowledge_knowledgeaccordionitem_is_published_e7b920f9; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeaccordionitem_is_published_e7b920f9 ON public.knowledge_knowledgeaccordionitem USING btree (is_published);


--
-- TOC entry 5913 (class 1259 OID 314135)
-- Name: knowledge_knowledgeactivitynews_category_id_9e6da811; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeactivitynews_category_id_9e6da811 ON public.knowledge_knowledgeactivitynews USING btree (category_id);


--
-- TOC entry 5914 (class 1259 OID 314136)
-- Name: knowledge_knowledgeactivitynews_display_order_432c651b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeactivitynews_display_order_432c651b ON public.knowledge_knowledgeactivitynews USING btree (display_order);


--
-- TOC entry 5915 (class 1259 OID 314137)
-- Name: knowledge_knowledgeactivitynews_is_active_eafd1a8a; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeactivitynews_is_active_eafd1a8a ON public.knowledge_knowledgeactivitynews USING btree (is_active);


--
-- TOC entry 5916 (class 1259 OID 314138)
-- Name: knowledge_knowledgeactivitynews_is_published_78b1ef02; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeactivitynews_is_published_78b1ef02 ON public.knowledge_knowledgeactivitynews USING btree (is_published);


--
-- TOC entry 5931 (class 1259 OID 314139)
-- Name: knowledge_knowledgearticle_capability_id_6f2a8481; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgearticle_capability_id_6f2a8481 ON public.knowledge_knowledgearticle_related_capabilities USING btree (capability_id);


--
-- TOC entry 5919 (class 1259 OID 314140)
-- Name: knowledge_knowledgearticle_category_id_cde9c6bb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgearticle_category_id_cde9c6bb ON public.knowledge_knowledgearticle USING btree (category_id);


--
-- TOC entry 5920 (class 1259 OID 314141)
-- Name: knowledge_knowledgearticle_display_order_e5e4e749; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgearticle_display_order_e5e4e749 ON public.knowledge_knowledgearticle USING btree (display_order);


--
-- TOC entry 5921 (class 1259 OID 314142)
-- Name: knowledge_knowledgearticle_is_active_8900c0f7; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgearticle_is_active_8900c0f7 ON public.knowledge_knowledgearticle USING btree (is_active);


--
-- TOC entry 5922 (class 1259 OID 314143)
-- Name: knowledge_knowledgearticle_is_featured_72c72547; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgearticle_is_featured_72c72547 ON public.knowledge_knowledgearticle USING btree (is_featured);


--
-- TOC entry 5923 (class 1259 OID 314144)
-- Name: knowledge_knowledgearticle_is_published_60ac4714; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgearticle_is_published_60ac4714 ON public.knowledge_knowledgearticle USING btree (is_published);


--
-- TOC entry 5932 (class 1259 OID 314145)
-- Name: knowledge_knowledgearticle_knowledgearticle_id_b93df845; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgearticle_knowledgearticle_id_b93df845 ON public.knowledge_knowledgearticle_related_capabilities USING btree (knowledgearticle_id);


--
-- TOC entry 5926 (class 1259 OID 314146)
-- Name: knowledge_knowledgearticle_slug_023d0590_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgearticle_slug_023d0590_like ON public.knowledge_knowledgearticle USING btree (slug varchar_pattern_ops);


--
-- TOC entry 5937 (class 1259 OID 314147)
-- Name: knowledge_knowledgearticle_topics_knowledgearticle_id_2f40aa64; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgearticle_topics_knowledgearticle_id_2f40aa64 ON public.knowledge_knowledgearticle_topics USING btree (knowledgearticle_id);


--
-- TOC entry 5938 (class 1259 OID 314148)
-- Name: knowledge_knowledgearticle_topics_knowledgetopic_id_11d44026; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgearticle_topics_knowledgetopic_id_11d44026 ON public.knowledge_knowledgearticle_topics USING btree (knowledgetopic_id);


--
-- TOC entry 5941 (class 1259 OID 314149)
-- Name: knowledge_knowledgecategory_display_order_9ac47539; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgecategory_display_order_9ac47539 ON public.knowledge_knowledgecategory USING btree (display_order);


--
-- TOC entry 5942 (class 1259 OID 314150)
-- Name: knowledge_knowledgecategory_is_active_e4178ae1; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgecategory_is_active_e4178ae1 ON public.knowledge_knowledgecategory USING btree (is_active);


--
-- TOC entry 5943 (class 1259 OID 314151)
-- Name: knowledge_knowledgecategory_is_published_ae29ad54; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgecategory_is_published_ae29ad54 ON public.knowledge_knowledgecategory USING btree (is_published);


--
-- TOC entry 5946 (class 1259 OID 314152)
-- Name: knowledge_knowledgecategory_slug_c01ef440_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgecategory_slug_c01ef440_like ON public.knowledge_knowledgecategory USING btree (slug varchar_pattern_ops);


--
-- TOC entry 5958 (class 1259 OID 314153)
-- Name: knowledge_knowledgecontent_knowledgecontenttypecard_i_be26cef3; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgecontent_knowledgecontenttypecard_i_be26cef3 ON public.knowledge_knowledgecontenttypecard_tags USING btree (knowledgecontenttypecard_id);


--
-- TOC entry 5959 (class 1259 OID 314154)
-- Name: knowledge_knowledgecontent_knowledgetopic_id_92a945b3; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgecontent_knowledgetopic_id_92a945b3 ON public.knowledge_knowledgecontenttypecard_tags USING btree (knowledgetopic_id);


--
-- TOC entry 5949 (class 1259 OID 314155)
-- Name: knowledge_knowledgecontenttypecard_category_id_b2aad8c3; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgecontenttypecard_category_id_b2aad8c3 ON public.knowledge_knowledgecontenttypecard USING btree (category_id);


--
-- TOC entry 5950 (class 1259 OID 314156)
-- Name: knowledge_knowledgecontenttypecard_display_order_c563fc4d; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgecontenttypecard_display_order_c563fc4d ON public.knowledge_knowledgecontenttypecard USING btree (display_order);


--
-- TOC entry 5951 (class 1259 OID 314157)
-- Name: knowledge_knowledgecontenttypecard_is_active_557de55b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgecontenttypecard_is_active_557de55b ON public.knowledge_knowledgecontenttypecard USING btree (is_active);


--
-- TOC entry 5952 (class 1259 OID 314158)
-- Name: knowledge_knowledgecontenttypecard_is_published_93a47da4; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgecontenttypecard_is_published_93a47da4 ON public.knowledge_knowledgecontenttypecard USING btree (is_published);


--
-- TOC entry 5953 (class 1259 OID 314159)
-- Name: knowledge_knowledgecontenttypecard_listing_page_id_4d3fdbee; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgecontenttypecard_listing_page_id_4d3fdbee ON public.knowledge_knowledgecontenttypecard USING btree (listing_page_id);


--
-- TOC entry 5962 (class 1259 OID 314160)
-- Name: knowledge_knowledgectabutton_display_order_787ba060; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgectabutton_display_order_787ba060 ON public.knowledge_knowledgectabutton USING btree (display_order);


--
-- TOC entry 5963 (class 1259 OID 314161)
-- Name: knowledge_knowledgectabutton_is_active_f164a180; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgectabutton_is_active_f164a180 ON public.knowledge_knowledgectabutton USING btree (is_active);


--
-- TOC entry 5964 (class 1259 OID 314162)
-- Name: knowledge_knowledgectabutton_is_published_243a3933; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgectabutton_is_published_243a3933 ON public.knowledge_knowledgectabutton USING btree (is_published);


--
-- TOC entry 5965 (class 1259 OID 314163)
-- Name: knowledge_knowledgectabutton_listing_page_id_0cbdee2f; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgectabutton_listing_page_id_0cbdee2f ON public.knowledge_knowledgectabutton USING btree (listing_page_id);


--
-- TOC entry 5968 (class 1259 OID 314164)
-- Name: knowledge_knowledgedownload_category_id_5dab7adf; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgedownload_category_id_5dab7adf ON public.knowledge_knowledgedownload USING btree (category_id);


--
-- TOC entry 5969 (class 1259 OID 314165)
-- Name: knowledge_knowledgedownload_display_order_2659f7d9; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgedownload_display_order_2659f7d9 ON public.knowledge_knowledgedownload USING btree (display_order);


--
-- TOC entry 5970 (class 1259 OID 314166)
-- Name: knowledge_knowledgedownload_is_active_e8feb603; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgedownload_is_active_e8feb603 ON public.knowledge_knowledgedownload USING btree (is_active);


--
-- TOC entry 5971 (class 1259 OID 314167)
-- Name: knowledge_knowledgedownload_is_published_7d7fb9a3; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgedownload_is_published_7d7fb9a3 ON public.knowledge_knowledgedownload USING btree (is_published);


--
-- TOC entry 5974 (class 1259 OID 314168)
-- Name: knowledge_knowledgedownload_slug_6d53ef3e_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgedownload_slug_6d53ef3e_like ON public.knowledge_knowledgedownload USING btree (slug varchar_pattern_ops);


--
-- TOC entry 5979 (class 1259 OID 314169)
-- Name: knowledge_knowledgeevent_category_id_7a9a9ee5; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeevent_category_id_7a9a9ee5 ON public.knowledge_knowledgeevent USING btree (category_id);


--
-- TOC entry 5980 (class 1259 OID 314170)
-- Name: knowledge_knowledgeevent_display_order_6bb6ef06; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeevent_display_order_6bb6ef06 ON public.knowledge_knowledgeevent USING btree (display_order);


--
-- TOC entry 5981 (class 1259 OID 314171)
-- Name: knowledge_knowledgeevent_is_active_f1bea6ee; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeevent_is_active_f1bea6ee ON public.knowledge_knowledgeevent USING btree (is_active);


--
-- TOC entry 5982 (class 1259 OID 314172)
-- Name: knowledge_knowledgeevent_is_published_81a3c716; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeevent_is_published_81a3c716 ON public.knowledge_knowledgeevent USING btree (is_published);


--
-- TOC entry 5987 (class 1259 OID 314173)
-- Name: knowledge_knowledgeevent_tags_knowledgeevent_id_889fd720; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeevent_tags_knowledgeevent_id_889fd720 ON public.knowledge_knowledgeevent_tags USING btree (knowledgeevent_id);


--
-- TOC entry 5988 (class 1259 OID 314174)
-- Name: knowledge_knowledgeevent_tags_knowledgeeventtag_id_0bd45ac8; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeevent_tags_knowledgeeventtag_id_0bd45ac8 ON public.knowledge_knowledgeevent_tags USING btree (knowledgeeventtag_id);


--
-- TOC entry 5991 (class 1259 OID 314175)
-- Name: knowledge_knowledgeeventtag_display_order_d4bcec33; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeeventtag_display_order_d4bcec33 ON public.knowledge_knowledgeeventtag USING btree (display_order);


--
-- TOC entry 5992 (class 1259 OID 314176)
-- Name: knowledge_knowledgeeventtag_is_active_a299cdbb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeeventtag_is_active_a299cdbb ON public.knowledge_knowledgeeventtag USING btree (is_active);


--
-- TOC entry 5995 (class 1259 OID 314177)
-- Name: knowledge_knowledgeeventtag_slug_99732860_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgeeventtag_slug_99732860_like ON public.knowledge_knowledgeeventtag USING btree (slug varchar_pattern_ops);


--
-- TOC entry 6000 (class 1259 OID 314178)
-- Name: knowledge_knowledgefeaturedarticle_article_id_a55826cd; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgefeaturedarticle_article_id_a55826cd ON public.knowledge_knowledgefeaturedarticle USING btree (article_id);


--
-- TOC entry 6001 (class 1259 OID 314179)
-- Name: knowledge_knowledgefeaturedarticle_display_order_f990d1dc; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgefeaturedarticle_display_order_f990d1dc ON public.knowledge_knowledgefeaturedarticle USING btree (display_order);


--
-- TOC entry 6002 (class 1259 OID 314180)
-- Name: knowledge_knowledgefeaturedarticle_is_active_e7cb7cb3; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgefeaturedarticle_is_active_e7cb7cb3 ON public.knowledge_knowledgefeaturedarticle USING btree (is_active);


--
-- TOC entry 6003 (class 1259 OID 314181)
-- Name: knowledge_knowledgefeaturedarticle_listing_page_id_262b7926; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgefeaturedarticle_listing_page_id_262b7926 ON public.knowledge_knowledgefeaturedarticle USING btree (listing_page_id);


--
-- TOC entry 6006 (class 1259 OID 314182)
-- Name: knowledge_knowledgefiltergroup_display_order_8ae04e78; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgefiltergroup_display_order_8ae04e78 ON public.knowledge_knowledgefiltergroup USING btree (display_order);


--
-- TOC entry 6007 (class 1259 OID 314183)
-- Name: knowledge_knowledgefiltergroup_is_active_dac83aeb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgefiltergroup_is_active_dac83aeb ON public.knowledge_knowledgefiltergroup USING btree (is_active);


--
-- TOC entry 6008 (class 1259 OID 314184)
-- Name: knowledge_knowledgefiltergroup_param_key_df9c58fb_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgefiltergroup_param_key_df9c58fb_like ON public.knowledge_knowledgefiltergroup USING btree (param_key varchar_pattern_ops);


--
-- TOC entry 6013 (class 1259 OID 314185)
-- Name: knowledge_knowledgefilteritem_display_order_24386067; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgefilteritem_display_order_24386067 ON public.knowledge_knowledgefilteritem USING btree (display_order);


--
-- TOC entry 6014 (class 1259 OID 314186)
-- Name: knowledge_knowledgefilteritem_group_id_b1476659; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgefilteritem_group_id_b1476659 ON public.knowledge_knowledgefilteritem USING btree (group_id);


--
-- TOC entry 6017 (class 1259 OID 314187)
-- Name: knowledge_knowledgefilteritem_is_active_b925e117; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgefilteritem_is_active_b925e117 ON public.knowledge_knowledgefilteritem USING btree (is_active);


--
-- TOC entry 6020 (class 1259 OID 314188)
-- Name: knowledge_knowledgelistingpage_display_order_657f23ab; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgelistingpage_display_order_657f23ab ON public.knowledge_knowledgelistingpage USING btree (display_order);


--
-- TOC entry 6021 (class 1259 OID 314189)
-- Name: knowledge_knowledgelistingpage_is_active_e24a29c8; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgelistingpage_is_active_e24a29c8 ON public.knowledge_knowledgelistingpage USING btree (is_active);


--
-- TOC entry 6036 (class 1259 OID 314190)
-- Name: knowledge_knowledgenewsite_knowledgenewsitem_id_ae8c12ce; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgenewsite_knowledgenewsitem_id_ae8c12ce ON public.knowledge_knowledgenewsitem_topics USING btree (knowledgenewsitem_id);


--
-- TOC entry 6024 (class 1259 OID 314191)
-- Name: knowledge_knowledgenewsitem_category_id_92082a2e; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgenewsitem_category_id_92082a2e ON public.knowledge_knowledgenewsitem USING btree (category_id);


--
-- TOC entry 6025 (class 1259 OID 314192)
-- Name: knowledge_knowledgenewsitem_display_order_9d73b5f8; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgenewsitem_display_order_9d73b5f8 ON public.knowledge_knowledgenewsitem USING btree (display_order);


--
-- TOC entry 6026 (class 1259 OID 314193)
-- Name: knowledge_knowledgenewsitem_is_active_f0a92b42; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgenewsitem_is_active_f0a92b42 ON public.knowledge_knowledgenewsitem USING btree (is_active);


--
-- TOC entry 6027 (class 1259 OID 314194)
-- Name: knowledge_knowledgenewsitem_is_press_article_ed757942; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgenewsitem_is_press_article_ed757942 ON public.knowledge_knowledgenewsitem USING btree (is_press_article);


--
-- TOC entry 6028 (class 1259 OID 314195)
-- Name: knowledge_knowledgenewsitem_is_published_5885af4a; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgenewsitem_is_published_5885af4a ON public.knowledge_knowledgenewsitem USING btree (is_published);


--
-- TOC entry 6031 (class 1259 OID 314196)
-- Name: knowledge_knowledgenewsitem_slug_1c0b517f_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgenewsitem_slug_1c0b517f_like ON public.knowledge_knowledgenewsitem USING btree (slug varchar_pattern_ops);


--
-- TOC entry 6037 (class 1259 OID 314197)
-- Name: knowledge_knowledgenewsitem_topics_knowledgetopic_id_30491943; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgenewsitem_topics_knowledgetopic_id_30491943 ON public.knowledge_knowledgenewsitem_topics USING btree (knowledgetopic_id);


--
-- TOC entry 6040 (class 1259 OID 314198)
-- Name: knowledge_knowledgetopic_display_order_6e8da450; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopic_display_order_6e8da450 ON public.knowledge_knowledgetopic USING btree (display_order);


--
-- TOC entry 6041 (class 1259 OID 314199)
-- Name: knowledge_knowledgetopic_is_active_5c3ab6f0; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopic_is_active_5c3ab6f0 ON public.knowledge_knowledgetopic USING btree (is_active);


--
-- TOC entry 6042 (class 1259 OID 314200)
-- Name: knowledge_knowledgetopic_is_published_b99c8d58; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopic_is_published_b99c8d58 ON public.knowledge_knowledgetopic USING btree (is_published);


--
-- TOC entry 6045 (class 1259 OID 314201)
-- Name: knowledge_knowledgetopic_slug_450203fb_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopic_slug_450203fb_like ON public.knowledge_knowledgetopic USING btree (slug varchar_pattern_ops);


--
-- TOC entry 6057 (class 1259 OID 314202)
-- Name: knowledge_knowledgetopicca_knowledgetopiccard_id_447e1f0b; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopicca_knowledgetopiccard_id_447e1f0b ON public.knowledge_knowledgetopiccard_tags USING btree (knowledgetopiccard_id);


--
-- TOC entry 6058 (class 1259 OID 314203)
-- Name: knowledge_knowledgetopicca_knowledgetopiccardtag_id_dd80eb8d; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopicca_knowledgetopiccardtag_id_dd80eb8d ON public.knowledge_knowledgetopiccard_tags USING btree (knowledgetopiccardtag_id);


--
-- TOC entry 6048 (class 1259 OID 314204)
-- Name: knowledge_knowledgetopiccard_display_order_947d2111; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopiccard_display_order_947d2111 ON public.knowledge_knowledgetopiccard USING btree (display_order);


--
-- TOC entry 6049 (class 1259 OID 314205)
-- Name: knowledge_knowledgetopiccard_is_active_fcafb769; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopiccard_is_active_fcafb769 ON public.knowledge_knowledgetopiccard USING btree (is_active);


--
-- TOC entry 6050 (class 1259 OID 314206)
-- Name: knowledge_knowledgetopiccard_is_published_2f0108fd; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopiccard_is_published_2f0108fd ON public.knowledge_knowledgetopiccard USING btree (is_published);


--
-- TOC entry 6051 (class 1259 OID 314207)
-- Name: knowledge_knowledgetopiccard_listing_page_id_f79e2065; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopiccard_listing_page_id_f79e2065 ON public.knowledge_knowledgetopiccard USING btree (listing_page_id);


--
-- TOC entry 6054 (class 1259 OID 314208)
-- Name: knowledge_knowledgetopiccard_topic_id_d0ee58f7; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopiccard_topic_id_d0ee58f7 ON public.knowledge_knowledgetopiccard USING btree (topic_id);


--
-- TOC entry 6061 (class 1259 OID 314209)
-- Name: knowledge_knowledgetopiccardtag_display_order_d6f8cc9d; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopiccardtag_display_order_d6f8cc9d ON public.knowledge_knowledgetopiccardtag USING btree (display_order);


--
-- TOC entry 6062 (class 1259 OID 314210)
-- Name: knowledge_knowledgetopiccardtag_is_active_8d7d01cb; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopiccardtag_is_active_8d7d01cb ON public.knowledge_knowledgetopiccardtag USING btree (is_active);


--
-- TOC entry 6065 (class 1259 OID 314211)
-- Name: knowledge_knowledgetopiccardtag_slug_d21f808b_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX knowledge_knowledgetopiccardtag_slug_d21f808b_like ON public.knowledge_knowledgetopiccardtag USING btree (slug varchar_pattern_ops);


--
-- TOC entry 6068 (class 1259 OID 314212)
-- Name: solution_solution_display_order_25e6795f; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solution_display_order_25e6795f ON public.solution_solution USING btree (display_order);


--
-- TOC entry 6069 (class 1259 OID 314213)
-- Name: solution_solution_is_active_50d5dbcf; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solution_is_active_50d5dbcf ON public.solution_solution USING btree (is_active);


--
-- TOC entry 6070 (class 1259 OID 314214)
-- Name: solution_solution_is_published_9f5bbfaa; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solution_is_published_9f5bbfaa ON public.solution_solution USING btree (is_published);


--
-- TOC entry 6078 (class 1259 OID 314215)
-- Name: solution_solution_related_capabilities_capability_id_cc9faac4; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solution_related_capabilities_capability_id_cc9faac4 ON public.solution_solution_related_capabilities USING btree (capability_id);


--
-- TOC entry 6081 (class 1259 OID 314216)
-- Name: solution_solution_related_capabilities_solution_id_4a542fb4; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solution_related_capabilities_solution_id_4a542fb4 ON public.solution_solution_related_capabilities USING btree (solution_id);


--
-- TOC entry 6073 (class 1259 OID 314217)
-- Name: solution_solution_slug_f375a902_like; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solution_slug_f375a902_like ON public.solution_solution USING btree (slug varchar_pattern_ops);


--
-- TOC entry 6082 (class 1259 OID 314218)
-- Name: solution_solutionapproachstep_display_order_e0a7c3f7; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionapproachstep_display_order_e0a7c3f7 ON public.solution_solutionapproachstep USING btree (display_order);


--
-- TOC entry 6083 (class 1259 OID 314219)
-- Name: solution_solutionapproachstep_is_active_1ff807f1; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionapproachstep_is_active_1ff807f1 ON public.solution_solutionapproachstep USING btree (is_active);


--
-- TOC entry 6086 (class 1259 OID 314220)
-- Name: solution_solutionchallenge_display_order_37f07761; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionchallenge_display_order_37f07761 ON public.solution_solutionchallenge USING btree (display_order);


--
-- TOC entry 6087 (class 1259 OID 314221)
-- Name: solution_solutionchallenge_is_active_c73d3473; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionchallenge_is_active_c73d3473 ON public.solution_solutionchallenge USING btree (is_active);


--
-- TOC entry 6090 (class 1259 OID 314222)
-- Name: solution_solutionchallenge_solution_id_4408bc1c; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionchallenge_solution_id_4408bc1c ON public.solution_solutionchallenge USING btree (solution_id);


--
-- TOC entry 6091 (class 1259 OID 314223)
-- Name: solution_solutionfeature_display_order_f7d17d44; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionfeature_display_order_f7d17d44 ON public.solution_solutionfeature USING btree (display_order);


--
-- TOC entry 6092 (class 1259 OID 314224)
-- Name: solution_solutionfeature_is_active_9eff11ae; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionfeature_is_active_9eff11ae ON public.solution_solutionfeature USING btree (is_active);


--
-- TOC entry 6095 (class 1259 OID 314225)
-- Name: solution_solutionfeature_solution_id_46dcdb74; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionfeature_solution_id_46dcdb74 ON public.solution_solutionfeature USING btree (solution_id);


--
-- TOC entry 6096 (class 1259 OID 314226)
-- Name: solution_solutionlistingpage_display_order_2348f5bc; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionlistingpage_display_order_2348f5bc ON public.solution_solutionlistingpage USING btree (display_order);


--
-- TOC entry 6097 (class 1259 OID 314227)
-- Name: solution_solutionlistingpage_is_active_6ad94301; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionlistingpage_is_active_6ad94301 ON public.solution_solutionlistingpage USING btree (is_active);


--
-- TOC entry 6100 (class 1259 OID 314228)
-- Name: solution_solutionmethodologystep_display_order_6e16e23f; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionmethodologystep_display_order_6e16e23f ON public.solution_solutionmethodologystep USING btree (display_order);


--
-- TOC entry 6101 (class 1259 OID 314229)
-- Name: solution_solutionmethodologystep_is_active_4e0f8377; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionmethodologystep_is_active_4e0f8377 ON public.solution_solutionmethodologystep USING btree (is_active);


--
-- TOC entry 6104 (class 1259 OID 314230)
-- Name: solution_solutionmethodologystep_solution_id_c607d630; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionmethodologystep_solution_id_c607d630 ON public.solution_solutionmethodologystep USING btree (solution_id);


--
-- TOC entry 6105 (class 1259 OID 314231)
-- Name: solution_solutionoutput_display_order_0075fac8; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionoutput_display_order_0075fac8 ON public.solution_solutionoutput USING btree (display_order);


--
-- TOC entry 6106 (class 1259 OID 314232)
-- Name: solution_solutionoutput_is_active_c1ab63c5; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionoutput_is_active_c1ab63c5 ON public.solution_solutionoutput USING btree (is_active);


--
-- TOC entry 6109 (class 1259 OID 314233)
-- Name: solution_solutionoutput_solution_id_134a7a75; Type: INDEX; Schema: public; Owner: irdm_user
--

CREATE INDEX solution_solutionoutput_solution_id_134a7a75 ON public.solution_solutionoutput USING btree (solution_id);


--
-- TOC entry 6115 (class 2606 OID 314234)
-- Name: about_aboutcontactbannerstat about_aboutcontactba_banner_id_0d445c9d_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutcontactbannerstat
    ADD CONSTRAINT about_aboutcontactba_banner_id_0d445c9d_fk_about_abo FOREIGN KEY (banner_id) REFERENCES public.about_aboutcontactbanner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6118 (class 2606 OID 314239)
-- Name: about_aboutecosystemstatistic about_aboutecosystem_ecosystem_id_dbb1def4_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutecosystemstatistic
    ADD CONSTRAINT about_aboutecosystem_ecosystem_id_dbb1def4_fk_about_abo FOREIGN KEY (ecosystem_id) REFERENCES public.about_aboutcapabilityecosystem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6116 (class 2606 OID 314244)
-- Name: about_aboutecosystempartnergroup about_aboutecosystem_ecosystem_id_eff726e8_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutecosystempartnergroup
    ADD CONSTRAINT about_aboutecosystem_ecosystem_id_eff726e8_fk_about_abo FOREIGN KEY (ecosystem_id) REFERENCES public.about_aboutcapabilityecosystem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6117 (class 2606 OID 314249)
-- Name: about_aboutecosystempartneritem about_aboutecosystem_group_id_4a0d4b4e_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutecosystempartneritem
    ADD CONSTRAINT about_aboutecosystem_group_id_4a0d4b4e_fk_about_abo FOREIGN KEY (group_id) REFERENCES public.about_aboutecosystempartnergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6119 (class 2606 OID 314254)
-- Name: about_aboutherostatistic about_aboutherostatistic_hero_id_f3dd3aef_fk_about_abouthero_id; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutherostatistic
    ADD CONSTRAINT about_aboutherostatistic_hero_id_f3dd3aef_fk_about_abouthero_id FOREIGN KEY (hero_id) REFERENCES public.about_abouthero(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6120 (class 2606 OID 314259)
-- Name: about_abouthighlightcard about_abouthighlight_intro_id_9883885b_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_abouthighlightcard
    ADD CONSTRAINT about_abouthighlight_intro_id_9883885b_fk_about_abo FOREIGN KEY (intro_id) REFERENCES public.about_aboutintroduction(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6121 (class 2606 OID 314264)
-- Name: about_aboutlegalbadge about_aboutlegalbadg_legal_info_id_97d065ff_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutlegalbadge
    ADD CONSTRAINT about_aboutlegalbadg_legal_info_id_97d065ff_fk_about_abo FOREIGN KEY (legal_info_id) REFERENCES public.about_aboutlegalinfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6122 (class 2606 OID 314269)
-- Name: about_aboutlegalorgattribute about_aboutlegalorga_legal_info_id_4f81322e_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutlegalorgattribute
    ADD CONSTRAINT about_aboutlegalorga_legal_info_id_4f81322e_fk_about_abo FOREIGN KEY (legal_info_id) REFERENCES public.about_aboutlegalinfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6123 (class 2606 OID 314274)
-- Name: about_aboutlegaltimelineitem about_aboutlegaltime_legal_info_id_74ca4891_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutlegaltimelineitem
    ADD CONSTRAINT about_aboutlegaltime_legal_info_id_74ca4891_fk_about_abo FOREIGN KEY (legal_info_id) REFERENCES public.about_aboutlegalinfo(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6124 (class 2606 OID 314279)
-- Name: about_aboutorgstructurebulletitem about_aboutorgstruct_card_id_d4db7d74_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutorgstructurebulletitem
    ADD CONSTRAINT about_aboutorgstruct_card_id_d4db7d74_fk_about_abo FOREIGN KEY (card_id) REFERENCES public.about_aboutorgstructurecard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6125 (class 2606 OID 314284)
-- Name: about_aboutorgstructurecard about_aboutorgstruct_section_id_987f12ed_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutorgstructurecard
    ADD CONSTRAINT about_aboutorgstruct_section_id_987f12ed_fk_about_abo FOREIGN KEY (section_id) REFERENCES public.about_aboutorgstructuresection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6126 (class 2606 OID 314289)
-- Name: about_aboutpartnerbenefit about_aboutpartnerbe_section_id_0b56fc40_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutpartnerbenefit
    ADD CONSTRAINT about_aboutpartnerbe_section_id_0b56fc40_fk_about_abo FOREIGN KEY (section_id) REFERENCES public.about_aboutpartnerbenefitsection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6127 (class 2606 OID 314294)
-- Name: about_abouttargetaudience about_abouttargetaud_section_id_a00fd946_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_abouttargetaudience
    ADD CONSTRAINT about_abouttargetaud_section_id_a00fd946_fk_about_abo FOREIGN KEY (section_id) REFERENCES public.about_abouttargetaudiencesection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6129 (class 2606 OID 314299)
-- Name: about_aboutvisionmissionicon about_aboutvisionmis_section_id_01e59c26_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutvisionmissionicon
    ADD CONSTRAINT about_aboutvisionmis_section_id_01e59c26_fk_about_abo FOREIGN KEY (section_id) REFERENCES public.about_aboutvisionmission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6128 (class 2606 OID 314304)
-- Name: about_aboutvisionmissioncard about_aboutvisionmis_section_id_5cdaaa96_fk_about_abo; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.about_aboutvisionmissioncard
    ADD CONSTRAINT about_aboutvisionmis_section_id_5cdaaa96_fk_about_abo FOREIGN KEY (section_id) REFERENCES public.about_aboutvisionmission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6130 (class 2606 OID 314309)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6131 (class 2606 OID 314314)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6132 (class 2606 OID 314319)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6133 (class 2606 OID 314324)
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6134 (class 2606 OID 314329)
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6135 (class 2606 OID 314334)
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6136 (class 2606 OID 314339)
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6137 (class 2606 OID 314344)
-- Name: capability_capabilitycasestudy capability_capabilit_capability_id_22efefff_fk_capabilit; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capabilitycasestudy
    ADD CONSTRAINT capability_capabilit_capability_id_22efefff_fk_capabilit FOREIGN KEY (capability_id) REFERENCES public.capability_capability(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6139 (class 2606 OID 314349)
-- Name: capability_capabilityfeature capability_capabilit_capability_id_2e9982e2_fk_capabilit; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capabilityfeature
    ADD CONSTRAINT capability_capabilit_capability_id_2e9982e2_fk_capabilit FOREIGN KEY (capability_id) REFERENCES public.capability_capability(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6142 (class 2606 OID 314354)
-- Name: capability_capabilityoutput capability_capabilit_capability_id_5aa8adef_fk_capabilit; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capabilityoutput
    ADD CONSTRAINT capability_capabilit_capability_id_5aa8adef_fk_capabilit FOREIGN KEY (capability_id) REFERENCES public.capability_capability(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6141 (class 2606 OID 314359)
-- Name: capability_capabilityneeditem capability_capabilit_capability_id_7930787f_fk_capabilit; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capabilityneeditem
    ADD CONSTRAINT capability_capabilit_capability_id_7930787f_fk_capabilit FOREIGN KEY (capability_id) REFERENCES public.capability_capability(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6140 (class 2606 OID 314364)
-- Name: capability_capabilityhowstep capability_capabilit_capability_id_bd6ae428_fk_capabilit; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capabilityhowstep
    ADD CONSTRAINT capability_capabilit_capability_id_bd6ae428_fk_capabilit FOREIGN KEY (capability_id) REFERENCES public.capability_capability(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6138 (class 2606 OID 314369)
-- Name: capability_capabilitycasestudytag capability_capabilit_case_study_id_b5ed7f46_fk_capabilit; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.capability_capabilitycasestudytag
    ADD CONSTRAINT capability_capabilit_case_study_id_b5ed7f46_fk_capabilit FOREIGN KEY (case_study_id) REFERENCES public.capability_capabilitycasestudy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6143 (class 2606 OID 314374)
-- Name: core_footerlink core_footerlink_section_id_0235b1ac_fk_core_footersection_id; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.core_footerlink
    ADD CONSTRAINT core_footerlink_section_id_0235b1ac_fk_core_footersection_id FOREIGN KEY (section_id) REFERENCES public.core_footersection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6144 (class 2606 OID 314379)
-- Name: core_menuitem core_menuitem_parent_id_dd02175c_fk_core_menuitem_id; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.core_menuitem
    ADD CONSTRAINT core_menuitem_parent_id_dd02175c_fk_core_menuitem_id FOREIGN KEY (parent_id) REFERENCES public.core_menuitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6145 (class 2606 OID 314384)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6146 (class 2606 OID 314389)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6147 (class 2606 OID 314394)
-- Name: expert_association expert_association_info_group_id_564b3e24_fk_expert_in; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_association
    ADD CONSTRAINT expert_association_info_group_id_564b3e24_fk_expert_in FOREIGN KEY (info_group_id) REFERENCES public.expert_infogroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6149 (class 2606 OID 314399)
-- Name: expert_expert_engagement_types expert_expert_engage_engagementtype_id_9803c021_fk_expert_en; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert_engagement_types
    ADD CONSTRAINT expert_expert_engage_engagementtype_id_9803c021_fk_expert_en FOREIGN KEY (engagementtype_id) REFERENCES public.expert_engagementtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6150 (class 2606 OID 314404)
-- Name: expert_expert_engagement_types expert_expert_engage_expert_id_7187dd67_fk_expert_ex; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert_engagement_types
    ADD CONSTRAINT expert_expert_engage_expert_id_7187dd67_fk_expert_ex FOREIGN KEY (expert_id) REFERENCES public.expert_expert(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6148 (class 2606 OID 314409)
-- Name: expert_expert expert_expert_group_id_408c0f52_fk_expert_expertgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert
    ADD CONSTRAINT expert_expert_group_id_408c0f52_fk_expert_expertgroup_id FOREIGN KEY (group_id) REFERENCES public.expert_expertgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6151 (class 2606 OID 314414)
-- Name: expert_expert_knowledge_topics expert_expert_knowle_expert_id_2618f145_fk_expert_ex; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert_knowledge_topics
    ADD CONSTRAINT expert_expert_knowle_expert_id_2618f145_fk_expert_ex FOREIGN KEY (expert_id) REFERENCES public.expert_expert(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6152 (class 2606 OID 314419)
-- Name: expert_expert_knowledge_topics expert_expert_knowle_knowledgetopic_id_93810fe6_fk_expert_kn; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert_knowledge_topics
    ADD CONSTRAINT expert_expert_knowle_knowledgetopic_id_93810fe6_fk_expert_kn FOREIGN KEY (knowledgetopic_id) REFERENCES public.expert_knowledgetopic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6153 (class 2606 OID 314424)
-- Name: expert_expert_research_areas expert_expert_resear_expert_id_831a3435_fk_expert_ex; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert_research_areas
    ADD CONSTRAINT expert_expert_resear_expert_id_831a3435_fk_expert_ex FOREIGN KEY (expert_id) REFERENCES public.expert_expert(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6154 (class 2606 OID 314429)
-- Name: expert_expert_research_areas expert_expert_resear_researcharea_id_49d98efd_fk_expert_re; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_expert_research_areas
    ADD CONSTRAINT expert_expert_resear_researcharea_id_49d98efd_fk_expert_re FOREIGN KEY (researcharea_id) REFERENCES public.expert_researcharea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6155 (class 2606 OID 314434)
-- Name: expert_infogroup_expert_direct_members expert_infogroup_exp_expert_id_f966e1c1_fk_expert_ex; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroup_expert_direct_members
    ADD CONSTRAINT expert_infogroup_exp_expert_id_f966e1c1_fk_expert_ex FOREIGN KEY (expert_id) REFERENCES public.expert_expert(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6156 (class 2606 OID 314439)
-- Name: expert_infogroup_expert_direct_members expert_infogroup_exp_infogroup_id_2938bdfb_fk_expert_in; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroup_expert_direct_members
    ADD CONSTRAINT expert_infogroup_exp_infogroup_id_2938bdfb_fk_expert_in FOREIGN KEY (infogroup_id) REFERENCES public.expert_infogroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6157 (class 2606 OID 314444)
-- Name: expert_infogroup_expert_research_areas expert_infogroup_exp_infogroup_id_c40d69e0_fk_expert_in; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroup_expert_research_areas
    ADD CONSTRAINT expert_infogroup_exp_infogroup_id_c40d69e0_fk_expert_in FOREIGN KEY (infogroup_id) REFERENCES public.expert_infogroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6158 (class 2606 OID 314449)
-- Name: expert_infogroup_expert_research_areas expert_infogroup_exp_researcharea_id_86c2644b_fk_expert_re; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroup_expert_research_areas
    ADD CONSTRAINT expert_infogroup_exp_researcharea_id_86c2644b_fk_expert_re FOREIGN KEY (researcharea_id) REFERENCES public.expert_researcharea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6159 (class 2606 OID 314454)
-- Name: expert_infogroupblock expert_infogroupbloc_info_group_id_4584e64b_fk_expert_in; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroupblock
    ADD CONSTRAINT expert_infogroupbloc_info_group_id_4584e64b_fk_expert_in FOREIGN KEY (info_group_id) REFERENCES public.expert_infogroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6160 (class 2606 OID 314459)
-- Name: expert_infogroupmember expert_infogroupmemb_info_group_id_584f052e_fk_expert_in; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_infogroupmember
    ADD CONSTRAINT expert_infogroupmemb_info_group_id_584f052e_fk_expert_in FOREIGN KEY (info_group_id) REFERENCES public.expert_infogroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6161 (class 2606 OID 314464)
-- Name: expert_orgnode expert_orgnode_info_group_id_ef0cf562_fk_expert_infogroup_id; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_orgnode
    ADD CONSTRAINT expert_orgnode_info_group_id_ef0cf562_fk_expert_infogroup_id FOREIGN KEY (info_group_id) REFERENCES public.expert_infogroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6162 (class 2606 OID 314469)
-- Name: expert_orgnode expert_orgnode_parent_id_064f017a_fk_expert_orgnode_id; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.expert_orgnode
    ADD CONSTRAINT expert_orgnode_parent_id_064f017a_fk_expert_orgnode_id FOREIGN KEY (parent_id) REFERENCES public.expert_orgnode(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6163 (class 2606 OID 314474)
-- Name: home_audiencetag home_audiencetag_segment_id_1ca1acab_fk_home_audiencesegment_id; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_audiencetag
    ADD CONSTRAINT home_audiencetag_segment_id_1ca1acab_fk_home_audiencesegment_id FOREIGN KEY (segment_id) REFERENCES public.home_audiencesegment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6164 (class 2606 OID 314479)
-- Name: home_heropilltag home_heropilltag_hero_id_a05a5c49_fk_home_herosection_id; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.home_heropilltag
    ADD CONSTRAINT home_heropilltag_hero_id_a05a5c49_fk_home_herosection_id FOREIGN KEY (hero_id) REFERENCES public.home_herosection(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6167 (class 2606 OID 314484)
-- Name: knowledge_knowledgearticle_related_capabilities knowledge_knowledgea_capability_id_6f2a8481_fk_capabilit; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgearticle_related_capabilities
    ADD CONSTRAINT knowledge_knowledgea_capability_id_6f2a8481_fk_capabilit FOREIGN KEY (capability_id) REFERENCES public.capability_capability(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6165 (class 2606 OID 314489)
-- Name: knowledge_knowledgeactivitynews knowledge_knowledgea_category_id_9e6da811_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgeactivitynews
    ADD CONSTRAINT knowledge_knowledgea_category_id_9e6da811_fk_knowledge FOREIGN KEY (category_id) REFERENCES public.knowledge_knowledgecategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6166 (class 2606 OID 314494)
-- Name: knowledge_knowledgearticle knowledge_knowledgea_category_id_cde9c6bb_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgearticle
    ADD CONSTRAINT knowledge_knowledgea_category_id_cde9c6bb_fk_knowledge FOREIGN KEY (category_id) REFERENCES public.knowledge_knowledgecategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6169 (class 2606 OID 314499)
-- Name: knowledge_knowledgearticle_topics knowledge_knowledgea_knowledgearticle_id_2f40aa64_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgearticle_topics
    ADD CONSTRAINT knowledge_knowledgea_knowledgearticle_id_2f40aa64_fk_knowledge FOREIGN KEY (knowledgearticle_id) REFERENCES public.knowledge_knowledgearticle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6168 (class 2606 OID 314504)
-- Name: knowledge_knowledgearticle_related_capabilities knowledge_knowledgea_knowledgearticle_id_b93df845_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgearticle_related_capabilities
    ADD CONSTRAINT knowledge_knowledgea_knowledgearticle_id_b93df845_fk_knowledge FOREIGN KEY (knowledgearticle_id) REFERENCES public.knowledge_knowledgearticle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6170 (class 2606 OID 314509)
-- Name: knowledge_knowledgearticle_topics knowledge_knowledgea_knowledgetopic_id_11d44026_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgearticle_topics
    ADD CONSTRAINT knowledge_knowledgea_knowledgetopic_id_11d44026_fk_knowledge FOREIGN KEY (knowledgetopic_id) REFERENCES public.knowledge_knowledgetopic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6171 (class 2606 OID 314514)
-- Name: knowledge_knowledgecontenttypecard knowledge_knowledgec_category_id_b2aad8c3_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgecontenttypecard
    ADD CONSTRAINT knowledge_knowledgec_category_id_b2aad8c3_fk_knowledge FOREIGN KEY (category_id) REFERENCES public.knowledge_knowledgecategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6173 (class 2606 OID 314519)
-- Name: knowledge_knowledgecontenttypecard_tags knowledge_knowledgec_knowledgecontenttype_be26cef3_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgecontenttypecard_tags
    ADD CONSTRAINT knowledge_knowledgec_knowledgecontenttype_be26cef3_fk_knowledge FOREIGN KEY (knowledgecontenttypecard_id) REFERENCES public.knowledge_knowledgecontenttypecard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6174 (class 2606 OID 314524)
-- Name: knowledge_knowledgecontenttypecard_tags knowledge_knowledgec_knowledgetopic_id_92a945b3_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgecontenttypecard_tags
    ADD CONSTRAINT knowledge_knowledgec_knowledgetopic_id_92a945b3_fk_knowledge FOREIGN KEY (knowledgetopic_id) REFERENCES public.knowledge_knowledgetopic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6175 (class 2606 OID 314529)
-- Name: knowledge_knowledgectabutton knowledge_knowledgec_listing_page_id_0cbdee2f_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgectabutton
    ADD CONSTRAINT knowledge_knowledgec_listing_page_id_0cbdee2f_fk_knowledge FOREIGN KEY (listing_page_id) REFERENCES public.knowledge_knowledgelistingpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6172 (class 2606 OID 314534)
-- Name: knowledge_knowledgecontenttypecard knowledge_knowledgec_listing_page_id_4d3fdbee_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgecontenttypecard
    ADD CONSTRAINT knowledge_knowledgec_listing_page_id_4d3fdbee_fk_knowledge FOREIGN KEY (listing_page_id) REFERENCES public.knowledge_knowledgelistingpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6176 (class 2606 OID 314539)
-- Name: knowledge_knowledgedownload knowledge_knowledged_category_id_5dab7adf_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgedownload
    ADD CONSTRAINT knowledge_knowledged_category_id_5dab7adf_fk_knowledge FOREIGN KEY (category_id) REFERENCES public.knowledge_knowledgecategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6177 (class 2606 OID 314544)
-- Name: knowledge_knowledgeevent knowledge_knowledgee_category_id_7a9a9ee5_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgeevent
    ADD CONSTRAINT knowledge_knowledgee_category_id_7a9a9ee5_fk_knowledge FOREIGN KEY (category_id) REFERENCES public.knowledge_knowledgecategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6178 (class 2606 OID 314549)
-- Name: knowledge_knowledgeevent_tags knowledge_knowledgee_knowledgeevent_id_889fd720_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgeevent_tags
    ADD CONSTRAINT knowledge_knowledgee_knowledgeevent_id_889fd720_fk_knowledge FOREIGN KEY (knowledgeevent_id) REFERENCES public.knowledge_knowledgeevent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6179 (class 2606 OID 314554)
-- Name: knowledge_knowledgeevent_tags knowledge_knowledgee_knowledgeeventtag_id_0bd45ac8_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgeevent_tags
    ADD CONSTRAINT knowledge_knowledgee_knowledgeeventtag_id_0bd45ac8_fk_knowledge FOREIGN KEY (knowledgeeventtag_id) REFERENCES public.knowledge_knowledgeeventtag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6180 (class 2606 OID 314559)
-- Name: knowledge_knowledgefeaturedarticle knowledge_knowledgef_article_id_a55826cd_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgefeaturedarticle
    ADD CONSTRAINT knowledge_knowledgef_article_id_a55826cd_fk_knowledge FOREIGN KEY (article_id) REFERENCES public.knowledge_knowledgearticle(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6182 (class 2606 OID 314564)
-- Name: knowledge_knowledgefilteritem knowledge_knowledgef_group_id_b1476659_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgefilteritem
    ADD CONSTRAINT knowledge_knowledgef_group_id_b1476659_fk_knowledge FOREIGN KEY (group_id) REFERENCES public.knowledge_knowledgefiltergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6181 (class 2606 OID 314569)
-- Name: knowledge_knowledgefeaturedarticle knowledge_knowledgef_listing_page_id_262b7926_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgefeaturedarticle
    ADD CONSTRAINT knowledge_knowledgef_listing_page_id_262b7926_fk_knowledge FOREIGN KEY (listing_page_id) REFERENCES public.knowledge_knowledgelistingpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6183 (class 2606 OID 314574)
-- Name: knowledge_knowledgenewsitem knowledge_knowledgen_category_id_92082a2e_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgenewsitem
    ADD CONSTRAINT knowledge_knowledgen_category_id_92082a2e_fk_knowledge FOREIGN KEY (category_id) REFERENCES public.knowledge_knowledgecategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6184 (class 2606 OID 314579)
-- Name: knowledge_knowledgenewsitem_topics knowledge_knowledgen_knowledgenewsitem_id_ae8c12ce_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgenewsitem_topics
    ADD CONSTRAINT knowledge_knowledgen_knowledgenewsitem_id_ae8c12ce_fk_knowledge FOREIGN KEY (knowledgenewsitem_id) REFERENCES public.knowledge_knowledgenewsitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6185 (class 2606 OID 314584)
-- Name: knowledge_knowledgenewsitem_topics knowledge_knowledgen_knowledgetopic_id_30491943_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgenewsitem_topics
    ADD CONSTRAINT knowledge_knowledgen_knowledgetopic_id_30491943_fk_knowledge FOREIGN KEY (knowledgetopic_id) REFERENCES public.knowledge_knowledgetopic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6188 (class 2606 OID 314589)
-- Name: knowledge_knowledgetopiccard_tags knowledge_knowledget_knowledgetopiccard_i_447e1f0b_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgetopiccard_tags
    ADD CONSTRAINT knowledge_knowledget_knowledgetopiccard_i_447e1f0b_fk_knowledge FOREIGN KEY (knowledgetopiccard_id) REFERENCES public.knowledge_knowledgetopiccard(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6189 (class 2606 OID 314594)
-- Name: knowledge_knowledgetopiccard_tags knowledge_knowledget_knowledgetopiccardta_dd80eb8d_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgetopiccard_tags
    ADD CONSTRAINT knowledge_knowledget_knowledgetopiccardta_dd80eb8d_fk_knowledge FOREIGN KEY (knowledgetopiccardtag_id) REFERENCES public.knowledge_knowledgetopiccardtag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6186 (class 2606 OID 314599)
-- Name: knowledge_knowledgetopiccard knowledge_knowledget_listing_page_id_f79e2065_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgetopiccard
    ADD CONSTRAINT knowledge_knowledget_listing_page_id_f79e2065_fk_knowledge FOREIGN KEY (listing_page_id) REFERENCES public.knowledge_knowledgelistingpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6187 (class 2606 OID 314604)
-- Name: knowledge_knowledgetopiccard knowledge_knowledget_topic_id_d0ee58f7_fk_knowledge; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.knowledge_knowledgetopiccard
    ADD CONSTRAINT knowledge_knowledget_topic_id_d0ee58f7_fk_knowledge FOREIGN KEY (topic_id) REFERENCES public.knowledge_knowledgetopic(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6190 (class 2606 OID 314609)
-- Name: solution_solution_related_capabilities solution_solution_re_capability_id_cc9faac4_fk_capabilit; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solution_related_capabilities
    ADD CONSTRAINT solution_solution_re_capability_id_cc9faac4_fk_capabilit FOREIGN KEY (capability_id) REFERENCES public.capability_capability(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6191 (class 2606 OID 314614)
-- Name: solution_solution_related_capabilities solution_solution_re_solution_id_4a542fb4_fk_solution_; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solution_related_capabilities
    ADD CONSTRAINT solution_solution_re_solution_id_4a542fb4_fk_solution_ FOREIGN KEY (solution_id) REFERENCES public.solution_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6192 (class 2606 OID 314619)
-- Name: solution_solutionchallenge solution_solutioncha_solution_id_4408bc1c_fk_solution_; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solutionchallenge
    ADD CONSTRAINT solution_solutioncha_solution_id_4408bc1c_fk_solution_ FOREIGN KEY (solution_id) REFERENCES public.solution_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6193 (class 2606 OID 314624)
-- Name: solution_solutionfeature solution_solutionfea_solution_id_46dcdb74_fk_solution_; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solutionfeature
    ADD CONSTRAINT solution_solutionfea_solution_id_46dcdb74_fk_solution_ FOREIGN KEY (solution_id) REFERENCES public.solution_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6194 (class 2606 OID 314629)
-- Name: solution_solutionmethodologystep solution_solutionmet_solution_id_c607d630_fk_solution_; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solutionmethodologystep
    ADD CONSTRAINT solution_solutionmet_solution_id_c607d630_fk_solution_ FOREIGN KEY (solution_id) REFERENCES public.solution_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6195 (class 2606 OID 314634)
-- Name: solution_solutionoutput solution_solutionout_solution_id_134a7a75_fk_solution_; Type: FK CONSTRAINT; Schema: public; Owner: irdm_user
--

ALTER TABLE ONLY public.solution_solutionoutput
    ADD CONSTRAINT solution_solutionout_solution_id_134a7a75_fk_solution_ FOREIGN KEY (solution_id) REFERENCES public.solution_solution(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 6493 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: irdm_user
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2026-08-10 23:13:15

--
-- PostgreSQL database dump complete
--

\unrestrict eZPyftJAJWyeO79N0bMyzhlRsHnP0gIudQIOgCT2VVfEmxeDjbzsPEfPwDz5XbD

