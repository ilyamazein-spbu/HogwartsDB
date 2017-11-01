CREATE TABLE "Spells" (
	"Spell ID" serial NOT NULL,
	"Subject ID" integer NOT NULL,
	"Spell Name" TEXT NOT NULL,
	"Incantation" TEXT NOT NULL,
	"Description" TEXT NOT NULL,
	"Is an Unforgivable Curse" BOOLEAN NOT NULL,
	CONSTRAINT Spells_pk PRIMARY KEY ("Spell ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Professor Classes" (
	"Subject ID" integer NOT NULL,
	"Professor ID" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Professors" (
	"Professor ID" serial NOT NULL,
	"Professor Name" TEXT NOT NULL UNIQUE,
	"Is Head of House" BOOLEAN NOT NULL,
	"Has a Permanent Teaching Post" BOOLEAN NOT NULL,
	CONSTRAINT Professors_pk PRIMARY KEY ("Professor ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Students" (
	"Student ID" serial NOT NULL,
	"Student Name" TEXT NOT NULL UNIQUE,
	"House ID" integer NOT NULL,
	"Year of Admission" integer NOT NULL,
	"Plays Quidditch" BOOLEAN NOT NULL,
	CONSTRAINT Students_pk PRIMARY KEY ("Student ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Houses" (
	"House ID" serial NOT NULL,
	"House Name" TEXT NOT NULL UNIQUE,
	"House Symbol" TEXT NOT NULL UNIQUE,
	"House Ghost" TEXT NOT NULL UNIQUE,
	"Founder" TEXT NOT NULL UNIQUE,
	CONSTRAINT Houses_pk PRIMARY KEY ("House ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Student Classes" (
    "Subject ID" integer NOT NULL,
	"Student ID" integer NOT NULL
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Subjects" (
	"Subject ID" serial NOT NULL,
	"Subject Name" TEXT NOT NULL,
	"Level of Knowledge" TEXT NOT NULL,
	"Is Compulsory" BOOLEAN NOT NULL,
	"Year" integer NOT NULL,
	CONSTRAINT Subjects_pk PRIMARY KEY ("Subject ID")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "Objects" (
	"Object ID" serial NOT NULL,
	"Subject ID" integer NOT NULL,
	"Object Name" TEXT NOT NULL,
	"Description" TEXT NOT NULL,
	CONSTRAINT Objects_pk PRIMARY KEY ("Object ID")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "Spells" ADD CONSTRAINT "Spells_fk0" FOREIGN KEY ("Subject ID") REFERENCES "Subjects"("Subject ID");

ALTER TABLE "Professor Classes" ADD CONSTRAINT "Professor Classes_fk0" FOREIGN KEY ("Subject ID") REFERENCES "Subjects"("Subject ID");
ALTER TABLE "Professor Classes" ADD CONSTRAINT "Professor Classes_fk1" FOREIGN KEY ("Professor ID") REFERENCES "Professors"("Professor ID");


ALTER TABLE "Students" ADD CONSTRAINT "Students_fk0" FOREIGN KEY ("House ID") REFERENCES "Houses"("House ID");


ALTER TABLE "Student Classes" ADD CONSTRAINT "Student Classes_fk0" FOREIGN KEY ("Student ID") REFERENCES "Students"("Student ID");
ALTER TABLE "Student Classes" ADD CONSTRAINT "Student Classes_fk1" FOREIGN KEY ("Subject ID") REFERENCES "Subjects"("Subject ID");


ALTER TABLE "Objects" ADD CONSTRAINT "Objects_fk0" FOREIGN KEY ("Subject ID") REFERENCES "Subjects"("Subject ID");





INSERT INTO "Houses" VALUES (1, 'Gryffindor', 'Lion', 'Nearly Headless Nick', 'Godrick Gryffindor');
INSERT INTO "Houses" VALUES (2, 'Slytherin', 'Serpent', 'The Bloody Baron', 'Salazar Slytherin');
INSERT INTO "Houses" VALUES (3, 'Ravenclaw', 'Raven', 'The Gray Lady', 'Rowena Ravenclaw');
INSERT INTO "Houses" VALUES (4, 'Hufflepuff', 'Badger', 'The Fat Friar', 'Helga Hufflepuff');



INSERT INTO "Professors" VALUES (1, 'Quirinus Quirrell', FALSE, FALSE);
INSERT INTO "Professors" VALUES (2, 'Gilderoy Lockhart', FALSE, FALSE);
INSERT INTO "Professors" VALUES (3, 'Remus Lupin', FALSE, FALSE);
INSERT INTO "Professors" VALUES (4, 'Bartemius Crouch Jr. posing as Mad-Eye Moody', FALSE, FALSE);
INSERT INTO "Professors" VALUES (5, 'Dolores Umbridge', FALSE, FALSE);
INSERT INTO "Professors" VALUES (6, 'Severus Snape', TRUE, TRUE);
INSERT INTO "Professors" VALUES (7, 'Pomona Sprout', TRUE, TRUE);
INSERT INTO "Professors" VALUES (8, 'Filius Flitwick', TRUE, TRUE);
INSERT INTO "Professors" VALUES (9, 'Minerva McGonagall', TRUE, TRUE);
INSERT INTO "Professors" VALUES (10, 'Rubeus Hagrid', FALSE, FALSE);
INSERT INTO "Professors" VALUES (11, 'Cuthbert Binns', FALSE, TRUE);
INSERT INTO "Professors" VALUES (12, 'Horace Slughorn', FALSE, FALSE);

INSERT INTO "Students" VALUES (1, 'Harry Potter', 1, 1991, TRUE);
INSERT INTO "Students" VALUES (2, 'Ronald Weasley', 1, 1991, FALSE);
INSERT INTO "Students" VALUES (3, 'Hermione Granger', 1, 1991, FALSE);
INSERT INTO "Students" VALUES (4, 'Ginny Weasley', 1, 1992, FALSE);
INSERT INTO "Students" VALUES (5, 'Cho Chang', 3, 1990, TRUE);
INSERT INTO "Students" VALUES (6, 'Colin Creevey', 1, 1992, FALSE);
INSERT INTO "Students" VALUES (7, 'Vincent Crabbe', 2, 1991, FALSE);
INSERT INTO "Students" VALUES (8, 'Gregory Goyle', 2, 1991, FALSE);
INSERT INTO "Students" VALUES (9, 'Luna Lovegood', 3, 1992, FALSE);
INSERT INTO "Students" VALUES (10, 'Neville Longbottom', 1, 1991, FALSE);
INSERT INTO "Students" VALUES (11, 'Draco Malfoy', 2, 1991, TRUE);
INSERT INTO "Students" VALUES (12, 'Cedric Diggory', 3, 1990, FALSE);
INSERT INTO "Students" VALUES (13, 'Susan Bones', 4, 1991, FALSE);
INSERT INTO "Students" VALUES (14, 'Padma Patil', 3, 1991, FALSE);
INSERT INTO "Students" VALUES (15, 'Blaise Zabini', 2, 1991, FALSE);


INSERT INTO "Subjects" VALUES (1, 'Defence Against The Dark Arts', 'Beginner', TRUE, 1991);
INSERT INTO "Subjects" VALUES (2, 'Defence Against The Dark Arts', 'Beginner', TRUE, 1992);
INSERT INTO "Subjects" VALUES (3, 'Defence Against The Dark Arts', 'Beginner Intermediate', TRUE, 1993);
INSERT INTO "Subjects" VALUES (4, 'Defence Against The Dark Arts', 'Intermediate', TRUE, 1994);
INSERT INTO "Subjects" VALUES (5, 'Defence Against The Dark Arts', 'Advanced Intermediate', TRUE, 1995);
INSERT INTO "Subjects" VALUES (6, 'Defence Against The Dark Arts', 'Advanced', TRUE, 1996);
INSERT INTO "Subjects" VALUES (7, 'Herbology', 'Beginner', TRUE, 1991);
INSERT INTO "Subjects" VALUES (8, 'Herbology', 'Beginner', TRUE, 1992);
INSERT INTO "Subjects" VALUES (9, 'Herbology', 'Beginner Intermediate', TRUE, 1993);
INSERT INTO "Subjects" VALUES (10, 'Herbology', 'Intermediate', TRUE, 1994);
INSERT INTO "Subjects" VALUES (11, 'Herbology', 'Advanced Intermediate', TRUE, 1995);
INSERT INTO "Subjects" VALUES (12, 'Herbology', 'Advanced', TRUE, 1996);
INSERT INTO "Subjects" VALUES (13, 'Charms', 'Beginner', TRUE, 1991);
INSERT INTO "Subjects" VALUES (14, 'Charms', 'Beginner', TRUE, 1992);
INSERT INTO "Subjects" VALUES (15, 'Charms', 'Beginner Intermediate', TRUE, 1993);
INSERT INTO "Subjects" VALUES (16, 'Charms', 'Intermediate', TRUE, 1994);
INSERT INTO "Subjects" VALUES (17, 'Charms', 'Advanced Intermediate', TRUE, 1995);
INSERT INTO "Subjects" VALUES (18, 'Charms', 'Advanced', TRUE, 1996);
INSERT INTO "Subjects" VALUES (19, 'Transfiguration', 'Beginner', TRUE, 1991);
INSERT INTO "Subjects" VALUES (20, 'Transfiguration', 'Beginner', TRUE, 1992);
INSERT INTO "Subjects" VALUES (21, 'Transfiguration', 'Beginner Intermediate', TRUE, 1993);
INSERT INTO "Subjects" VALUES (22, 'Transfiguration', 'Intermediate', TRUE, 1994);
INSERT INTO "Subjects" VALUES (23, 'Transfiguration', 'Advanced Intermediate', TRUE, 1995);
INSERT INTO "Subjects" VALUES (24, 'Transfiguration', 'Advanced', TRUE, 1996);
INSERT INTO "Subjects" VALUES (25, 'Care of Magical Creatures', 'Beginner Intermediate', TRUE, 1993);
INSERT INTO "Subjects" VALUES (26, 'Care of Magical Creatures', 'Intermediate', TRUE, 1994);
INSERT INTO "Subjects" VALUES (27, 'Care of Magical Creatures', 'Advanced Intermediate', TRUE, 1995);
INSERT INTO "Subjects" VALUES (28, 'History of Magic', 'Beginner', TRUE, 1991);
INSERT INTO "Subjects" VALUES (29, 'History of Magic', 'Beginner', TRUE, 1992);
INSERT INTO "Subjects" VALUES (30, 'History of Magic', 'Beginner Intermediate', TRUE, 1993);
INSERT INTO "Subjects" VALUES (31, 'History of Magic', 'Intermediate', TRUE, 1994);
INSERT INTO "Subjects" VALUES (32, 'History of Magic', 'Advanced Intermediate', TRUE, 1995);
INSERT INTO "Subjects" VALUES (33, 'Potions', 'Beginner', TRUE, 1991);
INSERT INTO "Subjects" VALUES (34, 'Potions', 'Beginner', TRUE, 1992);
INSERT INTO "Subjects" VALUES (35, 'Potions', 'Beginner Intermediate', TRUE, 1993);
INSERT INTO "Subjects" VALUES (36, 'Potions', 'Intermediate', TRUE, 1994);
INSERT INTO "Subjects" VALUES (37, 'Potions', 'Advanced Intermediate', TRUE, 1995);
INSERT INTO "Subjects" VALUES (38, 'Potions', 'Advanced', TRUE, 1996);
INSERT INTO "Subjects" VALUES (39, 'Potions', 'Advanced', TRUE, 1997);



INSERT INTO "Student Classes" VALUES ( 1 , 1);
INSERT INTO "Student Classes" VALUES ( 1 , 2);
INSERT INTO "Student Classes" VALUES ( 1 , 3);
INSERT INTO "Student Classes" VALUES ( 1 , 7);
INSERT INTO "Student Classes" VALUES ( 1 , 8);
INSERT INTO "Student Classes" VALUES ( 1 , 10);
INSERT INTO "Student Classes" VALUES ( 1 , 11);
INSERT INTO "Student Classes" VALUES ( 1 , 13);
INSERT INTO "Student Classes" VALUES ( 1 , 14);
INSERT INTO "Student Classes" VALUES ( 1 , 15);
INSERT INTO "Student Classes" VALUES ( 2 , 1);
INSERT INTO "Student Classes" VALUES ( 2 , 2);
INSERT INTO "Student Classes" VALUES ( 2 , 3);
INSERT INTO "Student Classes" VALUES ( 2 , 7);
INSERT INTO "Student Classes" VALUES ( 2 , 8);
INSERT INTO "Student Classes" VALUES ( 2 , 10);
INSERT INTO "Student Classes" VALUES ( 2 , 11);
INSERT INTO "Student Classes" VALUES ( 2 , 13);
INSERT INTO "Student Classes" VALUES ( 2 , 14);
INSERT INTO "Student Classes" VALUES ( 2 , 15);
INSERT INTO "Student Classes" VALUES ( 3 , 1);
INSERT INTO "Student Classes" VALUES ( 3 , 2);
INSERT INTO "Student Classes" VALUES ( 3 , 3);
INSERT INTO "Student Classes" VALUES ( 3 , 7);
INSERT INTO "Student Classes" VALUES ( 3 , 8);
INSERT INTO "Student Classes" VALUES ( 3 , 10);
INSERT INTO "Student Classes" VALUES ( 3 , 11);
INSERT INTO "Student Classes" VALUES ( 3 , 13);
INSERT INTO "Student Classes" VALUES ( 3 , 14);
INSERT INTO "Student Classes" VALUES ( 3 , 15);
INSERT INTO "Student Classes" VALUES ( 4 , 1);
INSERT INTO "Student Classes" VALUES ( 4 , 2);
INSERT INTO "Student Classes" VALUES ( 4 , 3);
INSERT INTO "Student Classes" VALUES ( 4 , 7);
INSERT INTO "Student Classes" VALUES ( 4 , 8);
INSERT INTO "Student Classes" VALUES ( 4 , 10);
INSERT INTO "Student Classes" VALUES ( 4 , 11);
INSERT INTO "Student Classes" VALUES ( 4 , 13);
INSERT INTO "Student Classes" VALUES ( 4 , 14);
INSERT INTO "Student Classes" VALUES ( 4 , 15);
INSERT INTO "Student Classes" VALUES ( 5 , 1);
INSERT INTO "Student Classes" VALUES ( 5 , 2);
INSERT INTO "Student Classes" VALUES ( 5 , 3);
INSERT INTO "Student Classes" VALUES ( 5 , 7);
INSERT INTO "Student Classes" VALUES ( 5 , 8);
INSERT INTO "Student Classes" VALUES ( 5 , 10);
INSERT INTO "Student Classes" VALUES ( 5 , 11);
INSERT INTO "Student Classes" VALUES ( 5 , 13);
INSERT INTO "Student Classes" VALUES ( 5 , 14);
INSERT INTO "Student Classes" VALUES ( 5 , 15);
INSERT INTO "Student Classes" VALUES ( 6 , 1);
INSERT INTO "Student Classes" VALUES ( 6 , 2);
INSERT INTO "Student Classes" VALUES ( 6 , 3);
INSERT INTO "Student Classes" VALUES ( 6 , 7);
INSERT INTO "Student Classes" VALUES ( 6 , 8);
INSERT INTO "Student Classes" VALUES ( 6 , 10);
INSERT INTO "Student Classes" VALUES ( 6 , 11);
INSERT INTO "Student Classes" VALUES ( 6 , 13);
INSERT INTO "Student Classes" VALUES ( 6 , 14);
INSERT INTO "Student Classes" VALUES ( 6 , 15);
INSERT INTO "Student Classes" VALUES ( 7 , 1);
INSERT INTO "Student Classes" VALUES ( 7 , 2);
INSERT INTO "Student Classes" VALUES ( 7 , 3);
INSERT INTO "Student Classes" VALUES ( 7 , 7);
INSERT INTO "Student Classes" VALUES ( 7 , 8);
INSERT INTO "Student Classes" VALUES ( 7 , 10);
INSERT INTO "Student Classes" VALUES ( 7 , 11);
INSERT INTO "Student Classes" VALUES ( 7 , 13);
INSERT INTO "Student Classes" VALUES ( 7 , 14);
INSERT INTO "Student Classes" VALUES ( 7 , 15);
INSERT INTO "Student Classes" VALUES ( 8 , 1);
INSERT INTO "Student Classes" VALUES ( 8 , 2);
INSERT INTO "Student Classes" VALUES ( 8 , 3);
INSERT INTO "Student Classes" VALUES ( 8 , 7);
INSERT INTO "Student Classes" VALUES ( 8 , 8);
INSERT INTO "Student Classes" VALUES ( 8 , 10);
INSERT INTO "Student Classes" VALUES ( 8 , 11);
INSERT INTO "Student Classes" VALUES ( 8 , 13);
INSERT INTO "Student Classes" VALUES ( 8 , 14);
INSERT INTO "Student Classes" VALUES ( 8 , 15);
INSERT INTO "Student Classes" VALUES ( 9 , 1);
INSERT INTO "Student Classes" VALUES ( 9 , 2);
INSERT INTO "Student Classes" VALUES ( 9 , 3);
INSERT INTO "Student Classes" VALUES ( 9 , 7);
INSERT INTO "Student Classes" VALUES ( 9 , 8);
INSERT INTO "Student Classes" VALUES ( 9 , 10);
INSERT INTO "Student Classes" VALUES ( 9 , 11);
INSERT INTO "Student Classes" VALUES ( 9 , 13);
INSERT INTO "Student Classes" VALUES ( 9 , 14);
INSERT INTO "Student Classes" VALUES ( 9 , 15);
INSERT INTO "Student Classes" VALUES ( 10 , 1);
INSERT INTO "Student Classes" VALUES ( 10 , 2);
INSERT INTO "Student Classes" VALUES ( 10 , 3);
INSERT INTO "Student Classes" VALUES ( 10 , 7);
INSERT INTO "Student Classes" VALUES ( 10 , 8);
INSERT INTO "Student Classes" VALUES ( 10 , 10);
INSERT INTO "Student Classes" VALUES ( 10 , 11);
INSERT INTO "Student Classes" VALUES ( 10 , 13);
INSERT INTO "Student Classes" VALUES ( 10 , 14);
INSERT INTO "Student Classes" VALUES ( 10 , 15);
INSERT INTO "Student Classes" VALUES ( 11 , 1);
INSERT INTO "Student Classes" VALUES ( 11 , 2);
INSERT INTO "Student Classes" VALUES ( 11 , 3);
INSERT INTO "Student Classes" VALUES ( 11 , 7);
INSERT INTO "Student Classes" VALUES ( 11 , 8);
INSERT INTO "Student Classes" VALUES ( 11 , 10);
INSERT INTO "Student Classes" VALUES ( 11 , 11);
INSERT INTO "Student Classes" VALUES ( 11 , 13);
INSERT INTO "Student Classes" VALUES ( 11 , 14);
INSERT INTO "Student Classes" VALUES ( 11 , 15);
INSERT INTO "Student Classes" VALUES ( 12 , 1);
INSERT INTO "Student Classes" VALUES ( 12 , 2);
INSERT INTO "Student Classes" VALUES ( 12 , 3);
INSERT INTO "Student Classes" VALUES ( 12 , 7);
INSERT INTO "Student Classes" VALUES ( 12 , 8);
INSERT INTO "Student Classes" VALUES ( 12 , 10);
INSERT INTO "Student Classes" VALUES ( 12 , 11);
INSERT INTO "Student Classes" VALUES ( 12 , 13);
INSERT INTO "Student Classes" VALUES ( 12 , 14);
INSERT INTO "Student Classes" VALUES ( 12 , 15);
INSERT INTO "Student Classes" VALUES ( 13 , 1);
INSERT INTO "Student Classes" VALUES ( 13 , 2);
INSERT INTO "Student Classes" VALUES ( 13 , 3);
INSERT INTO "Student Classes" VALUES ( 13 , 7);
INSERT INTO "Student Classes" VALUES ( 13 , 8);
INSERT INTO "Student Classes" VALUES ( 13 , 10);
INSERT INTO "Student Classes" VALUES ( 13 , 11);
INSERT INTO "Student Classes" VALUES ( 13 , 13);
INSERT INTO "Student Classes" VALUES ( 13 , 14);
INSERT INTO "Student Classes" VALUES ( 13 , 15);
INSERT INTO "Student Classes" VALUES ( 14 , 1);
INSERT INTO "Student Classes" VALUES ( 14 , 2);
INSERT INTO "Student Classes" VALUES ( 14 , 3);
INSERT INTO "Student Classes" VALUES ( 14 , 7);
INSERT INTO "Student Classes" VALUES ( 14 , 8);
INSERT INTO "Student Classes" VALUES ( 14 , 10);
INSERT INTO "Student Classes" VALUES ( 14 , 11);
INSERT INTO "Student Classes" VALUES ( 14 , 13);
INSERT INTO "Student Classes" VALUES ( 14 , 14);
INSERT INTO "Student Classes" VALUES ( 14 , 15);
INSERT INTO "Student Classes" VALUES ( 15 , 1);
INSERT INTO "Student Classes" VALUES ( 15 , 2);
INSERT INTO "Student Classes" VALUES ( 15 , 3);
INSERT INTO "Student Classes" VALUES ( 15 , 7);
INSERT INTO "Student Classes" VALUES ( 15 , 8);
INSERT INTO "Student Classes" VALUES ( 15 , 10);
INSERT INTO "Student Classes" VALUES ( 15 , 11);
INSERT INTO "Student Classes" VALUES ( 15 , 13);
INSERT INTO "Student Classes" VALUES ( 15 , 14);
INSERT INTO "Student Classes" VALUES ( 15 , 15);
INSERT INTO "Student Classes" VALUES ( 16 , 1);
INSERT INTO "Student Classes" VALUES ( 16 , 2);
INSERT INTO "Student Classes" VALUES ( 16 , 3);
INSERT INTO "Student Classes" VALUES ( 16 , 7);
INSERT INTO "Student Classes" VALUES ( 16 , 8);
INSERT INTO "Student Classes" VALUES ( 16 , 10);
INSERT INTO "Student Classes" VALUES ( 16 , 11);
INSERT INTO "Student Classes" VALUES ( 16 , 13);
INSERT INTO "Student Classes" VALUES ( 16 , 14);
INSERT INTO "Student Classes" VALUES ( 16 , 15);
INSERT INTO "Student Classes" VALUES ( 17 , 1);
INSERT INTO "Student Classes" VALUES ( 17 , 2);
INSERT INTO "Student Classes" VALUES ( 17 , 3);
INSERT INTO "Student Classes" VALUES ( 17 , 7);
INSERT INTO "Student Classes" VALUES ( 17 , 8);
INSERT INTO "Student Classes" VALUES ( 17 , 10);
INSERT INTO "Student Classes" VALUES ( 17 , 11);
INSERT INTO "Student Classes" VALUES ( 17 , 13);
INSERT INTO "Student Classes" VALUES ( 17 , 14);
INSERT INTO "Student Classes" VALUES ( 17 , 15);
INSERT INTO "Student Classes" VALUES ( 18 , 1);
INSERT INTO "Student Classes" VALUES ( 18 , 2);
INSERT INTO "Student Classes" VALUES ( 18 , 3);
INSERT INTO "Student Classes" VALUES ( 18 , 7);
INSERT INTO "Student Classes" VALUES ( 18 , 8);
INSERT INTO "Student Classes" VALUES ( 18 , 10);
INSERT INTO "Student Classes" VALUES ( 18 , 11);
INSERT INTO "Student Classes" VALUES ( 18 , 13);
INSERT INTO "Student Classes" VALUES ( 18 , 14);
INSERT INTO "Student Classes" VALUES ( 18 , 15);
INSERT INTO "Student Classes" VALUES ( 19 , 1);
INSERT INTO "Student Classes" VALUES ( 19 , 2);
INSERT INTO "Student Classes" VALUES ( 19 , 3);
INSERT INTO "Student Classes" VALUES ( 19 , 7);
INSERT INTO "Student Classes" VALUES ( 19 , 8);
INSERT INTO "Student Classes" VALUES ( 19 , 10);
INSERT INTO "Student Classes" VALUES ( 19 , 11);
INSERT INTO "Student Classes" VALUES ( 19 , 13);
INSERT INTO "Student Classes" VALUES ( 19 , 14);
INSERT INTO "Student Classes" VALUES ( 19 , 15);
INSERT INTO "Student Classes" VALUES ( 20 , 1);
INSERT INTO "Student Classes" VALUES ( 20 , 2);
INSERT INTO "Student Classes" VALUES ( 20 , 3);
INSERT INTO "Student Classes" VALUES ( 20 , 7);
INSERT INTO "Student Classes" VALUES ( 20 , 8);
INSERT INTO "Student Classes" VALUES ( 20 , 10);
INSERT INTO "Student Classes" VALUES ( 20 , 11);
INSERT INTO "Student Classes" VALUES ( 20 , 13);
INSERT INTO "Student Classes" VALUES ( 20 , 14);
INSERT INTO "Student Classes" VALUES ( 20 , 15);
INSERT INTO "Student Classes" VALUES ( 21 , 1);
INSERT INTO "Student Classes" VALUES ( 21 , 2);
INSERT INTO "Student Classes" VALUES ( 21 , 3);
INSERT INTO "Student Classes" VALUES ( 21 , 7);
INSERT INTO "Student Classes" VALUES ( 21 , 8);
INSERT INTO "Student Classes" VALUES ( 21 , 10);
INSERT INTO "Student Classes" VALUES ( 21 , 11);
INSERT INTO "Student Classes" VALUES ( 21 , 13);
INSERT INTO "Student Classes" VALUES ( 21 , 14);
INSERT INTO "Student Classes" VALUES ( 21 , 15);
INSERT INTO "Student Classes" VALUES ( 22 , 1);
INSERT INTO "Student Classes" VALUES ( 22 , 2);
INSERT INTO "Student Classes" VALUES ( 22 , 3);
INSERT INTO "Student Classes" VALUES ( 22 , 7);
INSERT INTO "Student Classes" VALUES ( 22 , 8);
INSERT INTO "Student Classes" VALUES ( 22 , 10);
INSERT INTO "Student Classes" VALUES ( 22 , 11);
INSERT INTO "Student Classes" VALUES ( 22 , 13);
INSERT INTO "Student Classes" VALUES ( 22 , 14);
INSERT INTO "Student Classes" VALUES ( 22 , 15);
INSERT INTO "Student Classes" VALUES ( 23 , 1);
INSERT INTO "Student Classes" VALUES ( 23 , 2);
INSERT INTO "Student Classes" VALUES ( 23 , 3);
INSERT INTO "Student Classes" VALUES ( 23 , 7);
INSERT INTO "Student Classes" VALUES ( 23 , 8);
INSERT INTO "Student Classes" VALUES ( 23 , 10);
INSERT INTO "Student Classes" VALUES ( 23 , 11);
INSERT INTO "Student Classes" VALUES ( 23 , 13);
INSERT INTO "Student Classes" VALUES ( 23 , 14);
INSERT INTO "Student Classes" VALUES ( 23 , 15);
INSERT INTO "Student Classes" VALUES ( 24 , 1);
INSERT INTO "Student Classes" VALUES ( 24 , 2);
INSERT INTO "Student Classes" VALUES ( 24 , 3);
INSERT INTO "Student Classes" VALUES ( 24 , 7);
INSERT INTO "Student Classes" VALUES ( 24 , 8);
INSERT INTO "Student Classes" VALUES ( 24 , 10);
INSERT INTO "Student Classes" VALUES ( 24 , 11);
INSERT INTO "Student Classes" VALUES ( 24 , 13);
INSERT INTO "Student Classes" VALUES ( 24 , 14);
INSERT INTO "Student Classes" VALUES ( 24 , 15);
INSERT INTO "Student Classes" VALUES ( 25 , 1);
INSERT INTO "Student Classes" VALUES ( 25 , 2);
INSERT INTO "Student Classes" VALUES ( 25 , 3);
INSERT INTO "Student Classes" VALUES ( 25 , 7);
INSERT INTO "Student Classes" VALUES ( 25 , 8);
INSERT INTO "Student Classes" VALUES ( 25 , 10);
INSERT INTO "Student Classes" VALUES ( 25 , 11);
INSERT INTO "Student Classes" VALUES ( 25 , 13);
INSERT INTO "Student Classes" VALUES ( 25 , 14);
INSERT INTO "Student Classes" VALUES ( 25 , 15);
INSERT INTO "Student Classes" VALUES ( 26 , 1);
INSERT INTO "Student Classes" VALUES ( 26 , 2);
INSERT INTO "Student Classes" VALUES ( 26 , 3);
INSERT INTO "Student Classes" VALUES ( 26 , 7);
INSERT INTO "Student Classes" VALUES ( 26 , 8);
INSERT INTO "Student Classes" VALUES ( 26 , 10);
INSERT INTO "Student Classes" VALUES ( 26 , 11);
INSERT INTO "Student Classes" VALUES ( 26 , 13);
INSERT INTO "Student Classes" VALUES ( 26 , 14);
INSERT INTO "Student Classes" VALUES ( 26 , 15);
INSERT INTO "Student Classes" VALUES ( 27 , 1);
INSERT INTO "Student Classes" VALUES ( 27 , 2);
INSERT INTO "Student Classes" VALUES ( 27 , 3);
INSERT INTO "Student Classes" VALUES ( 27 , 7);
INSERT INTO "Student Classes" VALUES ( 27 , 8);
INSERT INTO "Student Classes" VALUES ( 27 , 10);
INSERT INTO "Student Classes" VALUES ( 27 , 11);
INSERT INTO "Student Classes" VALUES ( 27 , 13);
INSERT INTO "Student Classes" VALUES ( 27 , 14);
INSERT INTO "Student Classes" VALUES ( 27 , 15);
INSERT INTO "Student Classes" VALUES ( 28 , 1);
INSERT INTO "Student Classes" VALUES ( 28 , 2);
INSERT INTO "Student Classes" VALUES ( 28 , 3);
INSERT INTO "Student Classes" VALUES ( 28 , 7);
INSERT INTO "Student Classes" VALUES ( 28 , 8);
INSERT INTO "Student Classes" VALUES ( 28 , 10);
INSERT INTO "Student Classes" VALUES ( 28 , 11);
INSERT INTO "Student Classes" VALUES ( 28 , 13);
INSERT INTO "Student Classes" VALUES ( 28 , 14);
INSERT INTO "Student Classes" VALUES ( 28 , 15);
INSERT INTO "Student Classes" VALUES ( 29 , 1);
INSERT INTO "Student Classes" VALUES ( 29 , 2);
INSERT INTO "Student Classes" VALUES ( 29 , 3);
INSERT INTO "Student Classes" VALUES ( 29 , 7);
INSERT INTO "Student Classes" VALUES ( 29 , 8);
INSERT INTO "Student Classes" VALUES ( 29 , 10);
INSERT INTO "Student Classes" VALUES ( 29 , 11);
INSERT INTO "Student Classes" VALUES ( 29 , 13);
INSERT INTO "Student Classes" VALUES ( 29 , 14);
INSERT INTO "Student Classes" VALUES ( 29 , 15);
INSERT INTO "Student Classes" VALUES ( 30 , 1);
INSERT INTO "Student Classes" VALUES ( 30 , 2);
INSERT INTO "Student Classes" VALUES ( 30 , 3);
INSERT INTO "Student Classes" VALUES ( 30 , 7);
INSERT INTO "Student Classes" VALUES ( 30 , 8);
INSERT INTO "Student Classes" VALUES ( 30 , 10);
INSERT INTO "Student Classes" VALUES ( 30 , 11);
INSERT INTO "Student Classes" VALUES ( 30 , 13);
INSERT INTO "Student Classes" VALUES ( 30 , 14);
INSERT INTO "Student Classes" VALUES ( 30 , 15);
INSERT INTO "Student Classes" VALUES ( 31 , 1);
INSERT INTO "Student Classes" VALUES ( 31 , 2);
INSERT INTO "Student Classes" VALUES ( 31 , 3);
INSERT INTO "Student Classes" VALUES ( 31 , 7);
INSERT INTO "Student Classes" VALUES ( 31 , 8);
INSERT INTO "Student Classes" VALUES ( 31 , 10);
INSERT INTO "Student Classes" VALUES ( 31 , 11);
INSERT INTO "Student Classes" VALUES ( 31 , 13);
INSERT INTO "Student Classes" VALUES ( 31 , 14);
INSERT INTO "Student Classes" VALUES ( 31 , 15);
INSERT INTO "Student Classes" VALUES ( 32 , 1);
INSERT INTO "Student Classes" VALUES ( 32 , 2);
INSERT INTO "Student Classes" VALUES ( 32 , 3);
INSERT INTO "Student Classes" VALUES ( 32 , 7);
INSERT INTO "Student Classes" VALUES ( 32 , 8);
INSERT INTO "Student Classes" VALUES ( 32 , 10);
INSERT INTO "Student Classes" VALUES ( 32 , 11);
INSERT INTO "Student Classes" VALUES ( 32 , 13);
INSERT INTO "Student Classes" VALUES ( 32 , 14);
INSERT INTO "Student Classes" VALUES ( 32 , 15);
INSERT INTO "Student Classes" VALUES ( 33 , 1);
INSERT INTO "Student Classes" VALUES ( 33 , 2);
INSERT INTO "Student Classes" VALUES ( 33 , 3);
INSERT INTO "Student Classes" VALUES ( 33 , 7);
INSERT INTO "Student Classes" VALUES ( 33 , 8);
INSERT INTO "Student Classes" VALUES ( 33 , 10);
INSERT INTO "Student Classes" VALUES ( 33 , 11);
INSERT INTO "Student Classes" VALUES ( 33 , 13);
INSERT INTO "Student Classes" VALUES ( 33 , 14);
INSERT INTO "Student Classes" VALUES ( 33 , 15);
INSERT INTO "Student Classes" VALUES ( 34 , 1);
INSERT INTO "Student Classes" VALUES ( 34 , 2);
INSERT INTO "Student Classes" VALUES ( 34 , 3);
INSERT INTO "Student Classes" VALUES ( 34 , 7);
INSERT INTO "Student Classes" VALUES ( 34 , 8);
INSERT INTO "Student Classes" VALUES ( 34 , 10);
INSERT INTO "Student Classes" VALUES ( 34 , 11);
INSERT INTO "Student Classes" VALUES ( 34 , 13);
INSERT INTO "Student Classes" VALUES ( 34 , 14);
INSERT INTO "Student Classes" VALUES ( 34 , 15);
INSERT INTO "Student Classes" VALUES ( 35 , 1);
INSERT INTO "Student Classes" VALUES ( 35 , 2);
INSERT INTO "Student Classes" VALUES ( 35 , 3);
INSERT INTO "Student Classes" VALUES ( 35 , 7);
INSERT INTO "Student Classes" VALUES ( 35 , 8);
INSERT INTO "Student Classes" VALUES ( 35 , 10);
INSERT INTO "Student Classes" VALUES ( 35 , 11);
INSERT INTO "Student Classes" VALUES ( 35 , 13);
INSERT INTO "Student Classes" VALUES ( 35 , 14);
INSERT INTO "Student Classes" VALUES ( 35 , 15);
INSERT INTO "Student Classes" VALUES ( 36 , 1);
INSERT INTO "Student Classes" VALUES ( 36 , 2);
INSERT INTO "Student Classes" VALUES ( 36 , 3);
INSERT INTO "Student Classes" VALUES ( 36 , 7);
INSERT INTO "Student Classes" VALUES ( 36 , 8);
INSERT INTO "Student Classes" VALUES ( 36 , 10);
INSERT INTO "Student Classes" VALUES ( 36 , 11);
INSERT INTO "Student Classes" VALUES ( 36 , 13);
INSERT INTO "Student Classes" VALUES ( 36 , 14);
INSERT INTO "Student Classes" VALUES ( 36 , 15);
INSERT INTO "Student Classes" VALUES ( 37 , 1);
INSERT INTO "Student Classes" VALUES ( 37 , 2);
INSERT INTO "Student Classes" VALUES ( 37 , 3);
INSERT INTO "Student Classes" VALUES ( 37 , 7);
INSERT INTO "Student Classes" VALUES ( 37 , 8);
INSERT INTO "Student Classes" VALUES ( 37 , 10);
INSERT INTO "Student Classes" VALUES ( 37 , 11);
INSERT INTO "Student Classes" VALUES ( 37 , 13);
INSERT INTO "Student Classes" VALUES ( 37 , 14);
INSERT INTO "Student Classes" VALUES ( 37 , 15);
INSERT INTO "Student Classes" VALUES ( 38 , 1);
INSERT INTO "Student Classes" VALUES ( 38 , 2);
INSERT INTO "Student Classes" VALUES ( 38 , 3);
INSERT INTO "Student Classes" VALUES ( 38 , 7);
INSERT INTO "Student Classes" VALUES ( 38 , 8);
INSERT INTO "Student Classes" VALUES ( 38 , 10);
INSERT INTO "Student Classes" VALUES ( 38 , 11);
INSERT INTO "Student Classes" VALUES ( 38 , 13);
INSERT INTO "Student Classes" VALUES ( 38 , 14);
INSERT INTO "Student Classes" VALUES ( 38 , 15);
INSERT INTO "Student Classes" VALUES ( 39 , 1);
INSERT INTO "Student Classes" VALUES ( 39 , 2);
INSERT INTO "Student Classes" VALUES ( 39 , 3);
INSERT INTO "Student Classes" VALUES ( 39 , 7);
INSERT INTO "Student Classes" VALUES ( 39 , 8);
INSERT INTO "Student Classes" VALUES ( 39 , 10);
INSERT INTO "Student Classes" VALUES ( 39 , 11);
INSERT INTO "Student Classes" VALUES ( 39 , 13);
INSERT INTO "Student Classes" VALUES ( 39 , 14);
INSERT INTO "Student Classes" VALUES ( 39 , 15);



INSERT INTO "Professor Classes" VALUES (1, 1);
INSERT INTO "Professor Classes" VALUES (2, 2);
INSERT INTO "Professor Classes" VALUES (3, 3);
INSERT INTO "Professor Classes" VALUES (4, 4);
INSERT INTO "Professor Classes" VALUES (5, 5);
INSERT INTO "Professor Classes" VALUES (6, 6);
INSERT INTO "Professor Classes" VALUES ( 7 ,  7 );
INSERT INTO "Professor Classes" VALUES ( 8 ,  7 );
INSERT INTO "Professor Classes" VALUES ( 9 ,  7 );
INSERT INTO "Professor Classes" VALUES ( 10 ,  7 );
INSERT INTO "Professor Classes" VALUES ( 11 ,  7 );
INSERT INTO "Professor Classes" VALUES ( 12 ,  7 );
INSERT INTO "Professor Classes" VALUES ( 13 ,  8 );
INSERT INTO "Professor Classes" VALUES ( 14 ,  8 );
INSERT INTO "Professor Classes" VALUES ( 15 ,  8 );
INSERT INTO "Professor Classes" VALUES ( 16 ,  8 );
INSERT INTO "Professor Classes" VALUES ( 17 ,  8 );
INSERT INTO "Professor Classes" VALUES ( 18 ,  8 );
INSERT INTO "Professor Classes" VALUES ( 19 ,  9 );
INSERT INTO "Professor Classes" VALUES ( 20 ,  9 );
INSERT INTO "Professor Classes" VALUES ( 21 ,  9 );
INSERT INTO "Professor Classes" VALUES ( 22 ,  9 );
INSERT INTO "Professor Classes" VALUES ( 23 ,  9 );
INSERT INTO "Professor Classes" VALUES ( 24 ,  9 );
INSERT INTO "Professor Classes" VALUES ( 25 ,  10 );
INSERT INTO "Professor Classes" VALUES ( 26 ,  10 );
INSERT INTO "Professor Classes" VALUES ( 27 ,  10 );
INSERT INTO "Professor Classes" VALUES ( 28 ,  11 );
INSERT INTO "Professor Classes" VALUES ( 29 ,  11 );
INSERT INTO "Professor Classes" VALUES ( 30 ,  11 );
INSERT INTO "Professor Classes" VALUES ( 31 ,  11 );
INSERT INTO "Professor Classes" VALUES ( 32 ,  11 );
INSERT INTO "Professor Classes" VALUES ( 33 ,  6 );
INSERT INTO "Professor Classes" VALUES ( 34 ,  6 );
INSERT INTO "Professor Classes" VALUES ( 35 ,  6 );
INSERT INTO "Professor Classes" VALUES ( 36 ,  6 );
INSERT INTO "Professor Classes" VALUES ( 37 ,  6 );
INSERT INTO "Professor Classes" VALUES ( 38 ,  12 );
INSERT INTO "Professor Classes" VALUES ( 39 ,  6 );



INSERT INTO "Spells" VALUES ( 1 , 1 , 'The Knockback Jinx', 'Flipendo', 'Physically repells an opponent, knocks away an object or blasts apart fragile objects.', FALSE);
INSERT INTO "Spells" VALUES ( 2 , 1 , 'The Wand-Lighting Charm', 'Lumos', 'Illuminates the tip of the casters wand; this light is fairly warm.', FALSE);
INSERT INTO "Spells" VALUES ( 3 , 1 , 'Curse of the Bogies', 'Mucus ad Nauseam', 'Gives the recipient a strong cold, that can make him or her collapse if not treated, as well as an extremely runny nose.', FALSE);
INSERT INTO "Spells" VALUES ( 4 , 2 , 'The Disarming Charm', 'Expelliarmus', 'Forces the victim to release whatever they are holding at the time.', FALSE);
INSERT INTO "Spells" VALUES ( 5 , 2 , 'The Tongue-Tying Curse', 'Mimblewimble', 'Binds the targets tongue to keep him or her from talking about a specific subject. This feature also allows one to prevent their victim from incanting.', FALSE);
INSERT INTO "Spells" VALUES ( 6 , 2 , 'The Full Body-Bind Curse', 'Petrificus Totalus', 'Paralyses the opponent.', FALSE);
INSERT INTO "Spells" VALUES ( 7 , 3 , 'The Boggart-Banishing Spell', 'Riddikulus', 'Causes the Boggart to assume a form that is humorous to the caster, along with a whip-crack noise, thereby counteracting the creautures ability to terrorise.', FALSE);
INSERT INTO "Spells" VALUES ( 8 , 3 , 'The Patronus Charm', 'Expecto Patronum', 'Evokes a partially-tangible positive energy force known as a Patronus or spirit guardian. It is the primary protection against Dementors and Lethifolds, against which there are no other defences.', FALSE);
INSERT INTO "Spells" VALUES ( 9 , 3 , 'The Orbis Jinx', 'Orbis', 'A type of earth magic, can only be used if an ally is levitating the target whilst the spell is being cast. Encases the target in an orb and drags them into the earth.', FALSE);
INSERT INTO "Spells" VALUES ( 10 , 4 , 'The Cruciatus Curse', 'Crucio', 'Inflicts intense, excruciating pain on the victim. The use of this curse on another human being is a life-long sentence in Azkaban.', TRUE);
INSERT INTO "Spells" VALUES ( 11 , 4 , 'The Imperius Curse', 'Imperio', 'Places the victim completely under the casters control, though a person with exceptional strength of will is capable of resisting it.', TRUE);
INSERT INTO "Spells" VALUES ( 12 , 4 , 'The Killing Curse', 'Avada Kedavra', 'Causes instantaneous and painless death, without any signs of violence on the body.', TRUE);
INSERT INTO "Spells" VALUES ( 13 , 6 , 'Levicorpus', 'Levicorpus', 'Causes the victim to be hoisted into the air by their ankle.', FALSE);
INSERT INTO "Spells" VALUES ( 14 , 6 , 'The Stunning Spell', 'Stupefy', 'Renders a victim unconscious and halts moving objects.', FALSE);
INSERT INTO "Spells" VALUES ( 15 , 6 , 'The Disarming Charm (revision)', 'Expelliarmus', 'Forces the victim to release whatever they are holding at the time.', FALSE);
INSERT INTO "Spells" VALUES ( 16 , 7 , 'The Fire-Making Spell', 'Incendio', 'A charm and a form of Conjuration that can be used to conjure a jet of orange and red flame, thereby setting things alight.', FALSE);
INSERT INTO "Spells" VALUES ( 17 , 7 , 'The Severing Charm', 'Diffindo', 'A charm used to precisely and accurately cut something.', FALSE);
INSERT INTO "Spells" VALUES ( 18 , 8 , 'The Severing Charm (revision)', 'Diffindo', 'A charm used to precisely and accurately cut something.', FALSE);
INSERT INTO "Spells" VALUES ( 19 , 8 , 'Incendio Duo', 'Incendio Duo', 'A more powerful version of Incendio, an elementary charm that conjures flames.', FALSE);
INSERT INTO "Spells" VALUES ( 20 , 9 , 'Incendio Tria', 'Incendio Tria', 'An improvement over both Incendio and Incendio Duo, and consequently creates larger flames than either spell.', FALSE);
INSERT INTO "Spells" VALUES ( 21 , 10 , 'Orchideous', 'Orchideous', 'A Transfiguration spell that conjures a bouquet of flowers from the end of the casters wand.', FALSE);
INSERT INTO "Spells" VALUES ( 22 , 10 , 'The Herbivicus Charm', 'Herbivicus', 'A charm used to rapidly increase the growth rate of plants and cause flowers to bloom.', FALSE);
INSERT INTO "Spells" VALUES ( 23 , 13 , 'The Levitation Charm', 'Wingardium Leviosa', 'A charm used to make objects fly, or levitate, taught to first years at Hogwarts School of Witchcraft and Wizardry.', FALSE);
INSERT INTO "Spells" VALUES ( 24 , 13 , 'The Unlocking Charm', 'Alohomora', 'A charm that unlocks and opens doors and windows that are not protected by magic. It is also able to open doors locked by the Locking Spell (Colloportus).', FALSE);
INSERT INTO "Spells" VALUES ( 25 , 13 , 'The Mending Charm', 'Reparo', 'A charm that can be used to seamlessly repair a broken object and works on most materials.', FALSE);
INSERT INTO "Spells" VALUES ( 26 , 14 , 'The General Counter-Spell', 'Finite Incantatem', 'A counter-spell for general use.', FALSE);
INSERT INTO "Spells" VALUES ( 27 , 14 , 'The Memory Charm', 'Obliviate', 'A spell that can be used to erase memories from an individuals mind.', FALSE);
INSERT INTO "Spells" VALUES ( 28 , 14 , 'Arresto Momentum', 'Arresto Momentum', 'A charm that can be used by a witch or wizard to slow the velocity of an object.', FALSE);
INSERT INTO "Spells" VALUES ( 29 , 15 , 'The Cheering Charm', 'unknown', 'A spell which makes a person happy. When the spell is overdone, it can cause the victim to be overcome with fits of hysterical laughter.', FALSE);
INSERT INTO "Spells" VALUES ( 30 , 15 , 'The Seize and Pull Charm', 'Carpe Retractum', 'A charm that creates a retractable, magical rope made of light. This rope can be used to pull objects within a certain distance towards the caster, or to pull the caster toward whatever they affix the spell to.', FALSE);
INSERT INTO "Spells" VALUES ( 31 , 15 , 'The Freezing Spell', 'Glacius', 'A freezing charm that causes air in front of the tip of the wand, to reach cold temperatures in the extreme, which in turn can extinguish fires, create ice blocks from water, and cool off salamanders.', FALSE);
INSERT INTO "Spells" VALUES ( 32 , 16 , 'The Summoning Charm', 'Accio', 'A charm that causes a target at a distance from the caster to levitate or fly over to them. This spell needs thought behind it, the object must be clear in the casters mind, before trying to summon.', FALSE);
INSERT INTO "Spells" VALUES ( 33 , 16 , 'The Banishing Charm', 'Depulso', 'The counter-charm to the Summoning Charm. As Accio summons objects to the caster, Depulso sends both objects and living things away from the caster. Unlike the Summoning Charm, which can summon specific objects from anywhere, the Banishing Charm banishes whatever the wand is aimed at.', FALSE);
INSERT INTO "Spells" VALUES ( 34 , 17 , 'The Silencing Charm', 'Silencio', 'A charm that renders the victim temporarily mute, working on both beasts and beings. It is immensely difficult to perform, more so on ravens than frogs.', FALSE);
INSERT INTO "Spells" VALUES ( 35 , 17 , 'Spell for Growing Legs', 'unknown', 'A charm used to grow legs on an object. It was a piece of advanced magic, as it was featured in the advanced pack of the Cast-a-Spell Kit.', FALSE);
INSERT INTO "Spells" VALUES ( 36 , 18 , 'The Water-Making Spell', 'Aguamenti', 'A charm that conjures a jet of clear, pure water and shoots it from the tip of the casters wand.', FALSE);
INSERT INTO "Spells" VALUES ( 37 , 18 , 'Vinegar to Wine Charm', 'unknown', 'Turns vinegar into wine.', FALSE);
INSERT INTO "Spells" VALUES ( 38 , 19 , 'Match to needle Spell', 'unknown', 'Transforms a match into a needle. It is one of the simplest transfiguration spells.', FALSE);
INSERT INTO "Spells" VALUES ( 39 , 19 , 'The Switching Spell', 'unknown', 'One of many transforming spells used to swap two different objects for one another. They are studied in the fourth year in transfiguration class. Hermione Granger, however, gained points for knowing about this spell in her first year.', FALSE);
INSERT INTO "Spells" VALUES ( 40 , 19 , 'Mice to Snuffboxes', 'unknown', 'Transfigures mice into snuffboxes.', FALSE);
INSERT INTO "Spells" VALUES ( 41 , 20 , 'Beetle Buttons Charm', 'unknown', 'A transforming spell that transfigures a beetle into a coat button.', FALSE);
INSERT INTO "Spells" VALUES ( 42 , 20 , 'Rabbit Slippers Spell', 'unknown', 'A Transforming spell that transfigures a pair of white rabbits into slippers.', FALSE);
INSERT INTO "Spells" VALUES ( 43 , 20 , 'Vera Verto', 'Vera Verto', 'Transforms an animal into a water goblet.', FALSE);
INSERT INTO "Spells" VALUES ( 44 , 21 , 'Teapot to Tortoise Spell', 'unknown', 'Transforms a teapot into a tortoise.', FALSE);
INSERT INTO "Spells" VALUES ( 45 , 21 , 'The Lapifors Spell', 'Lapifors', 'A transfiguration spell that can be used to transform the target into a rabbit; it works best on smaller artefacts such as statues, salamanders and cats.', FALSE);
INSERT INTO "Spells" VALUES ( 46 , 21 , 'The Draconifors Spell', 'Draconifors', 'A Transfiguration spell used to transform small objects into Dragons, which can then be controlled by the caster.', FALSE);
INSERT INTO "Spells" VALUES ( 47 , 22 , 'Hedgehog to Pincushion', 'unknown', 'A Transforming spell covered in Hogwarts Transfiguration classes between the first and the fourth year. By 1994, Harry Potter and his classmates, excluding Hermione Granger, still had not mastered the spell.', FALSE);
INSERT INTO "Spells" VALUES ( 48 , 22 , 'Guinea Fowl to Guinea Pig', 'unknown', 'A Transforming spell that is covered in fourth year Transfiguration classes at Hogwarts School of Witchcraft and Wizardry. Neville Longbottom was not particularly skilled with these spells.', FALSE);
INSERT INTO "Spells" VALUES ( 49 , 23 , 'The Inanimatus Conjurus Spell', 'Inanimatus Conjurus', 'A Transfiguration spell of unknown effect although, given the name, it is likely used to conjure inanimate artefacts.', FALSE);
INSERT INTO "Spells" VALUES ( 50 , 23 , 'The Doubling Charm', 'Geminio', 'A spell used to duplicate an object, creating an exact replica of the target entity.', FALSE);
INSERT INTO "Spells" VALUES ( 51 , 23 , 'The Vanishing Spell', 'Evanesco', ' a Transfiguration spell used to vanish both animate and inanimate objects into non-being, which is to say, everything.', FALSE);
INSERT INTO "Spells" VALUES ( 52 , 24 , 'Crinus Muto', 'Crinus Muto', 'a Transfiguration spell that can be used to transform the colour and style of the casters hair.', FALSE);
INSERT INTO "Spells" VALUES ( 53 , 24 , 'The Bird-Conjuring Charm', 'Avis', 'A spell that conjures a flock of birds. This charm is an advanced form of Transfiguration, taught at N.E.W.T.-level at Hogwarts School of Witchcraft and Wizardry.', FALSE);

INSERT INTO "Objects" VALUES ( 1 , 1 , 'The Bowtruckle', 'A hand-sized, insect eating, tree dweller with long sharp fingers (two on each hand), brown eyes, and a general appearance of a flat-faced little stickman made of bark and twigs, which serves well as camouflage in its natural habitat.');
INSERT INTO "Objects" VALUES ( 2 , 1 , 'Ghosts', 'Disembodied spirits of once-living wizards or witches.');
INSERT INTO "Objects" VALUES ( 3 , 1 , 'The Fire Crab', 'A large, turtle-like crab creature native to the island of Fiji. It has six legs, and a heavily jewelled shell, with different colours. It is able to defend itself by shooting flames from its rear end when it is attacked.');
INSERT INTO "Objects" VALUES ( 4 , 2 , 'The Pixie', 'A small, bright blue mischief-maker, and loves tricks and practical jokes. It is able to fly, and enjoys lifting people up by their ears and depositing them on the tops of trees and buildings, showing incredible strength for creatures of their size. Pixies can only communicate with other pixies; their voices are described as so shrill it was like listening to a lot of arguing budgies.');
INSERT INTO "Objects" VALUES ( 5 , 2 , 'The Troll', 'A magical creature of prodigious strength and immense stupidity. In fact, they are so stupid that they actually had a wizarding exam failing grade named after them.');
INSERT INTO "Objects" VALUES ( 6 , 2 , 'The Werewolf ', 'A human being who, upon the complete rising of the full moon, becomes a fearsome and deadly near-wolf. This condition is caused by infection with lycanthropy, also known as werewolfry.');
INSERT INTO "Objects" VALUES ( 7 , 3 , 'The Boggart', 'An amortal shape-shifting non-being that takes on the form of the viewers worst fear. Because of their shape-shifting ability, no one knows what a boggart looks like when it is alone, as it instantly changes into ones worst fears when one first sees it.');
INSERT INTO "Objects" VALUES ( 8 , 3 , 'The Grindylow', 'A small, horned, pale-green water demon');
INSERT INTO "Objects" VALUES ( 9 , 3 , 'The Red Cap', 'A small, dwarf-like creature that lives where blood had been shed, such as in the dungeons of castles, the potholes of old battlefields, or simply in holes underground. They attack those who have gotten lost, and though they are extremely dangerous to lone Muggles, a wizard can repel them with charms and hexes.');
INSERT INTO "Objects" VALUES ( 10 , 4 , 'The Erkling', 'An elfish creature, three feet tall on average (making it larger than a gnome) with a pointed face, which has a particular affinity for the taste of children. Their high pitch cackles are particularly entrancing to children, and they use this to lure them away from their guardians to eat them. These creatures also enjoy shooting darts at unsuspecting victims.');
INSERT INTO "Objects" VALUES ( 11 , 4 , 'The Dugbog', 'A marsh-dwelling magical creature, resembling a piece of dead wood while stationary. It has finned paws and sharp teeth, and glides through marshland, feeding on small animals, and occasionally attacking the ankles of humans who ventured into its habitat.');
INSERT INTO "Objects" VALUES ( 12 , 4 , 'The Blast-Ended Skrewt', 'A hybrid creature bred by Rubeus Hagrid in the autumn of 1994, by crossing Manticores and Fire crabs. Whether Hagrid used magic or somehow got the two to mate is unknown.');
INSERT INTO "Objects" VALUES ( 13 , 5 , 'Conflict avoidance', 'unknown');
INSERT INTO "Objects" VALUES ( 14 , 5 , 'Fleeing', 'unknown');
INSERT INTO "Objects" VALUES ( 15 , 5 , 'The Iguana', 'A type of lizard possibly involved with Dark Magic.');
INSERT INTO "Objects" VALUES ( 16 , 5 , 'The Vampire Bat', 'A type of bat possibly involved with Dark Magic.');
INSERT INTO "Objects" VALUES ( 17 , 6 , 'Dementors', 'Gliding, wraith-like dark creatures, widely considered to be one of the foulest to inhabit the world. Dementors feed on human happiness and thus generate feelings of depression and despair in any person in close proximity to them. They can also consume a persons soul, leaving their victims in a permanent vegetative state.');
INSERT INTO "Objects" VALUES ( 18 , 6 , 'The Inferius', 'A dead body, reanimated by a Dark Wizards spell. They are similar, but intrinsically distinct from a zombie. Inferi are created through the magical branch of Dark Arts called Necromancy, which is the art of raising the dead.');
INSERT INTO "Objects" VALUES ( 19 , 7 , 'Venomous Tentacula', 'A green, spiky, toothsome plant with mobile vines that try to grab living prey. Venomous Tentacula expels venom from its shoots, and its spikes are deadly.');
INSERT INTO "Objects" VALUES ( 20 , 7 , 'Devils Snare', 'A plant with the magical ability to constrict or strangle anything in its surrounding environment or something that happens to touch it. Struggling or resistance to Devils Snare will cause the plant to exert a greater force of constriction.');
INSERT INTO "Objects" VALUES ( 21 , 7 , 'Spiky Bushes', 'Bushes with spikes growing out of them. They can shoot these spikes at humans, but can be destroyed using the Fire-Making Spell.');
INSERT INTO "Objects" VALUES ( 22 , 8 , 'Mandrake a.k.a Mandragora', 'A plant which has a root that looks like a human (like a baby when the plant is young, but maturing as the plant grows). When matured, its cry can be fatal to any person who hears it.');
INSERT INTO "Objects" VALUES ( 23 , 8 , 'The Slug', 'A gastropod similar to the snail, but without a shell. In 1992, Ron Weasley began vomiting slugs after his attempt to curse Draco Malfoy backfired due to his broken wand.');
INSERT INTO "Objects" VALUES ( 24 , 8 , 'Leaping Toadstool', 'A magical mushroom which has the ability to jump. Ernie Macmillan asked Harry Potter to hand him a bucket filled with these toadstools during a Herbology class in their second year.');
INSERT INTO "Objects" VALUES ( 25 , 9 , 'The Puffapod', 'A magical plant that produces large pink seedpods full of shining beans, which instantly flower when they come into contact with any solid object.');
INSERT INTO "Objects" VALUES ( 26 , 10 , 'Bubotuber Pus', 'The liquid found in the swellings of the magical Bubotuber plant. It is very valuable for its acne-ridding qualities. It is a thick, yellowish-green liquid and smells strongly of petrol.');
INSERT INTO "Objects" VALUES ( 27 , 10 , 'Gillyweed', 'A magical plant native to the Mediterranean Sea. When it is eaten by a witch or wizard, one grows gills and webbing between the fingers and toes, allowing them to process oxygen from water and navigate underwater more easily.');
INSERT INTO "Objects" VALUES ( 28 , 11 , 'Screechsnap', 'A magical plant with the ability to move and make noise. It was also a semi-sentient plant for having the ability to feel both pain and pleasure.');
INSERT INTO "Objects" VALUES ( 29 , 11 , 'Fanged Geranium', 'A magical flower with sharp teeth. Its fangs are used as potion ingredients, as well as in wizarding foodstuffs.');
INSERT INTO "Objects" VALUES ( 30 , 12 , 'Snargaluff', 'A plant with the appearance of a gnarled stump, but hides dangerous thorn-covered vines that attack when provoked and is usually best handled by more than one person. It contains green pulsating pods about the size of a grapefruit which can be extracted.');
INSERT INTO "Objects" VALUES ( 31 , 25 , 'The Hippogriff', 'A magical creature that has the front legs, wings, and head of a giant eagle and the body, hind legs and tail of a horse.');
INSERT INTO "Objects" VALUES ( 32 , 25 , 'The Flobberworm', 'A ten-inch, toothless brown worm which eats vegetation, especially lettuce and cabbage.');
INSERT INTO "Objects" VALUES ( 33 , 25 , 'The Salamander', 'A small fire dwelling lizard that feeds on flames. They are born out of flames, specifically called salamander fires, and appear to be blue or red depending on the heat of the flames. They live as long as the flames that spawned them.');
INSERT INTO "Objects" VALUES ( 34 , 26 , 'The Niffler', 'A creature with a long snout and a coat of black, fluffy fur. They are attracted to shiny things, which made them wonderful for locating treasure, but this also means that they could wreak havoc if kept (or set loose) indoors.');
INSERT INTO "Objects" VALUES ( 35 , 26 , 'The Unicorn', 'A white, equine creature with a single horn on its forehead. Revered by Muggles and wizards alike, it is one of natures purest and most beautiful magical creatures. As such, the slaying of one is considered a terrible crime and doing so carries terrible consequences.');
INSERT INTO "Objects" VALUES ( 36 , 27 , 'The Thestral', 'A breed of winged horses with a skeletal body, face with reptilian features, and wide, leathery wings that resemble a bats. They are very rare, and are considered dangerous by the Ministry of Magic. Thestrals are, undeservedly, known as omens of misfortune and aggression by many wizards because they are visible only to those who have witnessed death at least once.');
INSERT INTO "Objects" VALUES ( 37 , 28 , 'Emeric the Evil', 'A short-lived but exceptionally aggressive wizard. He was once the master of the Elder Wand and, with it, he terrorised the south of England in the early Middle Ages. He was slaughtered in a ferocious duel against Egbert the Egregious.');
INSERT INTO "Objects" VALUES ( 38 , 28 , 'Soap Blizzard of 1378', 'A blizzard of soap that occurred sometime in 1378. This blizzard was followed by a burst of the wizarding economic bubble.');
INSERT INTO "Objects" VALUES ( 39 , 29 , 'Medieval Assembly of European Wizards', 'A European wizarding organisation operating across continental Europe. They may have had some relation to the International Warlock Convention of 1289, with which a sub-committee of Sardinian sorcerers was involved in September of that year.');
INSERT INTO "Objects" VALUES ( 40 , 29 , 'International Warlock Convention of 1289', 'A meeting held in 1289. Nothing is known about what was decided at this convention. The Medieval Assembly of European Wizards may have contributed to this convention. A subcommittee of Sardinian sorcerers was also involved in the convention in some capacity.');
INSERT INTO "Objects" VALUES ( 41 , 30 , 'Witch Hunts', 'unknown');
INSERT INTO "Objects" VALUES ( 42 , 31 , 'Goblin Rebellions', 'A series of rebellions in which the goblin population of the Wizarding world revolted against discrimination and prejudice toward their kind by wizards and witches. They were most prevalent during the seventeenth and eighteenth centuries.');
INSERT INTO "Objects" VALUES ( 43 , 32 , 'Giant wars', 'Wizarding bellicose conflicts that had historical significance, having taken place in, or earlier to, the end of the nineteenth century.');
INSERT INTO "Objects" VALUES ( 44 , 33 , 'The Forgetfulness Potion', 'A potion which causes an unknown degree of memory loss in the drinker.');
INSERT INTO "Objects" VALUES ( 45 , 33 , 'The Wideye Potion', 'A potion which prevents the drinker from falling asleep and can also be used to awaken someone from drugging or concussion.');
INSERT INTO "Objects" VALUES ( 46 , 33 , 'The Herbicide Potion', 'A potion that kills or damages plants. It has a disgusting taste and is not for human consumption since it may affect the drinkers health.');
INSERT INTO "Objects" VALUES ( 47 , 34 , 'The Sleeping Draught', 'A potion that causes the drinker to fall almost instantaneously into a deep but temporary sleep.');
INSERT INTO "Objects" VALUES ( 48 , 34 , 'The Swelling Solution', 'A potion which causes whatever it touches to swell in size; its three key ingredients (the only ingredients in it) are bat spleens, dried nettles, and puffer-fish eyes.');
INSERT INTO "Objects" VALUES ( 49 , 34 , 'The Hair-Raising Potion', 'A potion that causes the drinkers hair to stand on end. One of the known ingredients is rat tails.');
INSERT INTO "Objects" VALUES ( 50 , 35 , 'The Antidote to Uncommon Poisons', 'a potion that cures minor magical or uncommon poisons such as doxy bites. The ingredients required are fire seed, graphorn horn, billywig stings and chizpurfle carapaces.');
INSERT INTO "Objects" VALUES ( 51 , 35 , 'The Shrinking Solution', 'A potion that causes the drinker to shrink to a younger form. It is bright green when brewed correctly and, if prepared incorrectly, it can apparently be poisonous.');
INSERT INTO "Objects" VALUES ( 52 , 35 , 'The Girding Potion', 'A potion that gives the consumer extra endurance. It presumably has a rather foul odour, as Hermione Granger noted when making it in 1996.');
INSERT INTO "Objects" VALUES ( 53 , 36 , 'Skelegro', 'a dreadful-tasting potion which causes vanished or otherwise lost bones to regrow in a notably slow and painful process.');
INSERT INTO "Objects" VALUES ( 54 , 36 , 'The Hiccoughing Solution', 'A potion that causes hiccoughs.');
INSERT INTO "Objects" VALUES ( 55 , 36 , 'The Wit-Sharpening Potion', 'A potion which allows the drinker to think more clearly. Due to this, it acts a a counteragent to the Confundus Charm.');
INSERT INTO "Objects" VALUES ( 56 , 37 , 'The Invigoration Draught', 'A potion which boosts the drinkers energy.');
INSERT INTO "Objects" VALUES ( 57 , 37 , 'The Strengthening Solution', 'A potion that presumably increases the drinkers strength. It is brewed in at least two stages, requiring several days to mature in between, and two of the ingredients used to make it are salamander blood, and powdered Griffin claw.');
INSERT INTO "Objects" VALUES ( 58 , 37 , 'The Draught of Peace', 'A potion which relieves anxiety and agitation. Its ingredients are powdered moonstone, syrup of hellebore, powdered porcupine quills, and powdered unicorn horn. It should be a turquoise blue when finished and simmered before being consumed.');
INSERT INTO "Objects" VALUES ( 59 , 38 , 'Felix Felicis', 'A magical potion that makes the drinker lucky for a period of time, during which everything they attempt will be successful.');
INSERT INTO "Objects" VALUES ( 60 , 38 , 'Amortentia', 'The most powerful love potion in existence. It causes a powerful infatuation or obsession from the drinker. It has a distinctive mother-of-pearl sheen, and steam rises from it in characteristic spirals.');
INSERT INTO "Objects" VALUES ( 61 , 38 , 'The Draught of Living Death', 'An extremely powerful sleeping draught, sending the drinker into a deathlike slumber. Its effects are similar to suspended animation.');
INSERT INTO "Objects" VALUES ( 62 , 39 , 'The Polyjuice Potion', 'A potion that allows the drinker to assume the form of someone else. Its a complicated and challenging potion that even adult witches and wizards struggle to brew correctly. The potion is incredibly advanced and has two separate parts that contain steps for each part, when brewing is complete the potion has to stew for a month before usage.');
INSERT INTO "Objects" VALUES ( 63 , 39 , 'The Euphoria Elixir', 'A sunshine-yellow potion that induces a sense of inexplicable, irrational happiness upon the drinker.');
INSERT INTO "Objects" VALUES ( 64 , 39 , 'The Volubilis Potion', 'A potion that alters the drinkers voice. It will also restore their voice if they have lost it, and thus will end the effects of the Silencing Charm.');
