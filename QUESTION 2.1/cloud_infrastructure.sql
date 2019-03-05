

CREATE TABLE ADMIN (
    username VARCHAR PRIMARY KEY
);

CREATE TABLE CUSTOMER (
    customerid INTEGER
);

CREATE TABLE DATA_CENTER (
    name VARCHAR PRIMARY KEY,
    admin_username VARCHAR,
    capacity INTEGER,
    FOREIGN KEY (admin_username) REFERENCES ADMIN(username)
);

CREATE TABLE DATA_CENTER_HAS_ADMIN (
    data_center VARCHAR REFERENCES DATA_CENTER(name),
    admin character VARCHAR REFERENCES ADMIN(username),
    PRIMARY KEY (data_center, admin_username)
);

CREATE TABLE SERVER (
    serverid INTEGER,
    datacenter_name VARCHAR REFERENCES DATA_CENTER(name),
    comissiontime date,
    hardware_model VARCHAR,
    PRIMARY KEY (serverid, datacenter_name)
);

CREATE TABLE SERVER_PROCESS (
    processid INTEGER,
    serverid INTEGER REFERENCES SERVER(serverid),
    id INTEGER SERIAL PRIMARY KEY,
);

CREATE TABLE DATABASE (
    id SERIAL PRIMARY KEY,
    diskspace INTEGER,
    type VARCHAR,
    processid INTEGER REFERENCES SERVER_PROCESS(prcessid),
    serverid INTEGER REFERENCES SERVER_PROCESS(serverid),
);

CREATE TABLE HAS_A_ROLE (
    admin_username VARCHAR,
    role VARCHAR,
    FOREIGN KEY (admin_username) REFERENCES ADMIN(username)
);

CREATE TABLE TASK (
    taskid INTEGER,
    customerid INTEGER,
    finished BIT,
    started BIT,
    taskname VARCHAR,
    FOREIGN KEY (customerid)  REFERENCES CUSTOMER(customerid)
);

INSERT INTO ADMIN VALUES ('kallehallden');
INSERT INTO ADMIN VALUES ('erikjansson');
INSERT INTO ADMIN VALUES ('pellehenriksson');

INSERT INTO CUSTOMER VALUES (1);
INSERT INTO CUSTOMER VALUES (2);
INSERT INTO CUSTOMER VALUES (3);

INSERT INTO DATA_CENTER VALUES ('Data_center_1', 'kallehallden', 100);
INSERT INTO DATA_CENTER VALUES ('Data_center_2', 'erikjansson', 200);
INSERT INTO DATA_CENTER VALUES ('Data_center_3', 'pellehenriksson', 300);

INSERT INTO DATA_CENTER_HAS_ADMIN VALUES ('Data_center_3', 'pellehenriksson');
INSERT INTO DATA_CENTER_HAS_ADMIN VALUES ('Data_center_2', 'erikjansson');
INSERT INTO DATA_CENTER_HAS_ADMIN VALUES ('Data_center_1', 'kallehallden');

INSERT INTO HAS_A_ROLE VALUES ('kallehallden', 'main admin');
INSERT INTO HAS_A_ROLE VALUES ('erikjansson', 'main admin');
INSERT INTO HAS_A_ROLE VALUES ('pellehenriksson', 'main admin');

INSERT INTO SERVER VALUES (1, 'Data_center_1', 28-02-2018, 'model x');
INSERT INTO SERVER VALUES (2, 'Data_center_2', 12-02-2018, 'model y');
INSERT INTO SERVER VALUES (3, 'Data_center_3', 10-02-2018, 'model z');

INSERT INTO SERVER_PROCESS VALUES (1, 1, 1);
INSERT INTO SERVER_PROCESS VALUES (2, 2, 2);
INSERT INTO SERVER_PROCESS VALUES (3, 3, 3);

INSERT INTO SERVER_PROCESS VALUES (1, 10, 'type 1', 1, 1);
INSERT INTO SERVER_PROCESS VALUES (2, 20, 'type 2', 2, 2);
INSERT INTO SERVER_PROCESS VALUES (3, 30, 'type 3', 3, 3);

INSERT INTO TASK VALUES (1, 1, b'0', b'1', 'task 1');
INSERT INTO TASK VALUES (2, 2, b'0', b'1', 'task 2');
INSERT INTO TASK VALUES (3, 3, b'0', b'1', 'task 3');
