create table students(
studentid INT,
names varchar(20),
enrollment_no INT,
date_of_joining date
);
--altering table to create primary key
ALTER TABLE students
alter column studentid INT not null;

ALTER TABLE students
add constraint studentid primary key(studentid);

insert into students 
values(11,'nick panchal',1234567,'01/02/2019'),
(21,'yash panchal',2468101,'01/02/2019'),
(31,'gyan rathod',3689245,'01/02/2019');

insert into students values(51,'nick panchal',3334455,'01/02/2019')

create table studentstipend(
studentid INT FOREIGN KEY REFERENCES students(studentid),
studentstipend INT);
alter table studentstipend
add project VARCHAR(02)
insert into studentstipend 
values(11,80000,'p1'),(21,10000,'p2'),(31,120000,'p1');

insert into students 
values(41,'prakash ranjit',4567098,'01/02/2019');

select names from students
where studentid=11;

select * from studentstipend;

update studentstipend
set project='p2'
where studentid=31;

--Write an SQL query to fetch student names having stipend greater than or equal to 50000 and
--less than or equal 100000.
SELECT names
FROM students
WHERE studentid IN (SELECT studentstipend FROM studentstipend WHERE studentstipend >= 5000 AND studentstipend <= 100000);

--Write an SQL query for fetching duplicate records from a table.
select names,count(names) as duplicate from students group by names;

select count(studentstipend) as count from studentstipend
where studentstipend >= 50000

--Write an SQL query for removing duplicate records from a table.
select names,count(names) as duplicate from students group by names;

--. Write an SQL query to fetch the count of students project-wise sorted by project’s count in
--descending order.

select project,count(studentid) as [project count] from studentstipend 
group by project order by project desc

--. Write an SQL query for fetching only even rows from the table.
select * from students
where studentid%2=0;

SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS row_num
    FROM students
) AS subquery
WHERE row_num % 2 = 0; 

SELECT *
FROM (
    select *,ROW_NUMBER() OVER (ORDER BY (studentid)) AS row_num FROM students
) as subquery
WHERE row_num % 2 = 0; 

--Write the SQL query to find the nth highest stipend from the table. here n==2
--Write SQL query for finding the 3rd highest stipend from the table without using TOP/limit
select * from ( select *,row_number() over (order by(studentstipend) desc) as row_no from studentstipend) as subquery where 
row_no=2;

