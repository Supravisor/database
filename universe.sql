--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(28),
    diameter_lightyears integer NOT NULL,
    age_billion_years numeric(3,1) NOT NULL,
    galaxy_type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(9) NOT NULL,
    diameter_kilometers integer NOT NULL,
    year_discovered numeric(4,0),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(8),
    radius_kilometers integer NOT NULL,
    million_kilometers_from_sun integer NOT NULL,
    moons boolean,
    number_of_moons numeric(3,0),
    rings boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solarsystem; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solarsystem (
    solarsystem_id integer NOT NULL,
    name character varying(8) NOT NULL,
    radius_kilometers integer NOT NULL,
    million_kilometers_from_sun integer,
    number_of_moons numeric(3,0),
    rings boolean
);


ALTER TABLE public.solarsystem OWNER TO freecodecamp;

--
-- Name: solarsystem_solarsystem_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solarsystem_solarsystem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solarsystem_solarsystem_id_seq OWNER TO freecodecamp;

--
-- Name: solarsystem_solarsystem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solarsystem_solarsystem_id_seq OWNED BY public.solarsystem.solarsystem_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(16) NOT NULL,
    diameter_thousand_kilometers integer NOT NULL,
    spectral_type text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solarsystem solarsystem_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solarsystem ALTER COLUMN solarsystem_id SET DEFAULT nextval('public.solarsystem_solarsystem_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 87400, 13.6, 'barred spiral');
INSERT INTO public.galaxy VALUES (2, 'Draco II', 120, 10.0, 'spheroidal');
INSERT INTO public.galaxy VALUES (3, 'Tucana III', 220, 3.0, 'dwarf spherodial');
INSERT INTO public.galaxy VALUES (4, 'Segue 1', 400, 12.0, 'dwarf spherodial');
INSERT INTO public.galaxy VALUES (5, 'Sagittarius Dwarf Spheroidal', 10000, 8.0, 'ellipitcal satellite');
INSERT INTO public.galaxy VALUES (6, 'Hydrus I', 348, 12.0, 'mildy elliptical ultra-faint');
INSERT INTO public.galaxy VALUES (7, 'Carina III', 200, 15.0, 'dwarf spheroidal');
INSERT INTO public.galaxy VALUES (8, 'Ursa Major II Dwarf', 1800, 10.0, 'dwarf spheroidal');
INSERT INTO public.galaxy VALUES (9, 'Triangulum II', 220, 10.0, 'dwarf spheroidal');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3476, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 1877, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 1877, 4);
INSERT INTO public.moon VALUES (4, 'Io', 3643, 1610, 6);
INSERT INTO public.moon VALUES (5, 'Europa', 3100, 1610, 6);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5262, 1610, 6);
INSERT INTO public.moon VALUES (7, 'Callisto', 4821, 1610, 6);
INSERT INTO public.moon VALUES (8, 'Amalthea', 50, 1892, 6);
INSERT INTO public.moon VALUES (9, 'Mimas', 396, 1789, 7);
INSERT INTO public.moon VALUES (10, 'Enceladus', 505, 1789, 7);
INSERT INTO public.moon VALUES (11, 'Tethys', 1062, 1684, 7);
INSERT INTO public.moon VALUES (12, 'Dione', 696, 1684, 7);
INSERT INTO public.moon VALUES (13, 'Rhea', 949, 1672, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', 1200, 1851, 8);
INSERT INTO public.moon VALUES (15, 'Umbriel', 1200, 1851, 8);
INSERT INTO public.moon VALUES (16, 'Titania', 1600, 1787, 8);
INSERT INTO public.moon VALUES (17, 'Oberon', 1600, 1787, 8);
INSERT INTO public.moon VALUES (18, 'Miranda', 500, 1948, 8);
INSERT INTO public.moon VALUES (19, 'Triton', 2735, 1846, 9);
INSERT INTO public.moon VALUES (20, 'Nereid', 340, 1949, 9);
INSERT INTO public.moon VALUES (21, 'Naiad', 54, 1989, 9);
INSERT INTO public.moon VALUES (22, 'Thalassa', 62, 1989, 9);
INSERT INTO public.moon VALUES (23, 'Despina', 150, 1989, 9);
INSERT INTO public.moon VALUES (24, 'Charon', 1214, 1978, 10);
INSERT INTO public.moon VALUES (25, 'Nix', 50, 2005, 10);
INSERT INTO public.moon VALUES (26, 'Hydra', 51, 2005, 10);
INSERT INTO public.moon VALUES (27, 'Kerberos', 20, 2011, 10);
INSERT INTO public.moon VALUES (28, 'Styx', 20, 2012, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2440, 58, false, 0, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6052, 108, false, 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 6380, 150, true, 1, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 3390, 228, true, 2, false, 1);
INSERT INTO public.planet VALUES (5, 'Ceres', 476, 413, false, 0, false, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 69911, 778, true, 95, true, 1);
INSERT INTO public.planet VALUES (7, 'Saturn', 60250, 1400, true, 146, true, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 25559, 2900, true, 28, true, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 24764, 4500, true, 16, true, 1);
INSERT INTO public.planet VALUES (10, 'Pluto', 1189, 5900, true, 5, false, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 870, 6500, true, 2, true, 1);
INSERT INTO public.planet VALUES (12, 'Makemake', 715, 6847, true, 1, false, 1);
INSERT INTO public.planet VALUES (13, 'Eris', 1200, 10000, true, 1, false, 1);


--
-- Data for Name: solarsystem; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solarsystem VALUES (1, 'Sun', 695500, 0, NULL, NULL);
INSERT INTO public.solarsystem VALUES (2, 'Mercury', 2440, 58, 0, false);
INSERT INTO public.solarsystem VALUES (3, 'Venus', 6052, 108, 0, false);
INSERT INTO public.solarsystem VALUES (4, 'Earth', 6380, 150, 1, false);
INSERT INTO public.solarsystem VALUES (5, 'Mars', 3390, 228, 2, false);
INSERT INTO public.solarsystem VALUES (6, 'Ceres', 476, 413, 0, false);
INSERT INTO public.solarsystem VALUES (7, 'Jupiter', 69911, 778, 95, true);
INSERT INTO public.solarsystem VALUES (8, 'Saturn', 60250, 1400, 146, true);
INSERT INTO public.solarsystem VALUES (9, 'Uranus', 25559, 2900, 28, true);
INSERT INTO public.solarsystem VALUES (10, 'Neptune', 24764, 4500, 16, true);
INSERT INTO public.solarsystem VALUES (11, 'Pluto', 1189, 5900, 5, false);
INSERT INTO public.solarsystem VALUES (12, 'Haumea', 870, 6500, 2, true);
INSERT INTO public.solarsystem VALUES (13, 'Makemake', 715, 6847, 1, false);
INSERT INTO public.solarsystem VALUES (14, 'Eris', 1200, 10000, 1, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1391, 'G2 V', 1);
INSERT INTO public.star VALUES (2, 'Sirius', 12, 'A0mA1 Va', 1);
INSERT INTO public.star VALUES (3, 'Canopus', 98761, 'A9 II', 1);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1683, 'G2 V', 1);
INSERT INTO public.star VALUES (5, 'Arcturus', 35331, 'K1.5 III', 1);
INSERT INTO public.star VALUES (6, 'Vega', 3783, 'A0 Va', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: solarsystem_solarsystem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solarsystem_solarsystem_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solarsystem solarsystem_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solarsystem
    ADD CONSTRAINT solarsystem_name_key UNIQUE (name);


--
-- Name: solarsystem solarsystem_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solarsystem
    ADD CONSTRAINT solarsystem_pkey PRIMARY KEY (solarsystem_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--
