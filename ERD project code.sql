CREATE TABLE Salesperson (
    SalespersonID INT PRIMARY KEY,
    Name VARCHAR(255)
   
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255)
    
);

CREATE TABLE Car (
    CarID INT PRIMARY KEY,
    SerialNum VARCHAR(255) UNIQUE,
    Model VARCHAR(255)
   
);

CREATE TABLE Invoice (
    InvoiceID INT PRIMARY KEY,
    Date DATE,
    Amount DECIMAL(10, 2),
    SalespersonID INT,
    CustomerID INT,
    CarID INT,
    FOREIGN KEY (SalespersonID) REFERENCES Salesperson(SalespersonID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
   
);

CREATE TABLE ServiceTicket (
    TicketID INT PRIMARY KEY,
    Date DATE,
    CustomerID INT,
    CarID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
  
);

CREATE TABLE ServiceHistory (
    HistoryID INT PRIMARY KEY,
    ServiceDetails TEXT,
    CarID INT UNIQUE,
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
    
);

CREATE TABLE Mechanic (
    MechanicID INT PRIMARY KEY,
    Name VARCHAR(255)
  
);

CREATE TABLE CarRepair (
    MechanicID INT,
    CarID INT,
    PRIMARY KEY (MechanicID, CarID),
    FOREIGN KEY (MechanicID) REFERENCES Mechanic(MechanicID),
    FOREIGN KEY (CarID) REFERENCES Car(CarID)
);

CREATE TABLE Parts (
    PartID INT PRIMARY KEY,
    Name VARCHAR(255),
    Price DECIMAL(10, 2)
   
);

CREATE TABLE CarPartsOrder (
    CarID INT,
    PartID INT,
    PRIMARY KEY (CarID, PartID),
    FOREIGN KEY (CarID) REFERENCES Car(CarID),
    FOREIGN KEY (PartID) REFERENCES Parts(PartID)
);



-- Data for tables
INSERT INTO Salesperson (SalespersonID, Name)
VALUES
    (1, 'John Doe'),
    (2, 'Jane Smith');
   

   -- Customer table

INSERT INTO Customer (CustomerID, Name)
VALUES
    (1, 'Alice Johnson'),
    (2, 'Bob Williams');

--  Car table
INSERT INTO Car (CarID, SerialNum, Model)
VALUES
    (1, 'ABC123', 'Toyota Corolla'),
    (2, 'XYZ789', 'Honda Accord');

-- Invoice table
INSERT INTO Invoice (InvoiceID, Date, Amount, SalespersonID, CustomerID, CarID)
VALUES
    (1, '2023-12-01', 25000.00, 1, 1, 1),
    (2, '2023-12-10', 30000.00, 2, 2, 2);

-- ServiceTicket table
INSERT INTO ServiceTicket (TicketID, Date, CustomerID, CarID)
VALUES
    (1, '2024-01-10', 1, 1),
    (2, '2024-01-11', 2, 2);

-- ServiceHistory table
INSERT INTO ServiceHistory (HistoryID, ServiceDetails, CarID)
VALUES
    (1, 'Regular maintenance', 1),
    (2, 'Engine repair', 2);

-- Mechanic table
INSERT INTO Mechanic (MechanicID, Name)
VALUES
    (1, 'Mike Miller'),
    (2, 'Lisa Lewis');

--  Car Repair  table 
INSERT INTO CarRepair (MechanicID, CarID)
VALUES
    (1, 1),
    (2, 2);

--  Customer Parts table
INSERT INTO Parts (PartID, Name, Price)
VALUES
    (1, 'Oil Filter', 10.00),
    (2, 'Spark Plugs', 15.00);

--  Car Parts order table 
INSERT INTO CarPartsOrder (CarID, PartID)
VALUES
    (1, 1),
    (2, 2);
    
   
   