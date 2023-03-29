Select Airplane.RegNumber from Airplane INNER JOIN Pservice on (Airplane.RegNumber=Pservice.RegNumber AND Pservice.Maintenance_status=0);
