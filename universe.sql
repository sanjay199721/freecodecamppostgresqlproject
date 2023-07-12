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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(20) NOT NULL,
    mass_earth numeric NOT NULL,
    size_km integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_from_earth_kiloparsecs integer NOT NULL,
    size_kilo_parsecs numeric NOT NULL,
    interesting_fact text,
    visible_naked_eye boolean,
    no_of_stars integer,
    spiral boolean
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
    name character varying(20) NOT NULL,
    distance_from_earth_light_year numeric,
    interesting_fact text,
    radius_km integer,
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
    name character varying(20) NOT NULL,
    distance_from_earth_light_years numeric,
    mass_earths numeric NOT NULL,
    interesting_fact text,
    visible_naked_eye boolean,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_from_earth_light_years numeric,
    size_solar_radius numeric NOT NULL,
    interesting_fact text,
    visible_naked_eye boolean,
    mass_solar numeric NOT NULL,
    g_type boolean,
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 0.0016, NULL);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 0.0004, NULL);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 0.0003, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 765, 46.56, 'Expected to collide with Milkyway in 4-5 billion years', true, 1000, true);
INSERT INTO public.galaxy VALUES (2, 'Milkyway', 8, 26.8, 'Where we live', true, 250, true);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic', 50, 9.86, 'predicted to merge with milkyway in 2.4 billion years', true, 20, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 970, 18.74, 'referred to as pinwheel galaxy', true, 40, true);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic', 205, 5.78, 'A member of Local group', true, 3, false);
INSERT INTO public.galaxy VALUES (6, 'NGC 5866', 50, 18.4, 'Lenticular galaxy', false, 100, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Phobos', NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Deimos', NULL, NULL, NULL, 3);
INSERT INTO public.moon VALUES (3, 'Europa', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (4, 'Ganymede', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (5, 'Io', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (6, 'Callisto', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (7, 'Metis', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (8, 'Adrastea', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (9, 'Amalthea', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (10, 'Thebe', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (11, 'Themisto', NULL, NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Titan', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (13, 'Tethys', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (14, 'Enceladus', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (15, 'Janus', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (16, 'Mimas', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (17, 'Prometheus', NULL, NULL, NULL, 8);
INSERT INTO public.moon VALUES (18, 'Miranda', NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (19, 'Titania', NULL, NULL, NULL, 9);
INSERT INTO public.moon VALUES (20, 'Puck', NULL, NULL, NULL, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', NULL, 0.055, NULL, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', NULL, 0.815, NULL, true, 1);
INSERT INTO public.planet VALUES (3, 'Mars', NULL, 0.53, NULL, true, 1);
INSERT INTO public.planet VALUES (4, 'Proxima b', NULL, 1, NULL, false, 2);
INSERT INTO public.planet VALUES (5, 'Proxima c', NULL, 7, NULL, false, 2);
INSERT INTO public.planet VALUES (6, 'Proxima d', NULL, 0.81, NULL, false, 2);
INSERT INTO public.planet VALUES (7, 'Jupiter', NULL, 11, NULL, true, 1);
INSERT INTO public.planet VALUES (8, 'Saturn', NULL, 9, NULL, true, 1);
INSERT INTO public.planet VALUES (9, 'Uranus', NULL, 4, NULL, false, 1);
INSERT INTO public.planet VALUES (10, 'Neptune', NULL, 3.82, NULL, false, 1);
INSERT INTO public.planet VALUES (11, 'Lalande b', NULL, 4, NULL, false, 7);
INSERT INTO public.planet VALUES (12, 'Lalande c', NULL, 7, NULL, false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, 1, 'nearest star', true, 1, true, 2);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4.24, 0.1542, 'nearest star other than sun', false, 0.1221, false, 2);
INSERT INTO public.star VALUES (3, 'Alpha Andromadae', 97, 2.7, 'brightest star in andromeda', true, 3.8, true, 1);
INSERT INTO public.star VALUES (4, 'S Doradus', 169000, 380, 'brightest star in LMC', false, 380, false, 3);
INSERT INTO public.star VALUES (5, 'Sirius', 8.7, 1.711, 'brightest star in night sky', true, 2, false, 2);
INSERT INTO public.star VALUES (6, 'Achernar', 139, 7, 'brightest star in constellation eridanus', true, 6, false, 2);
INSERT INTO public.star VALUES (7, 'Lalande 21185', 8.3, 0.3, 'Brightest red dwarf', false, 0.389, false, 2);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: star fky_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fky_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fky_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fky_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fky_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fky_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

