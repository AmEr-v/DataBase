drop database RosiDB;
CREATE database RosiDB;
use RosiDB;

CREATE TABLE Country (
    CountryId int auto_increment,
    CountryName varchar(50),
    Primary key(CountryId)
);

CREATE TABLE Ppl(
    PersonId int auto_increment,
    PersonName varchar(225),
    CountryId int not null,
    Primary key (PersonId),
    Foreign key (CountryId) References Country(CountryId)
);
INSERT INTO `country` (`CountryId`, `CountryName`) VALUES ('17', 'Denmark');
INSERT INTO `country` (`CountryId`, `CountryName`) VALUES ('18', 'Bosnia and herzegovina');

INSERT INTO Ppl (personId, PersonName, CountryId) VALUES ('1' , 'John', 17);
INSERT INTO Ppl (personId, PersonName, CountryId) VALUES ('2' , 'Angelina', 18);
INSERT INTO Ppl (personId, PersonName, CountryId) VALUES ('3' , 'Ahmed', 17);
