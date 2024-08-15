--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6
-- Dumped by pg_dump version 14.6

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
-- Name: managers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.managers (
    mgr_id character varying(10) NOT NULL,
    name character varying(80) NOT NULL,
    dob date NOT NULL,
    team_id character varying(10),
    since date
);


ALTER TABLE public.managers OWNER TO postgres;

--
-- Name: match_referees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.match_referees (
    match_num character varying(10) NOT NULL,
    referee character varying(15),
    assistant_referee_1 character varying(15),
    assistant_referee_2 character varying(15),
    fourth_referee character varying(15)
);


ALTER TABLE public.match_referees OWNER TO postgres;

--
-- Name: matches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matches (
    match_num character varying(10) NOT NULL,
    match_date date NOT NULL,
    host_team_id character varying(10) NOT NULL,
    guest_team_id character varying(10) NOT NULL,
    host_team_score integer NOT NULL,
    guest_team_score integer NOT NULL
);


ALTER TABLE public.matches OWNER TO postgres;

--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    player_id character varying(10) NOT NULL,
    name character varying(80) NOT NULL,
    dob date NOT NULL,
    jersey_no integer NOT NULL,
    team_id character varying(10) NOT NULL
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: referees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.referees (
    referee_id character varying(10) NOT NULL,
    name character varying(80) NOT NULL,
    dob date NOT NULL
);


ALTER TABLE public.referees OWNER TO postgres;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    team_id character varying(10) NOT NULL,
    name character varying(80) NOT NULL,
    city character varying(80) NOT NULL,
    playground character varying(80) NOT NULL,
    jersey_home_color character varying(80),
    jersey_away_color character varying(80)
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Data for Name: managers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.managers (mgr_id, name, dob, team_id, since) FROM stdin;
M0001	Jacob	1990-08-23	T0001	2020-06-22
M0002	Scott	1985-05-02	T0002	2021-03-22
M0003	Brandon	1995-02-15	T0003	2019-04-02
M0004	Jack	1987-01-25	T0004	2018-03-11
M0005	Adom	1991-02-17	T0005	2020-02-15
M0006	Philip	1989-10-04	T0006	2021-05-16
\.


--
-- Data for Name: match_referees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.match_referees (match_num, referee, assistant_referee_1, assistant_referee_2, fourth_referee) FROM stdin;
M0001	R0001	R0002	R0003	R0004
M0002	R0005	R0006	R0007	R0001
M0003	R0002	R0003	R0004	R0005
M0004	R0006	R0007	R0001	R0002
M0005	R0003	R0004	R0005	R0006
M0006	R0007	R0001	R0003	R0002
M0007	R0004	R0005	R0006	R0007
M0008	R0001	R0002	R0003	R0004
M0009	R0005	R0006	R0007	R0001
M0010	R0002	R0005	R0003	R0004
M0011	R0006	R0007	R0001	R0002
M0012	R0005	R0006	R0003	R0004
M0013	R0001	R0002	R0003	R0007
M0014	R0001	R0002	R0003	R0004
M0016	R0001	R0002	R0003	R0007
M0015	R0001	R0002	R0003	R0004
\.


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matches (match_num, match_date, host_team_id, guest_team_id, host_team_score, guest_team_score) FROM stdin;
M0001	2020-05-06	T0001	T0006	5	4
M0002	2020-05-07	T0002	T0005	0	1
M0003	2020-05-09	T0003	T0004	2	3
M0004	2020-05-10	T0004	T0003	1	2
M0005	2020-05-11	T0005	T0002	2	1
M0006	2020-05-15	T0006	T0001	5	0
M0007	2020-05-17	T0001	T0005	5	5
M0008	2020-05-19	T0002	T0006	0	0
M0009	2020-05-21	T0003	T0001	4	4
M0010	2020-05-20	T0004	T0002	1	1
M0011	2020-05-21	T0004	T0003	2	1
M0012	2020-05-22	T0003	T0004	1	2
M0013	2020-05-23	T0004	T0001	4	3
M0014	2020-05-24	T0004	T0002	1	2
M0015	2020-05-25	T0003	T0001	3	2
M0016	2020-05-26	T0001	T0002	1	2
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (player_id, name, dob, jersey_no, team_id) FROM stdin;
P1001	Rudra	2003-05-01	99	T0001
P1002	Advik	2004-06-01	89	T0001
P1003	Adi	2003-05-07	79	T0001
P1004	veer	2003-08-12	69	T0001
P1005	Ahmed	2003-09-13	59	T0001
P1006	Viyan	2002-10-14	49	T0001
P1007	Pramav	2003-11-15	39	T0001
P1008	Shlok	2005-12-16	29	T0001
P1009	Madhav	2004-01-17	19	T0001
P1011	Adam	2003-03-19	1	T0001
P1012	Aarush	2003-04-20	20	T0001
P2001	Kiaan	2003-12-30	1	T0002
P2002	Rudrash	2004-11-29	2	T0002
P2003	Tanish	2002-10-28	3	T0002
P2004	Anand	2001-09-27	4	T0002
P2005	Bhaskar	2005-08-24	5	T0002
P2006	Arup	2003-07-23	6	T0002
P2007	Srihan	2003-06-20	7	T0002
P2008	Advit	2003-05-15	10	T0002
P2009	Raghav	2003-04-12	11	T0002
P2010	Krishna	2003-03-09	12	T0002
P2011	Manas	2004-02-08	13	T0002
P2012	Zayan	2003-01-01	14	T0002
P3001	Daksh	2003-12-30	10	T0003
P3002	Aditya	2004-11-29	26	T0003
P3003	Jay	2004-10-28	34	T0003
P3004	Ravi	2001-09-27	39	T0003
P3005	Suman	2004-08-24	40	T0003
P3006	Souvik	2003-07-22	51	T0003
P3007	Tanmoy	2005-06-20	56	T0003
P3008	Arijit	2003-05-15	74	T0003
P3009	Shivansh	2003-04-22	84	T0003
P3010	Elvin	2005-03-09	93	T0003
P3011	Kabir	2003-02-08	16	T0003
P3012	Joseph	2002-01-01	15	T0003
P4001	William	2003-12-30	10	T0004
P4002	James	2004-11-29	31	T0004
P4003	Issac	2004-10-28	44	T0004
P4004	Max	2001-09-22	55	T0004
P4005	Teddy	2004-08-24	65	T0004
P4006	Finley	2003-06-22	71	T0004
P4007	Jack	2005-06-20	66	T0004
P4008	henry	2003-05-15	44	T0004
P4009	Harry	2003-04-22	88	T0004
P4010	Charlie	2005-03-09	93	T0004
P4011	George	2003-02-08	17	T0004
P4012	Alexander	2002-01-01	29	T0004
P5001	Mark	2002-05-22	15	T0005
P5002	Donald	2004-11-29	10	T0005
P5003	Steven	2004-10-28	61	T0005
P5004	Paul	2001-09-23	17	T0005
P5005	Andrew	2004-08-24	18	T0005
P5006	Joshua	2003-07-22	7	T0005
P5007	Kevin	2005-06-22	8	T0005
P5008	Charles	2003-05-15	89	T0005
P5009	George	2000-04-22	99	T0005
P5010	Stephen	1999-03-09	16	T0005
P5011	Jack	2000-02-08	26	T0005
P5012	Jerry	2000-01-01	3	T0005
P6001	Mark	2002-05-22	15	T0006
P6002	Robert	2004-11-28	10	T0006
P6003	Michael	2004-10-26	61	T0006
P6004	David	2001-09-22	22	T0006
P6005	Daniel	2004-08-20	8	T0006
P6006	Charles	2003-07-20	10	T0006
P6007	Kevin	2005-06-14	12	T0006
P6008	Mathew	2003-05-25	14	T0006
P6009	Mark	2000-04-03	16	T0006
P6010	Anthony	1999-03-05	20	T0006
P6011	Donald	2000-02-14	10	T0006
P6012	Steven	2000-05-01	30	T0006
\.


--
-- Data for Name: referees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.referees (referee_id, name, dob) FROM stdin;
R0001	Tony Joseph Louis	1975-12-20
R0002	Samar Pal	1972-08-02
R0003	Kennedy Sapam	1970-12-06
R0004	Asit Kumar Sarkar	1960-05-12
R0005	Antony Abraham	1980-04-30
R0006	Sumanta Dutta	1974-02-28
R0007	Vairamuthu Parasuraman	1979-01-25
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (team_id, name, city, playground, jersey_home_color, jersey_away_color) FROM stdin;
T0001	Amigos	London	Emirates Stadium	Red	Blue
T0002	Thunder	leeds	Villa Park	White	Red
T0003	Rainbow	Moscow	City Park	Black	White
T0004	Black Eagles	New York	Griffin Prk	Orange	Black
T0005	All Stars	Pune	M S Maidan	Yellow	Pink
T0006	Arawali	Hyderabad	J K Park	Pink	Yellow
\.


--
-- Name: managers managers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_pk PRIMARY KEY (mgr_id);


--
-- Name: match_referees match_referees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_referees
    ADD CONSTRAINT match_referees_pkey PRIMARY KEY (match_num);


--
-- Name: matches matches_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pk PRIMARY KEY (match_num);


--
-- Name: players players_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pk PRIMARY KEY (player_id);


--
-- Name: referees referees_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.referees
    ADD CONSTRAINT referees_pk PRIMARY KEY (referee_id);


--
-- Name: teams teams_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pk PRIMARY KEY (team_id);


--
-- Name: managers managers_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_fk3 FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- Name: match_referees match_referees_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_referees
    ADD CONSTRAINT match_referees_fk0 FOREIGN KEY (match_num) REFERENCES public.matches(match_num);


--
-- Name: match_referees match_referees_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_referees
    ADD CONSTRAINT match_referees_fk2 FOREIGN KEY (referee) REFERENCES public.referees(referee_id);


--
-- Name: match_referees match_referees_fk3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_referees
    ADD CONSTRAINT match_referees_fk3 FOREIGN KEY (assistant_referee_1) REFERENCES public.referees(referee_id);


--
-- Name: match_referees match_referees_fk4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_referees
    ADD CONSTRAINT match_referees_fk4 FOREIGN KEY (assistant_referee_2) REFERENCES public.referees(referee_id);


--
-- Name: match_referees match_referees_fk5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match_referees
    ADD CONSTRAINT match_referees_fk5 FOREIGN KEY (fourth_referee) REFERENCES public.referees(referee_id);


--
-- Name: matches matches_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_fk0 FOREIGN KEY (host_team_id) REFERENCES public.teams(team_id);


--
-- Name: matches matches_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_fk1 FOREIGN KEY (guest_team_id) REFERENCES public.teams(team_id);


--
-- Name: players players_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_fk0 FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

