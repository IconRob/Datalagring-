


-- Task 3.1 Weekly number of lessons during a year
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





-- TASK 3.2 Siblingstable
CREATE VIEW student_siblings AS
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



-- Task 3.3, Lessons for specific teachers during a period
CREATE VIEW list_instructor_id AS
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
  COUNT(*) > 0 -- antalet lektioner 
ORDER BY
  No_of_Lessons DESC;





-- Task 3.4 List all ensambles comming week
CREATE MATERIALIZED VIEW ensambles_comming_week1 AS
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
  


SELECT * FROM ensambles_comming_week1;
