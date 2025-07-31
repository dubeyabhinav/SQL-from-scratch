-- Lecture 5: Subqueries & Derived Tables
-- Dataset: dummy02 with tables students, courses, enrollments
-- Additional challenges at the end

-- ================================================
-- Example 1: Find all Computer Science majors who took courses with above-average class performance.
-- Using a subquery in WHERE clause
-- ================================================

SELECT s.student_id, s.student_name
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE s.major = 'Computer Science'
  AND e.course_id IN (
      SELECT course_id
      FROM enrollments
      GROUP BY course_id
      HAVING AVG(grade) > 80
  );

-- ================================================
-- Example 2: List Computer Science majors with their grades in high-performing courses
-- Using a derived table (inline view)
-- ================================================

SELECT s.student_id, s.student_name, c.course_name, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
JOIN (
    SELECT course_id
    FROM enrollments
    GROUP BY course_id
    HAVING AVG(grade) > 80
) high_avg_courses
ON e.course_id = high_avg_courses.course_id
WHERE s.major = 'Computer Science';


-- ================================================
-- Additional Challenge Examples
-- These are more advanced queries to think about!
-- ================================================

-- Challenge 1:
-- Find Biology majors who scored above the average grade of their respective courses.

SELECT s.student_id, s.student_name, c.course_name, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.major = 'Biology'
  AND e.grade > (
      SELECT AVG(grade)
      FROM enrollments
      WHERE course_id = e.course_id
  )
ORDER BY s.student_name, c.course_name;

-- Challenge 2:
-- List the majors with the count of distinct courses where at least one student scored above 85.

SELECT s.major, COUNT(DISTINCT e.course_id) AS high_score_courses
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE e.grade > 85
GROUP BY s.major
ORDER BY high_score_courses DESC;

-- Challenge 3:
-- Find courses where the highest grade is below 70 (underperforming courses),
-- and list students enrolled in those courses.

SELECT c.course_id, c.course_name, s.student_id, s.student_name, e.grade
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
JOIN students s ON e.student_id = s.student_id
WHERE c.course_id IN (
    SELECT course_id
    FROM enrollments
    GROUP BY course_id
    HAVING MAX(grade) < 70
)
ORDER BY c.course_name, s.student_name;

-- Challenge 4:
-- For each student major, find their average grade only in courses where the course average is above the global average grade of all enrollments.

-- Step 1: Calculate global average grade
-- Step 2: Find courses with avg grade > global average
-- Step 3: Calculate student's avg grade for those courses grouped by major

WITH GlobalAvg AS (
    SELECT AVG(grade) AS global_avg FROM enrollments
),
HighAvgCourses AS (
    SELECT course_id
    FROM enrollments
    GROUP BY course_id
    HAVING AVG(grade) > (SELECT global_avg FROM GlobalAvg)
)
SELECT s.major, s.student_id, s.student_name, AVG(e.grade) AS avg_grade_in_top_courses
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE e.course_id IN (SELECT course_id FROM HighAvgCourses)
GROUP BY s.major, s.student_id, s.student_name
ORDER BY s.major, avg_grade_in_top_courses DESC;

-- ================================================
-- End of Lecture 5 SQL examples
-- ================================================
