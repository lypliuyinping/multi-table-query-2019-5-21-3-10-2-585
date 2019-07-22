# 1.查询同时存在1课程和2课程的情况
select
		a.*
	from
		student a,
		student_course b,
		student_course c
	where
		a.id = b.studentId
		and a.id = c.studentId
		and b.courseId = '1'
		and c.courseId = '2';
# 2.查询同时存在1课程和2课程的情况
select
		a.*
	from
		student a,
		student_course b,
		student_course c
	where
		a.id = b.studentId
		and a.id = c.studentId
		and b.courseId = '1'
		and c.courseId = '2';

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
	select
		b.id,
		b.name,
		round(avg(a.score), 2) as avg_score
	from
		student b
	join student_course a on
		b.id = a.studentId
	group by
		b.id,
		b.name
	having
		round(avg(a.score), 2)>= 60;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
	SELECT * FROM student WHERE id not in (select studentId FROM student_course)

# 5.查询所有有成绩的SQL
SELECT * FROM student WHERE id  in (select studentId FROM student_course);
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
	select
		a.*
	from
		student a,
		student_course b,
		student_course c
	where
		a.id = b.studentId
		and a.id = c.studentId
		and b.courseId = '1'
		and c.courseId = '2';
# 7.检索1课程分数小于60，按分数降序排列的学生信息
	select
		a.*
	from
		student a,
		student_course b
	where
		a.id = b.studentId
		and b.courseId = '1'
			and b.score<'60' 
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
	select
		b.*,
		round(avg(a.score), 2) as avg_score
	from
		student b
	join student_course a on
		b.id = a.studentId
	group by
		b.id,
		b.name
	order by avg_score desc, a.courseId asc 
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
	select student.name ,student_course.score 
	from student ,student_course 
	where student.id = student_course.studentId and courseId=2 and score<60;