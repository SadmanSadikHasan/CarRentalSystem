Create Database Car_Rental_System1


Create Table LogInPage(
Id int IDENTITY(1,1) PRIMARY KEY,
Username varchar(50) not null,
Password varchar(20) not null,
Email_Address varchar(100)
)

Create Table Booking1(
Booking_ID int IDENTITY(1,1),
Contact_no varchar(50) Primary KEY,
Destiation varchar(50),
Starting_Date date,
Return_Date date,
Duration int
)

Create Table Car_Info1(
Car_Id int IDENTITY(1,1) PRIMARY KEY,
Model varchar(50),
Type varchar(50),
Color varchar(50),
)

Insert Into Car_Info1 values ('Allion(Toyota)','Sedan','Silver'),
							('Civic(Honda)','Sedan','Black'),
							('Odyssey(Honda)','Minivan','White'),
							('HiAce(Toyota)','Micro','Black'),
							('HiAce(Toyota)','Micro','White'),
							('Pajero(Mitsubishi)','SUV','Black'),
							('Pajero(Mitsubishi)','SUV','Silver'),
							('Pajero(Toyota)','SUV','Silver'),
							('Fortuner(Toyota)','SUV','Black'),
							('BMW M340i','Sedan','Blue'),
							('Pajero(Toyota)','SUV','White'),
							('Civic(Honda)','Sedan','Blue'),
							('Allion(Toyota)','Sedan','Red'),
							('Fortuner(Toyota)','SUV','Silver')


Create Table Available(
Available_Id int Identity(1,1) PRIMARY KEY,
Available varchar(10) NULL Default 'Yes',
Car_Id int foreign key references Car_Info1(Car_Id)
)

Insert Into Available (Car_Id) values (1),
							(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14)

Select * from Available

Create Table Customer2(
Customer_Id int IDENTITY(1,1) PRIMARY KEY,
Customer_Name varchar(50),
Contact_no varchar(50) foreign key references Booking1(Contact_no),
Driving_Lisense varchar(50),
NID_no varchar(50),
Address varchar(50),
Car_Id int foreign key references Car_Info1(Car_Id)
)

Create Table Payment(
Payment_Id int IDENTITY(1,1) PRIMARY KEY,
TotalAmount int,
Due int,
Customer_Id int foreign key references Customer2(Customer_Id),
Status varchar(100),
Fine int 
)

Alter table Payment alter column Fine int NULL 
Select * from Payment
Select * from Customer2
Select * from Booking1
Select * from LogInPage

Select Customer_Id, Contact_no from Customer2 
Where Customer_Id = Any(
Select p.Customer_Id from Payment as p Where Status = 'Complete')

Select Payment_Id, TotalAmount, Fine, TotalAmount+Fine as tf from Payment as p  inner join Customer2 as c ON p.Customer_Id = c.Customer_Id where Status = 'Complete'

Select Sum(TotalAmount+Fine) as tf from Payment

Select c.Customer_Id, Contact_no, p.Payment_Id, p.TotalAmount, p.Fine  from Customer2 as c
inner join (Select  TotalAmount+Fine as tf from Payment as p where Status = 'Complete') 


Select Datediff(day, 2021-04-01, 2021-04-05) 

Update Available Set Available = 'Yes' where Car_Id = 
(Select Car_Id from Customer2 where Customer_Id = 4)
