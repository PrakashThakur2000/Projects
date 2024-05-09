create database healthcare;
use healthcare;

select * from dialysis_one;
select * from dialysis_two;
select * from dialysis1;

# 2kpi
select Profit_vs_NonProfit ,count(State) as count_state,State from dialysis1
group by Profit_vs_NonProfit ,State;


# 3kpi
select dialysis1.Chain_Organization ,dialysis_two.Total_Performance_Score 
from dialysis1 inner join dialysis_two 
on dialysis1.Zip=dialysis_two.Zip_Code;


# 6kpi
select avg(PY2020_Payment_Reduction_Percentage)*100 as Avrage_Reduction_rate from dialysis_two;

# 4kpi
select Dialysis_Stations,State from dialysis1  ;

#5 kpi
select count(Patient_Transfusion_category_text),count(Patient_Hospital_Readmission_Category )
from dialysis1 
where Patient_Transfusion_category_text="As Expected" and Patient_Hospital_Readmission_Category="As Expected";


 # kpi 5
SELECT 
    SUM(CASE 
            WHEN Patient_Transfusion_category_text LIKE '%As Expected%' THEN 1 
            ELSE 0 
        END
    ) AS Patient_Transfusion_category_text_count,
    SUM(CASE 
            WHEN Patient_Hospital_Readmission_Category LIKE '%As Expected%' THEN 1 
            ELSE 0 
        END
    ) AS Patient_Hospital_Readmission_Category_count,
    SUM(CASE 
            WHEN Patient_Hospital_Readmission_Category LIKE '%As Expected%' THEN 1 
            ELSE 0 
        END
    ) AS Patient_Hospital_Readmission_Category_count,
    SUM(CASE 
            WHEN Patient_Survival_Category_Text LIKE '%As Expected%' THEN 1 
            ELSE 0 
        END
    ) AS Patient_Survival_Category_Text_count,
    SUM(CASE 
            WHEN Patient_Infection_category_text LIKE '%As Expected%' THEN 1 
            ELSE 0 
        END
    ) AS Patient_Infection_category_text_count,
    SUM(CASE 
            WHEN Fistula_Category_Text LIKE '%As Expected%' THEN 1 
            ELSE 0 
        END
    ) AS Fistula_Category_Text_count,
    SUM(CASE 
            WHEN SWR_category_text LIKE '%As Expected%' THEN 1 
            ELSE 0 
        END
    ) AS SWR_category_text_count,
    SUM(CASE 
            WHEN PPPW_category_text LIKE '%As Expected%' THEN 1 
            ELSE 0 
        END
    ) AS PPPW_category_text_count
    
FROM 
    dialysis1;
