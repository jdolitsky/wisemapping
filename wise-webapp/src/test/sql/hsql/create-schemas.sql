CREATE TABLE COLABORATOR (
id INTEGER NOT NULL IDENTITY,
email varchar(255) NOT NULL,
creation_date date);

CREATE TABLE USER (
id INTEGER NOT NULL IDENTITY,
colaborator_id INTEGER NOT NULL,
username varchar(255)   NOT NULL,
firstname varchar(255)  NOT NULL,
lastname varchar(255)  NOT NULL,
password varchar(255)  NOT NULL,
activationCode BIGINT NOT NULL,
activation_date DATE,
allowSendEmail CHAR(1) NOT NULL,
FOREIGN KEY(colaborator_id) REFERENCES COLABORATOR(id)
);

CREATE TABLE MINDMAP (
id INTEGER NOT NULL IDENTITY,
title VARCHAR(255) NOT NULL,
description VARCHAR(255)  NOT NULL,
xml LONGVARBINARY NOT NULL,
public BOOLEAN NOT NULL,
creation_date DATETIME,
edition_date DATETIME,
owner_id INTEGER NOT NULL,
tags varchar(1014)  ,
last_editor varchar(255)  ,
creator_user varchar(255)  ,
editor_properties varchar(512)
--FOREIGN KEY(owner_id) REFERENCES USER(colaborator_id)
);


CREATE TABLE MINDMAP_HISTORY
(id INTEGER NOT NULL IDENTITY,
xml LONGVARBINARY NOT NULL,
mindmap_id INTEGER NOT NULL,
creation_date DATETIME,
creator_user varchar(255));

CREATE TABLE COLLABORATION_PROPERTIES
(id INTEGER NOT NULL IDENTITY,
starred BOOLEAN NOT NULL,
);

CREATE TABLE COLLABORATION
(id INTEGER NOT NULL IDENTITY,
colaborator_id INTEGER NOT NULL,
properties_id INTEGER,
mindmap_id INTEGER NOT NULL,
role_id INTEGER NOT NULL,
FOREIGN KEY(colaborator_id) REFERENCES COLABORATOR(id),
FOREIGN KEY(mindmap_id) REFERENCES MINDMAP(id),
FOREIGN KEY(properties_id) REFERENCES COLLABORATION_PROPERTIES(id)
);


CREATE TABLE TAG
(id INTEGER NOT NULL IDENTITY,
name varchar(255)  NOT NULL,
user_id INTEGER NOT NULL,
--FOREIGN KEY(user_id) REFERENCES USER(colaborator_id)
);

CREATE TABLE USER_LOGIN
(id INTEGER NOT NULL IDENTITY,
email varchar(255),
login_date date);
COMMIT;
SHUTDOWN;