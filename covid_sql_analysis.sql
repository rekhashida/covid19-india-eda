-- 1. Top 5 states by total cases
SELECT State_UTs, Total_Cases 
FROM covid19 
ORDER BY Total_Cases DESC 
LIMIT 5;

-- 2. States with death ratio above 1.5%
SELECT State_UTs, Death_Ratio 
FROM covid19 
WHERE Death_Ratio > 1.5 
ORDER BY Death_Ratio DESC;

-- 3. Average discharge ratio across all states
SELECT AVG(Discharge_Ratio) as Avg_Recovery_Rate 
FROM covid19;

-- 4. States with zero active cases
SELECT State_UTs 
FROM covid19 
WHERE Active = 0;

-- 5. State with highest deaths
SELECT State_UTs, Deaths 
FROM covid19 
ORDER BY Deaths DESC 
LIMIT 1;

-- 6. Total cases, deaths, discharged nationally
SELECT SUM(Total_Cases), SUM(Deaths), SUM(Discharged) 
FROM covid19;

-- 7. States where discharge ratio > 99%
SELECT State_UTs, Discharge_Ratio 
FROM covid19 
WHERE Discharge_Ratio > 99 
ORDER BY Discharge_Ratio DESC;

-- 8. Death ratio ranked lowest to highest
SELECT State_UTs, Death_Ratio 
FROM covid19 
ORDER BY Death_Ratio ASC;

-- 9. Count of states in each risk category
SELECT 
  CASE 
    WHEN Death_Ratio > 1.5 THEN 'High Risk'
    WHEN Death_Ratio > 1.0 THEN 'Medium Risk'
    ELSE 'Low Risk'
  END AS Risk_Category,
  COUNT(*) as State_Count
FROM covid19
GROUP BY Risk_Category;

-- 10. States with active cases still remaining
SELECT State_UTs, Active 
FROM covid19 
WHERE Active > 0 
ORDER BY Active DESC;
