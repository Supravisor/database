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
-- Name: guesses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guesses (
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.guesses OWNER TO freecodecamp;

--
-- Data for Name: guesses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guesses VALUES ('user_1731470075908', 2, 6);
INSERT INTO public.guesses VALUES ('user_1731468490642', 2, 6);
INSERT INTO public.guesses VALUES ('user_1731470075909', 5, 6);
INSERT INTO public.guesses VALUES ('user_1731468490643', 5, 6);
INSERT INTO public.guesses VALUES ('test', 3, 1);
INSERT INTO public.guesses VALUES ('user_1731470094032', 2, 433);
INSERT INTO public.guesses VALUES ('user_1731468644400', 2, 6);
INSERT INTO public.guesses VALUES ('user_1731468644401', 5, 6);
INSERT INTO public.guesses VALUES ('user_1731470094033', 5, 287);
INSERT INTO public.guesses VALUES ('ace', 12, 10);
INSERT INTO public.guesses VALUES ('user_1731470162956', 2, 465);
INSERT INTO public.guesses VALUES ('ave', 2, 4);
INSERT INTO public.guesses VALUES ('user_1731470162957', 5, 113);
INSERT INTO public.guesses VALUES ('user_1731469987465', 2, 6);
INSERT INTO public.guesses VALUES ('user_1731469987466', 5, 6);


--
-- Name: guesses guesses_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--
