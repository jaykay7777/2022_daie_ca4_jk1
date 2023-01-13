-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-01-13 10:46:12.568

-- tables
-- Table: TeamMembers
CREATE TABLE TeamMembers (
    memberID integer NOT NULL CONSTRAINT TeamMembers_pk PRIMARY KEY,
    firstname varchar(32) NOT NULL,
    lastname varchar(128) NOT NULL,
    email varchar(128) NOT NULL
);

-- End of file.

