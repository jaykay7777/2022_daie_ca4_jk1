-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-01-13 11:32:54.986

-- tables
-- Table: Asset
CREATE TABLE Asset (
    id integer NOT NULL CONSTRAINT Asset_pk PRIMARY KEY AUTOINCREMENT,
    type varchar(50) NOT NULL,
    format varchar(50) NOT NULL,
    WorkItem_id integer NOT NULL
);

-- Table: Library
CREATE TABLE Library (
    id integer NOT NULL CONSTRAINT Library_pk PRIMARY KEY AUTOINCREMENT,
    name varchar(128) NOT NULL,
    Asset_id integer NOT NULL,
    Project_id integer NOT NULL
);

-- Table: Project
CREATE TABLE Project (
    id integer NOT NULL CONSTRAINT Project_pk PRIMARY KEY AUTOINCREMENT,
    name varchar(128) NOT NULL,
    startDate date NOT NULL,
    endDate date NOT NULL
);

-- Table: ProjectMembers
CREATE TABLE ProjectMembers (
    TeamMembers_id integer NOT NULL,
    Project_id integer NOT NULL,
    CONSTRAINT ProjectMembers_pk PRIMARY KEY (TeamMembers_id,Project_id)
);

-- Table: TeamMembers
CREATE TABLE TeamMembers (
    id integer NOT NULL CONSTRAINT TeamMembers_pk PRIMARY KEY AUTOINCREMENT,
    firstname varchar(32) NOT NULL,
    lastname varchar(128) NOT NULL,
    email varchar(128) NOT NULL
);

-- Table: WorkItem
CREATE TABLE WorkItem (
    id integer NOT NULL CONSTRAINT WorkItem_pk PRIMARY KEY AUTOINCREMENT,
    name varchar(128) NOT NULL,
    status varchar(50) NOT NULL,
    TeamMembers_id integer NOT NULL
);

-- End of file.

