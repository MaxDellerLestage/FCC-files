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
    name character varying(30) NOT NULL,
    size_in_kms integer,
    link integer,
    bunch integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_key_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_key_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_key_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_key_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    truthy boolean,
    falsey boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_key_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_key_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_key_id_seq OWNER TO freecodecamp;

--
-- Name: moon_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_key_id_seq OWNED BY public.moon.moon_id;


--
-- Name: munch; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.munch (
    munch_id integer NOT NULL,
    name character varying(30) NOT NULL,
    newcol text
);


ALTER TABLE public.munch OWNER TO freecodecamp;

--
-- Name: munch_key_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.munch_key_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.munch_key_id_seq OWNER TO freecodecamp;

--
-- Name: munch_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.munch_key_id_seq OWNED BY public.munch.munch_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    amount_of_lame numeric(5,1),
    text1 text,
    link integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_key_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_key_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_key_id_seq OWNER TO freecodecamp;

--
-- Name: planet_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_key_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_kms integer,
    link integer,
    bunches integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_key_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_key_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_key_id_seq OWNER TO freecodecamp;

--
-- Name: star_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_key_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_key_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_key_id_seq'::regclass);


--
-- Name: munch munch_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.munch ALTER COLUMN munch_id SET DEFAULT nextval('public.munch_key_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_key_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_key_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'sbubup', 5000, 1, NULL);
INSERT INTO public.galaxy VALUES (2, 'retcon', 3400, 2, NULL);
INSERT INTO public.galaxy VALUES (3, 'milkway', 6001, 3, NULL);
INSERT INTO public.galaxy VALUES (4, 'gal4', 3000, 4, NULL);
INSERT INTO public.galaxy VALUES (5, 'gal5', 4000, 5, NULL);
INSERT INTO public.galaxy VALUES (6, 'gal6', 6000, 6, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, 'moon2', NULL, NULL, 1);
INSERT INTO public.moon VALUES (4, 'moon3', NULL, NULL, 1);
INSERT INTO public.moon VALUES (5, 'moon4', NULL, NULL, 1);
INSERT INTO public.moon VALUES (6, 'moon5', NULL, NULL, 1);
INSERT INTO public.moon VALUES (7, 'moon6', NULL, NULL, 1);
INSERT INTO public.moon VALUES (8, 'moon7', NULL, NULL, 1);
INSERT INTO public.moon VALUES (9, 'moon8', NULL, NULL, 1);
INSERT INTO public.moon VALUES (10, 'moon9', NULL, NULL, 1);
INSERT INTO public.moon VALUES (11, 'moon10', NULL, NULL, 1);
INSERT INTO public.moon VALUES (12, 'moon11', NULL, NULL, 1);
INSERT INTO public.moon VALUES (13, 'moon12', NULL, NULL, 1);
INSERT INTO public.moon VALUES (14, 'moon13', NULL, NULL, 1);
INSERT INTO public.moon VALUES (15, 'moon14', NULL, NULL, 1);
INSERT INTO public.moon VALUES (16, 'moon15', NULL, NULL, 1);
INSERT INTO public.moon VALUES (17, 'moon16', NULL, NULL, 1);
INSERT INTO public.moon VALUES (18, 'moon17', NULL, NULL, 1);
INSERT INTO public.moon VALUES (19, 'moon18', NULL, NULL, 1);
INSERT INTO public.moon VALUES (20, 'moon19', NULL, NULL, 1);
INSERT INTO public.moon VALUES (21, 'moon20', NULL, NULL, 1);


--
-- Data for Name: munch; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.munch VALUES (1, 'mun1', NULL);
INSERT INTO public.munch VALUES (2, 'mun2', NULL);
INSERT INTO public.munch VALUES (3, 'mun3', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'plan1', 400.5, NULL, 1);
INSERT INTO public.planet VALUES (2, 'plan2', 400.5, NULL, 1);
INSERT INTO public.planet VALUES (3, 'plan3', 400.5, NULL, 1);
INSERT INTO public.planet VALUES (4, 'plan4', 400.5, NULL, 1);
INSERT INTO public.planet VALUES (5, 'plan5', 400.5, NULL, 1);
INSERT INTO public.planet VALUES (6, 'plan6', 400.5, NULL, 1);
INSERT INTO public.planet VALUES (8, 'plan7', 400.5, NULL, 1);
INSERT INTO public.planet VALUES (9, 'plan8', 400.5, NULL, 1);
INSERT INTO public.planet VALUES (10, 'plan9', 400.0, NULL, 1);
INSERT INTO public.planet VALUES (11, 'plan10', 400.0, NULL, 1);
INSERT INTO public.planet VALUES (12, 'plan11', 400.0, NULL, 1);
INSERT INTO public.planet VALUES (13, 'plan12', 400.0, NULL, 1);
INSERT INTO public.planet VALUES (14, 'plan13', 400.0, NULL, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 2000, 1, NULL);
INSERT INTO public.star VALUES (2, 'star2', 3000, 2, NULL);
INSERT INTO public.star VALUES (3, 'star3', 4000, 3, NULL);
INSERT INTO public.star VALUES (4, 'star4', 2000, 4, NULL);
INSERT INTO public.star VALUES (5, 'star5', 3000, 5, NULL);
INSERT INTO public.star VALUES (6, 'star6', 4000, 6, NULL);


--
-- Name: galaxy_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_key_id_seq', 7, true);


--
-- Name: moon_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_key_id_seq', 21, true);


--
-- Name: munch_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.munch_key_id_seq', 3, true);


--
-- Name: planet_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_key_id_seq', 14, true);


--
-- Name: star_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_key_id_seq', 6, true);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_link_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_link_key UNIQUE (link);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: munch munch_newcol_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.munch
    ADD CONSTRAINT munch_newcol_key UNIQUE (newcol);


--
-- Name: munch munch_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.munch
    ADD CONSTRAINT munch_pkey PRIMARY KEY (munch_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id PRIMARY KEY (planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: star star_link_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_link_key UNIQUE (link);


--
-- Name: moon moon_to_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_to_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_to_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_to_star FOREIGN KEY (link) REFERENCES public.star(link);


--
-- Name: star star_to_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_to_galaxy FOREIGN KEY (link) REFERENCES public.galaxy(link);


--
-- PostgreSQL database dump complete
--