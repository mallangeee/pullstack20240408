SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS comment;
DROP TABLE IF EXISTS board;
DROP TABLE IF EXISTS user;




/* Create Tables */

CREATE TABLE board
(
	bno int NOT NULL AUTO_INCREMENT,
	author varchar(255) NOT NULL,
	title varchar(255) NOT NULL,
	body text NOT NULL,
	create_date timestamp,
	PRIMARY KEY (bno)
);


CREATE TABLE comment
(
	cno int NOT NULL AUTO_INCREMENT,
	bno int NOT NULL,
	author varchar(255) NOT NULL,
	body text NOT NULL,
	create_date timestamp DEFAULT NOW(), SYSDATE(),
	PRIMARY KEY (cno)
);


CREATE TABLE user
(
	pw varchar(255) NOT NULL,
	id varchar(255) NOT NULL,
	email varchar(255) NOT NULL,
	nick varchar(255) NOT NULL,
	create_date timestamp DEFAULT NOW(), SYSDATE(),
	photo varchar(255),
	PRIMARY KEY (id)
);



/* Create Foreign Keys */

ALTER TABLE comment
	ADD FOREIGN KEY (bno)
	REFERENCES board (bno)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE board
	ADD FOREIGN KEY (author)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE comment
	ADD FOREIGN KEY (author)
	REFERENCES user (id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



