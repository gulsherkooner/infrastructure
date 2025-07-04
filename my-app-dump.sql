PGDMP      ,                }            my-app    17.5    17.5 j    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16390    my-app    DATABASE     {   CREATE DATABASE "my-app" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "my-app";
                     postgres    false            �           1247    24809    enum_post_media_media_type    TYPE     T   CREATE TYPE public.enum_post_media_media_type AS ENUM (
    'image',
    'video'
);
 -   DROP TYPE public.enum_post_media_media_type;
       public               postgres    false            �           1247    24883    enum_posts_post_type    TYPE     j   CREATE TYPE public.enum_posts_post_type AS ENUM (
    'text',
    'image',
    'carousel',
    'video'
);
 '   DROP TYPE public.enum_posts_post_type;
       public               postgres    false            �           1247    24892    enum_posts_visibility    TYPE     c   CREATE TYPE public.enum_posts_visibility AS ENUM (
    'public',
    'private',
    'followers'
);
 (   DROP TYPE public.enum_posts_visibility;
       public               postgres    false                       1259    32992    comment_likes    TABLE     �   CREATE TABLE public.comment_likes (
    id uuid NOT NULL,
    comment_id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
 !   DROP TABLE public.comment_likes;
       public         heap r       postgres    false                       1259    32968    comments    TABLE     V  CREATE TABLE public.comments (
    comment_id uuid NOT NULL,
    post_id uuid NOT NULL,
    user_id uuid NOT NULL,
    parent_comment_id uuid,
    text text NOT NULL,
    is_deleted boolean DEFAULT false,
    likes_count integer DEFAULT 0,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.comments;
       public         heap r       postgres    false            �            1259    16654    dating_post    TABLE     �  CREATE TABLE public.dating_post (
    id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    type character varying(255) DEFAULT 'image/jpeg'::character varying,
    name character varying(255),
    ispinned boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.dating_post;
       public         heap r       postgres    false            �            1259    16653    dating-post_id_seq    SEQUENCE     �   CREATE SEQUENCE public."dating-post_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."dating-post_id_seq";
       public               postgres    false    252            �           0    0    dating-post_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public."dating-post_id_seq" OWNED BY public.dating_post.id;
          public               postgres    false    251            �            1259    16585    dating_profile    TABLE     �  CREATE TABLE public.dating_profile (
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
 "   DROP TABLE public.dating_profile;
       public         heap r       postgres    false            �            1259    16584    dating-profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public."dating-profile_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."dating-profile_id_seq";
       public               postgres    false    250            �           0    0    dating-profile_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."dating-profile_id_seq" OWNED BY public.dating_profile.id;
          public               postgres    false    249            �            1259    16487 	   followers    TABLE     �   CREATE TABLE public.followers (
    follow_id uuid NOT NULL,
    user_id uuid NOT NULL,
    target_userid uuid NOT NULL,
    created_at timestamp with time zone
);
    DROP TABLE public.followers;
       public         heap r       postgres    false            
           1259    49403    memberships    TABLE     �  CREATE TABLE public.memberships (
    membership_id uuid NOT NULL,
    user_id uuid NOT NULL,
    "MonthlyPrice" double precision NOT NULL,
    country character varying(10) NOT NULL,
    "introVideo" json,
    "payPerViewPrice" double precision NOT NULL,
    perks json DEFAULT '{}'::json,
    is_active boolean DEFAULT true,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.memberships;
       public         heap r       postgres    false            	           1259    41200 
   post_likes    TABLE     �   CREATE TABLE public.post_likes (
    id uuid NOT NULL,
    post_id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone
);
    DROP TABLE public.post_likes;
       public         heap r       postgres    false                       1259    24813 
   post_media    TABLE     !  CREATE TABLE public.post_media (
    id uuid NOT NULL,
    post_id uuid NOT NULL,
    media_type public.enum_post_media_media_type NOT NULL,
    url character varying(2048) NOT NULL,
    thumbnail_url character varying(2048),
    duration integer,
    width integer,
    height integer
);
    DROP TABLE public.post_media;
       public         heap r       postgres    false    921                       1259    57604 
   post_views    TABLE     �   CREATE TABLE public.post_views (
    view_id uuid NOT NULL,
    user_id uuid NOT NULL,
    post_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
    DROP TABLE public.post_views;
       public         heap r       postgres    false            �           0    0    COLUMN post_views.user_id    COMMENT     O   COMMENT ON COLUMN public.post_views.user_id IS 'The user who viewed the post';
          public               postgres    false    268            �           0    0    COLUMN post_views.post_id    COMMENT     K   COMMENT ON COLUMN public.post_views.post_id IS 'The post that was viewed';
          public               postgres    false    268                       1259    24899    posts    TABLE     �  CREATE TABLE public.posts (
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
    DROP TABLE public.posts;
       public         heap r       postgres    false    930    930    927                       1259    16697    settings    TABLE     �  CREATE TABLE public.settings (
    id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    accessibility jsonb DEFAULT '{"autoplay": "", "fontSize": "", "appearance": "", "colorContrast": ""}'::jsonb,
    content jsonb DEFAULT '{"likes": [], "dislikes": [], "localContent": "", "suggestionPreference": "", "sensitiveContentLevel": ""}'::jsonb,
    notifications jsonb DEFAULT '{"push": {"news": "", "likes": "", "offers": "", "comments": "", "messages": "", "trending": "", "datingMessages": ""}, "email": {"tips": "", "updates": "", "reminders": "", "connections": "", "suggestions": ""}}'::jsonb,
    privacy jsonb DEFAULT '{"location": {"allowAccess": "", "suggestions": "", "showInProfile": ""}, "messages": {"onlineStatus": "", "readReceipts": "", "whoCanMessage": ""}, "mutedUsers": [], "blockedUsers": []}'::jsonb,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.settings;
       public         heap r       postgres    false                       1259    16696    settings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.settings_id_seq;
       public               postgres    false    260            �           0    0    settings_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;
          public               postgres    false    259                       1259    57595    stories    TABLE     9  CREATE TABLE public.stories (
    story_id uuid NOT NULL,
    user_id uuid NOT NULL,
    video_url character varying(255) NOT NULL,
    viewed_by uuid[] DEFAULT ARRAY[]::uuid[] NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.stories;
       public         heap r       postgres    false                       1259    16688    user_payment_method    TABLE     <  CREATE TABLE public.user_payment_method (
    id integer NOT NULL,
    "userId" character varying(255) NOT NULL,
    name character varying(255),
    icon character varying(255),
    type character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 '   DROP TABLE public.user_payment_method;
       public         heap r       postgres    false                       1259    16687    user_payment_method_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_payment_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.user_payment_method_id_seq;
       public               postgres    false    258            �           0    0    user_payment_method_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.user_payment_method_id_seq OWNED BY public.user_payment_method.id;
          public               postgres    false    257            �            1259    16666    user_wallet    TABLE       CREATE TABLE public.user_wallet (
    id integer NOT NULL,
    "userId" character varying(255) NOT NULL,
    balance double precision DEFAULT '0'::double precision,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.user_wallet;
       public         heap r       postgres    false            �            1259    16665    user_wallet_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_wallet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_wallet_id_seq;
       public               postgres    false    254            �           0    0    user_wallet_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_wallet_id_seq OWNED BY public.user_wallet.id;
          public               postgres    false    253            �            1259    16391    users    TABLE        CREATE TABLE public.users (
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
    DROP TABLE public.users;
       public         heap r       postgres    false                        1259    16676    wallet_transaction    TABLE     C  CREATE TABLE public.wallet_transaction (
    id integer NOT NULL,
    "userWalletId" integer NOT NULL,
    title character varying(255) NOT NULL,
    amount double precision NOT NULL,
    date timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 &   DROP TABLE public.wallet_transaction;
       public         heap r       postgres    false            �            1259    16675    wallet_transaction_id_seq    SEQUENCE     �   CREATE SEQUENCE public.wallet_transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.wallet_transaction_id_seq;
       public               postgres    false    256            �           0    0    wallet_transaction_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.wallet_transaction_id_seq OWNED BY public.wallet_transaction.id;
          public               postgres    false    255            �           2604    24937    dating_post id    DEFAULT     r   ALTER TABLE ONLY public.dating_post ALTER COLUMN id SET DEFAULT nextval('public."dating-post_id_seq"'::regclass);
 =   ALTER TABLE public.dating_post ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    252    251    252            �           2604    24938    dating_profile id    DEFAULT     x   ALTER TABLE ONLY public.dating_profile ALTER COLUMN id SET DEFAULT nextval('public."dating-profile_id_seq"'::regclass);
 @   ALTER TABLE public.dating_profile ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    249    250    250            �           2604    24939    settings id    DEFAULT     j   ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);
 :   ALTER TABLE public.settings ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    259    260    260            �           2604    24940    user_payment_method id    DEFAULT     �   ALTER TABLE ONLY public.user_payment_method ALTER COLUMN id SET DEFAULT nextval('public.user_payment_method_id_seq'::regclass);
 E   ALTER TABLE public.user_payment_method ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    258    257    258            �           2604    24941    user_wallet id    DEFAULT     p   ALTER TABLE ONLY public.user_wallet ALTER COLUMN id SET DEFAULT nextval('public.user_wallet_id_seq'::regclass);
 =   ALTER TABLE public.user_wallet ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    253    254    254            �           2604    24942    wallet_transaction id    DEFAULT     ~   ALTER TABLE ONLY public.wallet_transaction ALTER COLUMN id SET DEFAULT nextval('public.wallet_transaction_id_seq'::regclass);
 D   ALTER TABLE public.wallet_transaction ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    255    256    256            �          0    32992    comment_likes 
   TABLE DATA           X   COPY public.comment_likes (id, comment_id, user_id, created_at, updated_at) FROM stdin;
    public               postgres    false    264   0�       �          0    32968    comments 
   TABLE DATA           �   COPY public.comments (comment_id, post_id, user_id, parent_comment_id, text, is_deleted, likes_count, created_at, updated_at) FROM stdin;
    public               postgres    false    263   t�       �          0    16654    dating_post 
   TABLE DATA           i   COPY public.dating_post (id, user_id, image, type, name, ispinned, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    252   5�       �          0    16585    dating_profile 
   TABLE DATA           C  COPY public.dating_profile (id, user_id, "firstName", gender, "interestedIn", "lookingFor", age, height, "drinkFreq", "smokeFreq", "workoutOptions", locations, professions, languages, "describeSelf", "idealDate", "greatPartner", likes, profile_img_url, banner_img_url, phone, website, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    250   d�       �          0    16487 	   followers 
   TABLE DATA           R   COPY public.followers (follow_id, user_id, target_userid, created_at) FROM stdin;
    public               postgres    false    248   ~�       �          0    49403    memberships 
   TABLE DATA           �   COPY public.memberships (membership_id, user_id, "MonthlyPrice", country, "introVideo", "payPerViewPrice", perks, is_active, created_at, updated_at) FROM stdin;
    public               postgres    false    266   :�       �          0    41200 
   post_likes 
   TABLE DATA           F   COPY public.post_likes (id, post_id, user_id, created_at) FROM stdin;
    public               postgres    false    265   �       �          0    24813 
   post_media 
   TABLE DATA           j   COPY public.post_media (id, post_id, media_type, url, thumbnail_url, duration, width, height) FROM stdin;
    public               postgres    false    261   ܟ       �          0    57604 
   post_views 
   TABLE DATA           W   COPY public.post_views (view_id, user_id, post_id, created_at, updated_at) FROM stdin;
    public               postgres    false    268   ԡ       �          0    24899    posts 
   TABLE DATA           �   COPY public.posts (post_id, user_id, title, description, url, created_at, updated_at, post_type, is_reel, category, post_tags, visibility, likes_count, comments_count, views_count, is_active) FROM stdin;
    public               postgres    false    262   ��       �          0    16697    settings 
   TABLE DATA           y   COPY public.settings (id, user_id, accessibility, content, notifications, privacy, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    260   �       �          0    57595    stories 
   TABLE DATA           j   COPY public.stories (story_id, user_id, video_url, viewed_by, active, created_at, updated_at) FROM stdin;
    public               postgres    false    267   �       �          0    16688    user_payment_method 
   TABLE DATA           g   COPY public.user_payment_method (id, "userId", name, icon, type, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    258   ��       �          0    16666    user_wallet 
   TABLE DATA           V   COPY public.user_wallet (id, "userId", balance, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    254   
�       �          0    16391    users 
   TABLE DATA           �   COPY public.users (user_id, email, username, password_hash, name, bio, dob, profile_img_url, created_at, updated_at, followers, following, banner_img_url, is_verified) FROM stdin;
    public               postgres    false    247   '�       �          0    16676    wallet_transaction 
   TABLE DATA           o   COPY public.wallet_transaction (id, "userWalletId", title, amount, date, "createdAt", "updatedAt") FROM stdin;
    public               postgres    false    256   ��       �           0    0    dating-post_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."dating-post_id_seq"', 1, false);
          public               postgres    false    251            �           0    0    dating-profile_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."dating-profile_id_seq"', 1, false);
          public               postgres    false    249            �           0    0    settings_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.settings_id_seq', 1, false);
          public               postgres    false    259            �           0    0    user_payment_method_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.user_payment_method_id_seq', 1, false);
          public               postgres    false    257            �           0    0    user_wallet_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_wallet_id_seq', 1, false);
          public               postgres    false    253            �           0    0    wallet_transaction_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.wallet_transaction_id_seq', 1, false);
          public               postgres    false    255            �           2606    32996     comment_likes comment_likes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.comment_likes DROP CONSTRAINT comment_likes_pkey;
       public                 postgres    false    264            �           2606    32976    comments comments_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (comment_id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public                 postgres    false    263            �           2606    16663    dating_post dating-post_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.dating_post
    ADD CONSTRAINT "dating-post_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.dating_post DROP CONSTRAINT "dating-post_pkey";
       public                 postgres    false    252            �           2606    16604 "   dating_profile dating-profile_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.dating_profile
    ADD CONSTRAINT "dating-profile_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.dating_profile DROP CONSTRAINT "dating-profile_pkey";
       public                 postgres    false    250            �           2606    16606 )   dating_profile dating-profile_user_id_key 
   CONSTRAINT     i   ALTER TABLE ONLY public.dating_profile
    ADD CONSTRAINT "dating-profile_user_id_key" UNIQUE (user_id);
 U   ALTER TABLE ONLY public.dating_profile DROP CONSTRAINT "dating-profile_user_id_key";
       public                 postgres    false    250            �           2606    16491    followers followers_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pkey PRIMARY KEY (follow_id);
 B   ALTER TABLE ONLY public.followers DROP CONSTRAINT followers_pkey;
       public                 postgres    false    248            �           2606    49411    memberships memberships_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (membership_id);
 F   ALTER TABLE ONLY public.memberships DROP CONSTRAINT memberships_pkey;
       public                 postgres    false    266            �           2606    41204    post_likes post_likes_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT post_likes_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.post_likes DROP CONSTRAINT post_likes_pkey;
       public                 postgres    false    265            �           2606    24819    post_media post_media_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.post_media
    ADD CONSTRAINT post_media_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.post_media DROP CONSTRAINT post_media_pkey;
       public                 postgres    false    261            �           2606    57608    post_views post_views_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.post_views
    ADD CONSTRAINT post_views_pkey PRIMARY KEY (view_id);
 D   ALTER TABLE ONLY public.post_views DROP CONSTRAINT post_views_pkey;
       public                 postgres    false    268            �           2606    24913    posts posts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (post_id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public                 postgres    false    262            �           2606    16708    settings settings_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_pkey;
       public                 postgres    false    260            �           2606    16710    settings settings_user_id_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_user_id_key UNIQUE (user_id);
 G   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_user_id_key;
       public                 postgres    false    260            �           2606    57603    stories stories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.stories
    ADD CONSTRAINT stories_pkey PRIMARY KEY (story_id);
 >   ALTER TABLE ONLY public.stories DROP CONSTRAINT stories_pkey;
       public                 postgres    false    267            �           2606    16695 ,   user_payment_method user_payment_method_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.user_payment_method
    ADD CONSTRAINT user_payment_method_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.user_payment_method DROP CONSTRAINT user_payment_method_pkey;
       public                 postgres    false    258            �           2606    16672    user_wallet user_wallet_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_wallet
    ADD CONSTRAINT user_wallet_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_wallet DROP CONSTRAINT user_wallet_pkey;
       public                 postgres    false    254            �           2606    16674 "   user_wallet user_wallet_userId_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.user_wallet
    ADD CONSTRAINT "user_wallet_userId_key" UNIQUE ("userId");
 N   ALTER TABLE ONLY public.user_wallet DROP CONSTRAINT "user_wallet_userId_key";
       public                 postgres    false    254            �           2606    16402    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public                 postgres    false    247            �           2606    16400    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    247            �           2606    16404    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public                 postgres    false    247            �           2606    16681 *   wallet_transaction wallet_transaction_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.wallet_transaction
    ADD CONSTRAINT wallet_transaction_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.wallet_transaction DROP CONSTRAINT wallet_transaction_pkey;
       public                 postgres    false    256            �           1259    33007     comment_likes_comment_id_user_id    INDEX     p   CREATE UNIQUE INDEX comment_likes_comment_id_user_id ON public.comment_likes USING btree (comment_id, user_id);
 4   DROP INDEX public.comment_likes_comment_id_user_id;
       public                 postgres    false    264    264            �           1259    16503    followers_target_userid    INDEX     V   CREATE INDEX followers_target_userid ON public.followers USING btree (target_userid);
 +   DROP INDEX public.followers_target_userid;
       public                 postgres    false    248            �           1259    16502    followers_user_id    INDEX     J   CREATE INDEX followers_user_id ON public.followers USING btree (user_id);
 %   DROP INDEX public.followers_user_id;
       public                 postgres    false    248            �           1259    49417    memberships_user_id    INDEX     N   CREATE INDEX memberships_user_id ON public.memberships USING btree (user_id);
 '   DROP INDEX public.memberships_user_id;
       public                 postgres    false    266            �           1259    41210    post_likes_post_id_user_id    INDEX     d   CREATE UNIQUE INDEX post_likes_post_id_user_id ON public.post_likes USING btree (post_id, user_id);
 .   DROP INDEX public.post_likes_post_id_user_id;
       public                 postgres    false    265    265            �           1259    57612    post_views_created_at_idx    INDEX     V   CREATE INDEX post_views_created_at_idx ON public.post_views USING btree (created_at);
 -   DROP INDEX public.post_views_created_at_idx;
       public                 postgres    false    268            �           1259    57610    post_views_post_id_idx    INDEX     P   CREATE INDEX post_views_post_id_idx ON public.post_views USING btree (post_id);
 *   DROP INDEX public.post_views_post_id_idx;
       public                 postgres    false    268            �           1259    57611    post_views_user_id_idx    INDEX     P   CREATE INDEX post_views_user_id_idx ON public.post_views USING btree (user_id);
 *   DROP INDEX public.post_views_user_id_idx;
       public                 postgres    false    268            �           1259    57609    unique_user_post_view    INDEX     _   CREATE UNIQUE INDEX unique_user_post_view ON public.post_views USING btree (user_id, post_id);
 )   DROP INDEX public.unique_user_post_view;
       public                 postgres    false    268    268            �           2606    32997 +   comment_likes comment_likes_comment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.comments(comment_id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.comment_likes DROP CONSTRAINT comment_likes_comment_id_fkey;
       public               postgres    false    264    263    4820            �           2606    33002 (   comment_likes comment_likes_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_likes
    ADD CONSTRAINT comment_likes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.comment_likes DROP CONSTRAINT comment_likes_user_id_fkey;
       public               postgres    false    4790    247    264            �           2606    32987 (   comments comments_parent_comment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_parent_comment_id_fkey FOREIGN KEY (parent_comment_id) REFERENCES public.comments(comment_id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_parent_comment_id_fkey;
       public               postgres    false    263    4820    263            �           2606    32977    comments comments_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(post_id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_post_id_fkey;
       public               postgres    false    263    4818    262            �           2606    32982    comments comments_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public               postgres    false    263    4790    247            �           2606    16497 &   followers followers_target_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_target_userid_fkey FOREIGN KEY (target_userid) REFERENCES public.users(user_id);
 P   ALTER TABLE ONLY public.followers DROP CONSTRAINT followers_target_userid_fkey;
       public               postgres    false    247    248    4790            �           2606    16492     followers followers_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 J   ALTER TABLE ONLY public.followers DROP CONSTRAINT followers_user_id_fkey;
       public               postgres    false    247    248    4790            �           2606    49412 $   memberships memberships_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 N   ALTER TABLE ONLY public.memberships DROP CONSTRAINT memberships_user_id_fkey;
       public               postgres    false    4790    247    266            �           2606    41205 "   post_likes post_likes_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT post_likes_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(post_id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.post_likes DROP CONSTRAINT post_likes_post_id_fkey;
       public               postgres    false    262    265    4818            �           2606    24943 "   post_media post_media_post_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.post_media
    ADD CONSTRAINT post_media_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(post_id);
 L   ALTER TABLE ONLY public.post_media DROP CONSTRAINT post_media_post_id_fkey;
       public               postgres    false    262    261    4818            �           2606    16682 7   wallet_transaction wallet_transaction_userWalletId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wallet_transaction
    ADD CONSTRAINT "wallet_transaction_userWalletId_fkey" FOREIGN KEY ("userWalletId") REFERENCES public.user_wallet(id) ON UPDATE CASCADE ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.wallet_transaction DROP CONSTRAINT "wallet_transaction_userWalletId_fkey";
       public               postgres    false    256    4804    254            �   4  x���;n$1и��(~�>�&�(������ =Y�7	�0qSȬ�B׶N�
u��2v���=pj��v���6l��~iB'�P�u��f�]����8���e��a�ox��� � 1����ݏqκ*��N0Q��w"z�йi.ۿ��<�_��?һ���:�l�����AǬY�.����39h�)>J�
d������`\g��<Z��l��jiX2m�_�G��i�r�Է齉u�2�XcmP�0�����c���Qy��"��sZ_[R��_R���?��M�?���� Z>��      �   �  x�ŕK�G�׭Sh�Q�"Y�>�O�����hٷ�Q�X��P��&��|�5",Q`4�@���2%��E\(�i�
�'����ǖ��-MMS�&S����;�k��jE����qT��g���Bh�%2aY^>}>����χ��������\�Cd�g���XVE�-�~����������Ps0'�f
=�| g�G�B�I��M(%�ېy�<���K�*[�k���clW���A�$��&�,�Ō$m�!?~X���З�w���Fq�w��}�-ᆴ&Jg�)����� J8@�j)K���X����xM�Vע�t���Y�I���<��h���0����������?>�3\oP_a�9�uT�k�swj�����"y��<A{�N:���Q��?�x=�O�p������C����\���4�����q�-�i�U�*
��*�q��h����n�Ŀ}�V��
L[,k9��)�,��|�b�P�@H�,�QDm,�y�V"��1yR���j�>��|7K?����7>�.�l��N�N����/�)f�z�b�~�6 ���`�`�a��;����תK�R!��JSKbwK����֏�ޔ�������N
g�ưf.g����m������4�j�"c�1�2jx�����~��Њ��J��Bs�"xF���v�� �8.      �     x��нj�0��پ�L]�d�ӟm��.�u�ر"+�ݫo���J���^8ã����5e� 1�p��2��f�&��\Ƞ�C�qn��إ)�i��>���9c;��l�*�մ.zހ:���
ۉ������Cq�3����R@d���{I��o�xHS����ތ�;H������=)�Qw�:F���� � vT��[�0�3-#�U�����0���lb��Wfc���[���<0!���;$ӳ��-y����D��br�V�&�1�9����Ü�/�W\���C��      �   
  x���_o�0��ɧ�x�ˀ`D�����ik5)��I{1� 7�&�@�(�}&m�>�O���w�#نx瘒���*�0!����4�j��,I�M�y_ǎ�c��;�0	g��Sw���w`�d@2+�Z��g�Ğw��	����o�EN="ƭ����`F���_������O�
���Gͭ^��K��v=SN��/�u�)O�Q�} 6ZQ�q�*	H������'��\��YT�����ڠz�����蝾3���n\���vY1�?�I=-T?@9�����L�F�{�Y�b��u�2G���j����]�+UF���0\+�F\w��u-�u�iLN|Twy��|�5Β�����ba�]	���1|с�]߼3rǫB����$��C��,���a�~:��4��l��Զw��������dJ�y�S���cq�%&\:�m�Lm�����R�dqL����py�,��9Ȉ���V��q�&!�oq�M��o�tK�A��8ْx�i�f�1���V�?�p�      �   �   x����m1 ��n�\�Z�%��. S��VHQ̦���\��G4B�����1i�v����y:n]��Z}vA.(�����vV&y���h��C1���#�_hC��}a����<ɼ����E�����F�� �+(/��M`�XNU�o��2<��#�������v'D      �   �  x��TM��6>{~��=t5cɲlJI�P
II;�Sa��1VƖ��<;β����R2-�1�����|ȏ��e�RW�h�a#quוG7Hf�qV�6�+"!����JVWJt�el�X��o�C>*i�m\&����H��K��q-��DZ�5a�m����M���D>��~H�}�Shw;9l�wS��sP^8��[��]�N��o���9���G�Gf�CuU�7���a����Z���\��������`�������R��x!�
D޸C�>�W�d�F?��\� ���q6��Ŝs��:��W\����Y`�=�h���+`�Ls7��o�g1�a�v�7 ��>:o�u��.�����w�J�IF�?�����ܞ��xs�Q�߿y�Ijs啊`q��Ti8�Ep7��� �W"��w�O��1�{R���g?��X	c��^(��h��b�����ɻ��n��\��N 29���hF�{ob�|`L�	��hn���{7G������?2�%����*�M��b��NS��+Jh�Y�p�+XP�@EKH��m��wEՖŗw7�DUM��)jHC�� ��#BiN*�HQ�
k�:	+8�&�*��BA�ȿ���{�8koS�0iHSV�ԈԘ��m[L���8g�4�;����f}^þD�lhe�Uv�h���|w��Xû5��k�?F�|_��E7��t�5m��K�I�g��?����/#�T      �   �   x����q�0c���{�!��jqB�d�%�\�g.��[�R�j@Jd�C��En�|-�K�q�*h
�f@7������j�U1�m�*�t���6�p]����F
� ��=!yD����6ɖ[
���0��2�$����5�i�#����KO�@�D.��?��K�2?���|?�}� F�F	      �   �  x���=o�@�Y�/��w�� E��]�f�}ɲ%�,+��__��Sp���}�d��AZ���Q!`��ETF�jH2�T<�(&� 'Ua[l�����yY�����c������X�%��1��t���t'��Fڨ�:-s}�m8_^Oh�)�R	��վ��il���5�~1V�7+Zg�Z����x�������9`��N$�D�s�,���F�M���"�}Ix�F���	"�u�v)��'������<��6�8���� g�W��c�)�yg�pdQ���}~	7�G��^Ê��Iv����/%��XDi?]��ڀ7��){M.�X�5d)�^�BpQ&�N��Ѥ���Ur�����뮗���o�ք{g6���D�0sO�c���[+d�/��s� �BY� Do��b�	��)���<5��EJ;�G����?�����2�YѰ8MQ^�*�^�U�m�w�A����°Z����6���֧U<6����x8~c
�      �   �  x���M�\1���N�}��ϒ����&�$==R��T��k��A|vЈ����n3VF����m<�A:0`��a6��Kӆ~9��Fz���'� �$�⃑���������"?�=�Q��zi��8x����VM]���7Qv2��D\K�}��e�e��?�?��h/H�ŋ��41���	ahXa3?1��{���Ed ��zL�Np�$�Bm���X��xI��^��=� �-P�#�ػ<��;b���P���K��H}��Q����#�a�������O�~"{-Oxj���'�{�,���چPHu
�Z�n~ �*�8����H��K���k���׿���Ι0����!�&��M��82���ʧó�e�v\9�}e!���%�W�Rb�6��f�k�B8��t�a��D=i.��f�*����;��6�l}���_���z�����^�,      �   ;  x���[��Vǟ�Oa�������~A�VQeg��Fڼ%��\����П~�@C+�/�ɔ�����_U'	��Y��2��wHDg�	��X�0M(	W�#MeB�(�sD&��Ŏ�>f�VՐ����_�����8v���1T�з�k��!��m�،K�֏��S��v[�����εk�r�Dq%��B��O?SLDE���M�����x����Kܘ�?�|�うAW����?!,��+"V�-�&��b��_D���q����9/���\U�>����:��5�K�b��#�Y`�a��~�������ll�q�&����UȾE�!��f}[���X�]<���b\g�n�6�g�Ǥ4����b_�Ɵ/:��&��ɪ"�l^~�ն����ġm������p2����)fS��{Ls��I�GEMC,f�<'Xc���/F%��������Ӽ��`�����thn2�芘���nf_F�e���g�wrl�,zd���`��*!��r��-[xP&��"G�z�,��Ą�����??UU۶�OS�m�O�f���t�'~6iӖ��x���c\ڮ����?(ǜ2)��˺��H	���v;Tۧ�4�'���&��a���<t��x)�_�b��K���Sb�O��� J0#�.1���8a#�Q�"�<<�y�6Üos�~���l�mƽY��l�j�*�fZ��5��k;"��\v�Ќn:����M�24Т����M""3�WX��^2J������p:����֚�r� �{��I�"@pɪ�<_0�Ip�##"A܁h]4
���6|�@~����N�*/�ԍ}{�[oGkFeX
�~l��_v�WK%ғ¹�zJ�01�l���Rc*�fD���ؽ���a����KŢ@�B���`�=Hi
���D������윝��w��&j[�'U��\�J�t���(���^�l�z[�bߓZ��S�o|j����
C�bKL��&x%��j����6Ħ�`N#��9lR�`f�U�ƿ�����DǼ�)0e�}-B�OD�I(z�G��ϟE��@�� ���p��*��Ӆ2n����j^�[j_��A$s��q��ԼV����ڼ���O��
j�w0�����!�8�<��m�l�v�}�zԂ{�!-3z�L"ϝ}֡$��_��Փ�e��n�s��U��~�����fK-�]!��������:��p�-lH�@|0r�BǨ���p��$�`pB�B)�[���	�$�K���~�m1fm:�5c�x��w�,�&�[�F&���R�9뒀�	�u�vl���P	5R($�a�E#0�į������Le���y���x]-q��J��K�o����U����[�+-��!��q�#�<0��j<�x�6u�L�������^lm��/������z�����\#�����\�dS9�G������[��M���V�E��iU��` �\���P,u��XM�������6x?|�R_[���}_���.vy�HE7!��k��y;%��C2Q�>�n�������,��,�y.�!]r3%+����_�^q���-�ߗ>|�?�H6      �      x������ � �      �   �  x���ۊ�0���)z_�̌F�1,}�B�d)��S�$����북��²�B0蟋�����G�Ak��
Ɋ�9��\]k�WQ*�@Yeõbg��d�Z6L�!�͸ڟ��\n6uWԧq
��2�S�s�E���Mn6��^_��:�鑲��p�΀q`�ckծ:Mqy[��Ɉ��-�#���'�v����vӔ�����]���G7´��l-����R,P��W��`��h��򊀌��� �`J���.��)�Nї���g��CX���	3\J�� :��I��G�8�ks�(����x {wm��#d�ԭ:5�q��/�g��e��H�ލvC�w�=��F�p0�g�4�L�a~�la5=�<�`.q�XW�*ɬ��8	\�����UF��S#p	-?��_<k�w�E�fC�Efؒ��������ٷ�O^�}�`{�:$��O���l˥�μ�:���	��X�׿ RQ
      �      x������ � �      �      x������ � �      �   Q  x���Yo7���_���/G�E%�)^��
䐜i6͢��w,G��@
@���軇DCd��bj8�)�5�j�-$�7O*�Wz���E�N� ,�����{��;�=�ɜMMz�s6Y�P������^7W�R����v��r�G�������/�� ݃!���i�z8�4�UQ�b�֮
��qy�t�A��l���J��z]�]-YJHP������ŗ31�1�g0��ѯU:w�_�ن�[Ϫfh3+�Y%<��ҫ_P�� 2�y�!�C�!�ϐ;�^v�b`��w�>?,$�[��y�m("��)��^�@���۪L�RXW����k�$g�.������(w�$y'�"#�w���z7u�[J��,֩��ei������PiE ��3j<s�̅� ��Ꮣ�1�� �f�!U||����D���H�N?�>����o���x�u��_�5E	}ؿ_���z\�P��p��^�6<�n��5Vy^��<TA�)�
��MҤ��m���/).B�ⵐ��*C+�E�q��$�H	BP��Gbѐ�@Q����4�5³5�,��!�غ݉`B)H�a��|��i�6sֺ��� �3i\u��&1�r�c��޼(��U�n���ڴ�]�Gb����L�����Γߧ��C�=�p�kM���2W��k��Y\}�7��I�OD@ ���7���ђ�h��mX$tQ�fv�gv\ ��:<r��ֶ˕iWKi%U)�2��uD�>�(CB��k�������������V��W� ����0��+HD�`/�TE�:�������-��z��~#�a�q!n��ڹ<*6������LC����%�Q��6����y:���������0��!�������=D�-J[(H�Q�����
k�:R���ƽ>u1�순^�no���H|���>�.���u��V��VM̄>b��&�7n3]�_��"��P��!bt��*��TB�U���M#%0�-���p��%GJwkD�d/s�Ї���×�L�$�w�N�m�g�g7��}�2�\_F�쎝�^��.2�����N�㓂�.����g�b��k�T���a�@�3�$<�OQ���Y��Tn۴jR����D���$C������%<���jz�v�g�C$�ݰ�h7,!K�'�hJ���T�ç�k����=���g~��6ӼY,/��=�[8ƫ�kgnn���w���ߦ7����<�_�;�_d�7<�ej�M�������D ��tRSm��(��|UT�J��.���̚R4o�-���P��uH��Kj������_$�      �      x������ � �     