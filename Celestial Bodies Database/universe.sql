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

DROP DATABASE universe;
--
-- Name universe; Type DATABASE; Schema -; Owner freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

connect universe

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
-- Name galaxy; Type TABLE; Schema public; Owner freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_type character varying(10),
    age_in_millions_of_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name galaxy_id_seq; Type SEQUENCE; Schema public; Owner freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name galaxy_id_seq; Type SEQUENCE OWNED BY; Schema public; Owner freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name galaxy_info; Type TABLE; Schema public; Owner freecodecamp
--

CREATE TABLE public.galaxy_info (
    galaxy_info_id integer NOT NULL,
    name character varying(50) NOT NULL,
    num_planet_in_billion integer,
    size_in_light_years integer,
    galaxy_id integer
);


ALTER TABLE public.galaxy_info OWNER TO freecodecamp;

--
-- Name galaxy_info_galaxy_info_id_seq; Type SEQUENCE; Schema public; Owner freecodecamp
--

CREATE SEQUENCE public.galaxy_info_galaxy_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_info_galaxy_info_id_seq OWNER TO freecodecamp;

--
-- Name galaxy_info_galaxy_info_id_seq; Type SEQUENCE OWNED BY; Schema public; Owner freecodecamp
--

ALTER SEQUENCE public.galaxy_info_galaxy_info_id_seq OWNED BY public.galaxy_info.galaxy_info_id;


--
-- Name moon; Type TABLE; Schema public; Owner freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    distance_to_planet numeric(15,3),
    diameter_km integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name moon_id_seq; Type SEQUENCE; Schema public; Owner freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name moon_id_seq; Type SEQUENCE OWNED BY; Schema public; Owner freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name planet; Type TABLE; Schema public; Owner freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    star_id integer,
    is_spherical boolean NOT NULL,
    diameter_km integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name planet_id_seq; Type SEQUENCE; Schema public; Owner freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name planet_id_seq; Type SEQUENCE OWNED BY; Schema public; Owner freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name star; Type TABLE; Schema public; Owner freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    galaxy_id integer NOT NULL,
    surface_temp_in_c integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name star_id_seq; Type SEQUENCE; Schema public; Owner freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name star_id_seq; Type SEQUENCE OWNED BY; Schema public; Owner freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name galaxy galaxy_id; Type DEFAULT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'regclass);


--
-- Name galaxy_info galaxy_info_id; Type DEFAULT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.galaxy_info ALTER COLUMN galaxy_info_id SET DEFAULT nextval('public.galaxy_info_galaxy_info_id_seq'regclass);


--
-- Name moon moon_id; Type DEFAULT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'regclass);


--
-- Name planet planet_id; Type DEFAULT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'regclass);


--
-- Name star star_id; Type DEFAULT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'regclass);


--
-- Data for Name galaxy; Type TABLE DATA; Schema public; Owner freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is the galaxy that includes our Solar System.', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Sagitttaius Dwarf Spheroidal', 'Nearest Galaxy to Milky Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Nearest major galaxy to the milky way', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Antenna', '', '', NULL);
INSERT INTO public.galaxy VALUES (5, 'Backward', '', '', NULL);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', '', '', NULL);


--
-- Data for Name galaxy_info; Type TABLE DATA; Schema public; Owner freecodecamp
--

INSERT INTO public.galaxy_info VALUES (1, 'Milky Way', 100, 52850, 1);
INSERT INTO public.galaxy_info VALUES (2, 'Andromeda', 1000, 110000, 3);
INSERT INTO public.galaxy_info VALUES (3, 'Black Eye', 100, 26481, 6);


--
-- Data for Name moon; Type TABLE DATA; Schema public; Owner freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon', NULL, 384400.000, 3474, 1);
INSERT INTO public.moon VALUES (3, 'Ganymede', 'a satellite of Jupiter, is the largest and most massive of the Solar Systems moons.', NULL, NULL, 8);
INSERT INTO public.moon VALUES (4, 'Charon  ', 'Pluto’s Other Half', NULL, NULL, 12);
INSERT INTO public.moon VALUES (5, 'Atlas', 'The UFO', NULL, NULL, 9);
INSERT INTO public.moon VALUES (6, 'Hyperion ', 'The Space Sponge', NULL, NULL, 9);
INSERT INTO public.moon VALUES (7, 'Mimas', 'That’s No Moon…', NULL, NULL, 9);
INSERT INTO public.moon VALUES (8, 'Pan', 'The Ring Sculptor', NULL, NULL, 9);
INSERT INTO public.moon VALUES (9, 'Nereid', 'The Wanderer', NULL, NULL, 11);
INSERT INTO public.moon VALUES (11, 'Phobos', 'On Course for Trouble', NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Epimetheus and Janus', 'The Twins', NULL, NULL, 9);
INSERT INTO public.moon VALUES (13, 'Triton', 'A Volcanic Space Melon', NULL, NULL, 11);
INSERT INTO public.moon VALUES (14, 'Titan', 'A Terrain fit for Tolkien', NULL, NULL, 9);
INSERT INTO public.moon VALUES (15, 'Io', 'The Moon with a Fiery Attitude', NULL, NULL, 8);
INSERT INTO public.moon VALUES (16, 'Rhea', 'Put a Ring on it', NULL, NULL, 9);
INSERT INTO public.moon VALUES (17, 'Europa', 'The Solar System’s Cue Ball', NULL, NULL, 8);
INSERT INTO public.moon VALUES (18, 'Enceladus', 'The Exciting Possibility', NULL, NULL, 9);
INSERT INTO public.moon VALUES (19, 'Miranda ', 'Frankenstein’s Moon', NULL, NULL, 10);
INSERT INTO public.moon VALUES (20, 'Iapetus ', 'A Tale of Two Faces', NULL, NULL, 9);
INSERT INTO public.moon VALUES (10, 'Callisto ', 'The Solar Systems Pin Cushio', NULL, NULL, 8);
INSERT INTO public.moon VALUES (21, 'Dactyl  ', 'The Alternative Moon', NULL, NULL, NULL);


--
-- Data for Name planet; Type TABLE DATA; Schema public; Owner freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our Planet!', true, 1, true, 12742);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Closest Planet to the Sun', false, 1, true, 4879);
INSERT INTO public.planet VALUES (6, 'Venus', 'Venus has no natural statellites. it is the hottest planet', false, 1, true, 12104);
INSERT INTO public.planet VALUES (7, 'Mars', 'Mars has an atmosphere of mostly carbon dioxide.', false, 1, false, 6779);
INSERT INTO public.planet VALUES (8, 'Jupiter', NULL, false, 1, false, 139820);
INSERT INTO public.planet VALUES (9, 'Saturn', NULL, false, 1, false, 116460);
INSERT INTO public.planet VALUES (10, 'Uranus', NULL, false, 1, false, 50724);
INSERT INTO public.planet VALUES (11, 'Neptune', NULL, false, 1, false, 49244);
INSERT INTO public.planet VALUES (12, 'Pluto', 'It is the ninth-largest and tenth-most-massive known object to directly orbit the Sun.', false, 1, true, 2376);
INSERT INTO public.planet VALUES (13, 'Proxima B', 'And Earth Sized planet discovered in 2016', false, 2, true, NULL);
INSERT INTO public.planet VALUES (14, 'Proxima D', 'A Candidate sub-earth which orbits very closely to the star', false, 2, true, NULL);
INSERT INTO public.planet VALUES (15, 'TOI-1452', 'This world is 70% than ours (Super-Earth) and its density could indicate a deep ocean surface', false, NULL, true, NULL);
INSERT INTO public.planet VALUES (16, 'WASP-39 b', 'The First Found With Atmospheric Carbon Dioxide', false, NULL, true, NULL);
INSERT INTO public.planet VALUES (17, 'WASP-103 b', 'The Rugby Ball Planet', false, NULL, false, NULL);
INSERT INTO public.planet VALUES (18, 'TYC 8998-760-1 b', 'The Brown Dwarf', false, NULL, true, NULL);
INSERT INTO public.planet VALUES (19, 'Pluto', 'It is the ninth-largest and tenth-most-massive known object to directly orbit the Sun.', false, 1, true, 2376);
INSERT INTO public.planet VALUES (20, 'Proxima B', 'And Earth Sized planet discovered in 2016', false, 2, true, NULL);
INSERT INTO public.planet VALUES (21, 'Proxima D', 'A Candidate sub-earth which orbits very closely to the star', false, 2, true, NULL);
INSERT INTO public.planet VALUES (22, 'TOI-1452', 'This world is 70% than ours (Super-Earth) and its density could indicate a deep ocean surface', false, NULL, true, NULL);
INSERT INTO public.planet VALUES (23, 'WASP-39 b', 'The First Found With Atmospheric Carbon Dioxide', false, NULL, true, NULL);
INSERT INTO public.planet VALUES (24, 'WASP-103 b', 'The Rugby Ball Planet', false, NULL, false, NULL);
INSERT INTO public.planet VALUES (25, 'TYC 8998-760-1 b', 'The Brown Dwarf', false, NULL, true, NULL);


--
-- Data for Name star; Type TABLE DATA; Schema public; Owner freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The sun is the only star in our solar system', 1, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', NULL, 1, NULL);
INSERT INTO public.star VALUES (3, 'Barnards Star', NULL, 1, NULL);
INSERT INTO public.star VALUES (5, 'Luhman 16', NULL, 1, NULL);
INSERT INTO public.star VALUES (6, 'Sirius', NULL, 1, NULL);
INSERT INTO public.star VALUES (4, 'Pistol Star', 'Blue Hypergaint star. it is one of the most luminous known stars in the Milky Way', 1, NULL);


--
-- Name galaxy_id_seq; Type SEQUENCE SET; Schema public; Owner freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name galaxy_info_galaxy_info_id_seq; Type SEQUENCE SET; Schema public; Owner freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_info_galaxy_info_id_seq', 3, true);


--
-- Name moon_id_seq; Type SEQUENCE SET; Schema public; Owner freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name planet_id_seq; Type SEQUENCE SET; Schema public; Owner freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 25, true);


--
-- Name star_id_seq; Type SEQUENCE SET; Schema public; Owner freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name galaxy_info galaxy_info_name_key; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.galaxy_info
    ADD CONSTRAINT galaxy_info_name_key UNIQUE (name);


--
-- Name galaxy_info galaxy_info_pkey; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.galaxy_info
    ADD CONSTRAINT galaxy_info_pkey PRIMARY KEY (galaxy_info_id);


--
-- Name galaxy galaxy_pkey; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name moon moon_id; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name moon moon_pkey; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name galaxy name; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (galaxy_id);


--
-- Name planet planet_id; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name planet planet_pkey; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name star star_id; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


--
-- Name star star_pkey; Type CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name star galaxy_id; Type FK CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name galaxy_info galaxy_info_galaxy_id_fkey; Type FK CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.galaxy_info
    ADD CONSTRAINT galaxy_info_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name planet star_id; Type FK CONSTRAINT; Schema public; Owner freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

