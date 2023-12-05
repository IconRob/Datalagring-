


-- SOLVED QUESTION 1
EXPLAIN ANALYZE
SELECT 
    CASE EXTRACT(MONTH FROM b.start_time)
        WHEN 1 THEN 'Jan'
        WHEN 2 THEN 'Feb'
        WHEN 3 THEN 'Mars'
        WHEN 4 THEN 'April'
        WHEN 5 THEN 'Maj'
        WHEN 6 THEN 'Juni'
        WHEN 7 THEN 'Juli'
        WHEN 8 THEN 'Aug'
        WHEN 9 THEN 'Sep'
        WHEN 10 THEN 'Okt'
        WHEN 11 THEN 'Nov'
        WHEN 12 THEN 'Dec'
    END AS month,
    COUNT(b.booking_id) AS total_lessons,
    COUNT(sl.solo_lession_id) AS solo_lessons,
    COUNT(gl.group_lesson_id) AS group_lessons,
    COUNT(e.ensamble_id) AS ensamble_lessons
FROM 
    booking b
LEFT JOIN 
    solo_lesson sl ON b.booking_id = sl.booking_id
LEFT JOIN 
    group_lesson gl ON b.booking_id = gl.booking_id
LEFT JOIN 
    ensamble e ON b.booking_id = e.booking_id
WHERE 
    EXTRACT(YEAR FROM b.start_time) = 2023
GROUP BY 
    EXTRACT(MONTH FROM b.start_time);



/*
-- kopplar ihop efternamn på siblings
SELECT
  s1.last_name,
  COUNT(s1.student_id) - 1 AS No_of_Siblings,
  STRING_AGG(s1.student_id::text, ', ') AS Sibling_Student_IDs
FROM
  student s1
JOIN
  student s2 ON s1.last_name = s2.last_name AND s1.student_id != s2.student_id
GROUP BY
  s1.last_name
HAVING
  COUNT(s1.student_id) > 1;

*/




-- TASK 3.2 Siblingstabell
EXPLAIN ANALYZE
SELECT
  No_of_Siblings,
  COUNT(*) AS No_of_Students
FROM (
  SELECT
    s.student_id,
    COUNT(DISTINCT sg.sibling_group_id) AS No_of_Siblings
  FROM
    student s
  LEFT JOIN
    sibling_group sg ON s.student_id = sg.student_id
  GROUP BY
    s.student_id
) AS SiblingCounts
GROUP BY
  No_of_Siblings
ORDER BY
  No_of_Siblings;



-- Task 3.3, antal lektioner för specifika lärare under angivet tidsintervall
EXPLAIN ANALYZE
SELECT
  i.instructor_id,
  i.first_name,
  i.last_name,
  COUNT(*) AS No_of_Lessons
FROM
  booking b
INNER JOIN instructor i ON b.instructor_id = i.instructor_id
INNER JOIN booking_lesson bl ON b.booking_id = bl.booking_id
WHERE
  b.start_time >= date_trunc('month', current_date) -- Första dagen i nuvarande månad
  AND b.end_time < date_trunc('month', current_date) + interval '1 month' -- Första dagen i nästa månad
GROUP BY
  i.instructor_id
HAVING
  COUNT(*) > 0 -- X är det specifika antalet lektioner som du vill filtrera på
ORDER BY
  No_of_Lessons DESC;





--Listar alla ensambler under kommande vecka TASK 3.4
CREATE VIEW ensambles_comming_week AS
SELECT
  to_char(b.start_time, 'Day') AS Day,
  e.genre AS Genre,
  CASE
    WHEN max_students - COUNT(bl.student_id) <= 0 THEN 'No Seats'
    WHEN max_students - COUNT(bl.student_id) BETWEEN 1 AND 2 THEN '1 or 2 Seats'
    ELSE 'Many Seats'
  END AS "No of Free Seats"
FROM
  booking b
JOIN
  ensamble e ON b.booking_id = e.booking_id
LEFT JOIN
  booking_lesson bl ON e.booking_id = bl.booking_id
WHERE
  b.start_time >= current_date + interval '1 day' * EXTRACT(DOW FROM current_date) -- nästa vecka
  AND b.start_time < current_date + interval '1 day' * (7 - EXTRACT(DOW FROM current_date)) + interval '7 days'
GROUP BY
  e.genre, b.start_time, e.max_students
ORDER BY
  e.genre, to_char(b.start_time, 'Day');
  


SELECT * FROM ensambles_comming_week;
