create database HealthCare;
use healthcare;

select * from doctor;
select 'doctor id' from doctor;

alter table doctor change `Doctor ID` doctor_id int;
select `doctor name` from doctor;

#1
create view Total_Doctors as
select count(`doctor id`) as Total_Doctors from doctor;

select * from total_doctors;

#2
create view Total_Patiens as 
select count(`patient id`) from patient1;

Alter view Total_Patiens as 
select count(`patient id`) Total_Patients from patient1;

select * from Total_Patiens;

#3
create view Total_Visits as
select count(`visit id`) from visit1;
select * from total_visits;

alter view total_visits as select count(`visit id`) Total_visits from visit1;

select * from total_visits;

#4
create view AvgAgeOfPatients as
select avg(age) avg_age from patient1;

select round(avg_age) from avgageofpatients;



#5
create view Top5Diagnosis as
select diagnosis, count(*) as Total_Diagnosis 
from visit1
group by diagnosis
order by total_diagnosis Desc
limit 5;

select * from Top5Diagnosis;

#6
create view Follow_up_Rate as
select `follow up required` , count(*) Follow_Up_Rate from visit1
group by `follow up required`;

select * from Follow_up_Rate;

#7
create view Avg_TreatmentCost as
select round(avg(`treatment cost`)) as Avg_TreatmentCost from treatments;

select * from Avg_TreatmentCost;

#8
create view Lab_Tests_Conducted as
select count(`lab result id`) Lab_Tests_Conducted from `lab result1`;

select * from Lab_Tests_Conducted;

#9
drop view Result_Rate;
create view Result_Rate  as 
select `test result` , concat(Round(count(*)/100,2),'%') as Result_Rate from `lab result1`
group by `test result`;

select * from Result_rate;

#10
create view Doctor_Per_Patient as
select round(count(distinct v.`visit id`)/count(distinct d.`doctor id`)) as Doctor_Per_Patient
from visit1 v
inner join doctor d
where v.`doctor id`= d.`doctor id` ;

select * from Doctor_Per_Patient ;

#11
create view Total_Revenue as
select 
 case
 when sum(`treatment cost`+`cost`) >= 1000000000 then
 concat(round((sum(`treatment cost`+`cost`))/1000000000,2),'B')
 when sum(`treatment cost`+`cost`) >= 1000000 then
 concat(round((sum(`treatment cost`+`cost`))/1000000,2),'M')
 when sum(`treatment cost`+`cost`) >= 1000 then
 concat(round((sum(`treatment cost`+`cost`))/1000,2),'K') 
  else round(sum(`treatment cost`+`cost`),2)
  end as Total_Revenue
 from treatments;
 
 select * from Total_Revenue;






