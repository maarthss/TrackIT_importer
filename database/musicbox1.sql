--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4 (Debian 17.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.4 (Debian 17.4-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: musicbox; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE musicbox WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE musicbox OWNER TO postgres;

\connect musicbox

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album (
    id bigint NOT NULL,
    description text NOT NULL,
    image character varying(255),
    release_date character varying(255) NOT NULL,
    title character varying(150) NOT NULL,
    artist_id bigint NOT NULL
);


ALTER TABLE public.album OWNER TO postgres;

--
-- Name: album_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.album_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.album_seq OWNER TO postgres;

--
-- Name: artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artist (
    id bigint NOT NULL,
    description character varying(255) NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.artist OWNER TO postgres;

--
-- Name: artist_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artist_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artist_seq OWNER TO postgres;

--
-- Name: follow_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.follow_user (
    user_followed bigint NOT NULL,
    user_follower bigint NOT NULL
);


ALTER TABLE public.follow_user OWNER TO postgres;

--
-- Name: image_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.image_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.image_seq OWNER TO postgres;

--
-- Name: list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list (
    id bigint NOT NULL,
    creation_date timestamp(6) without time zone NOT NULL,
    description text,
    name character varying(50) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.list OWNER TO postgres;

--
-- Name: list_contain; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.list_contain (
    list_id bigint NOT NULL,
    track_id bigint NOT NULL
);


ALTER TABLE public.list_contain OWNER TO postgres;

--
-- Name: list_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.list_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.list_seq OWNER TO postgres;

--
-- Name: rate_album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rate_album (
    rating double precision,
    rating_date timestamp(6) without time zone,
    album_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.rate_album OWNER TO postgres;

--
-- Name: rate_track; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rate_track (
    rating double precision,
    rating_date timestamp(6) without time zone,
    track_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.rate_track OWNER TO postgres;

--
-- Name: review_album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review_album (
    review text,
    review_date timestamp(6) without time zone,
    album_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.review_album OWNER TO postgres;

--
-- Name: review_track; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review_track (
    review text,
    review_date timestamp(6) without time zone,
    track_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.review_track OWNER TO postgres;

--
-- Name: track; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.track (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    video character varying(255),
    album_id bigint NOT NULL,
    artist_id bigint NOT NULL
);


ALTER TABLE public.track OWNER TO postgres;

--
-- Name: track_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.track_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.track_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(75) NOT NULL,
    name character varying(50) NOT NULL,
    password_hash character varying(255) NOT NULL,
    surname character varying(50) NOT NULL,
    username character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_seq OWNER TO postgres;

--
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album (id, description, image, release_date, title, artist_id) FROM stdin;
1	Released in 1993, Radiohead's debut album includes the breakout hit 'Creep'. Though initially met with mixed reviews, it later gained recognition as the start of a groundbreaking career.	https://lastfm.freetls.fastly.net/i/u/300x300/3820170a0a6cb7d7d429e2945cd067c9.png	1993-02-22	Pablo Honey	1
2	Released in 1995, 'The Bends' marked Radiohead's shift toward a more layered and emotional sound, with tracks like 'Fake Plastic Trees' and 'Street Spirit (Fade Out)'.	https://lastfm.freetls.fastly.net/i/u/300x300/9ea9931e129bb5efd3606866901855b5.jpg	1995-03-13	The Bends	1
3	Released in 1997, 'OK Computer' is often hailed as one of the greatest albums of all time. It explored themes of technology and isolation, and its success transformed the band into global icons.	https://lastfm.freetls.fastly.net/i/u/300x300/131e3e85d45047e93ab77b422e591719.jpg	1997-05-21	OK Computer	1
4	In 2000, Radiohead released 'Kid A', a radical departure from rock into experimental electronica. It initially divided fans but is now considered a modern masterpiece.	https://lastfm.freetls.fastly.net/i/u/300x300/2ed343318c844d19cd897ec67fad11c4.png	2000-10-02	Kid A	1
5	In 2007, 'In Rainbows' was released with a revolutionary 'pay what you want' model. Musically warm and emotionally direct, it includes fan favorites like 'Nude' and 'Weird Fishes'.	https://lastfm.freetls.fastly.net/i/u/300x300/9dbcd9399ac3e622b4f508323155b644.jpg	2007-10-10	In Rainbows	1
6	Released in 2022, this sophomore album expands Maria Jaume’s sound with light percussion, synth layers and fuller arrangements. The title reflects cycles of thought and travel, capturing her introspective perspective shaped by life between Mallorca and Barcelona.	https://lastfm.freetls.fastly.net/i/u/300x300/7cf2b70d31c0d6328f4cb872995e0969.jpg	2022-03-25	Voltes i voltes	2
8	Released in 1999, their self-titled debut introduced the band’s playful, science-fiction-tinged Catalan lyrics and Mediterranean pop melodies. It laid the groundwork for their cult following in the Balearic music scene.	https://lastfm.freetls.fastly.net/i/u/300x300/ee48a18d66979439283d0e5836657872.jpg	1999-01-01	Antònia Font	3
9	Released in 2001, 'A Rússia' expanded their sonic palette with rich instrumentation and surreal imagery, further establishing their identity as creative outliers in Catalan pop.	https://lastfm.freetls.fastly.net/i/u/300x300/03e70036991b454abb23eec12b91d936.jpg	2001-04-23	A Rússia	3
10	Released in 2002, 'Alegria' became one of the band’s most iconic records. It includes fan favorites like 'Wa Yeah!' and reflects their perfect balance of optimism and oddity.	https://lastfm.freetls.fastly.net/i/u/300x300/ff50c31234ca8f9246ac5505d41344a6.jpg	2002-05-07	Alegria	3
11	Released in 2006, this album is a fan favorite for its underwater metaphors and dreamy production. The title track and 'Armando Rampas' showcase their lyrical surrealism at its peak.	https://lastfm.freetls.fastly.net/i/u/300x300/0f413cb8d50044989d3c0192ad5955a4.jpg	2006-03-28	Batiscafo Katiuscas	3
12	Released in 2011 after a brief hiatus, 'Lamparetes' features a matured sound and poetic lyrics, including the standout single 'Clint Eastwood'. It became their last album before an eight-year break.	https://lastfm.freetls.fastly.net/i/u/300x300/7bba7b455ecd4e71867c53bbc499832e.jpg	2011-04-12	Lamparetes	3
14	Phoebe Bridgers' debut solo album, known for its haunting lyrics and intimate acoustic sound.	https://lastfm.freetls.fastly.net/i/u/300x300/531bdb172f66ee3500e344936f1f22bd.jpg	2017-09-22	Stranger in the Alps	4
15	Her critically acclaimed second album that blends indie rock and folk with deeply personal storytelling.	https://lastfm.freetls.fastly.net/i/u/300x300/4e31f6b52ff52b99a93650badd19b2c5.jpg	2020-06-18	Punisher	4
16	Clairo's debut studio album featuring a blend of lo-fi pop and indie electronic sounds, praised for its candid lyricism.	https://lastfm.freetls.fastly.net/i/u/300x300/d2389b806dd5061b6a75e360c4c46c88.jpg	2019-08-02	Immunity	5
17	Her sophomore album, showcasing a more mature sound with elements of folk and soft rock, reflecting personal growth.	https://lastfm.freetls.fastly.net/i/u/300x300/0a9f1e6e0c825c1e7772fb049f2bf4a1.jpg	2021-07-16	Sling	5
19	Extremoduro's debut album, laying the foundation of their rebellious and raw rock style.	https://lastfm.freetls.fastly.net/i/u/300x300/38bcbab8cfec625b4842a4b5e28e5504.jpg	1989-06-01	Rock Transgresivo	6
20	An album reflecting a darker, more introspective phase in the band's career.	https://lastfm.freetls.fastly.net/i/u/300x300/cd1fb783201746ea4829151308f0afbd.png	2002-04-01	Yo, Minoría Absoluta	6
22	Their last studio album, showcasing maturity and a refined rock sound.	https://lastfm.freetls.fastly.net/i/u/300x300/cd6d27d55354220bb86902b9f75bf8e3.jpg	2011-09-27	Material Defectuoso	6
23	An album blending indie pop and folk with introspective and heartfelt lyrics.	https://lastfm.freetls.fastly.net/i/u/300x300/ea36cafb2f184974c9bcb84481edb06b.jpg	2011-01-31	10 milles per veure una bona armadura	7
25	An album by Manel featuring their signature Catalan indie-folk sound with thoughtful lyrics and melodic arrangements.	https://lastfm.freetls.fastly.net/i/u/300x300/da01e0023f9446f1a87b9ab63b0eca41.jpg	2019-10-18	Els millors professors europeus	7
26	Featuring timeless hits like 'Dancing Queen', this album marked their global peak.	https://lastfm.freetls.fastly.net/i/u/300x300/9669591438fa40869420f91c617de999.jpg	1976-10-11	Arrival	8
28	Includes hits like 'The Winner Takes It All', blending emotional lyrics with catchy melodies.	https://lastfm.freetls.fastly.net/i/u/300x300/d4bdb055af9f2ab12f8a785983602278.png	1980-11-03	Super Trouper	8
30	Follow-up album featuring more polished production and catchy rock anthems.	https://lastfm.freetls.fastly.net/i/u/300x300/7b722e52fea595ea5cd78d97e3cd68e3.jpg	2016-05-27	The Ride	9
31	Their third album, continuing to develop their sound with emotional and energetic tracks.	https://lastfm.freetls.fastly.net/i/u/300x300/25f98bf693f94815b139d310934424b6.jpg	2019-04-26	The Balance	9
33	Critically acclaimed sophomore album featuring hits like 'Rehab' and 'Back to Black'.	https://lastfm.freetls.fastly.net/i/u/300x300/5e8b279da10957d060253256c8302f8f.png	2006-10-27	Back to Black	10
35	A darker, more complex album continuing the story of their fictional world.	https://lastfm.freetls.fastly.net/i/u/300x300/9efc2181a3c5643cde2441c79451d1bc.jpg	2018-10-05	Trench	11
36	An EP expanding the narrative universe of Twenty One Pilots.	https://lastfm.freetls.fastly.net/i/u/300x300/44592187ade17dafe3531db1b7cafbe1.jpg	2024-05-24	Clancy	11
7	Released in 2025, 'Nostàlgia Airlines SOUVENIR' dives into retro pop textures and dreamy melancholy. With playful arrangements and surreal lyrical imagery, it marks a stylistic evolution while staying rooted in Maria Jaume’s poetic voice.	https://lastfm.freetls.fastly.net/i/u/300x300/a9eb016f81ec1d76bdfa4ba63660e3a8.jpg	2025-04-19	Nostàlgia Airlines SOUVENIR	2
13	Released in 2022, this comeback album marked Antònia Font’s return after nearly a decade apart. It reflects a more reflective, polished tone while retaining their unique linguistic and melodic style.	https://lastfm.freetls.fastly.net/i/u/300x300/629e2508dbb70d891aeafff7b4483b41.jpg	2022-03-18	Un minut estroboscòpica	3
18	Clairo's third album that continues to explore introspective themes with a dreamy, synth-pop vibe.	https://lastfm.freetls.fastly.net/i/u/300x300/6e8d5d5ca3c27594162651accd47cb7e.jpg	2024-05-10	Charm	5
21	A concept album that explores existential themes with complex compositions and intense lyrics.	https://lastfm.freetls.fastly.net/i/u/300x300/ede36c70d52be0240b143d00727deb34.png	2008-11-18	La Ley Innata	6
24	Exploring new sounds with a mix of electronic and pop influences.	https://lastfm.freetls.fastly.net/i/u/300x300/2777eddc0c3a4fa2ace343064e3abb4c.jpg	2013-11-04	Atletes, baixin de l'escenari	7
27	A disco-influenced album with danceable tracks and polished production.	https://lastfm.freetls.fastly.net/i/u/300x300/d84bfbc85d894d51b4a845d0f5472109.png	1979-04-23	Voulez-Vous	8
29	Debut album that brought their energetic indie rock sound to a wider audience.	https://lastfm.freetls.fastly.net/i/u/300x300/7e4879bb1fa34d50cd8c8625a767c217.png	2014-09-15	The Balcony	9
32	Debut album blending jazz, soul, and R&B influences, showcasing Amy's unique vocal style.	https://lastfm.freetls.fastly.net/i/u/300x300/d5d8b5ea0b1b4542b4e0249e94d81387.jpg	2003-10-20	Frank	10
34	Concept album exploring themes of anxiety and insecurity, featuring hits like 'Stressed Out'.	https://lastfm.freetls.fastly.net/i/u/300x300/6f9906f43b7b516e89f9ebc331dd990a.jpg	2015-05-17	Blurryface	11
\.


--
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artist (id, description, name) FROM stdin;
1	Radiohead are an English rock band formed in 1985 in Abingdon, celebrated for their experimental approach that helped define alternative rock and electronic art-rock in the 1990s and 2000s.	Radiohead
2	Maria Jaume is a Mallorcan singer-songwriter whose intimate Catalan indie-folk songs, beginning with her 2020 debut “Fins a maig no revisc,” explore vulnerability and island landscapes.	Maria Jaume
3	Antònia Font are an indie-pop band from Mallorca, formed in 1997, known for quirky, space-themed Catalan lyrics and Mediterranean melodies; they reunited in 2021 after an eight-year hiatus.	Antònia Font
4	Phoebe Bridgers is an American indie folk-rock singer-songwriter from Los Angeles whose haunting vocals and candid storytelling on albums like “Stranger in the Alps” (2017) and “Punisher” (2020) have earned critical acclaim.	Phoebe Bridgers
5	Clairo (Claire Cottrill) is an American bedroom-pop artist who gained viral attention with “Pretty Girl” in 2017 and has since released the introspective albums “Immunity” (2019) and “Sling” (2021).	Clairo
6	Extremoduro are a Spanish rock band from Plasencia, founded in 1987, famed for raw guitar riffs and poetic, often gritty lyrics that became a soundtrack for generations.	Extremoduro
7	Manel are a Barcelona indie-folk pop quartet formed in 2007, singing in Catalan with brass and string arrangements that weave humorous, literate storytelling.	Manel
8	ABBA are a Swedish pop quartet formed in 1972 whose glittering harmonies and disco-pop hits like “Dancing Queen” made them global stars; they returned with the album “Voyage” in 2021.	ABBA
9	Catfish and the Bottlemen are a Welsh indie-rock band formed in Llandudno in 2007, delivering riff-driven, anthemic hits such as “Kathleen” and the platinum debut “The Balcony.”	Catfish And The Bottlemen
10	Amy Winehouse (1983-2011) was a British soul and jazz singer whose smoky contralto and confessional songwriting on “Back to Black” influenced a new wave of retro-soul.	Amy Winehouse
11	Twenty One Pilots are an Ohio duo formed in 2009 who blend alt-rock, hip-hop and electronic styles, winning a Grammy for the hit “Stressed Out.”	Twenty One Pilots
\.


--
-- Data for Name: follow_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.follow_user (user_followed, user_follower) FROM stdin;
\.


--
-- Data for Name: list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list (id, creation_date, description, name, user_id) FROM stdin;
\.


--
-- Data for Name: list_contain; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.list_contain (list_id, track_id) FROM stdin;
\.


--
-- Data for Name: rate_album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rate_album (rating, rating_date, album_id, user_id) FROM stdin;
\.


--
-- Data for Name: rate_track; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rate_track (rating, rating_date, track_id, user_id) FROM stdin;
\.


--
-- Data for Name: review_album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review_album (review, review_date, album_id, user_id) FROM stdin;
\.


--
-- Data for Name: review_track; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review_track (review, review_date, track_id, user_id) FROM stdin;
\.


--
-- Data for Name: track; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.track (id, title, video, album_id, artist_id) FROM stdin;
1	You	https://youtu.be/OzL7u5teZhg?si=ubXQ0YTZhR33ohFD	1	1
2	Creep	https://youtu.be/zFYEYRcjK2g?si=nsuIgrhQKqCOBKkh	1	1
3	How Do You?	https://youtu.be/ukFTig7exNU?si=9rkqVrcxjnYoRPPH	1	1
4	Stop Whispering	https://youtu.be/DPpug5FUQsc?si=AGebvH0ArYHNpChf	1	1
5	Thinking About You	https://youtu.be/2jsPEOiMNaA?si=Z6MAm02Yfhww8fXX	1	1
6	Anyone Can Play Guitar	https://youtu.be/i_GZJLH0ynY?si=Wz3gMB7alWZgdMgc	1	1
7	Ripcord	https://youtu.be/i0GC7Oo_Zo4?si=2s2wA1zXKVlm3Qa8	1	1
8	Vegetable	https://youtu.be/kALoYb7bepI?si=aOvD87DoiR9pXJF5	1	1
9	Prove Yourself	https://youtu.be/o6Hqe1qKUhA?si=cyFu19hPGxmbPemh	1	1
10	I Can't	https://youtu.be/cwQZ3O3hUe8?si=NLjaCWYAWoDkoj6v	1	1
11	Lurgee	https://youtu.be/RGx5wxznSOE?si=mTlOUgzzIOD7PJhK	1	1
12	Blow Out	https://youtu.be/ocQImpRfPMk?si=XH20SPP5PuQxh5PV	1	1
13	Planet Telex	https://youtu.be/g0az4OkM02Y?si=kRkAUg29JRKS3YQp	2	1
14	The Bends	https://youtu.be/K8z8hLvjb_U?si=DBsUvpLeRh-dhxz_	2	1
15	High and Dry	https://youtu.be/7fv84nPfTH0?si=v0VmaYR9PSRe-ub3	2	1
16	Fake Plastic Trees	https://youtu.be/6gDhsUWCHrg?si=qr1GMWZM0Z48pO1O	2	1
17	Bones	https://youtu.be/3ZKxungSg9U?si=G85XYfkLu0YviO5o	2	1
18	(Nice Dream)	https://youtu.be/jIjTFt6XmFM?si=VFzh3yg9AwdulHNT	2	1
19	Just	https://youtu.be/Qnk4jiWamm4?si=2Qy1EibAFzxx6nTy	2	1
20	My Iron Lung	https://youtu.be/eHK67LiMI8k?si=fQihggEz1mD8fzz6	2	1
21	Bullet Proof.. I Wish I Was	https://youtu.be/KkCgUI_g2oo?si=HT7zuFIDg6mI8SK0	2	1
22	Black Star	https://youtu.be/d7lbzUUXj0k?si=UhMTKq4u3565dhpt	2	1
23	Sulk	https://youtu.be/-SLb6BdCHlE?si=VlP1-6eNsKnOuc_U	2	1
24	Street Spirit (Fade Out)	https://youtu.be/2y6kop0VTXY?si=wLwffKKm8alXp83i	2	1
25	Airbag	https://youtu.be/jNY_wLukVW0?si=RIVVO4Hv9WXKKCun	3	1
26	Paranoid Android	https://youtu.be/YTH8cxXBGBo?si=9MWGq_WQLSZw1wkC	3	1
27	Subterranean Homesick Alien	https://youtu.be/_fTWmUlTEqE?si=x5L3jh9Hl33pVBMz	3	1
28	Exit Music (For a Film)	https://youtu.be/Bf01riuiJWA?si=gZZE4L-aiQKoo1Zt	3	1
29	Let Down	https://youtu.be/duBCwvC1kP4?si=AP7UYQIuj4QvAQBd	3	1
30	Karma Police	https://youtu.be/4IJI6soiQhI?si=HGUsOGq3RWp4YQuO	3	1
31	Fitter Happier	https://youtu.be/O4SzvsMFaek?si=xJWXBt5HkBgBCsAp	3	1
32	Electioneering	https://youtu.be/3DtgWrFTtQk?si=_Q_q-9fOo-lpF2pa	3	1
33	Climbing Up the Walls	https://youtu.be/XX4EpkR-Sp4?si=aOF6n4x7MthF_mgT	3	1
34	No Surprises	https://youtu.be/LBt60dfwEBY?si=-fRanFfH9o7m8Jv_	3	1
35	Lucky	https://youtu.be/yuZYQvvLXVY?si=L6QSbTqBUBgGkpwP	3	1
36	The Tourist	https://youtu.be/HkgzObf8uVU?si=TcM5ibD_o4pz1DAz	3	1
37	Everything In Its Right Place	https://youtu.be/NUnXxh5U25Y?si=G_-SnJwHSWZSNyHw	4	1
38	Kid A	https://youtu.be/MXNbfU0Ww_E?si=YgGxTz4Pme5eKG1c	4	1
39	The National Anthem	https://youtu.be/NfQD1QiQ9o4?si=oI152T6k2QcHDhiF	4	1
40	How To Disappear Completely	https://youtu.be/6W6HhdqA95w?si=q4N4NALmfdxQQZ1i	4	1
41	Treefingers	https://youtu.be/L7p47zYKJoM?si=k0JoV018NVluapXN	4	1
42	Optimistic	https://youtu.be/1On-ZHfTWOo?si=xSfZG6Dlucs1yacj	4	1
43	In Limbo	https://youtu.be/Q29iibXXiOs?si=jKhzm7prM4BmEkND	4	1
44	Idioteque	https://youtu.be/svwJTnZOaco?si=nW1-Rj9u5v97NtdK	4	1
45	Morning Bell	https://youtu.be/XTT6k3Q4JnQ?si=ylGSX_i29e5V9yHg	4	1
46	Motion Picture Soundtrack	https://youtu.be/EcSvMFm2ABE?si=4cV0yI8zUSuLY9b8	4	1
47	15 Step	https://youtu.be/Al1o33CRXsU?si=SUFQjf0djaVNJWia	5	1
48	Bodysnatchers	https://youtu.be/TTa6h_gNrkU?si=vpyQI-xyKkZVUlLd	5	1
49	Nude	https://youtu.be/Eu51xKYHDRo?si=cxPxnn__Cy6695Jt	5	1
50	Weird Fishes/Arpeggi	https://youtu.be/ZP95RRPlMTk?si=0ZilVL3jmzJnpB8J	5	1
51	All I Need	https://youtu.be/OOLMuK74fVw?si=LrSpPBjNq6gWQbrp	5	1
52	Faust Arp	https://youtu.be/JzwRPBSsUwc?si=InYjs-ou7kNs-XJQ	5	1
53	Reckoner	https://youtu.be/2WAlyQKVxCE?si=OeCYaE4-06J02Z4O	5	1
54	House of Cards	https://youtu.be/igJDghozMrM?si=07-G1ZD6EaSwJXyD	5	1
55	Jigsaw Falling Into Place	https://youtu.be/LY42nUEHQMk?si=RGmPodxUhKySU16k	5	1
56	Videotape	https://youtu.be/rn_dLEFKFys?si=F3cwUsD5qJeWK2Pl	5	1
57	2008	https://youtu.be/nzeHGtp5PSY?si=fl3j-kCLs8wLk7YH	6	2
58	Ni Picassos ni Dalís	https://youtu.be/O2SC040aq9M?si=pcBbO6iLIxAT9ygz	6	2
59	Dunes de cous-cous	https://youtu.be/X8EhxnY5MKM?si=7CCCeLhN577ZMAbr	6	2
60	A final de mes	https://youtu.be/UpEQJsX3O04?si=F3sw8uEoxBgSNlkP	6	2
61	Procés natural	https://youtu.be/fBgruHYcFZo?si=b5A6mzinPtbn0Qlz	6	2
62	Me desplom	https://youtu.be/kXVglv4qZiM?si=kPMR5JkwlhJqqNtE	6	2
63	Tombats en es sol	https://youtu.be/UwZ08wWAJuE?si=EycWqCvlE7POuF47	6	2
64	Com te n'has anat?	https://youtu.be/Z2wG8G7K1ZU?si=7KKark37u2lMV6Cy	6	2
65	Magnetic Fields	https://youtu.be/DcZEPbKUttA?si=oFoVZjBRRNP51XeF	6	2
66	s1venir	https://youtu.be/WgZ050aJeA0?si=HcE1XVW5tBcxxIXW	7	2
67	Very Verinosa	https://youtu.be/Iqx96g57_0s?si=zrArNwU8I3u4kBPH	7	2
68	Mon Cheri Go Home (ft. Fades)	https://youtu.be/uwbwFWULN3E?si=G2pkb8GXVbrbiFYl	7	2
69	Chill beBé	https://youtu.be/ne35RUYe8sI?si=ZsAoLKvNOVIPRzpJ	7	2
70	màgia obscurA	https://youtu.be/uY3zbuAe55g?si=67PJiaubJA9wXiS5	7	2
71	Pura geografia	https://youtu.be/jEM6hReeU78?si=JC51j4wyldarHN2l	7	2
72	Super mala pinta (ft. Renaldo & Clara)	https://youtu.be/BCC0EvN3-4Q?si=t_VVORt9n6kD2NGA	7	2
73	Quina pena	https://youtu.be/zb6u_23QZVY?si=bRbT6puGzZzinwCh	7	2
74	Trista a Miami (ft. Julieta)	https://youtu.be/SoDTtGle30Q?si=ieSD8YI_xJm3o2-t	7	2
75	Mala via	https://youtu.be/WYd53BFqy84?si=0NpYi9cKEoB5D8wk	7	2
76	Cala Rajada 1964	https://youtu.be/W2sD7-XZ6jg?si=abHSDjugpokS2jQl	7	2
77	Hoteles, sol y playa (ft. Pau Debon)	https://youtu.be/UlT_TeQyYRI?si=_VJOjMFPFBimbRWG	7	2
78	Xin xin i bye bye	https://youtu.be/0qmH9kdakQM?si=SnGpp5y9gYfhAdig	7	2
79	Ella sempre crema	https://youtu.be/2c8J1H42tg8?si=zQEvMEA3rHLeI6IF	7	2
80	Ressaca a sa platja	https://youtu.be/DomRyxK0PhA?si=0zDSxdZIKymmvi1D	7	2
81	Balada des Trast (ft. Mar Grimalt)	https://youtu.be/BOT0BVDtoBo?si=dDnNQIokomOutdFu	7	2
84	Viure Sense Tu	https://youtu.be/Xnuq0dX1ubk?si=eiZNoVyBBxH9RN6q	8	3
85	S'Univers És Una Festa	https://youtu.be/-CvO5zrdaqg?si=OZ24TyitZMob1Xdm	8	3
86	En S'Estiu	https://youtu.be/LabGIsiuxTc?si=X1k1pIjGD6lkiYML	8	3
89	Astronauta Rimador	https://youtu.be/1V_GRVw5faM?si=CuB2qN3elEnGqjAq	8	3
90	S'aire de Ca Teva	https://youtu.be/-hrwU-6N5Kw?si=vevdf8nvqTmAibJj	8	3
91	Sa Vida Passa	https://youtu.be/z91XjQTh-QA?si=3Ky5anfWQfqTS4tt	8	3
92	Amb un Velomar	https://youtu.be/hPlHIZIVb6Y?si=AoUdb9X_VsAqR-tx	8	3
94	Canta	https://youtu.be/vJaJ9yc-rnA?si=fXLJvCxQ9iXKkd6G	9	3
95	Tots es motors	https://youtu.be/MUZx4JbdKno?si=YjudFZhoiYtR0m6O	9	3
96	Focs artificials	https://youtu.be/tvxFtpOQh7A?si=NO92Npry6fEcr_WP	9	3
97	Estendre sa roba	https://youtu.be/qi38bshKM0E?si=7AUhXd76zO2aQuhC	9	3
99	Fa calor	https://youtu.be/FKUiYK4BXrA?si=jKOR6wuFCLMY_jzm	9	3
100	Camps de maduixes	https://youtu.be/43of1rjhty0?si=mwyDc-BWZBg4dLmi	9	3
101	Aquesta pluja	https://youtu.be/GiA-r0khN6s?si=UtYArektZZ19XM1g	9	3
102	Tornar a sa terra	https://youtu.be/3Y2e5kHMlGk?si=sARtMRtUOX9AgHYj	9	3
103	Ses meves mans	https://youtu.be/tJsEozqpu1c?si=-AbNJrt85rVCRxLc	9	3
104	Declar	https://youtu.be/O5bX-Vl_mZw?si=CexgB-r3XIVRlHcH	9	3
109	Final	https://youtu.be/UM4sxngPEl8?si=ccjvpKH40l_zf-Uv	10	3
110	Alegria	https://youtu.be/ILXPNpZKPbQ?si=YkVnmrW88lUdoKej	10	3
111	Dins aquest iglú	https://youtu.be/9p2A85OgDe4?si=xmMknxTFSj3oQYTa	10	3
112	Alpinistes-samurais	https://youtu.be/elzlwstWa9Q?si=agwcwWwTryN0FEmF	10	3
113	Vos estim a tots igual	https://youtu.be/ce856W2lB9A?si=C1OcvPGu-_CQX335	10	3
114	Productes de neteja	https://youtu.be/IZn2iYf1jIA?si=E_6HAq3esl-vd_WM	10	3
115	Patxanga	https://youtu.be/7k3SBGbU4f4?si=7eG9m5k_pHyG8dqP	10	3
116	Asteroide núm. 15000	https://youtu.be/DSjYtz0nBPI?si=TYe_eZZZOOaWWYCk	10	3
117	Tristesa	https://youtu.be/fbebCwjjz9w?si=KxudueCs76tC-X3Y	10	3
118	...Alegria	https://youtu.be/6DyUwASVR5M?si=J2Izx6oHpjL-6r06	10	3
119	Play	https://youtu.be/i8aI-uV0Mtw?si=GhlJW21Exk6AL0s-	11	3
120	Batiscafo Katiuscas	https://youtu.be/vqzA3h_XGLs?si=UHQe0vq73OblqJqJ	11	3
121	Wa Yeah!	https://youtu.be/CyceHyj0Ea8?si=TWAzT0ZZx2cbUZBK	11	3
122	Tokio m'és igual	https://youtu.be/KsR2tgQPGRw?si=_DzzvRYnX4c8_pXC	11	3
123	Amazones a sa lluna	https://youtu.be/_ThCokewta8?si=BJ-JUC6P_nnLmwyl	11	3
124	Darrera una revista	https://youtu.be/Jl54LDSwpUI?si=k2q5PrP5zslME21l	11	3
125	Love Song	https://youtu.be/ffMTQznKbLQ?si=-jJjpmP0DxHp7rhO	11	3
126	Nata	https://youtu.be/FWCHARuDu-E?si=0hqtoOjx_iDS1X5v	11	3
127	Mecanismes	https://youtu.be/utFW7QmS_As?si=S2vEmMum7Cz-dsS4	11	3
128	Tonto	https://youtu.be/aqvzmde1VcA?si=ln8yw7YCwTkkyy6-	11	3
129	Bamboo	https://youtu.be/VoCQU_TjDzU?si=NxWOVYJ60mAeiPLn	11	3
130	Replay	https://youtu.be/sX2O_hSvJUw?si=nz2jZ5iMA-lG-lEK	11	3
131	Me Sobren Paraules	https://youtu.be/FNkfGgrxmPA?si=fhgC5JhzZX4dVzR2	12	3
132	Coses Modernes	https://youtu.be/WA7TKSzF6pY?si=vzrpbrNOO9prcVsP	12	3
133	Islas Baleares	https://youtu.be/wbDzzgtiEQ4?si=jGG1xHqXuLGbdqw5	12	3
134	Abraham Lincoln	https://youtu.be/rTQDfkrTNRE?si=YRPH1W_04G-c8Gn2	12	3
135	Clint Eastwood	https://youtu.be/xW2pMONE10w?si=GJIGsJF6jEbDAw7i	12	3
136	Icebergs i Gèisers	https://youtu.be/5jZGuwx9uC8?si=UMwJ_y8-P7cc-QzZ	12	3
137	Calgary 88	https://youtu.be/TSZeqa0T0O4?si=xXMk10jR52Mtzcsx	12	3
138	Pioners	https://youtu.be/0DjFDtxgFkk?si=kuP-AKkP0WghZLWT	12	3
139	Boreal	https://youtu.be/FXZeCOrMWkk?si=Sr4i4Rwy-DbP7kwD	12	3
140	Es Canons de Navarone	https://youtu.be/wblZel1KUso?si=VT3g94Sls7LUUiAQ	12	3
141	Carreteres Que No Van Enlloc	https://youtu.be/sI2AHPkKby4?si=yxERyirsgqsOsfzE	12	3
142	Es Far de Ses Salines	https://youtu.be/DfBMq579IGQ?si=Jm4hCDK3nfVb5wEq	12	3
143	Sospitosos	https://youtu.be/BS-Wy_gZpjk?si=No1lw-_NN4N89ofG	12	3
144	Minutos Musicales	https://youtu.be/BZ_WyiI_apI?si=zmMIMhR2cDyE5pqN	12	3
145	Un minut estroboscòpica	https://youtu.be/4bQBHBNJnNA?si=SP5PDTZbpW9XXpFm	13	3
146	Oh la la	https://youtu.be/0_VCqryfoZM?si=MP-LbQvpCUTt6ng0	13	3
147	Miquel Riera	https://youtu.be/YTE9EDxK8AE?si=ITN3Dr917_Alqr5I	13	3
148	Amants perfectes	https://youtu.be/kWlvm9qjZlc?si=fPPYv54d9Medq2RC	13	3
149	Cultura silenci	https://youtu.be/r1WknkAIC1k?si=BX6O6vycJlteHn1v	13	3
150	Una daixona de pols	https://youtu.be/zTdJIHO9Eg8?si=9UJZoV30UnenUgJb	13	3
151	Invisible	https://youtu.be/foM-a-kuwqo?si=OMnY7k1TDuz9NH58	13	3
152	Caramel·let	https://youtu.be/92G7jqdeT6Q?si=4Hpn4lW1cI72r_SH	13	3
153	Cançó de llum	https://youtu.be/adsz08_AxFU?si=8jPxRqhaxKz-Z-Rj	13	3
154	Venc amb tu	https://youtu.be/3K60bRISZMw?si=ZtkFpozMqw20B3yz	13	3
155	Smoke Signals	https://youtu.be/B2qY6C5KWOE?si=EC2H5fXnOLhR_yWD	14	4
156	Motion Sickness	https://youtu.be/iMr69JihnP4?si=38hUpczO1uIx5EOp	14	4
157	Funeral	https://youtu.be/4GtIs8UeH9Y?si=Tuhf5NFfGULUP3DX	14	4
158	Demi Moore	https://youtu.be/VfwNie83McA?si=19wTP7su7U7aMLQ0	14	4
159	Scott Street	https://youtu.be/ZOtecdsegaM?si=xxZTuwUSGmp-Ihbs	14	4
160	Killer	https://youtu.be/ZOtecdsegaM?si=wFGLmievqHQ7v-Z6	14	4
161	Georgia	https://youtu.be/mICSN-myHG4?si=B7WcpsJmtEBcx8tJ	14	4
162	Chelsea	https://youtu.be/cmF35stL478?si=YR1KGWYcD4ZtKpHc	14	4
163	Would You Rather	https://youtu.be/8K7SvFIFgO8?si=_Z9YAQwujAep2C-B	14	4
164	You Missed My Heart	https://youtu.be/VCE6_TQh5HY?si=7H_Oc5pxrFz0zppu	14	4
165	Smoke Signals (Reprise)	https://youtu.be/ikx3WsUGUKo?si=noa7rcKc_HxiQoFS	14	4
166	DVD Menu	https://youtu.be/X3CYZ0zCY6M?si=fFoE4ac_FZWW_Dea	15	4
167	Garden Song	https://youtu.be/ekXfx-rQ3Ww?si=-5og0t7jiR84bZLW	15	4
168	Kyoto	https://youtu.be/Ubt_qaac_wM?si=iF_GEsL8UfWwEIn1	15	4
169	Punisher	https://youtu.be/ncSf8Nk3aq4?si=LHP7OG31m2R6MbWk	15	4
170	Halloween	https://youtu.be/bVZTMyQ3SsU?si=jXnNqohtQ6ZpwAJr	15	4
171	Chinese Satellite	https://youtu.be/i63yumCNdJs?si=y8ac5YH11WxQQvLi	15	4
172	Moon Song	https://youtu.be/DXqZ66XK3z8?si=_rIUky9YGFTyEyz0	15	4
173	Savior Complex	https://youtu.be/60PwTgPY9vg?si=CBmlRxR-hKRGz6vL	15	4
174	ICU	https://youtu.be/9lGqdlvNOXU?si=6LMVkUoeSMogHl0z	15	4
175	Graceland Too	https://youtu.be/cTG0dakpDko?si=grOWOtXGUIX6URwf	15	4
176	I Know the End	https://youtu.be/ZC6mEJ5i5y8?si=_pGlTswWmpZI6iy5	15	4
177	Alewife	https://youtu.be/Y0K4yHdgeIk?si=pMVKWruha8SUyRHi	16	5
178	Impossible	https://youtu.be/LSnalqkHKy8?si=D2q3JB6YDsbjh7C0	16	5
179	Closer to You	https://youtu.be/Gyb-_xec_1E?si=T-riV9II6CBjVCWl	16	5
180	North	https://youtu.be/gkMd-WzPmuY?si=sRfHU463l1CSH8o1	16	5
181	Bags	https://youtu.be/XGZfqM3bs3I?si=BxOSkDbv-Y6_lkGm	16	5
182	Softly	https://youtu.be/2YV5WGrwfk0?si=8hST_CLSYxLj7aRY	16	5
183	Sofia	https://youtu.be/TgCYREjELV0?si=E8euDcErqmyz_SzX	16	5
184	White Flag	https://youtu.be/wAsWDWqvQsQ?si=mXme3iyp-WrAQn-j	16	5
185	Feel Something	https://youtu.be/7Xs_d70n0Zc?si=Llvc8L3W7RPjstX9	16	5
186	Sinking	https://youtu.be/fcS7BOGkED0?si=79cA-JfIg0ylLrmw	16	5
187	I Wouldn't Ask You	https://youtu.be/7NnmnDY-wJY?si=tub2aYG8uxLRymP2	16	5
188	Bambi	https://youtu.be/nLavzXXZCcs?si=Gz66sGBrlfTPT2H4	17	5
189	Amoeba	https://youtu.be/VR8ooa3G_5M?si=FpaFbIyBt6xxw3Nu	17	5
190	Partridge	https://youtu.be/w3WT9NfSx94?si=ggG-3bfDaxcvOx7G	17	5
191	Zinnias	https://youtu.be/IWqJMne8xbU?si=uhtQy3orIuAbCZcK	17	5
192	Blouse	https://youtu.be/BmtZzo05pqQ?si=lOPNqZhEtLhn7reb	17	5
193	Wade	https://youtu.be/C0GzxlOzkKk?si=P8fYXkQHcnLajP1Q	17	5
194	Harbor	https://youtu.be/a5Ajd8BFSQM?si=vhAj2tRaTmoeZ-Dw	17	5
195	Just For Today	https://youtu.be/K5MpbghKJUo?si=x2KWBxXGw9XimU_V	17	5
196	Joanie	https://youtu.be/sdAWtPA1P3E?si=Ph0QPzk2aBLhDzCx	17	5
197	Reaper	https://youtu.be/SZf2hDnHr2c?si=f9Kl-h1xvEjU1jxF	17	5
198	Little Changes	https://youtu.be/gVW0HiwPFQc?si=9ix_M5KMBzXBm2Hq	17	5
199	Management	https://youtu.be/i_1lXwpuZMk?si=EwRdIP8Ru89mau_u	17	5
200	Nomad	https://youtu.be/BJM536JyZAg?si=DCetuFtOZgekUyxa	18	5
201	Sexy to Someone	https://youtu.be/Ad2AgVaNq00?si=JOg2LXHr00kKOW1D	18	5
202	Second Nature	https://youtu.be/0Tm2kz67YBA?si=6GFf85lWTEd0fZX1	18	5
203	Slow Dance	https://youtu.be/LnPGL8W4Zew?si=jgX3fXU8D7ECstEm	18	5
204	Thank You	https://youtu.be/F0BM0LFtUtU?si=linYO8VVUK5sEq5Z	18	5
205	Terrapin	https://youtu.be/vtjUe3sHQms?si=swQNfLZDEUmQ7CHj	18	5
206	Juna	https://youtu.be/9Z3t4wDjebM?si=M6T2Ea0hynPFjJsV	18	5
207	Add Up My Love	https://youtu.be/GJ1w0OhBHZM?si=a4K5kI9NsRlNctLI	18	5
208	Echo	https://youtu.be/V6b9OD3V7sQ?si=pUVfoXmX6Q1RtfOJ	18	5
209	Glory of the Snow	https://youtu.be/llFKQS8c3mE?si=oo23_J06s93nC14w	18	5
210	Pier 4	https://youtu.be/DPWBb_a4EqQ?si=lr52K5mUuzNCg1Q-	18	5
211	Extremaydura	https://youtu.be/LfUmyr6equs?si=PkyzjEohbk-6xuAt	19	6
212	Emparedado	https://youtu.be/k0LTw3JuT6g?si=RlIRtYjIA6QeR8x4	19	6
213	Decidí	https://youtu.be/1D1pbagPP0Y?si=JulmXJA6H0XfYtWj	19	6
214	Romperás	https://youtu.be/NRVDKsAwp24?si=OR1QMYKv7qcLUa9x	19	6
363	Adiós abanico, que llegó el aire	https://youtu.be/c5P5hNSFQhc?si=9UVrRP8GwTUCgTTM	19	6
215	Arrebato	https://youtu.be/pKVDD6UYEbY?si=TeBCy0DagcG_cvXS	19	6
216	Jesucristo García	https://youtu.be/W1k_XlnJu1U?si=EL-i_sBnk6uzDZO5	19	6
217	La Hoguera	https://youtu.be/OmDkLMZXwnk?si=9CxC_NvR9GMtM89X	19	6
218	Te juzgarán solo por tus errores (Yo no)	https://youtu.be/ySqbikfeYew?si=bUYKV-Qsoheb2V5y	19	6
219	Caballero andante (¡¡¡No me dejéis así!!!)	https://youtu.be/eNfxMxdBHeU?si=z0f28-Tztgxx-GOm	19	6
220	Amor castúo	https://youtu.be/s8wWs5XgNHM?si=69_H_pfR5wRmyzL8	19	6
364	A fuego	https://youtu.be/Oz5qg4pLm78?si=wABijDE-5gObVauK	20	6
221	La vereda de la puerta de atrás	https://youtu.be/bTYA_KXwOoE?si=NzC23SmWa_cIPZW9	20	6
222	Hoy te la meto hasta las orejas	https://youtu.be/HrEmKzhjTFo?si=_ZqwEuG4IqoJojil	20	6
223	Standby	https://www.youtube.com/watch?v=ZH05IaSy2hE	20	6
224	Menamoro	https://youtu.be/l-CjkAPeMSQ?si=1-j6q0shUxrh5JtS	20	6
225	Luce la oscuridad	https://youtu.be/qxglckFGjrc?si=3L0RAH74nGjJU5IG	20	6
226	Cerca del suelo	https://youtu.be/bnVlV4kjJ5c?si=n-SuzZxMbQItTPhi	20	6
227	Puta	https://youtu.be/_LU62VsIcV0?si=tMcN2GOi7h2U40ur	20	6
228	Buitre no come alpiste	https://youtu.be/MWxkZqeL_sg?si=RJNborUVXPxX_rkl	20	6
229	La vieja (canción sórdida)	https://youtu.be/oG5RYm3_Qok?si=mrVynzZBKKsqTsTv	20	6
230	Dulce introducción al caos	https://youtu.be/-byTiKtOrH4?si=xsDLSHtO8CfDBmCY	21	6
231	Primer movimiento: El sueño	https://youtu.be/_vmFgtKf4D4?si=usi5UDaqNWnm8uKN	21	6
232	Segundo movimiento: Lo de fuera	https://youtu.be/2vuSCv_vCIk?si=y1u9uWWBAdoRRLXM	21	6
233	Tercer movimiento: Lo de dentro	https://youtu.be/2vuSCv_vCIk?si=9pjPP5WOS735Hndt	21	6
234	Cuarto movimiento: La realidad	https://youtu.be/WUIuGSARrzI?si=CfsBQcxL67IORwhA	21	6
235	Coda flamenca (Otra realidad)	https://youtu.be/Pp-fw3jBa4U?si=mh2Vxcsl7g9gvNr2	21	6
236	Desarraigo	https://youtu.be/Jo6lIVf9UQg?si=8mzlnvcUYPQDyGax	22	6
237	Mi espíritu imperecedero	https://youtu.be/1gVF9YI5pnk?si=f7HiQ4APw0PwpDTn	22	6
238	Otra inútil canción para la paz	https://youtu.be/05g7_GhljRU?si=VDFe_xARULJ_FaDs	22	6
239	Si te vas…	https://youtu.be/-H8qmZdah74?si=cU3s12oYwC9-3Iwg	22	6
240	Tango suicida	https://youtu.be/ywVubmG4og8?si=M6Mh5-y8PsYZl2rd	22	6
241	Calle Esperanza S/N	https://youtu.be/z5DLlej2EJA?si=3xSZbavJWeKIyUJa	22	6
242	Benvolgut	https://youtu.be/irrPUyetKoA?si=dYjY_mFuKlHEEBmu	23	7
243	La cançó del soldadet	https://youtu.be/8zW0Fl6gi5g?si=L7ASm3RDt7opi9dT	23	7
244	El gran salt	https://youtu.be/pzomaZMbrfw?si=-mOyLPW4BPJ3Mo-M	23	7
245	Boomerang	https://youtu.be/uw3IoBlJ6Nw?si=diXAq7kBMg_2NJ1R	23	7
246	La bola de cristall	https://youtu.be/Ofe1gSUPKfI?si=0ChrC1kIlazdx7Vp	23	7
247	Aniversari	https://youtu.be/iOQeH38a2Mo?si=p6RaM6YE6Mjgd1Xw	23	7
248	Flor groga	https://youtu.be/1yIPfQ1KEoc?si=9CiZ4UwtHlkKhK9p	23	7
249	Criticarem les noves modes de pentinats	https://youtu.be/m9LJz0ilTnM?si=aoXxDynhdhqGJgHn	23	7
252	Ai, Yoko	https://youtu.be/ame-GKroXzw?si=xMjNcXHXUNuko5h8	24	7
253	Vés bruixot!	https://youtu.be/dzxn4g_zdVY?si=PMNzxYoKklbEsNmQ	24	7
254	Ja era fort	https://youtu.be/tb8H7mVYpPY?si=_2S9BMy2vAqOIGPX	24	7
255	Banda de rock	https://youtu.be/mqDRwyiobGM?si=f3fFNL6LaKQ4wwK1	24	7
256	Deixar-te un dia	https://youtu.be/5GxRT28TNk8?si=qt2tnKZ2dig3X0IL	24	7
257	Mort d’un heroi romàntic	https://youtu.be/HGYnMlcSrvc?si=oIXqk6wCoNq0wcS2	24	7
258	Imagina't un nen	https://youtu.be/ALcoLZtm1Eo?si=bqam8gbIexZZgJPG	24	7
259	Teresa Rampell	https://youtu.be/LMiqw-EvDB0?si=Mh9WDkXMZ9mUDjQz	24	7
260	A veure què en fem	https://youtu.be/Nraqk0RaXVw?si=9gH4ykHX6EfvUe8K	24	7
261	Desapareixíem lentament	https://youtu.be/usQ2AQLGC40?si=2z7nmvmg1POQ3wq4	24	7
262	Quin dia feia, amics...	https://youtu.be/aPUjVt-CAbc?si=Q9S3eyQlP99YB0sk	24	7
263	Fes-me petons	https://youtu.be/DxFN7EiI-5U?si=pdVoJpyCGA6NSl7l	24	7
264	Un directiu em va acomiadar	https://youtu.be/Sq_9UCGX65g?si=srqA8ylSABc7C0Kr	24	7
265	En la que el Bernat se't troba	https://youtu.be/lARUMGyC8lQ?si=FFIhkvJnaB5S_YUn	25	7
266	Avís per a navegants	https://youtu.be/dkGZoCHG6zY?si=J_hHth3eWoxeCh6z	25	7
267	Ai, Dolors	https://youtu.be/QUU_QC0iNi0?si=CscAbqoRB-AeN83j	25	7
268	Pla quinquennal	https://youtu.be/w16f9mLukJw?si=PHm_caXn-_h0lNCe	25	7
269	Roma	https://youtu.be/Yjzjvijvd0k?si=ZFXrJJGgLJhPFGWZ	25	7
270	Els guapos són els raros	https://youtu.be/mtTO1FvcNw4?si=ON4rhFeRpwg466hp	25	7
271	Dona estrangera	https://youtu.be/eieGq5l4bVk?si=A0A_vEeZeMXarHse	25	7
272	Ceràmiques Guzmán	https://youtu.be/5ysFT9RRYOQ?si=0TXPWQS9FDIo578F	25	7
273	Nit freda per ser abril	https://youtu.be/21FdVL8DEZc?si=RFEBLGfQYulIP2fp	25	7
274	Corrandes de la parella estable	https://youtu.be/1PsW9tGfcrk?si=g3rLSa0nY0Gn2-_R	25	7
278	Dancing Queen	https://youtu.be/YkLLcIKhJ64?si=CgPqBuWZ77AxFsXZ	26	8
279	My Love, My Life	https://youtu.be/-1CKpjW9wek?si=n_JJCjtr_uodkN6r	26	8
280	Dum Dum Diddle	https://youtu.be/3yoTDkGuHxw?si=U78t2HjkpQQMM0z9	26	8
281	Knowing Me, Knowing You	https://youtu.be/_oAnFBiQng4?si=NHGn0R5iQoDHfC17	26	8
282	Money, Money, Money	https://youtu.be/1LPNuFkteI8?si=wEbbMAuWVwoBBP1Y	26	8
283	That's Me	https://youtu.be/uV3Sh91Zy9E?si=3sMX7DTqOmcKbKrt	26	8
284	Why Did It Have to Be Me?	https://youtu.be/8G-XwarxyMs?si=x7EQHg0kspTOEdtq	26	8
285	Tiger	https://youtu.be/htziQt0pCAQ?si=fonHYw4nTZT7xakV	26	8
286	Fernando	https://youtu.be/b-U3-Sla8GM?si=594ExLPp-et6A4Zp	26	8
365	Voulez-Vous	https://youtu.be/0X2mn7Sk9lQ?si=qzmBGyu36pjdN1Lk	27	8
366	Angeleyes	https://youtu.be/GHddJnNo_BQ?si=WQIrjSuKnrGl2EeG	27	8
367	The King Has Lost His Crown	https://youtu.be/3JWAbEJ4EZU?si=YD7_V3SgeRoOj1lb	27	8
368	Does Your Mother Know	https://youtu.be/PfvAiukymyw?si=ea7rmMAkxH0FP3Wj	27	8
291	If It Wasn't for the Nights	https://youtu.be/ziz_2mIgY04?si=Al10XUn618rdLlko	27	8
292	Chiquitita	https://youtu.be/8WyfVoFM9As?si=SdFKBoR6up5DVs8G	27	8
293	Lovers (Live a Little Longer)	https://youtu.be/a02pJY2FauI?si=gn9JxwzYE0Ez09Y_	27	8
294	I Have A Dream	https://youtu.be/LxBbX9IdA2Y?si=WlhDTJqpKuIo7KN_	27	8
296	Gimme! Gimme! Gimme! (A Man After Midnight)	https://youtu.be/pa2j0Bh83ms?si=PldeqYVrx1dBZBJ_	27	8
287	Super Trouper	https://youtu.be/cBjAZvpJDQs?si=56TXIT5nLnij0dt8	28	8
288	The Winner Takes It All	https://youtu.be/WbnG3eAGb6Y?si=6mmHZcpBE4XYGRNx	28	8
289	On and On and On	https://youtu.be/dlUQM5PD51o?si=GempREuROciDvj10	28	8
290	Andante, Andante	https://youtu.be/CS-30pO94lo?si=m5g8-EVPpmMtwGHw	28	8
369	Me and I	https://youtu.be/CaoBiFYu-FI?si=B7jEL1G2FTCO3Xta	28	8
370	Happy New Year	https://youtu.be/dpdz82zW0kU?si=01VbD22c4Ibhbfhf	28	8
371	Our Last Summer	https://youtu.be/xm3s1sANRDE?si=ahCABN-racW28bHN	28	8
372	The Piper	https://youtu.be/oc4XqKSWOSc?si=QzCGjR0tZ377qO7P	28	8
373	Lay All Your Love on Me	https://youtu.be/5mHzaIehRTE?si=8wQPde0G5Qh2hlEX	28	8
374	The Way Old Friends Do	https://youtu.be/d1-uLBhcJZc?si=9u2U89IC2dh8AY8F	28	8
375	Homesick	https://youtu.be/NJqnj1gwLeQ?si=0DV5orR5WVAXikl2	29	9
376	Kathleen	https://youtu.be/fr_xYa12RM0?si=jSjvme-7Lz-Q_fn_	29	9
378	Cocoon	https://youtu.be/axfDi9V0oW4?si=Z42vHaB-IfuzFz2P	29	9
379	Fallout	https://youtu.be/sfSbIli2Mi4?si=CMcpaedn00paskcZ	29	9
380	Pacifier	https://youtu.be/4Ykz-JO-aDY?si=7Nq1_k7VMLDZQlkF	29	9
381	Hourglass	https://youtu.be/L-NbInXED-o?si=MdyRP_xgETlKNUCZ	29	9
382	Business	https://youtu.be/HNPLL8KVcOw?si=O0UDSed_wlMvHR7u	29	9
383	26	https://youtu.be/cLjm7E_iBUA?si=UzkTuk7udxi0fK0T	29	9
384	Rango	https://youtu.be/VIB0RUzbkAs?si=Gwebq3kjVZWt8tYj	29	9
385	Sidewinder	https://youtu.be/-PCaaapUg5k?si=qkPBAyDaRSAth8KK	29	9
386	Tyrants	https://youtu.be/0EdPafm7_S8?si=j689rQcFhfugtghn	29	9
387	7	https://youtu.be/IkDLsioZRTk?si=ddVzELJMIXsfUW_P	30	9
388	Soundcheck	https://youtu.be/4GCm8KJqjWc?si=vywLnSTNG7W-dkvQ	30	9
389	Twice	https://youtu.be/wyMBaJeF2G4?si=22jZQOE5b3SgrLzd	30	9
390	Outside	https://youtu.be/R9HQ9somzCQ?si=hmkkCb5My989ViVj	30	9
391	Anything	https://youtu.be/Ikyq57-GIAc?si=LbhncJRjOKLImMn4	30	9
392	Glasgow	https://youtu.be/Qw8eqvXWZRA?si=X1C0MCCsjCdVQ70C	30	9
394	Postpone	https://youtu.be/HS0q76zkcKU?si=Apc35eiZyQJ3Zrqc	30	9
400	Oxygen	https://youtu.be/p-ulEVUS7qA?si=ffz2YWBKnIK8Aqqv	30	9
401	Heathrow	https://youtu.be/dNkqT6qeeLs?si=kVIxK6AzS73cGIwq	30	9
402	Longshot	https://youtu.be/vc_iGmtjDMo?si=dMlcYIzBRpYFgBKT	31	9
403	Fluctuate	https://youtu.be/W9J0PXH5cjo?si=NzHX5M9qj1EktmZj	31	9
404	2all	https://youtu.be/0d2llFWvFSM?si=GA_vnu5qM4abBN2P	31	9
405	Conversation	https://youtu.be/167O_ygTbKI?si=hVH8cNvaW_hijI47	31	9
302	Sidetrack	https://youtu.be/d_MK8Lz6e4I?si=AqNdEkz441QXlxzW	31	9
303	Encore	https://youtu.be/ZV_5mWg_RhI?si=pZdGhPGEq2Rq989s	31	9
307	Stronger Than Me	https://youtu.be/rayMT3OIOC4?si=EJSrUgek2x9P-S-N	32	10
308	You Sent Me Flying	https://youtu.be/TwV5xUxBDxE?si=AT1WBwftTyuvKoxM	32	10
309	Know You Now	https://youtu.be/zvg9nzEIX4Q?si=qtJSRlW-t6kXfqZO	32	10
310	Pumps	https://youtu.be/tCgomnW2TRM?si=ri6i80-O0DKv-z5z	32	10
311	I Heard Love Is Blind	https://youtu.be/HHUBkPb0ytQ?si=3935IsoyizJ9CgYR	32	10
318	What Is It About Men	https://youtu.be/ELeyIumbmNQ?si=jmTfvvWw1oX7jG68	32	10
320	Rehab	https://youtu.be/XOjDJRiUeGE?si=SDOL2E53WHCw_iNJ	33	10
321	You Know I'm No Good	https://youtu.be/Xs_d5kwYqX8?si=8nZtPumCkHXM3gRd	33	10
322	Me & Mr Jones	https://youtu.be/tvjtLexh2G4?si=2_-DBKWZT3Xs2WBk	33	10
323	Just Friends	https://youtu.be/0ZNXJpI-WsY?si=d-YkSKz9WMQ385rS	33	10
324	Back to Black	https://youtu.be/VWi5P4Sh3MQ?si=L_HDFb-gZo-41gTE	33	10
325	Love Is a Losing Game	https://youtu.be/q6drd4J-TBg?si=w6nWUrxiI-hKeuYZ	33	10
326	Tears Dry on Their Own	https://youtu.be/k_a10crEqqc?si=MF57WHOkJNk6Kkwm	33	10
329	He Can Only Hold Her	https://youtu.be/36KrTBaWADU?si=S1BE23LypjS7Ww0v	33	10
331	Valerie	https://youtu.be/ssAXgxgoCF4?si=6ujVbeHthDEnMu32	33	10
332	Heavydirtysoul	https://youtu.be/lzXRdS9cynQ?si=SceUOvJoxjxl7c_4	34	11
333	Stressed Out	https://youtu.be/yizkt5BubGo?si=ZBlhLPwSx5bLPvR0	34	11
334	Ride	https://youtu.be/6BpcFxNS3i8?si=Js36oN-jwR1MfFjL	34	11
335	Fairly Local	https://youtu.be/YMQ5_Rkwiyw?si=wwSya6J0yrJz1Mgl	34	11
336	Tear in My Heart	https://youtu.be/-olL71GgdXQ?si=rVKZGL2xwqOsmYsk	34	11
337	Lane Boy	https://youtu.be/MMGrjjzz1r8?si=5UvwmRpWIjEL4A5y	34	11
338	The Judge	https://youtu.be/an6iivcWZhE?si=bl7XpRx-835VcnmN	34	11
339	Doubt	https://youtu.be/F-C81j75Rmk?si=HSQ7vcxPbBy5UUYy	34	11
340	Polarize	https://youtu.be/7DnFMAc446k?si=sFTvySesCbchS6Ad	34	11
341	We Don’t Believe What’s On TV	https://youtu.be/OLdviOHQeQs?si=6-Ea1Av1lDox8JV6	34	11
342	Message Man	https://youtu.be/wg-if-6FeVA?si=VpIeFId8rkXUJg05	34	11
343	Hometown	https://youtu.be/wS8otCVxpkw?si=dORCYkQS9wByb9yW	34	11
344	Not Today	https://youtu.be/rJv6RI9SD_Q?si=I7GYy5cMzPBjvwyC	34	11
345	Goner	https://youtu.be/wXjbzT0javY?si=v91tA_Tjh2nTx7ys	34	11
346	Jumpsuit	https://youtu.be/Fz6KrQhF-SE?si=Gb1za2TuW1lb9GP2	35	11
347	Levitate	https://youtu.be/DRkET-jZRtc?si=wxnpA3veZvzVuejb	35	11
348	Morph	https://youtu.be/rYuBU7YzZ-c?si=ngSCHWlCmIIFOk3t	35	11
349	My Blood	https://youtu.be/0a2ePzVCKuk?si=8Ou-rzPinYOclB1v	35	11
350	Chlorine	https://youtu.be/zKFzKIa_pIM?si=SNStAbal7DvDYymd	35	11
351	Smithereens	https://youtu.be/3QNmdRzX0fM?si=9svdcbIa2VEJxoUL	35	11
352	Neon Gravestones	https://youtu.be/6U8OAC6sN9I?si=3gYzwWTkYE-WMFML	35	11
354	Overcompensate	https://youtu.be/t_-2FjNLzzM?si=Fdjwa_ebfHFXw2Mp	36	11
360	Routines In The Night	https://youtu.be/D9pOuGOaumI?si=ijSOMKEyHK7EOGny	36	11
361	Oldies Station	https://youtu.be/M425FE75lCE?si=VPjQqpaymBesC4wR	36	11
362	Navigating	https://youtu.be/O-zcOkMAPjQ?si=XJpJUb1QsTKmrPsQ	36	11
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, name, password_hash, surname, username) FROM stdin;
\.


--
-- Name: album_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.album_seq', 1, false);


--
-- Name: artist_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artist_seq', 1, false);


--
-- Name: image_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.image_seq', 1, false);


--
-- Name: list_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.list_seq', 1, false);


--
-- Name: track_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.track_seq', 1, false);


--
-- Name: users_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_seq', 1, false);


--
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id);


--
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id);


--
-- Name: follow_user follow_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow_user
    ADD CONSTRAINT follow_user_pkey PRIMARY KEY (user_followed, user_follower);


--
-- Name: list_contain list_contain_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_contain
    ADD CONSTRAINT list_contain_pkey PRIMARY KEY (list_id, track_id);


--
-- Name: list list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list
    ADD CONSTRAINT list_pkey PRIMARY KEY (id);


--
-- Name: rate_album rate_album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate_album
    ADD CONSTRAINT rate_album_pkey PRIMARY KEY (album_id, user_id);


--
-- Name: rate_track rate_track_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate_track
    ADD CONSTRAINT rate_track_pkey PRIMARY KEY (track_id, user_id);


--
-- Name: review_album review_album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_album
    ADD CONSTRAINT review_album_pkey PRIMARY KEY (album_id, user_id);


--
-- Name: review_track review_track_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_track
    ADD CONSTRAINT review_track_pkey PRIMARY KEY (track_id, user_id);


--
-- Name: track track_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_pkey PRIMARY KEY (id);


--
-- Name: list uk1g8ymw4pgef726ke3tyx5sbn6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list
    ADD CONSTRAINT uk1g8ymw4pgef726ke3tyx5sbn6 UNIQUE (name);


--
-- Name: users uk6dotkott2kjsp8vw4d0m25fb7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk6dotkott2kjsp8vw4d0m25fb7 UNIQUE (email);


--
-- Name: users ukr43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT ukr43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: follow_user fk17bk1lpysgdpwunutss6mg9jc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow_user
    ADD CONSTRAINT fk17bk1lpysgdpwunutss6mg9jc FOREIGN KEY (user_followed) REFERENCES public.users(id);


--
-- Name: list fk4bmd249e4km8hrkqhhcndle4y; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list
    ADD CONSTRAINT fk4bmd249e4km8hrkqhhcndle4y FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: review_track fk4ofhys9c32inxbg68399di9pu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_track
    ADD CONSTRAINT fk4ofhys9c32inxbg68399di9pu FOREIGN KEY (track_id) REFERENCES public.track(id);


--
-- Name: rate_track fk8iaptjo71g5byljb8sbxmpc2u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate_track
    ADD CONSTRAINT fk8iaptjo71g5byljb8sbxmpc2u FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: review_track fk90c6xhdi608096c3s9bl5n2nm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_track
    ADD CONSTRAINT fk90c6xhdi608096c3s9bl5n2nm FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: follow_user fk9a4yysjjgsa386n4hd8rsqot5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.follow_user
    ADD CONSTRAINT fk9a4yysjjgsa386n4hd8rsqot5 FOREIGN KEY (user_follower) REFERENCES public.users(id);


--
-- Name: track fkaxm9pbgk7ptorfyk3o6911q05; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT fkaxm9pbgk7ptorfyk3o6911q05 FOREIGN KEY (album_id) REFERENCES public.album(id);


--
-- Name: rate_album fkb3v0eyn6y2rd48wvolw6wf076; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate_album
    ADD CONSTRAINT fkb3v0eyn6y2rd48wvolw6wf076 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: rate_album fkeun6hlmc9mo2sxtyhkubs4frg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate_album
    ADD CONSTRAINT fkeun6hlmc9mo2sxtyhkubs4frg FOREIGN KEY (album_id) REFERENCES public.album(id);


--
-- Name: rate_track fkh7sa4rtgcderxyd30hifsuwus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate_track
    ADD CONSTRAINT fkh7sa4rtgcderxyd30hifsuwus FOREIGN KEY (track_id) REFERENCES public.track(id);


--
-- Name: track fki28jadqiuqk1dlxtl0me7hqh2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.track
    ADD CONSTRAINT fki28jadqiuqk1dlxtl0me7hqh2 FOREIGN KEY (artist_id) REFERENCES public.artist(id);


--
-- Name: list_contain fkjh71hv7d47d6lryuaq49txofm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_contain
    ADD CONSTRAINT fkjh71hv7d47d6lryuaq49txofm FOREIGN KEY (track_id) REFERENCES public.track(id);


--
-- Name: review_album fkmkobajat53m5ald4oghng4o9m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_album
    ADD CONSTRAINT fkmkobajat53m5ald4oghng4o9m FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: album fkmwc4fyyxb6tfi0qba26gcf8s1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT fkmwc4fyyxb6tfi0qba26gcf8s1 FOREIGN KEY (artist_id) REFERENCES public.artist(id);


--
-- Name: list_contain fkqm880wgy2inggwqjtlpi13bh8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.list_contain
    ADD CONSTRAINT fkqm880wgy2inggwqjtlpi13bh8 FOREIGN KEY (list_id) REFERENCES public.list(id);


--
-- Name: review_album fkr1a032pnjvxnd9awj6eo0ws9j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review_album
    ADD CONSTRAINT fkr1a032pnjvxnd9awj6eo0ws9j FOREIGN KEY (album_id) REFERENCES public.album(id);


--
-- PostgreSQL database dump complete
--

