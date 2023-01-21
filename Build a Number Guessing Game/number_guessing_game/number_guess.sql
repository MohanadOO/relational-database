--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: player_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.player_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.player_user_id_seq OWNER TO freecodecamp;

--
-- Name: player_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.player_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.player_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'MoMO', 0, 0);
INSERT INTO public.users VALUES (3, '', 0, 0);
INSERT INTO public.users VALUES (4, 'Nah', 0, 0);
INSERT INTO public.users VALUES (5, 'user_1674187043486', 0, 0);
INSERT INTO public.users VALUES (6, 'user_1674187043485', 0, 0);
INSERT INTO public.users VALUES (7, 'user_1674187220453', 0, 0);
INSERT INTO public.users VALUES (8, 'user_1674187220452', 0, 0);
INSERT INTO public.users VALUES (9, 'user_1674187418345', 0, 0);
INSERT INTO public.users VALUES (10, 'user_1674187418344', 0, 0);
INSERT INTO public.users VALUES (55, 'user_1674269350968', 5, 146);
INSERT INTO public.users VALUES (38, 'user_1674269018255', 2, 863);
INSERT INTO public.users VALUES (1, 'Mohanad', 5, 10);
INSERT INTO public.users VALUES (11, 'user_1674187660209', 0, 0);
INSERT INTO public.users VALUES (12, 'user_1674187660208', 0, 0);
INSERT INTO public.users VALUES (13, 'user_1674187791537', 0, 0);
INSERT INTO public.users VALUES (14, 'user_1674187791536', 0, 0);
INSERT INTO public.users VALUES (15, 'user_1674266038504', 0, 0);
INSERT INTO public.users VALUES (16, 'user_1674266038503', 0, 0);
INSERT INTO public.users VALUES (17, 'user_1674266231862', 0, 0);
INSERT INTO public.users VALUES (18, 'user_1674266231861', 0, 0);
INSERT INTO public.users VALUES (19, 'user_1674267104053', 0, 0);
INSERT INTO public.users VALUES (20, 'user_1674267104052', 0, 0);
INSERT INTO public.users VALUES (37, 'user_1674269018256', 5, 168);
INSERT INTO public.users VALUES (22, 'user_1674268346145', 2, 250);
INSERT INTO public.users VALUES (21, 'user_1674268346146', 5, 132);
INSERT INTO public.users VALUES (24, 'user_1674268386451', 2, 514);
INSERT INTO public.users VALUES (40, 'user_1674269072989', 2, 828);
INSERT INTO public.users VALUES (58, 'user_1674269359025', 2, 260);
INSERT INTO public.users VALUES (23, 'user_1674268386452', 5, 935);
INSERT INTO public.users VALUES (39, 'user_1674269072990', 5, 140);
INSERT INTO public.users VALUES (26, 'user_1674268409540', 2, 385);
INSERT INTO public.users VALUES (57, 'user_1674269359026', 5, 283);
INSERT INTO public.users VALUES (25, 'user_1674268409541', 5, 313);
INSERT INTO public.users VALUES (42, 'user_1674269108248', 2, 443);
INSERT INTO public.users VALUES (28, 'user_1674268819994', 2, 228);
INSERT INTO public.users VALUES (27, 'user_1674268819995', 5, 466);
INSERT INTO public.users VALUES (41, 'user_1674269108249', 5, 389);
INSERT INTO public.users VALUES (30, 'user_1674268858075', 2, 639);
INSERT INTO public.users VALUES (29, 'user_1674268858076', 5, 623);
INSERT INTO public.users VALUES (89, 'user_1674270211453', 2, 211);
INSERT INTO public.users VALUES (44, 'user_1674269122609', 2, 127);
INSERT INTO public.users VALUES (32, 'user_1674268885416', 2, 84);
INSERT INTO public.users VALUES (43, 'user_1674269122610', 5, 268);
INSERT INTO public.users VALUES (31, 'user_1674268885417', 5, 241);
INSERT INTO public.users VALUES (88, 'user_1674270211454', 5, 316);
INSERT INTO public.users VALUES (34, 'user_1674268924715', 2, 34);
INSERT INTO public.users VALUES (33, 'user_1674268924716', 5, 984);
INSERT INTO public.users VALUES (46, 'user_1674269127892', 2, 162);
INSERT INTO public.users VALUES (36, 'user_1674268978360', 2, 728);
INSERT INTO public.users VALUES (45, 'user_1674269127893', 5, 965);
INSERT INTO public.users VALUES (35, 'user_1674268978361', 5, 199);
INSERT INTO public.users VALUES (91, 'user_1674270312058', 2, 793);
INSERT INTO public.users VALUES (48, 'user_1674269154578', 2, 160);
INSERT INTO public.users VALUES (90, 'user_1674270312059', 5, 441);
INSERT INTO public.users VALUES (47, 'user_1674269154579', 5, 240);
INSERT INTO public.users VALUES (50, 'user_1674269241949', 2, 722);
INSERT INTO public.users VALUES (49, 'user_1674269241950', 5, 349);
INSERT INTO public.users VALUES (122, 'user_1674271069299', 2, 861);
INSERT INTO public.users VALUES (52, 'user_1674269281621', 2, 934);
INSERT INTO public.users VALUES (121, 'user_1674271069300', 5, 546);
INSERT INTO public.users VALUES (51, 'user_1674269281622', 5, 398);
INSERT INTO public.users VALUES (54, 'user_1674269324769', 2, 39);
INSERT INTO public.users VALUES (124, 'user_1674271288182', 2, 100);
INSERT INTO public.users VALUES (53, 'user_1674269324770', 5, 996);
INSERT INTO public.users VALUES (56, 'user_1674269350967', 2, 614);
INSERT INTO public.users VALUES (123, 'user_1674271288183', 5, 708);
INSERT INTO public.users VALUES (126, 'user_1674271346319', 2, 422);
INSERT INTO public.users VALUES (125, 'user_1674271346320', 5, 830);


--
-- Name: player_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.player_user_id_seq', 126, true);


--
-- Name: users player_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT player_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

