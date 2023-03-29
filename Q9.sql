SELECT Pilot.Lic_Number, COUNT(*),  MAX(Pilot.Model_Number)
FROM Pilot 
WHERE Pilot.Prestrictions IN ('None') 
GROUP BY Pilot.Lic_Number;
