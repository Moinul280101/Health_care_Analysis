SELECT * FROM healthcare.clean_healthcare_dataset;

/* Basic KPI */

SELECT COUNT(Name) as Total_patients
FROM healthcare.clean_healthcare_dataset;


SELECT SUM(Billing_Amount) AS Total_Bills
FROM healthcare.clean_healthcare_dataset;

/* Gender Wise Patients Count*/
SELECT Gender, COUNT(Name) AS Total_patients 
FROM healthcare.clean_healthcare_dataset
GROUP BY Gender;


/*Admittion date Wise Patients Count*/
SELECT Date_of_Admission, Count(Name) as patients_count
FROM healthcare.clean_healthcare_dataset
GROUP BY Date_of_Admission;

/* Medical_Condition wise Patients*/
SELECT Medical_Condition, Count(name) as Patients_Count
FROM healthcare.clean_healthcare_dataset
GROUP BY Medical_Condition
ORDER BY Patients_Count;

/* Medication Wise Patients Count*/
SELECT Medication, Count(name) as Patients_Count
FROM healthcare.clean_healthcare_dataset
GROUP BY Medication
ORDER BY Patients_Count;
/*  Total BIlls Amount By Insurance Company */
SELECT Insurance_provider, Sum(Billing_Amount) as Total_bills , COUNT(Name) as patients_Count
FROM healthcare.clean_healthcare_dataset
GROUP BY Insurance_Provider
ORDER BY Total_bills;

/* Avarage Stay by Medical Condition*/
SELECT Medical_Condition, Avg(Length_of_Stay) as Avg_Stay 
FROM healthcare.clean_healthcare_dataset
GROUP BY Medical_Condition
ORDER BY Avg_Stay;
/* Total patients by Admition Type*/
SELECT Admission_Type, Count(Name) as Patients_Count 
FROM healthcare.clean_healthcare_dataset
GROUP BY Admission_Type
ORDER BY Patients_Count;

/* Age Category */

SELECT Name , Age,
CASE
 WHEN age<= 10 then "Child "
  WHEN age<=18 then "Teenage "
   WHEN age<=45 then "Adult "
   ELSE "Old"
END AS age_category
FROM healthcare.clean_healthcare_dataset;


/* Hospital Billis Rank */
SELECT Hospital , Sum(Billing_Amount) AS Total_Bills,
RANK() OVER( ORDER BY Sum(Billing_Amount) DESC) AS Bills_Rank
FROM healthcare.clean_healthcare_dataset
GROUP BY Hospital;

/* Hospital Wise Total Doctor */
SELECT Hospital , Count(Doctor) as Doctor_Count
FROM healthcare.clean_healthcare_dataset
Group BY Hospital
order by Doctor_Count DESC;


/*   KEY INSHIGHTS
1.Male's patient's are more than Female patient's

2.Obesity Medicine condition are highets Avarage Billing Amount among all the Medicine condition

3.Abnormal Test Result are highets Among all the test Result

4.Most Patient's Admit in year of 2020

5.LLC Smith Has most Number Of Doctors Among all Hospital

6. Asthama Condition Has Highets Avarage stay 

7. A- Blood group Patients Admit most number among All Blood Group

8. In Year 2019 Has Highets Avarage billing Amount

9.Highets Billing Amount by Johnson PLC 

10.Elective admition Type is Most*/
