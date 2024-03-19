PGDMP      )                |            obrasalmeida    16.0    16.0 v    v           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            w           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            x           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            y           1262    38867    obrasalmeida    DATABASE     �   CREATE DATABASE obrasalmeida WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE obrasalmeida;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            z           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    38895    addresses_works    TABLE     .  CREATE TABLE public.addresses_works (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    street character varying(255) NOT NULL,
    number integer NOT NULL,
    cep character varying(9) NOT NULL,
    city character varying(50) NOT NULL,
    state character varying(50) NOT NULL
);
 #   DROP TABLE public.addresses_works;
       public         heap    postgres    false    4            �            1259    38894    addresses_works_id_seq    SEQUENCE     �   CREATE SEQUENCE public.addresses_works_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.addresses_works_id_seq;
       public          postgres    false    4    218            {           0    0    addresses_works_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.addresses_works_id_seq OWNED BY public.addresses_works.id;
          public          postgres    false    217            �            1259    38970 	   contracts    TABLE     d   CREATE TABLE public.contracts (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.contracts;
       public         heap    postgres    false    4            �            1259    38969    contracts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.contracts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.contracts_id_seq;
       public          postgres    false    228    4            |           0    0    contracts_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.contracts_id_seq OWNED BY public.contracts.id;
          public          postgres    false    227            �            1259    38978 	   employees    TABLE     f  CREATE TABLE public.employees (
    id integer NOT NULL,
    ra character varying(8) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    alternative_name character varying(50) NOT NULL,
    admission_date date NOT NULL,
    salary numeric(12,2) NOT NULL,
    lunch_cost numeric(10,2) NOT NULL,
    ticket_cost numeric(10,2) NOT NULL,
    payment_id integer NOT NULL,
    contract_id integer NOT NULL,
    position_id integer NOT NULL,
    dinner character varying(3) NOT NULL,
    lunch character varying(3) NOT NULL,
    total_cost numeric(12,2) NOT NULL
);
    DROP TABLE public.employees;
       public         heap    postgres    false    4            �            1259    38977    employees_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public          postgres    false    4    230            }           0    0    employees_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
          public          postgres    false    229            �            1259    38876    macroservices    TABLE     q   CREATE TABLE public.macroservices (
    id integer NOT NULL,
    macroservice character varying(100) NOT NULL
);
 !   DROP TABLE public.macroservices;
       public         heap    postgres    false    4            �            1259    38875    macroservices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.macroservices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.macroservices_id_seq;
       public          postgres    false    4    216            ~           0    0    macroservices_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.macroservices_id_seq OWNED BY public.macroservices.id;
          public          postgres    false    215            �            1259    38963    payments    TABLE     c   CREATE TABLE public.payments (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.payments;
       public         heap    postgres    false    4            �            1259    38962    payments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.payments_id_seq;
       public          postgres    false    226    4                       0    0    payments_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;
          public          postgres    false    225            �            1259    38923    permissions    TABLE     m   CREATE TABLE public.permissions (
    id integer NOT NULL,
    access_name character varying(50) NOT NULL
);
    DROP TABLE public.permissions;
       public         heap    postgres    false    4            �            1259    38922    permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public          postgres    false    222    4            �           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          postgres    false    221            �            1259    38956 	   positions    TABLE     d   CREATE TABLE public.positions (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.positions;
       public         heap    postgres    false    4            �            1259    38955    positions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.positions_id_seq;
       public          postgres    false    4    224            �           0    0    positions_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.positions_id_seq OWNED BY public.positions.id;
          public          postgres    false    223            �            1259    39063    presence_controls    TABLE     �   CREATE TABLE public.presence_controls (
    id integer NOT NULL,
    obra_id integer NOT NULL,
    employee_id integer NOT NULL,
    presence_date date NOT NULL,
    arrival_time character varying(10) NOT NULL
);
 %   DROP TABLE public.presence_controls;
       public         heap    postgres    false    4            �            1259    39062    presence_control_id_seq    SEQUENCE     �   CREATE SEQUENCE public.presence_control_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.presence_control_id_seq;
       public          postgres    false    4    238            �           0    0    presence_control_id_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public.presence_control_id_seq OWNED BY public.presence_controls.id;
          public          postgres    false    237            �            1259    39084    productivity_controls    TABLE     T  CREATE TABLE public.productivity_controls (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    obra_id integer NOT NULL,
    place character varying(50) NOT NULL,
    sub_id integer NOT NULL,
    quantity integer NOT NULL,
    weight integer NOT NULL,
    created_at date NOT NULL,
    ambient character varying(50) NOT NULL
);
 )   DROP TABLE public.productivity_controls;
       public         heap    postgres    false    4            �            1259    39083    productivity_controls_id_seq    SEQUENCE     �   CREATE SEQUENCE public.productivity_controls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.productivity_controls_id_seq;
       public          postgres    false    4    240            �           0    0    productivity_controls_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.productivity_controls_id_seq OWNED BY public.productivity_controls.id;
          public          postgres    false    239            �            1259    39106    quality_controls    TABLE     �   CREATE TABLE public.quality_controls (
    id integer NOT NULL,
    productivity_id integer NOT NULL,
    nonconformity character varying(3) NOT NULL,
    operation character varying(255)
);
 $   DROP TABLE public.quality_controls;
       public         heap    postgres    false    4            �            1259    39105    quality_controls_id_seq    SEQUENCE     �   CREATE SEQUENCE public.quality_controls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.quality_controls_id_seq;
       public          postgres    false    242    4            �           0    0    quality_controls_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.quality_controls_id_seq OWNED BY public.quality_controls.id;
          public          postgres    false    241            �            1259    39021    subservices    TABLE     �   CREATE TABLE public.subservices (
    id integer NOT NULL,
    macro_id integer NOT NULL,
    subservice character varying(100) NOT NULL,
    unit_id integer
);
    DROP TABLE public.subservices;
       public         heap    postgres    false    4            �            1259    39020    subservices_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subservices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.subservices_id_seq;
       public          postgres    false    236    4            �           0    0    subservices_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.subservices_id_seq OWNED BY public.subservices.id;
          public          postgres    false    235            �            1259    39014    units    TABLE     `   CREATE TABLE public.units (
    id integer NOT NULL,
    unit character varying(30) NOT NULL
);
    DROP TABLE public.units;
       public         heap    postgres    false    4            �            1259    39013    units_id_seq    SEQUENCE     �   CREATE SEQUENCE public.units_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.units_id_seq;
       public          postgres    false    4    234            �           0    0    units_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.units_id_seq OWNED BY public.units.id;
          public          postgres    false    233            �            1259    38916    users    TABLE     N  CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    password_hash character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    permission_id integer NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    4            �            1259    38915    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    220    4            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    219            �            1259    39000    works_managements    TABLE       CREATE TABLE public.works_managements (
    id integer NOT NULL,
    obra_id integer NOT NULL,
    place character varying(50) NOT NULL,
    ambient character varying(50) NOT NULL,
    sub_id integer NOT NULL,
    quantity integer NOT NULL,
    weight integer NOT NULL
);
 %   DROP TABLE public.works_managements;
       public         heap    postgres    false    4            �            1259    38999    works_managements_id_seq    SEQUENCE     �   CREATE SEQUENCE public.works_managements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.works_managements_id_seq;
       public          postgres    false    4    232            �           0    0    works_managements_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.works_managements_id_seq OWNED BY public.works_managements.id;
          public          postgres    false    231            �           2604    38898    addresses_works id    DEFAULT     x   ALTER TABLE ONLY public.addresses_works ALTER COLUMN id SET DEFAULT nextval('public.addresses_works_id_seq'::regclass);
 A   ALTER TABLE public.addresses_works ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    38973    contracts id    DEFAULT     l   ALTER TABLE ONLY public.contracts ALTER COLUMN id SET DEFAULT nextval('public.contracts_id_seq'::regclass);
 ;   ALTER TABLE public.contracts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    38981    employees id    DEFAULT     l   ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    38879    macroservices id    DEFAULT     t   ALTER TABLE ONLY public.macroservices ALTER COLUMN id SET DEFAULT nextval('public.macroservices_id_seq'::regclass);
 ?   ALTER TABLE public.macroservices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    38966    payments id    DEFAULT     j   ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);
 :   ALTER TABLE public.payments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    38926    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    38959    positions id    DEFAULT     l   ALTER TABLE ONLY public.positions ALTER COLUMN id SET DEFAULT nextval('public.positions_id_seq'::regclass);
 ;   ALTER TABLE public.positions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    39066    presence_controls id    DEFAULT     {   ALTER TABLE ONLY public.presence_controls ALTER COLUMN id SET DEFAULT nextval('public.presence_control_id_seq'::regclass);
 C   ALTER TABLE public.presence_controls ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    238    238            �           2604    39087    productivity_controls id    DEFAULT     �   ALTER TABLE ONLY public.productivity_controls ALTER COLUMN id SET DEFAULT nextval('public.productivity_controls_id_seq'::regclass);
 G   ALTER TABLE public.productivity_controls ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    240    240            �           2604    39109    quality_controls id    DEFAULT     z   ALTER TABLE ONLY public.quality_controls ALTER COLUMN id SET DEFAULT nextval('public.quality_controls_id_seq'::regclass);
 B   ALTER TABLE public.quality_controls ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241    242            �           2604    39024    subservices id    DEFAULT     p   ALTER TABLE ONLY public.subservices ALTER COLUMN id SET DEFAULT nextval('public.subservices_id_seq'::regclass);
 =   ALTER TABLE public.subservices ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    39017    units id    DEFAULT     d   ALTER TABLE ONLY public.units ALTER COLUMN id SET DEFAULT nextval('public.units_id_seq'::regclass);
 7   ALTER TABLE public.units ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    38919    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    39003    works_managements id    DEFAULT     |   ALTER TABLE ONLY public.works_managements ALTER COLUMN id SET DEFAULT nextval('public.works_managements_id_seq'::regclass);
 C   ALTER TABLE public.works_managements ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            [          0    38895    addresses_works 
   TABLE DATA           U   COPY public.addresses_works (id, name, street, number, cep, city, state) FROM stdin;
    public          postgres    false    218   ��       e          0    38970 	   contracts 
   TABLE DATA           -   COPY public.contracts (id, name) FROM stdin;
    public          postgres    false    228   �       g          0    38978 	   employees 
   TABLE DATA           �   COPY public.employees (id, ra, first_name, last_name, alternative_name, admission_date, salary, lunch_cost, ticket_cost, payment_id, contract_id, position_id, dinner, lunch, total_cost) FROM stdin;
    public          postgres    false    230   R�       Y          0    38876    macroservices 
   TABLE DATA           9   COPY public.macroservices (id, macroservice) FROM stdin;
    public          postgres    false    216   �       c          0    38963    payments 
   TABLE DATA           ,   COPY public.payments (id, name) FROM stdin;
    public          postgres    false    226   ��       _          0    38923    permissions 
   TABLE DATA           6   COPY public.permissions (id, access_name) FROM stdin;
    public          postgres    false    222   �       a          0    38956 	   positions 
   TABLE DATA           -   COPY public.positions (id, name) FROM stdin;
    public          postgres    false    224   3�       o          0    39063    presence_controls 
   TABLE DATA           b   COPY public.presence_controls (id, obra_id, employee_id, presence_date, arrival_time) FROM stdin;
    public          postgres    false    238   ��       q          0    39084    productivity_controls 
   TABLE DATA              COPY public.productivity_controls (id, employee_id, obra_id, place, sub_id, quantity, weight, created_at, ambient) FROM stdin;
    public          postgres    false    240   �       s          0    39106    quality_controls 
   TABLE DATA           Y   COPY public.quality_controls (id, productivity_id, nonconformity, operation) FROM stdin;
    public          postgres    false    242   ��       m          0    39021    subservices 
   TABLE DATA           H   COPY public.subservices (id, macro_id, subservice, unit_id) FROM stdin;
    public          postgres    false    236   ď       k          0    39014    units 
   TABLE DATA           )   COPY public.units (id, unit) FROM stdin;
    public          postgres    false    234   ǒ       ]          0    38916    users 
   TABLE DATA           n   COPY public.users (id, username, first_name, last_name, password_hash, created_at, permission_id) FROM stdin;
    public          postgres    false    220   �       i          0    39000    works_managements 
   TABLE DATA           b   COPY public.works_managements (id, obra_id, place, ambient, sub_id, quantity, weight) FROM stdin;
    public          postgres    false    232   �       �           0    0    addresses_works_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.addresses_works_id_seq', 7, true);
          public          postgres    false    217            �           0    0    contracts_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.contracts_id_seq', 3, true);
          public          postgres    false    227            �           0    0    employees_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.employees_id_seq', 15, true);
          public          postgres    false    229            �           0    0    macroservices_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.macroservices_id_seq', 35, true);
          public          postgres    false    215            �           0    0    payments_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.payments_id_seq', 4, true);
          public          postgres    false    225            �           0    0    permissions_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.permissions_id_seq', 4, true);
          public          postgres    false    221            �           0    0    positions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.positions_id_seq', 6, true);
          public          postgres    false    223            �           0    0    presence_control_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.presence_control_id_seq', 12, true);
          public          postgres    false    237            �           0    0    productivity_controls_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.productivity_controls_id_seq', 11, true);
          public          postgres    false    239            �           0    0    quality_controls_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.quality_controls_id_seq', 5, true);
          public          postgres    false    241            �           0    0    subservices_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.subservices_id_seq', 91, true);
          public          postgres    false    235            �           0    0    units_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.units_id_seq', 7, true);
          public          postgres    false    233            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 7, true);
          public          postgres    false    219            �           0    0    works_managements_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.works_managements_id_seq', 19, true);
          public          postgres    false    231            �           2606    38900 $   addresses_works addresses_works_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.addresses_works
    ADD CONSTRAINT addresses_works_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.addresses_works DROP CONSTRAINT addresses_works_pkey;
       public            postgres    false    218            �           2606    38975    contracts contracts_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.contracts DROP CONSTRAINT contracts_pkey;
       public            postgres    false    228            �           2606    38983    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    230            �           2606    38881     macroservices macroservices_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.macroservices
    ADD CONSTRAINT macroservices_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.macroservices DROP CONSTRAINT macroservices_pkey;
       public            postgres    false    216            �           2606    38968    payments payments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.payments DROP CONSTRAINT payments_pkey;
       public            postgres    false    226            �           2606    38928    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    222            �           2606    38961    positions positions_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.positions
    ADD CONSTRAINT positions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.positions DROP CONSTRAINT positions_pkey;
       public            postgres    false    224            �           2606    39068 '   presence_controls presence_control_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.presence_controls
    ADD CONSTRAINT presence_control_pkey PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public.presence_controls DROP CONSTRAINT presence_control_pkey;
       public            postgres    false    238            �           2606    39089 0   productivity_controls productivity_controls_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.productivity_controls
    ADD CONSTRAINT productivity_controls_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.productivity_controls DROP CONSTRAINT productivity_controls_pkey;
       public            postgres    false    240            �           2606    39111 &   quality_controls quality_controls_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.quality_controls
    ADD CONSTRAINT quality_controls_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.quality_controls DROP CONSTRAINT quality_controls_pkey;
       public            postgres    false    242            �           2606    39026    subservices subservices_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.subservices
    ADD CONSTRAINT subservices_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.subservices DROP CONSTRAINT subservices_pkey;
       public            postgres    false    236            �           2606    39019    units units_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.units DROP CONSTRAINT units_pkey;
       public            postgres    false    234            �           2606    38921    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            �           2606    39005 (   works_managements works_managements_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.works_managements
    ADD CONSTRAINT works_managements_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.works_managements DROP CONSTRAINT works_managements_pkey;
       public            postgres    false    232            �           2606    38984    employees fk_contract    FK CONSTRAINT     |   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_contract FOREIGN KEY (contract_id) REFERENCES public.contracts(id);
 ?   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_contract;
       public          postgres    false    230    4780    228            �           2606    39074    presence_controls fk_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.presence_controls
    ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES public.employees(id);
 G   ALTER TABLE ONLY public.presence_controls DROP CONSTRAINT fk_employee;
       public          postgres    false    4782    230    238            �           2606    39090 !   productivity_controls fk_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.productivity_controls
    ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES public.employees(id);
 K   ALTER TABLE ONLY public.productivity_controls DROP CONSTRAINT fk_employee;
       public          postgres    false    230    240    4782            �           2606    39027    subservices fk_macroservice    FK CONSTRAINT     �   ALTER TABLE ONLY public.subservices
    ADD CONSTRAINT fk_macroservice FOREIGN KEY (macro_id) REFERENCES public.macroservices(id);
 E   ALTER TABLE ONLY public.subservices DROP CONSTRAINT fk_macroservice;
       public          postgres    false    216    4768    236            �           2606    38989    employees fk_payment    FK CONSTRAINT     y   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_payment FOREIGN KEY (payment_id) REFERENCES public.payments(id);
 >   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_payment;
       public          postgres    false    4778    230    226            �           2606    38929    users fk_permission    FK CONSTRAINT     ~   ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_permission FOREIGN KEY (permission_id) REFERENCES public.permissions(id);
 =   ALTER TABLE ONLY public.users DROP CONSTRAINT fk_permission;
       public          postgres    false    220    4774    222            �           2606    38994    employees fk_position    FK CONSTRAINT     |   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_position FOREIGN KEY (position_id) REFERENCES public.positions(id);
 ?   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_position;
       public          postgres    false    224    4776    230            �           2606    39112     quality_controls fk_productivity    FK CONSTRAINT     �   ALTER TABLE ONLY public.quality_controls
    ADD CONSTRAINT fk_productivity FOREIGN KEY (productivity_id) REFERENCES public.productivity_controls(id);
 J   ALTER TABLE ONLY public.quality_controls DROP CONSTRAINT fk_productivity;
       public          postgres    false    240    242    4792            �           2606    39052    works_managements fk_subservice    FK CONSTRAINT     �   ALTER TABLE ONLY public.works_managements
    ADD CONSTRAINT fk_subservice FOREIGN KEY (sub_id) REFERENCES public.subservices(id);
 I   ALTER TABLE ONLY public.works_managements DROP CONSTRAINT fk_subservice;
       public          postgres    false    232    4788    236            �           2606    39100 #   productivity_controls fk_subservice    FK CONSTRAINT     �   ALTER TABLE ONLY public.productivity_controls
    ADD CONSTRAINT fk_subservice FOREIGN KEY (sub_id) REFERENCES public.subservices(id);
 M   ALTER TABLE ONLY public.productivity_controls DROP CONSTRAINT fk_subservice;
       public          postgres    false    4788    240    236            �           2606    39037    subservices fk_unit    FK CONSTRAINT     r   ALTER TABLE ONLY public.subservices
    ADD CONSTRAINT fk_unit FOREIGN KEY (unit_id) REFERENCES public.units(id);
 =   ALTER TABLE ONLY public.subservices DROP CONSTRAINT fk_unit;
       public          postgres    false    234    4786    236            �           2606    39057    works_managements fk_work    FK CONSTRAINT     �   ALTER TABLE ONLY public.works_managements
    ADD CONSTRAINT fk_work FOREIGN KEY (obra_id) REFERENCES public.addresses_works(id);
 C   ALTER TABLE ONLY public.works_managements DROP CONSTRAINT fk_work;
       public          postgres    false    4770    232    218            �           2606    39069    presence_controls fk_work    FK CONSTRAINT     �   ALTER TABLE ONLY public.presence_controls
    ADD CONSTRAINT fk_work FOREIGN KEY (obra_id) REFERENCES public.addresses_works(id);
 C   ALTER TABLE ONLY public.presence_controls DROP CONSTRAINT fk_work;
       public          postgres    false    218    4770    238            �           2606    39117    productivity_controls fk_work    FK CONSTRAINT     �   ALTER TABLE ONLY public.productivity_controls
    ADD CONSTRAINT fk_work FOREIGN KEY (obra_id) REFERENCES public.addresses_works(id);
 G   ALTER TABLE ONLY public.productivity_controls DROP CONSTRAINT fk_work;
       public          postgres    false    4770    218    240            [   u   x�3��O*JTp��K��=�6/3_�˛3�4Q�1'�(5%_��437�����bNKKNCCKCcN�Ԝ�+s9�R�L�2��S�L1A3Ō,S��L1�4%" ğ�9������qqq .z      e   7   x�3�t,+�)��2�I-JN�,ʬJL��2�t��+)J,�Wp,.�����qqq ��s      g   �   x���=�0�g�� U�����P+!��D4�A�H	]����U���l�����P����v:@�C����ec��"6S�)�9��
$ll?��%ߪ�"@�ϝ4�������o||��?�2� �BK+7^��[֚lo�a:�%:�� E��ɢ�Zc��J�S���)�6'���ZY      Y   ~  x�}�=r�0�k����%��+!+3C�2Hm\�2��ϥ�R<ɲ�Ψ���p,8�]p�{�9̨}�.4���\x.3�Ј?	ZӼ|`֤*2�o�DZ^cp��J#r@툗�AT}~1���S���j�|�Z0�;�c����a�g�3�F1u�%0���2�g�f
٫�<���\0��'Mq�,�za�5y
���y�ɜj�q��s���k�v�\��5꒘X��0�; ۨ�}�Ic�ԣ��.���?�i�B)���R�Cz�.[�Ab�)�i=`�r�%�:uk͓rbcܪr��,�Y]��G?hF����r�	�XؘZ��*��f34�q2�����5��@�Qr�̛�:�)D�.������G �.0ݜ      c   2   x�3�t�<��(3�ˈ38571/1�˘3�43�*�6��M�+2b���� a0�      _   >   x�3�tL����,.)JL�/�2�t��L�+I�2��/H-JL���K��2�.-�/���qqq ��3      a   e   x��1�0D�z�>�Q@��h%��-&��i������Z���)�ʐF�w��v��LW	�����.��^����%N1�m���62i{����h �      o   Y   x�m���0k{�����,�?�Rڒ��+ްn�1�\�p���[�A���G��į�o>m��/��f�!Q< H�BPbd����*/�      q   i   x�3�44�4�tN,NT0�BsNSN#C] 2��tί���H�@Shj
BXZr�qa*,M,*��24�44A(�ȉU�2S�2c�y�ʂs�b���� ��)~      s   *   x�3�4��;�8�3�8��L�������y%�E�\1z\\\ -o�      m   �  x�uUKn�0\S��	
�#JZ�iRh� �Zf��R��t���X�ȎE:���<��̣l�8{8x��.\�OA?\mNo��.��tc�w�%J�����t���H���P�S�dGo6�}qL&�	vg�n]Z7��G�(��J&$�b��f�[4V��N�1��������4p�s{��!� �d7�v(%���0�v6�w~��<����l����6�AC��a0}3�^1�x�n��4����4u�z�Wg��3A��ȅ�@�.�@N�p�\�ЕT?8Z�����`�SR�\h�!��P)��7���lڙ���DT��=��# A�T"3�whG��U�7�9-�$�h�$��������J�y����A��|3��"�E�'R��i|.���t� �8�t�K�pQ�����DK��\�H��F�������KV�g��tf�,ݥ(�����!�J���|e��d~���F�/��ot"�e$4����be%�5��9�W�>�*���:V6ϖXz4��8��+����r��a
X� �=�Ey�k����ۭ'F%y��0೚~��=���,
D���%6Ds4���";���� ���?��\[�� WKl�Dê�j������A��E
JB��,��,�D�"�ԗ�C��X$E������@d��aMd��Yd)�@Kv޼����23^*`�.��[$�^ ���� VTY.��P"�"�2&o~�*�+��)I������      k   ?   x�3�,��LILI�2��=��˘3%3�����eʙ�eƙ��Y�X�e�Y���_�Z����� �:      ]   �  x�u��r�P�5<��9�+;D�Ѩ(�H��	�~̔��ʌU]�����ƜV���j.E�d��}�>�ś!�c���¨�^�R��ب��l峪��iL�C丞{[����@�h1J
# a�a�p�sXy~\�^�t�I�
�i4^π
Wpà��tMY2���\w�Z��[`��� a�𔳚sQ]��4��z��l�E[S�f*�'/$N�ҷG{{�;�aՙj���"7�Qi���"b��SӰ�jY���'E�+����m��.��d�Gx�~K7�8�i���� �U旛�7
!" �)ċ\��^}�:����?#���w��bJ򛋦]4�]�*�-��a~}�L�"���e�-��O{��zHT0U��L���TO�1<m�I����2�6�MF��U=
�ڨfӢ�cũ[/�a��_��=t�@A��; ��7�͵      i   c   x���4�tN,NT0�tί���H�4�44�41�24��3����8K�J�RF`)#)C��1Lʘ381'��M�����,p[ R1z\\\ ��/3     