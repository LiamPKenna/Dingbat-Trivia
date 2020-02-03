--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO "Guest";

--
-- Name: questions; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.questions (
    id bigint NOT NULL,
    question character varying,
    correct_answer integer,
    answer_1 character varying,
    answer_2 character varying,
    answer_3 character varying,
    answer_4 character varying
);


ALTER TABLE public.questions OWNER TO "Guest";

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE public.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO "Guest";

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE public.questions_id_seq OWNED BY public.questions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "Guest";

--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-02-02 02:57:21.378768	2020-02-02 02:57:21.378768
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.questions (id, question, correct_answer, answer_1, answer_2, answer_3, answer_4) FROM stdin;
2	What is the state bird of Oregon?	3	Tufted Puffin	Anna's Hummingbird	Western Meadowlark	White-headed Woodpecker
3	What year was the very first model of the iPhone released?	2	2005	2007	2008	2010
4	Which is NOT a Tom Hank's movie?	4	Saving Private Ryan	The Green Mile	You've Got Mail	Flight
5	Who was the 2nd president of the US?	1	John Adams	George Washington	Thomas Jefferson	Abraham Lincoln
6	Mick Jagger is in which band?	2	Pink Floyd	Rolling Stones	The Clash	The Beatles
7	How many spaces are on a standard Monopoly board?	4	20	60	80	40
8	What was the first successful vaccine developed in history?	2	Scarlet Fever	Smallpox	Cholera	Rabies
9	In which language was the book 'War and Peace' originally written?	4	French	English	German	Russian
10	Adele performed the theme song to which James Bond film?	1	Skyfall	Quantum of Solace	Casino Royale	From Russia With Love
11	What is the color of Donald Duck's bowtie?	4	Blue	Yellow	Green	Red
12	Which of these NBA franchises has never signed LeBron James?	1	Boston Celtics	Miami Heat	Los Angeles Laker	Cleveland Cavaliers
13	Which of these antagonist characters was created by novelist J.K. Rowling?	4	Lord Farqaad	Darth Vader	Professor Moriarty	Lord Voldemort
14	Which actress plays a major role on the TV show 'The Big Bang Theory'?	1	Kaley Cuoco	Portia de Rossi	Sofia Vergara	Emily Deschanel
15	What funk/soul band was Lionel Richie a member of?	3	Amigas	Spectrums	Commodores	Ataris
16	The only planet the has a day longer than its year is?	2	Jupiter	Venus	Pluto	Uranus
17	The naturalist responsible for "The Theory of Evolution by Natural Selection" is which one of the following?	3	Issac Newton	Albert Einstein	Charles Darwin	Johannes Kepler
18	The North Star is which one of the following?	4	Alpha Centauri	Rigal	Orion	Polaris
19	All land-dwelling living things depend upon which of the following as the initial source of energy?	3	Green Plants	Chlorophyll	Sunlight	Producers
20	A woodpecker can peck how many times per second?	3	10	40	20	30
21	It is estimated that millions of trees world wide are accidentally planted by which species	2	Elephants	Squirrels	Tiger	Hippopotamus
22	Introduced in New York in 1950 what was the first credit card?	2	Visa	Diners Club	American Express	Master Card
23	Which composer wrote The Water Music?	1	Handel	Mozart	Beethoven	Vivaldi
24	In which city would you find the International Court of Justice?	2	Amsterdam	Le Hague	Paris	Berlin
25	In mythology who fired the arrow that struck Achilles in his heel?	4	Rome	Athens	Berlin	Paris
26	Which was the first country to have a public monorail system?	3	USA	Germany	Japan	England
27	Which is the world's longest mountain range?	1	Andes	Himalayas	Rocky Mountains	Akaishi Mountains
28	Which female actress won the most Oscars?	4	Jodie Foster	Meryl Streep	Angelina Jolie	Katharine Hepburn
29	In 1988 Bob Dylan was a member of which supergroup?	3	The Moving Strawburys	The Adventuring Bilburys	The Traveling Wilburys	The Journeying Blackburys
30	What was Elvis Presley's middle name?	2	Moses	Aaron	Adam	Abraham
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY public.schema_migrations (version) FROM stdin;
20200202030455
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('public.questions_id_seq', 30, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- PostgreSQL database dump complete
--
