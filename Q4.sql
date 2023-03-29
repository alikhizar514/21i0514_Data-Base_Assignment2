

Select Powner.oname,Powner.oAddress from Powner 
Inner Join POwns on ( POwns.Owner_id = Powner.Owner_id )
Inner Join Airplane on ( Airplane.RegNumber = POwns.RegNumber)
Inner Join Ptype on ( Ptype.Model_Number = Airplane.Model_Number AND Ptype.pcapacity > 200);
