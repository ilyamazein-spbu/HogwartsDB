	"Самые ранние года поступления на каждый факультет из имеющихся учеников"

SELECT "House_ID", MIN("Admission_Year") "Admission_Year"
    FROM "Students"
    GROUP BY "House_ID";
    
"Оптимизация"

EXPLAIN SELECT "House_ID", MIN("Admission_Year") "Admission_Year"
    FROM "Students"
    GROUP BY "House_ID";
    
"Seq Scan on 'Students'  (cost=0.00..1.15 rows=15 width=6)"

CREATE INDEX ON "Students"("House_ID");
SET enable_seqscan TO off;

EXPLAIN SELECT "House_ID", MIN("Admission_Year") "Admission_Year"
    FROM "Students"
    GROUP BY "House_ID";

"Index Scan using 'Students_House_ID_idx' on 'Students'  (cost=0.14..12.36 rows=15 width=6)"


	"Ученики из параллели Гарри Поттера, играющие в Квиддич"

SELECT "Student_Name" AS "Players"
	FROM "Students"
		WHERE "Plays_Quidditch" = TRUE AND "Admission_Year" = 1991
	ORDER BY "Student_Name";
	
"Оптимизация"

EXPLAIN SELECT "Student_Name" AS "Players"
	FROM "Students"
		WHERE "Plays_Quidditch" = TRUE AND "Admission_Year" = 1991
	ORDER BY "Student_Name";
	
"Seq Scan on 'Students'  (cost=0.00..1.19 rows=1 width=516)"

CREATE INDEX ON "Students"("Plays_Quidditch", "Admission_Year");
SET enable_seqscan TO off;

EXPLAIN SELECT "Student_Name" AS "Players"
	FROM "Students"
		WHERE "Plays_Quidditch" = TRUE AND "Admission_Year" = 1991
	ORDER BY "Student_Name";

"Index Scan using 'Students_Plays_Quidditch_Admission_Year_idx' on 'Students'  (cost=0.14..8.15 rows=1 width=516)"


	"Заклинания с неизвестными произношениями, не являющиеся запретными"

SELECT "Spell_Name" AS "Unknown Spells"
	FROM "Spells"
		WHERE "Unforgivable" = FALSE AND "Incantation" = 'unknown'
	ORDER BY "Spell_Name";

"Оптимизация"

EXPLAIN SELECT "Spell_Name" AS "Unknown Spells"
	FROM "Spells"
		WHERE "Unforgivable" = FALSE AND "Incantation" = 'unknown'
	ORDER BY "Spell_Name";
	
"Seq Scan on 'Spells'  (cost=0.00..2.66 rows=10 width=20)"

CREATE INDEX ON "Spells"("Unforgivable", "Incantation");
SET enable_seqscan TO off;

EXPLAIN SELECT "Spell_Name" AS "Unknown Spells"
	FROM "Spells"
		WHERE "Unforgivable" = FALSE AND "Incantation" = 'unknown'
	ORDER BY "Spell_Name";

"Bitmap Index Scan on 'Spells_Unforgivable_Incantation_idx'  (cost=0.00..4.24 rows=10 width=0)"


	"Предметы, у которых есть Высший уровень сложности"
	
SELECT DISTINCT "Subject_Name" AS "Advanced Studies"
	FROM "Subjects"
		WHERE "Knowledge_Level" = 'Advanced';

"Оптимизация"

EXPLAIN SELECT DISTINCT "Subject_Name" AS "Advanced Studies"
	FROM "Subjects"
		WHERE "Knowledge_Level" = 'Advanced';
		
"Seq Scan on 'Subjects'  (cost=0.00..1.49 rows=1 width=516)"

CREATE INDEX ON "Subjects"("Knowledge_Level");
SET enable_seqscan TO off;

EXPLAIN SELECT DISTINCT "Subject_Name" AS "Advanced Studies"
	FROM "Subjects"
		WHERE "Knowledge_Level" = 'Advanced';

"Index Scan using 'Subjects_Knowledge_Level_idx' on 'Subjects'  (cost=0.14..8.16 rows=1 width=516)"

		
	"Профессора, которые постоянно преподают в Хогвартс и не являются главами домов"

SELECT "Professor_Name" AS "Regular Professors"
	FROM "Professors"
		WHERE "House_Head" = FALSE AND "Permanent_Post" = TRUE;
		
"Оптимизация"		
		
EXPLAIN SELECT "Professor_Name" AS "Regular Professors"
	FROM "Professors"
		WHERE "House_Head" = FALSE AND "Permanent_Post" = TRUE;
		
"Seq Scan on 'Professors'  (cost=0.00..1.12 rows=3 width=516)"

CREATE INDEX ON "Professors"("House_Head", "Permanent_Post");
SET enable_seqscan TO off;

EXPLAIN SELECT "Professor_Name" AS "Regular Professors"
	FROM "Professors"
		WHERE "House_Head" = FALSE AND "Permanent_Post" = TRUE;

"Index Scan using 'Professors_House_Head_Permanent_Post_idx' on 'Professors'  (cost=0.14..8.20 rows=3 width=516)"


	"Список зельев, в порядке их изучения"

SELECT "Object_Name" AS "Potions" FROM
"Objects" JOIN "Subjects"
ON "Objects"."Subject_ID" = "Subjects"."Subject_ID"
WHERE "Subject_Name" = 'Potions'
ORDER BY "Year";

"Оптимизация"

EXPLAIN SELECT "Object_Name" AS "Potions" FROM
"Objects" JOIN "Subjects"
ON "Objects"."Subject_ID" = "Subjects"."Subject_ID"
WHERE "Subject_Name" = 'Potions'
ORDER BY "Year";

"Seq Scan on 'Objects'  (cost=0.00..2.64 rows=64 width=21)"
"Seq Scan on 'Subjects'  (cost=0.00..1.49 rows=1 width=6)"

CREATE INDEX ON "Objects"("Subject_ID");
CREATE INDEX ON "Subjects"("Subject_Name");
SET enable_seqscan TO off;

EXPLAIN SELECT "Object_Name" AS "Potions" FROM
"Objects" JOIN "Subjects"
ON "Objects"."Subject_ID" = "Subjects"."Subject_ID"
WHERE "Subject_Name" = 'Potions'
ORDER BY "Year";

"Bitmap Index Scan on 'Objects_Subject_ID_idx'  (cost=0.00..4.15 rows=2 width=0)"
"Index Scan using 'Subjects_Subject_Name_idx' on 'Subjects'  (cost=0.14..8.16 rows=1 width=6)"


"Во всех представленных случаях использование индексов является более затратным, поскольку таблицы в базе данные не настолько большие, чтобы оно было эффективным. Идексы представлют данные как дерево, но на таком объеме данных алгоритмы на дереве не будут лучше последовательного сканирования."


	"Профессора, которые преподавали только Защиту от Темных Искусств"

SELECT "Exclusively DADA Professors" FROM
(SELECT "Professor_Name" AS "Exclusively DADA Professors", string_agg("Subject_Name", ', ') AS "Subject(s)" FROM
(SELECT DISTINCT "Subject_Name", "Professor_Name" FROM
"Professors" JOIN ("Professor_Classes" JOIN "Subjects"
ON "Professor_Classes"."Subject_ID" = "Subjects"."Subject_ID") AS "Prof_Clas_Sub"
ON "Professors"."Professor_ID" = "Prof_Clas_Sub"."Professor_ID"
ORDER BY "Professor_Name") AS "Prof_Sub"
GROUP BY "Professor_Name") AS "Sub_Prof"
WHERE "Subject(s)" = 'Defence Against The Dark Arts';


	"Список предметов и профессоров, которые их ведут"

SELECT "Subject_Name" AS "Subject", string_agg("Professor_Name", ', ') AS "Professor(s)" FROM
(SELECT DISTINCT "Subject_Name", "Professor_Name" FROM
"Professors" JOIN ("Professor_Classes" JOIN "Subjects"
ON "Professor_Classes"."Subject_ID" = "Subjects"."Subject_ID") AS "Prof_Clas_Sub"
ON "Professors"."Professor_ID" = "Prof_Clas_Sub"."Professor_ID"
ORDER BY "Subject_Name") AS "Prof_Sub"
GROUP BY "Subject_Name";


	"Список факультетов и игроков в квиддич, входящих в состав команды своего факультета"

SELECT "House_Name" AS "House", string_agg("Student_Name", ', ') AS "Students" FROM
(SELECT "House_Name", "Student_Name" FROM
("Houses" LEFT JOIN "Students" ON ("Houses"."House_ID" = "Students"."House_ID" AND "Students"."Plays_Quidditch" = TRUE)) AS "House_Teams"
ORDER BY "Student_Name") AS "Players"
GROUP BY "House_Name"
ORDER BY "House_Name";


	"Самый большой факультет и кол-во учащихся на нем"

SELECT "House" AS "Most Popular House(s)",  "Number of Students" FROM
(SELECT "House_Name" AS "House", COUNT("Student_ID") AS "Number of Students" FROM
("Houses" LEFT JOIN "Students" ON ("Houses"."House_ID" = "Students"."House_ID")) AS "House_Students"
GROUP BY "House_Name") AS "House_Numbers"
WHERE "Number of Students" = (SELECT MAX("Number of Students") FROM
(SELECT "House_Name" AS "House", COUNT("Student_ID") AS "Number of Students" FROM
("Houses" LEFT JOIN "Students" ON ("Houses"."House_ID" = "Students"."House_ID")) AS "House_Students"
GROUP BY "House_Name") AS "House_Numbers");


	"Список предметов и количества лет, которые они преподаются, с какого по какой год"

SELECT "Subject_Name" AS "Subject", COUNT("Sub_Prof_Clas"."Year") AS "Years of Study", MIN("Year") AS "From", MAX("Year") AS "To" FROM
("Subjects" LEFT JOIN "Professor_Classes" ON ("Subjects"."Subject_ID" = "Professor_Classes"."Subject_ID")) AS "Sub_Prof_Clas"
GROUP BY "Subject_Name"
ORDER BY "Subject_Name";
