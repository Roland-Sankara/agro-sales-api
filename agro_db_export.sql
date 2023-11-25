--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: Role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Role" AS ENUM (
    'superAdmin',
    'admin',
    'customer'
);


ALTER TYPE public."Role" OWNER TO agro_sales_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Category; Type: TABLE; Schema: public; Owner: agro_sales_user
--

CREATE TABLE public."Category" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Category" OWNER TO agro_sales_user;

--
-- Name: Category_id_seq; Type: SEQUENCE; Schema: public; Owner: agro_sales_user
--

CREATE SEQUENCE public."Category_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Category_id_seq" OWNER TO agro_sales_user;

--
-- Name: Category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agro_sales_user
--

ALTER SEQUENCE public."Category_id_seq" OWNED BY public."Category".id;


--
-- Name: Product; Type: TABLE; Schema: public; Owner: agro_sales_user
--

CREATE TABLE public."Product" (
    id integer NOT NULL,
    name text NOT NULL,
    price bigint NOT NULL,
    description text NOT NULL,
    "categoryId" integer NOT NULL
);


ALTER TABLE public."Product" OWNER TO agro_sales_user;

--
-- Name: Product_id_seq; Type: SEQUENCE; Schema: public; Owner: agro_sales_user
--

CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Product_id_seq" OWNER TO agro_sales_user;

--
-- Name: Product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agro_sales_user
--

ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: agro_sales_user
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    role public."Role" DEFAULT 'admin'::public."Role" NOT NULL
);


ALTER TABLE public."User" OWNER TO agro_sales_user;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: agro_sales_user
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_id_seq" OWNER TO agro_sales_user;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agro_sales_user
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: agro_sales_user
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO agro_sales_user;

--
-- Name: Category id; Type: DEFAULT; Schema: public; Owner: agro_sales_user
--

ALTER TABLE ONLY public."Category" ALTER COLUMN id SET DEFAULT nextval('public."Category_id_seq"'::regclass);


--
-- Name: Product id; Type: DEFAULT; Schema: public; Owner: agro_sales_user
--

ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: agro_sales_user
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: agro_sales_user
--

COPY public."Category" (id, name) FROM stdin;
1	dairy
2	cash-crop
3	poultry
\.


--
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: agro_sales_user
--

COPY public."Product" (id, name, price, description, "categoryId") FROM stdin;
1	Fresh Dairsy Youghurt	5000	This is so tasty	1
2	Coffee	15000	Arabica coffee from Mount Elgon in UG	2
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: agro_sales_user
--

COPY public."User" (id, username, password, role) FROM stdin;
1	Roland-Sankara	123de#5678	admin
2	King Fahad	1234349$3%^	admin
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: agro_sales_user
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
8c0312ec-eda6-4664-9bcf-f59c39c24613	22ecdc89f0c76489492325dc40fac017ea66ca3589d4d3b601cd288ba9a29e88	2023-11-23 23:18:31.82643+03	20231123201831_init_migration	\N	\N	2023-11-23 23:18:31.759762+03	1
\.


--
-- Name: Category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agro_sales_user
--

SELECT pg_catalog.setval('public."Category_id_seq"', 3, true);


--
-- Name: Product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agro_sales_user
--

SELECT pg_catalog.setval('public."Product_id_seq"', 2, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agro_sales_user
--

SELECT pg_catalog.setval('public."User_id_seq"', 2, true);


--
-- Name: Category Category_pkey; Type: CONSTRAINT; Schema: public; Owner: agro_sales_user
--

ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);


--
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: agro_sales_user
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: agro_sales_user
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: agro_sales_user
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Product Product_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: agro_sales_user
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."Category"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostreSQL database dump complete
--

