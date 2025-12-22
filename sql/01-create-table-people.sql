-- Defining the active database
USE testDB;

-- Creating the People table
CREATE TABLE People (
  PersonID INT AUTO_INCREMENT PRIMARY KEY, /* Generate an automatic ID and do not accept null or duplicate values */
  Name VARCHAR(255) NOT NULL, /* Empty values ​​are not accepted in the table */
  Email VARCHAR(100) UNIQUE, /* It does not accept duplicate values */
  Lastname VARCHAR(255) NOT NULL,
  Country VARCHAR(255)
);