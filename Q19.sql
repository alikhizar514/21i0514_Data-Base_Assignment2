SELECT Hanger.Hanger_Number, COUNT(*) as TotalPlanes
FROM Hanger
INNER JOIN Airplane ON Hanger.Hanger_Number = Airplane.Hanger_Number
GROUP BY Hanger.Hanger_Number;
