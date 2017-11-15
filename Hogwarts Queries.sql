"Ученики из параллели Гарри Поттера, играющие в Квиддич, в алфавитном порядке"

SELECT "Student_Name" AS "Players"
	FROM "Students"
		WHERE "Plays_Quidditch" = TRUE AND "Admission_Year" = 1991
	ORDER BY "Student_Name";
	

"Заклинания с неизвестными произношениями, не являющиеся запретными, в алфавитном порядке"

SELECT "Spell_Name" AS "Unknown Spells"
	FROM "Spells"
		WHERE "Unforgivable" = FALSE AND "Incantation" = 'unknown'
	ORDER BY "Spell_Name";
	

"Предметы, у которых есть Высший уровень сложности"
	
SELECT DISTINCT "Subject_Name" AS "Advanced Studies"
	FROM "Subjects"
		WHERE "Knowledge_Level" = 'Advanced';
		
		
"Профессора, которые постоянно преподают в Хогвартс и не являются главами домов"

SELECT "Professor_Name" AS "Regular Professors"
	FROM "Professors"
		WHERE "House_Head" = FALSE AND "Permanent_Post" = TRUE;
		
		
"Количество предметов, которые преподаются во все года обучения в Хогвартс"

SELECT COUNT ("Subject_Name") AS "Full Subjects amount" FROM (SELECT "Subject_Name" FROM "Subjects" WHERE "Year" = 1996) AS "Full_Subs";
	
	

"Профессора, которые преподавали только Защиту от Темных Искусств, в алфавитном порядке"

SELECT "Professor" FROM
(SELECT "Professor_Name" AS "Exclusively DADA Professors", string_agg("Subject_Name", ', ') AS "Subject(s)" FROM
(SELECT DISTINCT "Subject_Name", "Professor_Name" FROM
"Professors" JOIN ("Professor_Classes" JOIN "Subjects"
ON "Professor_Classes"."Subject_ID" = "Subjects"."Subject_ID") AS "Prof_Clas_Sub"
ON "Professors"."Professor_ID" = "Prof_Clas_Sub"."Professor_ID"
ORDER BY "Professor_Name") AS "Prof_Sub"
GROUP BY "Professor_Name") AS "Sub_Prof"
WHERE "Subject(s)" = 'Defence Against The Dark Arts';


"Список предметов и профессоров, которые их ведут, в алфавитном порядке"

SELECT "Subject_Name" AS "Subject", string_agg("Professor_Name", ', ') AS "Professor(s)" FROM
(SELECT DISTINCT "Subject_Name", "Professor_Name" FROM
"Professors" LEFT JOIN ("Professor_Classes" RIGHT JOIN "Subjects"
ON "Professor_Classes"."Subject_ID" = "Subjects"."Subject_ID") AS "Prof_Clas_Sub"
ON "Professors"."Professor_ID" = "Prof_Clas_Sub"."Professor_ID"
ORDER BY "Subject_Name") AS "Prof_Sub"
GROUP BY "Subject_Name";


"Список зельев, в порядке их изучения"

SELECT "Object_Name" AS "Potions" FROM
"Objects" LEFT OUTER JOIN "Subjects"
ON "Objects"."Subject_ID" = "Subjects"."Subject_ID"
WHERE "Subject_Name" = 'Potions'
ORDER BY "Year";
