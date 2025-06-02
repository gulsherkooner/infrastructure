--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

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
-- Name: enum_post_media_media_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_post_media_media_type AS ENUM (
    'image',
    'video'
);


ALTER TYPE public.enum_post_media_media_type OWNER TO postgres;

--
-- Name: enum_posts_post_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_posts_post_type AS ENUM (
    'text',
    'image',
    'carousel',
    'video'
);


ALTER TYPE public.enum_posts_post_type OWNER TO postgres;

--
-- Name: enum_posts_visibility; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_posts_visibility AS ENUM (
    'public',
    'private',
    'followers'
);


ALTER TYPE public.enum_posts_visibility OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dating_post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dating_post (
    id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    type character varying(255) DEFAULT 'image/jpeg'::character varying,
    name character varying(255),
    ispinned boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.dating_post OWNER TO postgres;

--
-- Name: dating-post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."dating-post_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."dating-post_id_seq" OWNER TO postgres;

--
-- Name: dating-post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."dating-post_id_seq" OWNED BY public.dating_post.id;


--
-- Name: dating_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dating_profile (
    id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    "firstName" character varying(255),
    gender character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    "interestedIn" character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    "lookingFor" character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    age integer,
    height character varying(255),
    "drinkFreq" character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    "smokeFreq" character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    "workoutOptions" character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    locations character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    professions character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    languages character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    "describeSelf" character varying(255),
    "idealDate" character varying(255),
    "greatPartner" character varying(255),
    likes character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    profile_img_url character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    banner_img_url character varying(255)[] DEFAULT (ARRAY[]::character varying[])::character varying(255)[],
    phone character varying(255),
    website character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.dating_profile OWNER TO postgres;

--
-- Name: dating-profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."dating-profile_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."dating-profile_id_seq" OWNER TO postgres;

--
-- Name: dating-profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."dating-profile_id_seq" OWNED BY public.dating_profile.id;


--
-- Name: followers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.followers (
    follow_id uuid NOT NULL,
    user_id uuid NOT NULL,
    target_userid uuid NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE public.followers OWNER TO postgres;

--
-- Name: post_media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_media (
    id uuid NOT NULL,
    post_id uuid NOT NULL,
    media_type public.enum_post_media_media_type NOT NULL,
    url character varying(2048) NOT NULL,
    thumbnail_url character varying(2048),
    duration integer,
    width integer,
    height integer
);


ALTER TABLE public.post_media OWNER TO postgres;

--
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.posts (
    post_id uuid NOT NULL,
    user_id uuid NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    url json DEFAULT '[]'::json,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    post_type public.enum_posts_post_type NOT NULL,
    is_reel boolean DEFAULT false,
    category character varying(100),
    post_tags json DEFAULT '[]'::json,
    visibility public.enum_posts_visibility DEFAULT 'public'::public.enum_posts_visibility,
    likes_count integer DEFAULT 0,
    comments_count integer DEFAULT 0,
    views_count integer DEFAULT 0,
    is_active boolean DEFAULT true
);


ALTER TABLE public.posts OWNER TO postgres;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    accessibility jsonb DEFAULT '{"autoplay": "", "fontSize": "", "appearance": "", "colorContrast": ""}'::jsonb,
    content jsonb DEFAULT '{"likes": [], "dislikes": [], "localContent": "", "suggestionPreference": "", "sensitiveContentLevel": ""}'::jsonb,
    notifications jsonb DEFAULT '{"push": {"news": "", "likes": "", "offers": "", "comments": "", "messages": "", "trending": "", "datingMessages": ""}, "email": {"tips": "", "updates": "", "reminders": "", "connections": "", "suggestions": ""}}'::jsonb,
    privacy jsonb DEFAULT '{"location": {"allowAccess": "", "suggestions": "", "showInProfile": ""}, "messages": {"onlineStatus": "", "readReceipts": "", "whoCanMessage": ""}, "mutedUsers": [], "blockedUsers": []}'::jsonb,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.settings_id_seq OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: user_payment_method; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_payment_method (
    id integer NOT NULL,
    "userId" character varying(255) NOT NULL,
    name character varying(255),
    icon character varying(255),
    type character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.user_payment_method OWNER TO postgres;

--
-- Name: user-payment-method_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."user-payment-method_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."user-payment-method_id_seq" OWNER TO postgres;

--
-- Name: user-payment-method_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."user-payment-method_id_seq" OWNED BY public.user_payment_method.id;


--
-- Name: user_wallet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_wallet (
    id integer NOT NULL,
    "userId" character varying(255) NOT NULL,
    balance double precision DEFAULT '0'::double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.user_wallet OWNER TO postgres;

--
-- Name: user-wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."user-wallet_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."user-wallet_id_seq" OWNER TO postgres;

--
-- Name: user-wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."user-wallet_id_seq" OWNED BY public.user_wallet.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id uuid NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(50) NOT NULL,
    password_hash character varying(255) NOT NULL,
    name character varying(100),
    bio text,
    dob character varying(50),
    profile_img_url text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    followers integer DEFAULT 0,
    following integer DEFAULT 0,
    banner_img_url text,
    is_verified boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: wallet-transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."wallet-transaction" (
    id integer NOT NULL,
    "userWalletId" integer NOT NULL,
    title character varying(255) NOT NULL,
    amount double precision NOT NULL,
    date timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public."wallet-transaction" OWNER TO postgres;

--
-- Name: waller-transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."waller-transaction_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."waller-transaction_id_seq" OWNER TO postgres;

--
-- Name: waller-transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."waller-transaction_id_seq" OWNED BY public."wallet-transaction".id;


--
-- Name: dating_post id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dating_post ALTER COLUMN id SET DEFAULT nextval('public."dating-post_id_seq"'::regclass);


--
-- Name: dating_profile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dating_profile ALTER COLUMN id SET DEFAULT nextval('public."dating-profile_id_seq"'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: user_payment_method id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_payment_method ALTER COLUMN id SET DEFAULT nextval('public."user-payment-method_id_seq"'::regclass);


--
-- Name: user_wallet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_wallet ALTER COLUMN id SET DEFAULT nextval('public."user-wallet_id_seq"'::regclass);


--
-- Name: wallet-transaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."wallet-transaction" ALTER COLUMN id SET DEFAULT nextval('public."waller-transaction_id_seq"'::regclass);


--
-- Data for Name: dating_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dating_post (id, user_id, image, type, name, ispinned, "createdAt", "updatedAt") FROM stdin;
7654	c1813272-3d94-42c3-a283-df35ba4456f7	https://dl.dropboxusercontent.com/scl/fi/oxvasy21d7zef1u5cg5qe/dating-post-1747911252068.jpg?rlkey=phro9atld9ibm7gh61axuvr1m&dl=0	image/jpeg	dating-post-1747911252068.jpg	f	2025-05-22 16:24:17.159+05:30	2025-05-27 02:34:27.466+05:30
12345	c1813272-3d94-42c3-a283-df35ba4456f7	https://dl.dropboxusercontent.com/scl/fi/byraxb2bxmp8v8lwrc9y9/dating-post-1747910785735.jpg?rlkey=af63asbqeyf06jeaifcqvpcam&dl=0	image/jpeg	dating-post-1747910785735.jpg	t	2025-05-22 16:16:31.408+05:30	2025-05-27 02:24:33.437+05:30
\.


--
-- Data for Name: dating_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dating_profile (id, user_id, "firstName", gender, "interestedIn", "lookingFor", age, height, "drinkFreq", "smokeFreq", "workoutOptions", locations, professions, languages, "describeSelf", "idealDate", "greatPartner", likes, profile_img_url, banner_img_url, phone, website, "createdAt", "updatedAt") FROM stdin;
2762	c1813272-3d94-42c3-a283-df35ba4456f7	Kumar Sachin	{Male}	{Women}	{"Serious relationship"}	20		{Never}	{Never}	{"Not very active"}	{"New York"}	{"Software Engineer",Doctor}	{English,Spanish}	I am an engineer..	Beautiful candle night 	Loving and caring nature for future wifey	{Painting,Movies,Ambitious,"Dog lover",Tennis,Cricket,Tea,Sushi,Hiking,"Camping life"}	{https://dl.dropboxusercontent.com/scl/fi/f46gr83qcunj848swwqsd/1747911196031-dating-profile-c1813272-3d94-42c3-a283-df35ba4456f7-1747911196029.jpg?rlkey=9nn43cbffk3el23mz7pqtlb9p&raw=1}	{https://dl.dropboxusercontent.com/scl/fi/cvsfeo3p1wtrzvhhjtcso/1747932792337-dating-banner-c1813272-3d94-42c3-a283-df35ba4456f7-1747932792336.jpg?rlkey=y9q0l12cnqm1ctfgvhgz4qvxb&raw=1}	9752470033	https://sachin-eta.vercel.app	2025-05-17 18:14:50.15+05:30	2025-05-28 04:20:13.571+05:30
\.


--
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.followers (follow_id, user_id, target_userid, created_at) FROM stdin;
98f017fe-55a6-4dc0-8646-b8367781045b	01e6d90f-7a1a-490a-bb88-b56b60d4c694	c9a9302f-f54d-476c-826f-d975ecbb16f1	2025-05-21 17:01:44.379+05:30
\.


--
-- Data for Name: post_media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_media (id, post_id, media_type, url, thumbnail_url, duration, width, height) FROM stdin;
32eb5af8-0453-43c5-84f4-a838711365a3	42aa9df9-b122-4cd9-9f1a-ad2c3fa7f7c4	image	https://dl.dropboxusercontent.com/scl/fi/4qv627c5fvptroyr7bhjy/1748317230651-Color.png?rlkey=675fz70g868vfpsv33nqmk0oe	\N	\N	\N	\N
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.posts (post_id, user_id, title, description, url, created_at, updated_at, post_type, is_reel, category, post_tags, visibility, likes_count, comments_count, views_count, is_active) FROM stdin;
42aa9df9-b122-4cd9-9f1a-ad2c3fa7f7c4	3a01dbfc-95e1-4b65-be97-edb34aafd030	img	img	["https://dl.dropboxusercontent.com/scl/fi/4qv627c5fvptroyr7bhjy/1748317230651-Color.png?rlkey=675fz70g868vfpsv33nqmk0oe"]	2025-05-27 09:10:30.64+05:30	2025-05-27 09:10:30.64+05:30	image	f	\N	["img"]	public	0	0	0	t
f55e0c82-aa89-4f23-8bcb-5eb9dadf0937	c9a9302f-f54d-476c-826f-d975ecbb16f1	Nature calls for more 	Nature calls for more 	["https://dl.dropboxusercontent.com/scl/fi/f4qqkfu56d0fy8g8bo87b/1747579541512-IMG20250518171956.jpg?rlkey=zrrk0n9s4zxy4wdob4d2ds8li"]	2025-05-18 20:15:43.781+05:30	2025-05-18 20:15:43.781+05:30	image	f	\N	["Nature"]	public	0	0	0	t
7850bd1b-3900-484e-a1ec-771c10432d54	c9a9302f-f54d-476c-826f-d975ecbb16f1	Image	Image	["https://dl.dropboxusercontent.com/scl/fi/n6alx5qaec22dc5iuad8m/1747579673851-IMG20250515091650.jpg?rlkey=rcg8g1jlb35ngdq49s7mt6txc"]	2025-05-18 20:17:56.028+05:30	2025-05-18 20:17:56.028+05:30	image	f	\N	["Image"]	public	0	0	0	t
5788d705-19bf-4d19-a53c-c43d3b3048b8	c9a9302f-f54d-476c-826f-d975ecbb16f1	Journey to the new world 	Journey is key role for development, with out journey we can't experience new things in life which make a person to be in a single perspective view.	["https://dl.dropboxusercontent.com/scl/fi/1ywi0f9ffce729n1a03k6/1747580537744-1000032612.jpg?rlkey=2jyw4b4wezwq6ms9vlrvnhvyn"]	2025-05-18 20:32:19.646+05:30	2025-05-18 20:32:19.646+05:30	image	f	\N	["Nature","Journey"]	public	0	0	0	t
2212470a-2bd8-48d6-9a81-a4aab5dd2a9c	c9a9302f-f54d-476c-826f-d975ecbb16f1	AI frmale image	\N	["https://dl.dropboxusercontent.com/scl/fi/gmpepgrf1l2jdfuhhmalb/1747669090771-face1.jpg?rlkey=ydjm8cqu8q2d68gnkklwwiqdf"]	2025-05-19 21:08:12.965+05:30	2025-05-19 21:08:12.965+05:30	image	f	\N	["AI"]	public	0	0	0	t
af08163b-4112-4a95-8ee8-383bf32d6143	01e6d90f-7a1a-490a-bb88-b56b60d4c694	Portrait of a street	Portrait of a street	["https://dl.dropboxusercontent.com/scl/fi/ifjfwq47t35n0u4ja3foj/1747711301343-photo-1602492665157-639323eadd31.jpeg?rlkey=m664xwkfkdgmj00gkd59w9toe"]	2025-05-20 08:51:48.604+05:30	2025-05-20 08:51:48.604+05:30	image	f	\N	["Portrait"]	public	0	0	0	t
cce7df98-53b8-4153-b0ab-7b10395a7b2e	c1813272-3d94-42c3-a283-df35ba4456f7	HEllooo Everyone	\N	["https://dl.dropboxusercontent.com/scl/fi/xfsz2tgr4fd379gxm5dic/1747730626885-ChatGPT-Image-May-16-2025-10_47_27-PM.png?rlkey=d0npokexlwh11zgk8clmly5f9"]	2025-05-20 14:13:49.029+05:30	2025-05-20 14:13:49.029+05:30	image	f	\N	[]	public	0	0	0	t
5931a3ec-a165-4ed9-867f-0767b8052ca3	c1813272-3d94-42c3-a283-df35ba4456f7	HEllooo Everyone	\N	["https://dl.dropboxusercontent.com/scl/fi/s9cs6bqz4ysjfjok5odl5/tikmate.app_7488599562404236550_hd.mp4?rlkey=140osgeoqslqzhvvcz5c4x2f8&st=k44dp5ia"]	2025-05-20 14:13:55.376+05:30	2025-05-20 14:13:55.376+05:30	video	f	\N	[]	public	0	0	0	t
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, user_id, accessibility, content, notifications, privacy, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: user_payment_method; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_payment_method (id, "userId", name, icon, type, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: user_wallet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_wallet (id, "userId", balance, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, email, username, password_hash, name, bio, dob, profile_img_url, created_at, updated_at, followers, following, banner_img_url, is_verified) FROM stdin;
3a01dbfc-95e1-4b65-be97-edb34aafd030	kiranraj0070@gmail.com	Kiranraj0070	$2b$10$YaLk5TblS2n5Lqac7uLHA.Nk0PtO9r9DTlQBRwa5vB.4Y0n8BJzNW	kiranraj0070		01-01-2000	https://dl.dropboxusercontent.com/scl/fi/dn9edgpae6xxpum4wv5l4/1748249843786-IMG20250515091650.jpg?rlkey=kmy6pzf5rtked9g4tjo2bwi6g&raw=1	2025-05-26 14:12:52.772+05:30	2025-05-26 14:27:23.299+05:30	0	0	https://dl.dropboxusercontent.com/scl/fi/gdz9fxnm0nzc7g4unl6ao/1748249714843-Purple-Modern-Geometric-Graphic-Designer-LinkedIn-Banner.png?rlkey=ysh6u43uh231iqxld82emlhnc&raw=1	f
c1813272-3d94-42c3-a283-df35ba4456f7	sachinkc4456@gmail.com	cyros	$2b$10$ewU2OkKjfqfGyTntqvI2/eY5R0K2wPPebQRbdflorUeLQAZTQZ31K	Kumar Sachin	Hi I am Kumar Sachin	20-11-2006	https://dl.dropboxusercontent.com/scl/fi/ifgfs8lbbdlru38o11l2n/1747730580394-ladoo.png?rlkey=4kwor4risidq4fa3bjtp80t3t&raw=1	2025-05-17 18:05:08.336+05:30	2025-05-20 14:13:00.091+05:30	0	0	\N	f
c9a9302f-f54d-476c-826f-d975ecbb16f1	kiranraj80555@gmail.com	Kiranraj20	$2b$10$yLCl96KHD5UWP/g16uboiOFJVLIc8x1GKRgzUKTWww6Wks41q7g7a	kiranraj suram	\N	11-06-2000	https://dl.dropboxusercontent.com/scl/fi/wtexqjy6mzyb9jtd9f6sw/1747490724449-Untitled-10000.png?rlkey=kv42oc75hx78sqrpcd7hqp62h&raw=1	2025-05-17 19:31:02.48+05:30	2025-05-21 17:01:45.945+05:30	1	0	https://dl.dropboxusercontent.com/scl/fi/4msa12jx6md3d351f15xu/1747579904557-Purple-Modern-Geometric-Graphic-Designer-LinkedIn-Banner.png?rlkey=csfnnkc6jaflocjyk1csaoh8w&raw=1	f
01e6d90f-7a1a-490a-bb88-b56b60d4c694	kiranrajmiami@gmail.com	miami143L	$2b$10$/51CKe.vtXMzX0lsih4SFeao7eybJ06jQUhUnv.mbiPNg2GS5HFNe	suram kiranraj	\N	11-06-2001	https://dl.dropboxusercontent.com/scl/fi/1zehge5j0o6mvoq1vx7tr/1747490661245-game-pic.jpg?rlkey=1nxk6jiyf48zulrtl89ggpyg0&raw=1	2025-05-17 19:33:22.227+05:30	2025-05-21 17:01:44.913+05:30	0	1	\N	f
0fb258de-7691-405b-bcc2-70461a75596f	kooolerest@gmail.com	gulsher	$2b$10$jamG.bT.wdNmSzef3VTyfe0XpzFCGfsa4zhf88n9XEbeuHpjl.OZK	gulsher singh	\N	02-04-1984	https://dl.dropboxusercontent.com/scl/fi/u0654p30gk1uzcoi4qpou/1747755510490-delsc.png?rlkey=56uduvwbuwvegaegirp8evgd6&raw=1	2025-05-20 21:07:33.965+05:30	2025-05-20 21:08:30.133+05:30	0	0	\N	f
ba1d8d72-40b9-42df-aef9-0c0869037c90	cyros.sachin@gmail.com	sachin_dev	$2b$10$4sKA4Z3hNb5g6fho7QT/seengoyBqXHkPbTcdqsMHDBizBg.3KEu.	Sachin	\N	20-11-1984	\N	2025-05-21 15:02:18.909+05:30	2025-05-21 15:02:18.909+05:30	0	0	\N	f
1013bfd1-9ad7-417f-87a9-71145e92c76c	jodha6671@gmail.com	cyros_sachin	$2b$10$9IBmdB3FORzQ39Ei82Fwhe1mEn8s.ITyXxlY9w0OR9LbL4Y22xmLe	Kumar Sachin	\N	20-11-2005	\N	2025-05-25 20:06:28.202+05:30	2025-05-25 20:06:28.202+05:30	0	0	\N	f
\.


--
-- Data for Name: wallet-transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."wallet-transaction" (id, "userWalletId", title, amount, date, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: dating-post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."dating-post_id_seq"', 1, false);


--
-- Name: dating-profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."dating-profile_id_seq"', 1, false);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, false);


--
-- Name: user-payment-method_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."user-payment-method_id_seq"', 1, false);


--
-- Name: user-wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."user-wallet_id_seq"', 1, false);


--
-- Name: waller-transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."waller-transaction_id_seq"', 1, false);


--
-- Name: dating_post dating-post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dating_post
    ADD CONSTRAINT "dating-post_pkey" PRIMARY KEY (id);


--
-- Name: dating_profile dating-profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dating_profile
    ADD CONSTRAINT "dating-profile_pkey" PRIMARY KEY (id);


--
-- Name: dating_profile dating-profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dating_profile
    ADD CONSTRAINT "dating-profile_user_id_key" UNIQUE (user_id);


--
-- Name: followers followers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (follow_id);


--
-- Name: post_media post_media_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_media
    ADD CONSTRAINT post_media_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (post_id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: settings settings_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_user_id_key UNIQUE (user_id);


--
-- Name: user_payment_method user-payment-method_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_payment_method
    ADD CONSTRAINT "user-payment-method_pkey" PRIMARY KEY (id);


--
-- Name: user_wallet user-wallet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_wallet
    ADD CONSTRAINT "user-wallet_pkey" PRIMARY KEY (id);


--
-- Name: user_wallet user-wallet_userId_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_wallet
    ADD CONSTRAINT "user-wallet_userId_key" UNIQUE ("userId");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: wallet-transaction waller-transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."wallet-transaction"
    ADD CONSTRAINT "waller-transaction_pkey" PRIMARY KEY (id);


--
-- Name: followers_target_userid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX followers_target_userid ON public.followers USING btree (target_userid);


--
-- Name: followers_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX followers_user_id ON public.followers USING btree (user_id);


--
-- Name: followers followers_target_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_target_userid_fkey FOREIGN KEY (target_userid) REFERENCES public.users(user_id);


--
-- Name: followers followers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: post_media post_media_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_media
    ADD CONSTRAINT post_media_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(post_id);


--
-- Name: wallet-transaction waller-transaction_userWalletId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."wallet-transaction"
    ADD CONSTRAINT "waller-transaction_userWalletId_fkey" FOREIGN KEY ("userWalletId") REFERENCES public.user_wallet(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

