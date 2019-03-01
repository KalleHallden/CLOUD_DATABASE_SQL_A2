--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2


CREATE TABLE public.admin (
    username character varying NOT NULL
);


ALTER TABLE public.admin OWNER TO kalle;

CREATE TABLE public.customer (
    customerid integer NOT NULL
);


ALTER TABLE public.customer OWNER TO kalle;

CREATE TABLE public.data_center (
    name character varying NOT NULL,
    admin_username character varying,
    capacity integer
);


ALTER TABLE public.data_center OWNER TO kalle;


CREATE TABLE public.data_center_has_admin (
    data_center character varying NOT NULL,
    admin character varying NOT NULL
);


ALTER TABLE public.data_center_has_admin OWNER TO kalle;

CREATE TABLE public.database (
    diskspace character(10),
    type character varying,
    processid integer,
    serverid integer
);

ALTER TABLE public.database OWNER TO kalle;

CREATE TABLE public.has_a_role (
    admin_username character varying,
    role character varying
);


ALTER TABLE public.has_a_role OWNER TO kalle;

CREATE TABLE public.server (
    serverid integer NOT NULL,
    datacenter_name character varying NOT NULL,
    comissiontime date,
    hardware_model character varying
);

ALTER TABLE public.server OWNER TO kalle;

CREATE TABLE public.server_process (
    processid integer,
    serverid integer,
    id integer NOT NULL
);

ALTER TABLE public.server_process OWNER TO kalle;

CREATE SEQUENCE public.server_process_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.server_process_id_seq OWNER TO kalle;

ALTER SEQUENCE public.server_process_id_seq OWNED BY public.server_process.id;

CREATE TABLE public.task (
    taskid integer NOT NULL,
    customerid integer NOT NULL,
    finished bit(1),
    started bit(1),
    taskname character varying
);


ALTER TABLE public.task OWNER TO kalle;

CREATE TABLE public.vm (
    id integer NOT NULL,
    prcessid integer,
    serverid integer,
    memory integer,
    cpu integer
);


ALTER TABLE public.vm OWNER TO kalle;

CREATE SEQUENCE public.vm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vm_id_seq OWNER TO kalle;

ALTER SEQUENCE public.vm_id_seq OWNED BY public.vm.id;

ALTER TABLE ONLY public.server_process ALTER COLUMN id SET DEFAULT nextval('public.server_process_id_seq'::regclass);

ALTER TABLE ONLY public.vm ALTER COLUMN id SET DEFAULT nextval('public.vm_id_seq'::regclass);

COPY public.admin (username) FROM stdin;
kallehallden
erikjansson
pellefredriksson
\.


COPY public.customer (customerid) FROM stdin;
1
2
3
\.


COPY public.data_center (name, admin_username, capacity) FROM stdin;
Data Center 1	kallehallden	100
Data Center 2	erikjansson	200
Data Center 3	pellefredriksson	300
\.


COPY public.data_center_has_admin (data_center, admin) FROM stdin;
Data Center 1	kallehallden
Data Center 2	kallehallden
Data Center 3	erikjansson
\.


COPY public.database (diskspace, type, processid, serverid) FROM stdin;
search    	100	1	1
facebook  	200	2	2
youtube   	300	3	3
\.

COPY public.has_a_role (admin_username, role) FROM stdin;
kallehallden	database admin
kallehallden	hardware admin
erikjansson	database admin
\.

COPY public.server (serverid, datacenter_name, comissiontime, hardware_model) FROM stdin;
1	Data Center 1	2017-03-14	1
2	Data Center 2	2018-03-14	2
3	Data Center 3	2019-03-14	3
\.


--
-- Data for Name: server_process; Type: TABLE DATA; Schema: public; Owner: kalle
--

COPY public.server_process (processid, serverid, id) FROM stdin;
1	1	1
2	2	2
3	3	3
\.


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: kalle
--

COPY public.task (taskid, customerid, finished, started, taskname) FROM stdin;
1	1	0	1	build a pirateship
2	2	0	1	get into the league of legends
3	3	0	1	delete my MI6 criminal record, Mohahahaha
\.


--
-- Data for Name: vm; Type: TABLE DATA; Schema: public; Owner: kalle
--

COPY public.vm (id, prcessid, serverid, memory, cpu) FROM stdin;
1	1	1	100	100
2	2	2	200	200
3	3	3	300	300
\.


--
-- Name: server_process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kalle
--

SELECT pg_catalog.setval('public.server_process_id_seq', 3, true);


--
-- Name: vm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kalle
--

SELECT pg_catalog.setval('public.vm_id_seq', 1, false);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (username);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customerid);


--
-- Name: data_center_has_admin data_center_has_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.data_center_has_admin
    ADD CONSTRAINT data_center_has_admin_pkey PRIMARY KEY (data_center, admin);


--
-- Name: data_center data_center_pkey; Type: CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.data_center
    ADD CONSTRAINT data_center_pkey PRIMARY KEY (name);


--
-- Name: server server_pkey; Type: CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.server
    ADD CONSTRAINT server_pkey PRIMARY KEY (serverid, datacenter_name);


--
-- Name: server_process server_process_pkey; Type: CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.server_process
    ADD CONSTRAINT server_process_pkey PRIMARY KEY (id);


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (taskid, customerid);


--
-- Name: vm vm_pkey; Type: CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.vm
    ADD CONSTRAINT vm_pkey PRIMARY KEY (id);


--
-- Name: data_center data_center_admin_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.data_center
    ADD CONSTRAINT data_center_admin_username_fkey FOREIGN KEY (admin_username) REFERENCES public.admin(username) ON DELETE CASCADE;


--
-- Name: data_center_has_admin data_center_has_admin_admin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.data_center_has_admin
    ADD CONSTRAINT data_center_has_admin_admin_fkey FOREIGN KEY (admin) REFERENCES public.admin(username);


--
-- Name: data_center_has_admin data_center_has_admin_data_center_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.data_center_has_admin
    ADD CONSTRAINT data_center_has_admin_data_center_fkey FOREIGN KEY (data_center) REFERENCES public.data_center(name);


--
-- Name: database database_processid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.database
    ADD CONSTRAINT database_processid_fkey FOREIGN KEY (processid) REFERENCES public.server_process(id);


--
-- Name: has_a_role has_a_role_admin_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.has_a_role
    ADD CONSTRAINT has_a_role_admin_username_fkey FOREIGN KEY (admin_username) REFERENCES public.admin(username) ON DELETE CASCADE;


--
-- Name: server server_datacenter_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.server
    ADD CONSTRAINT server_datacenter_name_fkey FOREIGN KEY (datacenter_name) REFERENCES public.data_center(name);


--
-- Name: task task_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kalle
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customer(customerid);


--
-- PostgreSQL database dump complete
--

