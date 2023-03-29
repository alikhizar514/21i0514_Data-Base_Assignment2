Select AVG(SRecord.s_hours),Ptype.Model_Number from Ptype
inner join Ptrecord on (Ptype.Model_Number = Ptrecord.Model_Number)
inner join SRecord  on (SRecord.Work_code = Ptrecord.ptr_code)
group by Ptype.Model_Number;
