
DROP DATABASE IF EXISTS Airport;
CREATE DATABASE Airport;

--Hanger
Drop table if exists Maintain;
Drop table if exists Pilot;
Drop table if exists Works_on;
Drop table if exists Pservice;
Drop table if exists SRecord;
Drop table if exists Employees;
Drop table if exists HOwns;
Drop table if exists POwns;
Drop table if exists Powner;
drop table if exists bought_from; 
Drop table if exists Airplane;
Drop table if exists Ptrecord;
Drop table if exists Ptype;
Drop table if exists Hanger;

Create table Hanger(
	Hanger_Number varchar(14) not null,
	primary key(Hanger_Number),
	hcapacity int not null,
	hlocation varchar(25) not null,
);
Insert into Hanger(Hanger_Number,hCapacity,hlocation) Values
	  ('B227', 7, 'Islamabad'),
	  ('B229', 9, 'Lahore'),
	  ('A123', 5, 'Karachi'),
	  ('C456', 10, 'Peshawar'),
	  ('D789', 8, 'Quetta'),
	  ('F101', 12, 'Multan'),
	  ('G246', 6, 'Rawalpindi'),
	  ('H354', 4, 'Gwadar'),
	  ('I908', 15, 'Faisalabad'),
	  ('J765', 3, 'Sialkot'),
	  ('K432', 20, 'Hyderabad'),
	  ('L876', 11, 'Bahawalpur'),
	  ('M987', 14, 'Sukkur'),
	  ('N567', 2, 'Gilgit'),
	  ('O345', 6, 'Muzaffarabad'),
	  ('P123', 8, 'Sargodha'),
	  ('Q678', 9, 'Jhelum'),
	  ('R901', 13, 'Dera Ismail Khan'),
	  ('S234', 7, 'Kohat'),
	  ('T567', 10, 'Abbottabad');

--Ptype
Create table Ptype(
	Model_Number varchar(14) not null,
	primary key(Model_Number),
	pweight varchar(14) not null,
	pcapacity int not null,
);
Insert into Ptype (Model_Number,pweight,pcapacity) Values
	  ('227B', '100kg', 110),
   	  ('123A', '200kg', 150),
	  ('456B', '150kg', 120),
	  ('789C', '250kg', 170),
	  ('234D', '120kg', 100),
	  ('567E', '180kg', 130),
	  ('890F', '300kg', 200),
	  ('321G', '110kg', 90),
	  ('654H', '170kg', 140),
	  ('987I', '230kg', 180),
	  ('246J', '90kg', 80),
	  ('135K', '210kg', 160),
	  ('468L', '280kg', 190),
	  ('279M', '150kg', 120),
	  ('591N', '190kg', 140),
	  ('384O', '220kg', 170),
	  ('627P', '260kg', 200),
	  ('930Q', '280kg', 220),
	  ('753R', '240kg', 180),
	  ('246S', '200kg', 160);
	 
--Airplane
Create table Airplane(
	RegNumber varchar(14)  not null,
	primary key(RegNumber),
	
	Hanger_Number varchar(14) not null,
	Model_Number varchar(14) not null,

	Foreign key (Hanger_Number) References Hanger(Hanger_Number),
	Foreign key (Model_Number) References Ptype(Model_Number),
);
Insert into Airplane (RegNumber,Hanger_Number,Model_Number) Values
			('N45689', 'T567', '246S'),
										('N56894', 'T567', '227B'),
										('N56895', 'T567', '456B'),
										('N56896', 'T567', '789C'),
										('N56897', 'T567', '567E'),
										('N56899', 'T567', '321G'),
	('N12345', 'B227', '227B'),
	('N23456', 'B227', '227B'),
	('N34567', 'B227', '456B'),
	('N45678', 'C456', '789C'),
	('N56789', 'D789', '234D'),
	('N67890', 'F101', '567E'),
	('N78901', 'G246', '890F'),
	('N89012', 'H354', '321G'),
	('N90123', 'I908', '654H'),
	('N01234', 'J765', '987I'),
	('N45679', 'K432', '246J'),
	('N45680', 'L876', '135K'),
	('N45681', 'M987', '468L'),
	('N45682', 'N567', '279M'),
	('N45683', 'O345', '591N'),
	('N45684', 'P123', '384O'),
	('N45685', 'Q678', '627P'),
	('N45686', 'R901', '930Q'),
	('N45687', 'S234', '753R'),
	('N45688', 'T567', '246S');

--Powner
Create table Powner(
	Owner_id int not null,
	primary key(Owner_id),
	o_ssn int not null,
	oname char(25),
	oAddress varchar(50) not null,
	ophone varchar(14),
	P_flag bit not null,
	--bought_from varchar(25) not null,
);
Insert into Powner (Owner_id,o_ssn,oname,oAddress,ophone,P_flag) Values
	(22, 223, 'ABC Corporation', '123 Main Street, Anytown, USA', '123-456-7890', 0),
	(23, 334, 'ABC Corporation', '456 Maple Ave, Anytown, USA', '987-654-3210', 0),
	(24, 445, 'ABC Corporation', '789 Oak St, Anytown, USA', '555-555-1212', 0),
	(25, 556, 'Johnson Industries', '111 Elm St, Anytown, USA', '444-444-2323', 0),
	(26, 667, 'ABC Inc.', '222 Pine St, Anytown, USA', '777-777-3434', 0),	
	(27, 778, 'DEF Corporation', '333 Spruce St, Anytown, USA', '888-888-4545', 0),
	(28, 889, 'ABC Inc.', '444 Oak St, Anytown, USA', '222-222-5656', 0),
	(29, 900, 'ABC Enterprises', '555 Main St, Anytown, USA', '333-333-6767', 0),
  (21, 110, 'Ali Khizar', 'Sh# W-280, Rawalpindi', '9251-5555963', 0),
  (1, 110, 'Ali Khizar', 'Sh# W-280, Rawalpindi', '9251-5555963', 0),
  (2, 220, 'Ahmed Ali', 'Block A, Lahore', '9251-5555964', 1),
  (3, 330, 'Sana Khan', 'H# 123, Karachi', '9251-5555965', 1),
  (4, 440, 'Asad Khan', 'Sh# 5, Islamabad', '9251-5555966', 1),
  (5, 550, 'Rabia Zia', 'H# 23, Faisalabad', '9251-5555967', 1),
  (6, 660, 'Usman Malik', 'Block B, Lahore', '9251-5555968', 1),
  (7, 770, 'Aisha Noor', 'Sh# 2, Rawalpindi', '9251-5555969', 1),
  (8, 880, 'Sajid Hussain', 'H# 89, Karachi', '9251-5555970', 1),
  (9, 990, 'Fahad Ahmed', 'Block C, Islamabad', '9251-5555971', 1),
  (10, 100, 'Nashit Khan', 'H# 56, Lahore', '9251-5555972', 1),
  (11, 210, 'Saba Zafar', 'Block D, Karachi', '9251-5555973', 1),
  (12, 320, 'Bilal Raza', 'Sh# 7, Islamabad', '9251-5555974', 1),
  (13, 430, 'Sadia Malik', 'H# 90, Faisalabad', '9251-5555975', 1),
  (14, 540, 'Ahmed Khan', 'Block E, Lahore', '9251-5555976', 1),
  (15, 650, 'Sana Ali', 'Sh# 4, Rawalpindi', '9251-5555977', 1),
  (16, 760, 'Ahsan Tariq', 'H# 34, Karachi', '9251-5555978', 1),
  (17, 870, 'Nida Saeed', 'Block F, Islamabad', '9251-5555979', 1),
  (18, 980, 'Adnan Haider', 'H# 12, Lahore', '9251-5555980', 1),
  (19, 109, 'Fatima Khan', 'Block G, Karachi', '9251-5555981', 1),
  (20, 218, 'Saima Bashir', 'Sh# 3, Islamabad', '9251-5555982', 1);

--bought_from
create table bought_from(
	Owner_id int not null,
	owner2 int not null,
	
	Foreign key (Owner_id) References Powner(Owner_id),
	primary key(Owner_id,owner2)
);
Insert into bought_from(Owner_id,owner2) values 
	(1, 2),
	(2, 3),
	(3, 29),
	(4, 8),
	(5, 15),
	(6, 21),
	(7, 17),
	(8, 2),
	(9, 24),
	(10, 6),
	(11, 22),
	(12, 25),
	(13, 20),
	(14, 11),
	(15, 7),
	(16, 9),
	(17, 18),
	(18, 14),
	(19, 10),
	(20, 27),
	(21, 19),
	(22, 26),
	(23, 5),
	(24, 23),
	(25, 13),
	(26, 16),
	(27, 1),
	(28, 4),
	(29, 28);
;
--POwns
Create table POwns(
	Owner_id int not null,
	RegNumber varchar(14)  not null,

	Foreign key (Owner_id) References Powner(Owner_id),
	Foreign key (RegNumber) References Airplane(RegNumber),
	
	primary key(Owner_id,RegNumber),
	purchase_date DATE not null,
);
Insert into POwns (Owner_id,RegNumber,purchase_date) Values
		(22, 'N12345', '2023-04-06'),
		(23, 'N23456', '2023-05-06'),
		(24, 'N34567', '2023-06-06'),
		(25, 'N45678', '2023-07-06'),
		(26, 'N56789', '2023-09-06'),
		(27, 'N67890', '2023-11-06'),
		(28, 'N78901', '2023-12-06'),
		(29, 'N90123', '2023-10-06'),
		(21, 'N45689', '2023-04-06'),
		(1, 'N12345', '2023-02-01'),
		(2, 'N23456', '2023-04-15'),
		(3, 'N34567', '2023-01-10'),
		(4, 'N45678', '2023-04-23'),
		(5, 'N56789', '2023-05-07'),
		(6, 'N67890', '2023-06-11'),
		(7, 'N78901', '2023-07-02'),
		(8, 'N89012', '2023-08-12'),
		(9, 'N90123', '2023-09-08'),
		(10, 'N01234', '2023-10-18'),
		(11, 'N45679', '2023-11-19'),
		(12, 'N12345', '2023-02-01'),
		(13, 'N45681', '2023-03-12'),
		(14, 'N45682', '2023-05-23'),
		(15, 'N45683', '2023-07-28'),
		(16, 'N45684', '2023-09-15'),
		(17, 'N45685', '2023-10-25'),
		(18, 'N45686', '2023-12-01'),
		(19, 'N45687', '2023-02-09'),
		(20, 'N45688', '2023-04-06');
	
--HOwns
Create table HOwns(	
	Owner_id int not null,
	Hanger_Number varchar(14) not null,

	Foreign key (Owner_id) References Powner(Owner_id),
	Foreign key (Hanger_Number) References Hanger(Hanger_Number),
	primary key(Owner_id,Hanger_Number),
);
Insert into HOwns (Owner_id,Hanger_Number) Values
	(1, 'B227'),
    (2, 'B229'),
    (3, 'A123'),
    (4, 'C456'),
    (5, 'D789'),
    (6, 'F101'),
    (7, 'G246'),
    (8, 'H354'),
    (9, 'I908'),
    (10, 'J765'),
    (11, 'K432'),
    (12, 'L876'),
    (13, 'M987'),
    (14, 'N567'),
    (15, 'O345'),
    (16, 'P123'),
    (17, 'Q678'),
    (18, 'R901'),
    (19, 'S234'),
    (20, 'T567');

--Employees
Create table Employees(
	Emp_id varchar(14) not null,
	primary key(Emp_id),
	salary int,
	emp_shift varchar(14) not null,
	shift_type bit not null,
);
Insert into Employees(Emp_id,salary,emp_shift,shift_type) Values
 ('EMP01234',95000,'9am-5pm',0),
 ('EMP02345',80000,'10am-6pm',1),
 ('EMP03456',70000,'6pm-10pm',0),
 ('EMP04567',60000,'10pm-6am',0),
 ('EMP05678',90000,'9am-5pm',0),
 ('EMP06789',85000,'10am-6pm',1),
 ('EMP07890',75000,'6pm-10pm',0),
 ('EMP08901',65000,'10pm-6am',1),
 ('EMP09012',85000,'9am-5pm',0),
 ('EMP10123',95000,'10am-6pm',1),
 ('EMP11234',80000,'6pm-10pm',0),
 ('EMP12345',70000,'10pm-6am',1),
 ('EMP13456',60000,'9am-5pm',0),
 ('EMP14567',90000,'10am-6pm',1),
 ('EMP15678',85000,'6pm-10pm',0),
 ('EMP16789',75000,'10pm-6am',1),
 ('EMP17890',65000,'9am-5pm',0),
 ('EMP18901',85000,'10am-6pm',1),
 ('EMP19012',95000,'6pm-10pm',0),
 ('EMP20123',80000,'10pm-6am',1);


 Create table Ptrecord(
	ptr_code varchar(14) not null,
	Model_Number varchar(14) not null,

	primary key(ptr_code),
	Foreign key (Model_Number) References Ptype(Model_Number)
 );
 Insert into Ptrecord (ptr_code,Model_Number) Values
		('WC001', '227B'),
		('WC002', '123A'),
		('WC003', '456B'),
		('WC004', '789C'),
		('WC005', '234D'),
		('WC006', '567E'),
		('WC007', '890F'),
		('WC008', '321G'),
		('WC009', '654H'),
		('WC010', '987I'),
		('WC011', '246J'),
		('WC012', '135K'),
		('WC013', '468L'),
		('WC014', '279M'),
		('WC015', '591N'),
		('WC016', '384O'),
		('WC017', '627P'),
		('WC018', '930Q'),
		('WC019', '753R'),
		('WC020', '246S');	
--Servive_Record
Create table SRecord(
	sr_number varchar(14) not null,
	Work_code varchar(14) not null,
	s_date Date not null,
	s_hours int,
	
	primary key(sr_number),
);
Insert into SRecord (sr_number,Work_code,s_date,s_hours) Values 
	('SR001', 'WC001', '2023-01-01', 9),
	('SR002', 'WC002', '2023-02-15', 8),
	('SR003', 'WC003', '2023-03-18', 12),
	('SR004', 'WC004', '2023-03-23', 14),
	('SR005', 'WC005', '2023-03-20', 11),
	('SR006', 'WC006', '2023-03-19', 9),
	('SR007', 'WC007', '2023-07-10', 6),
	('SR008', 'WC008', '2023-08-21', 7),
	('SR009', 'WC009', '2023-09-17', 16),
	('SR010', 'WC010', '2023-10-08', 15),
	('SR011', 'WC011', '2023-11-13', 5),
	('SR012', 'WC012', '2023-12-25', 13),
	('SR013', 'WC013', '2023-01-02', 11),
	('SR014', 'WC014', '2023-02-19', 18),
	('SR015', 'WC015', '2023-04-23', 8),
	('SR016', 'WC016', '2023-04-21', 7),
	('SR017', 'WC017', '2023-05-02', 10),
	('SR018', 'WC018', '2023-06-15', 7),
	('SR019', 'WC019', '2023-07-20', 12),
	('SR020', 'WC020', '2023-08-29', 16),
	('SR021', 'WC001', '2023-09-01', 11),
	('SR022', 'WC002', '2023-10-15', 10),
	('SR023', 'WC003', '2023-11-11', 14),
	('SR024', 'WC004', '2023-12-23', 12),
	('SR025', 'WC005', '2023-01-05', 9),
	('SR026', 'WC006', '2023-02-19', 7),
	('SR027', 'WC007', '2023-03-10', 5),
	('SR028', 'WC008', '2023-04-21', 6),
	('SR029', 'WC009', '2023-05-17', 15),
	('SR030', 'WC010', '2023-06-08', 13),
	('SR031', 'WC011', '2023-07-13', 4),
	('SR032', 'WC012', '2023-12-25', 11),
	('SR033', 'WC013', '2023-01-02', 10),
	('SR034', 'WC014', '2023-02-19', 17),
	('SR035', 'WC015', '2023-03-05', 7),
	('SR036', 'WC016', '2023-04-21', 6),
	('SR037', 'WC017', '2023-05-02', 9),
	('SR038', 'WC018', '2023-06-15', 6);
--Pservice
Create table Pservice(
	sr_number varchar(14) not null,
	RegNumber varchar(14)  not null,
	Maintenance_status bit not null,

	Foreign key (sr_number) References SRecord(sr_number),
	Foreign key (RegNumber) References Airplane(RegNumber),

	primary key(RegNumber,sr_number),
);
INSERT INTO Pservice (sr_number, RegNumber,Maintenance_status)
VALUES
		('SR001', 'N12345', 1),
		('SR002', 'N23456', 0),
		('SR003', 'N34567', 1),
		('SR004', 'N45678', 0),
		('SR005', 'N56789', 1),
		('SR006', 'N67890', 0),
		('SR007', 'N78901', 1),
		('SR008', 'N89012', 0),
		('SR009', 'N90123', 1),
		('SR010', 'N01234', 0),
		('SR011', 'N45679', 1),
		('SR012', 'N45680', 0),
		('SR013', 'N45681', 1),
		('SR014', 'N45682', 0),
		('SR015', 'N45683', 1),
		('SR016', 'N45684', 0),
		('SR017', 'N45685', 1),
		('SR018', 'N45686', 0),
		('SR019', 'N45687', 1),
		('SR020', 'N45688', 0),
		('SR021', 'N12345', 1),
		('SR022', 'N23456', 0),
		('SR023', 'N34567', 1),
		('SR024', 'N45678', 0),
		('SR025', 'N56789', 1),
		('SR026', 'N67890', 0),
		('SR027', 'N78901', 1),
		('SR028', 'N89012', 0),
		('SR029', 'N90123', 1),
		('SR030', 'N01234', 0),
		('SR031', 'N45679', 1),
		('SR032', 'N45680', 0),
		('SR033', 'N45681', 1),
		('SR034', 'N45682', 0),
		('SR035', 'N45683', 1),
		('SR036', 'N45684', 0),
		('SR037', 'N45685', 1),
		('SR038', 'N45686', 0);

--Works_on
Create table Works_on(
	Model_Number varchar(14) not null,
	Emp_id varchar(14) not null,

	Foreign key (Model_Number) References Ptype(Model_Number),
	Foreign key (Emp_id) References Employees(Emp_id),

	primary key(Emp_id,Model_Number),
);
Insert into Works_on (Model_Number,Emp_id) Values
	('227B', 'EMP01234'),
	('123A', 'EMP02345'),
	('456B', 'EMP03456'),
	('789C', 'EMP04567'),
	('234D', 'EMP05678'),
	('567E', 'EMP06789'),
	('890F', 'EMP07890'),
	('321G', 'EMP08901'),
	('654H', 'EMP09012'),
	('987I', 'EMP10123'),
	('246J', 'EMP11234'),
	('135K', 'EMP12345'),
	('468L', 'EMP13456'),
	('279M', 'EMP14567'),
	('591N', 'EMP15678'),
	('384O', 'EMP16789'),
	('627P', 'EMP17890'),
	('930Q', 'EMP18901'),
	('753R', 'EMP19012'),
	('246S', 'EMP20123');

--Pilot
Create table Pilot(
	Pssn varchar(14) not null,
	Lic_Number varchar(25) not null,
	primary key(Pssn),
	Prestrictions char(25),
	Model_Number varchar(14) not null,

	Foreign key(Model_Number) References Ptype(Model_Number),

);
Insert into Pilot (Pssn,Lic_Number,Prestrictions,Model_Number) Values
		('1A', 'PLT0123456789', 'None', '227B'),
		('1B', 'PLT1234567890', 'Night', '123A'),
		('1C', 'PLT2345678901', 'None', '456B'),
		('1D', 'PLT3456789012', 'None', '789C'),
		('1E', 'PLT4567890123', 'Medical', '234D'),
		('1F', 'PLT5678901234', 'None', '567E'),
		('1G', 'PLT6789012345', 'None', '890F'),
		('1H', 'PLT7890123456', 'None', '321G'),
		('1I', 'PLT8901234567', 'None', '654H'),
		('1J', 'PLT9012345678', 'Night', '987I'),
		('1K', 'PLT1123456789', 'None', '246J'),
		('1L', 'PLT0012345678', 'None', '135K'),
		('1M', 'PLT0023456789', 'None', '468L'),
		('1N', 'PLT0034567890', 'Medical', '279M'),
		('1O', 'PLT0045678901', 'None', '591N'),
		('1P', 'PLT0056789012', 'None', '384O'),
		('1Q', 'PLT0067890123', 'None', '627P'),
		('1R', 'PLT0078901234', 'None', '930Q'),
		('1S', 'PLT0089012345', 'None', '753R'),
		('1T', 'PLT0090123456', 'None', '246S'),
		('1U', 'PLT1123456789', 'None', '227B'),
		('1V', 'PLT1234567890', 'Night', '123A'),
		('1W', 'PLT2345678901', 'None', '456B'),
		('1X', 'PLT3456789012', 'None', '789C'),
		('1Y', 'PLT4567890123', 'Medical', '234D'),
		('1Z', 'PLT5678901234', 'None', '567E'),
		('2A', 'PLT6789012345', 'None', '890F'),
		('2B', 'PLT7890123456', 'None', '321G'),
		('2C', 'PLT8901234567', 'None', '654H'),
		('2D', 'PLT9012345678', 'Night', '987I'),
		('2E', 'PLT1123456789', 'None', '246J'),
		('2F', 'PLT0012345678', 'None', '135K'),
		('2G', 'PLT0023456789', 'None', '468L'),
		('2H', 'PLT0034567890', 'Medical', '279M'),
		('2I', 'PLT0045678901', 'None', '591N'),
		('2J', 'PLT0056789012', 'None', '384O'),
		('2K', 'PLT0067890123', 'None', '627P'),
		('2L', 'PLT0078901234', 'None', '930Q'),
		('2M', 'PLT0089012345', 'None', '753R'),
		('2N', 'PLT0090123456', 'None', '246S');

--Maintains
Create table Maintain(
	sr_number varchar(14) not null,
	Emp_id varchar(14) not null,
	Total_hours int not null,

	Foreign key (Emp_id) References Employees(Emp_id),
	Foreign key (sr_number) References SRecord(sr_number),

	primary key(Emp_id,sr_number),
);
INSERT INTO Maintain ( sr_number,Emp_id, Total_hours) VALUES
		('SR001', 'EMP01234', 75),
		('SR002', 'EMP02345', 95),
		('SR003', 'EMP03456', 80),
		('SR004', 'EMP04567', 60),
		('SR005', 'EMP05678', 110),
		('SR006', 'EMP06789', 70),
		('SR007', 'EMP07890', 85),
		('SR008', 'EMP08901', 50),
		('SR009', 'EMP09012', 105),
		('SR010', 'EMP10123', 65),
		('SR011', 'EMP11234', 90),
		('SR012', 'EMP12345', 100),
		('SR013', 'EMP13456', 75),
		('SR014', 'EMP14567', 55),
		('SR015', 'EMP15678', 80),
		('SR016', 'EMP16789', 95),
		('SR017', 'EMP17890', 70),
		('SR018', 'EMP18901', 105),
		('SR019', 'EMP19012', 85),
		('SR020', 'EMP20123', 60),
		('SR021', 'EMP01234', 95),
		('SR022', 'EMP02345', 70),
		('SR023', 'EMP03456', 100),
		('SR024', 'EMP04567', 80),
		('SR025', 'EMP05678', 75),
		('SR026', 'EMP06789', 110),
		('SR027', 'EMP07890', 65),
		('SR028', 'EMP08901', 90),
		('SR029', 'EMP09012', 70),
		('SR030', 'EMP10123', 85),
		('SR031', 'EMP11234', 50),
		('SR032', 'EMP12345', 105),
		('SR033', 'EMP13456', 95),
		('SR034', 'EMP14567', 75),
		('SR035', 'EMP15678', 80),
		('SR036', 'EMP16789', 90),
		('SR037', 'EMP17890', 65),
		('SR038', 'EMP18901', 100);
