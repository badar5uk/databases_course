Use Hotel;

Create TABLE Hotel(
HotelID varchar(30) Primary Key,
Name varchar(30),
Location varchar(30),
Contact_number varchar(30),
);

Create TABLE Staff(
StaffID varchar(30)Primary key,
Name varchar(30),
Position varchar(30),
Contact_number varchar(30),
);

ALter TABLE Staff
ADD HotelID varchar(30)
References Hotel(HotelID);

Create TABLE Room(
RoomID varchar(30)Primary key,
Room_Number varchar(30),
Type varchar(30),
Status varchar(30),
Price_per_night DEC
);

ALter TABLE Room
ADD HotelID varchar(30)
References Hotel(HotelID);

Create TABLE Guest(
GuestID Varchar(30) Primary key,
Name varchar(30),
Goverment_ID INT,
Contact_number varchar(30),
);

Create TABLE Booking(
BookingID Varchar(30) Primary key,
Booking_Date Date,
Check_in_date Date,
Check_out_date Date,
Status varchar(30),
Total_Cost Dec,
);

ALter TABLE Booking
ADD RoomID varchar(30)
References Room(RoomID);

Alter TABLE Guest
ADD Primary key (GuestID);

ALter TABLE Booking
ADD GuestID varchar(30)
References Guest(GuestID);

Create TABLE Payment(
Transaction_date Date,
Amount Dec,
Method varchar(30)
);

ALter TAble booking
ADD constraint PK_Booking Primary key (BookingID)

ALter TAble Payment
ADD Transaction_ID varchar(30) Primary key;

Alter Table Payment
ADD BookingID Varchar(30) 
References Booking(BookingID);

Create Table Review(
ReviewID Varchar(30) Primary key,
Review_Date Date,
Rating Dec,
);

Alter Table Review
ADD GuestID varchar(30)
References Guest(GuestID);

Alter TAble REview 
ADD HotelID varchar(30) 
References Hotel(HotelID)

Create Table Comment(
Comment Varchar(300)
);

Alter TAble Comment
ADD ReviewID Varchar(30)
References Review(ReviewID);


ALTER TABLE Booking
ALTER COLUMN
  BookingID 
    VARCHAR(30) NOT NULL;

ALter TAble booking
ADD constraint PK_Booking Primary key (BookingID)

Alter Table Payment
ADD BookingID Varchar(30) 
References Booking(BookingID);

ALTER TABLE Hotel
ADD UNIQUE (Name)
Alter TAble Room
ADD UNIQUE (Room_Number)


ALTER TABLE Room
ADD Room_Type VARCHAR(10) NOT NULL CHECK (Room_Type IN('Single', 'Double', 'Suite'))

Alter TAble Booking
ADD Booking_status VARCHAR(10) NOT NULL CHECK (Booking_status IN('Pending', 'Confirmed', 'Canceled', 'Check-in', 'Check-out' ))

Alter TAble Room
Add Price_Per_Night Varchar(30) Check (Price_Per_Night>0)


ALter Table Payment
ADD Amount VArchar(30) Check (Amount>0)

Alter table Review
ADD Rating Dec Check(Rating>=1 AND Rating<=5)

/*
ALTER TABLE Staff
drop CONSTRAINT fk_HotelID;
*/

Alter TAble Comment
ADD CONSTRAINT FK__Comment__ReviewI__534D60F1
 FOREIGN KEY (ReviewID)
REFERENCES Review(ReviewID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALter TAble Room
ADD Room_Status BIT not null default 1;

Alter TAble Booking
ADD CONSTRAINT DF_SomeName DEFAULT 'Pending' FOR Booking_status;

Alter TAble Booking
Add Constraint check_date_validity Check (Check_in_date <= Check_out_date);

Alter Table Comment
ADD CONSTRAINT some_Constraint DEFAULT 'No comments' FOR Comment;