# 1.Query the existence of 1 course
SELECT COUNT(*) FROM course WHERE id = 1;

# 2.Query the presence of both 1 and 2 courses
SELECT COUNT(*) FROM course WHERE id = 1 OR id =2;

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT ID,NAME,AVG(score) FROM student a,student_course b WHERE a.`id` = b.`studentId` GROUP BY a.`id`  HAVING AVG(b.`score`) >=60;

# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT * FROM student a WHERE NOT EXISTS (SELECT * FROM student_course b WHERE a.`id`=b.`studentId`);

# 5.Query all SQL with grades
SELECT * FROM (student a INNER JOIN student_course b ON a.`id`=b.`studentId`) INNER JOIN course c ON c.`id`=b.`courseId`;

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT * FROM student a INNER JOIN student_course b ON a.`id`=b.`studentId` AND a.`id`=1 AND b.`courseId`=2;

# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT a.*,b.`courseId`,b.`score` FROM student a,student_course b WHERE a.`id`=b.`studentId` AND b.`courseId`=1 AND b.`score`<60 ORDER BY b.`score` DESC;

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT b.`courseId`, a.`name`,AVG(b.`score`) FROM course a,student_course b WHERE a.`id`=b.`courseId` GROUP BY a.`id` ORDER BY b.`score` DESC , b.`courseId` ASC;


# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT a.`name`,b.`score` FROM (student a INNER JOIN student_course b ON a.`id`=b.`studentId` AND b.`score`<60) INNER JOIN course c ON c.`id`=b.`courseId` AND c.`name`="Math";
