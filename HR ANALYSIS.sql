CREATE DATABASE HR_Anaylisi ;
use HR_Anaylisi;
Select  * from hr_employee_attrition_dataset;
##departement##
create view departement AS
select Department,count(Department)  AS TotalDepartment from hr_employee_attrition_dataset
where Attrition="Yes"
group by Department;
select * from departement;
###Gender##
create view gender AS
select Gender,count(Gender) AS TotalGender from hr_employee_attrition_dataset
group by Gender;
select * from gender;
###JobRole##
create view jobrole AS
select JobRole,count(JobRole) AS TotalJobRole from hr_employee_attrition_dataset
group by Jobrole;
select * from jobrole;
###Attrition##
create view attrition AS
select Department,count(Attrition) AS TotalAttrition from hr_employee_attrition_dataset
where Attrition="Yes"
group by Department;
select * from attrition;

##OverTime##
create view  overtime AS
select JobRole,count(OverTime) AS TotalOverTime from hr_employee_attrition_dataset
where OverTime="Yes"
group by JobRole;
select * from overtime;


select Department,count(*) AS totaldepartment,
sum (CASE WHEN Attrition="Yes" THEN 1 ELSE 0 END) AS totalattrition
group by Department;




##EducationFeild##
create view eductionfield AS
select EducationField,count(*)AS eductionfield ,
sum(CASE WHEN OverTime="Yes" THEN 1 ELSE 0 END) AS totalovertime from hr_employee_attrition_dataset
group by EducationField;
select * from eductionfield;

create view totaljobover AS
select JobRole,count(*) AS totaljobrole,
sum(CASE WHEN OverTime="Yes" THEN 1 ELSE 0 END)AS totalover
 from hr_employee_attrition_dataset
group by JobRole;
select * from totaljobover;

create view attritionrate AS
select ROUND(COUNT(CASE WHEN Attrition="Yes" THEN 1 END )*100.0/COUNT(*),2) AS Attritionrate 
 from hr_employee_attrition_dataset;
 select * from attritionrate;
   
   create view avgsalr AS
 SELECT Attrition ,ROUND(AVG(MonthlyIncome),2) AS AVGSALR
 FROM hr_employee_attrition_dataset
 GROUP BY Attrition;
 select * from avgsalr;
 
create view yearsatcompany AS
 SELECT YearsATCompany,count(*) from hr_employee_attrition_dataset
 WHERE Attrition="Yes"
 group by YearsATCompany
 order by YearsATCompany ;
 select * from yearsatcompany;
   
   create view age AS
 select case When Age between 20 AND 30 THEN"20-30"
             When Age between 30 and 40 THEN "30-40"
             when Age between 40 and 50 then "40-50"
             ELSE "50+"
             end as Agegroup
             ,count(*) AS TotalAttrition from hr_employee_attrition_dataset
             where Attrition="Yes"
             group by Agegroup;
             select * from age;
  
  
  create view jobsatisfaction As
 select JobSatisfaction,count(*) AS AttritionCount
 from hr_employee_attrition_dataset
 Where Attrition="Yes"
 group by JobSatisfaction;
 select * from jobsatisfaction;
 
 