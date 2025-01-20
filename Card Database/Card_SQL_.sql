use insightflow

Create Table Card(
CardID Varchar(36) Primary key,
Content Varchar(100)
);

Create Table Board(
BoardName Varchar(50) Primary key);

Create Table Category(
CategoryID VarChar(15),
CategoryType varchar(50)
);

Alter table Category
drop column CategoryID

Alter Table Category
Add CategoryID VarChar(15) Primary key

Alter Table Card
Add CategoryID VarChar(15) References Category(CategoryID)

Alter table Category
Add BoardName Varchar(50) References Board(BoardName)
