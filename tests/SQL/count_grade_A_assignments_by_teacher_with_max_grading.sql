-- Write query to find the number of grade A's given by the teacher who has graded the most assignments

-- Step 1: Find the teacher who has graded the most assignments
WITH teacher_grading_counts AS (
    SELECT teacher_id, COUNT(*) AS num_graded_assignments
    FROM assignments
    WHERE grade IS NOT NULL
    GROUP BY teacher_id
    ORDER BY num_graded_assignments DESC
    LIMIT 1
)

-- Step 2: Count the number of grade A's given by that teacher
SELECT COUNT(*) AS num_grade_A_assignments
FROM assignments
WHERE grade = 'A'
AND teacher_id = (SELECT teacher_id FROM teacher_grading_counts);