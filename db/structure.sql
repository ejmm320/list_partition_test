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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: articles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.articles (
    store_number integer NOT NULL,
    dan character varying NOT NULL,
    name text NOT NULL,
    price numeric NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
)
PARTITION BY LIST (store_number);


--
-- Name: articles2; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.articles2 (
    id bigint NOT NULL,
    store_number integer NOT NULL,
    dan character varying NOT NULL,
    name text NOT NULL,
    price numeric NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: articles2_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.articles2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: articles2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.articles2_id_seq OWNED BY public.articles2.id;


--
-- Name: articles_991; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.articles_991 (
    store_number integer NOT NULL,
    dan character varying NOT NULL,
    name text NOT NULL,
    price numeric NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: articles_992; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.articles_992 (
    store_number integer NOT NULL,
    dan character varying NOT NULL,
    name text NOT NULL,
    price numeric NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: articles_993; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.articles_993 (
    store_number integer NOT NULL,
    dan character varying NOT NULL,
    name text NOT NULL,
    price numeric NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: stores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.stores (
    id bigint NOT NULL,
    number character varying NOT NULL,
    name character varying NOT NULL,
    start_date date NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: articles_991; Type: TABLE ATTACH; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles ATTACH PARTITION public.articles_991 FOR VALUES IN (991);


--
-- Name: articles_992; Type: TABLE ATTACH; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles ATTACH PARTITION public.articles_992 FOR VALUES IN (992);


--
-- Name: articles_993; Type: TABLE ATTACH; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles ATTACH PARTITION public.articles_993 FOR VALUES IN (993);


--
-- Name: articles2 id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles2 ALTER COLUMN id SET DEFAULT nextval('public.articles2_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: articles2 articles2_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles2
    ADD CONSTRAINT articles2_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (store_number, dan);


--
-- Name: articles_991 articles_991_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles_991
    ADD CONSTRAINT articles_991_pkey PRIMARY KEY (store_number, dan);


--
-- Name: articles_992 articles_992_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles_992
    ADD CONSTRAINT articles_992_pkey PRIMARY KEY (store_number, dan);


--
-- Name: articles_993 articles_993_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles_993
    ADD CONSTRAINT articles_993_pkey PRIMARY KEY (store_number, dan);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: index_articles2_on_store_number_and_dan; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_articles2_on_store_number_and_dan ON public.articles2 USING btree (store_number, dan);


--
-- Name: articles_991_pkey; Type: INDEX ATTACH; Schema: public; Owner: -
--

ALTER INDEX public.articles_pkey ATTACH PARTITION public.articles_991_pkey;


--
-- Name: articles_992_pkey; Type: INDEX ATTACH; Schema: public; Owner: -
--

ALTER INDEX public.articles_pkey ATTACH PARTITION public.articles_992_pkey;


--
-- Name: articles_993_pkey; Type: INDEX ATTACH; Schema: public; Owner: -
--

ALTER INDEX public.articles_pkey ATTACH PARTITION public.articles_993_pkey;


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20240327184306'),
('20240324105105'),
('202403241035215');

