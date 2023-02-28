drop database RosiDB;
CREATE database RosiDB;
use RosiDB;

CREATE TABLE Country (
    CountryId int auto_increment,
    CountryName varchar(50),
    CountryPopulation int,
    Primary key(CountryId)
);

CREATE TABLE Ppl(
    PersonId int auto_increment,
    PersonName varchar(225),
    CountryId int not null,
    Primary key (PersonId),
    Foreign key (CountryId) References Country(CountryId)
);
INSERT INTO `country` (`CountryName`, CountryPopulation) VALUES ('Denmark', "5857000");
INSERT INTO `country` (`CountryName`, CountryPopulation) VALUES ('Bosnia and herzegovina', "3271000");
INSERT INTO `country` (`CountryName`, CountryPopulation) VALUES ('USA', "310000000");
INSERT INTO `country` (`CountryName`, CountryPopulation) VALUES ('Portugal', "10000000");

INSERT INTO Ppl (personId, PersonName, CountryId) VALUES ('1' , 'John', 1);
INSERT INTO Ppl (personId, PersonName, CountryId) VALUES ('2' , 'Angelina', 2);
INSERT INTO Ppl (personId, PersonName, CountryId) VALUES ('3' , 'Ahmed', 2);
