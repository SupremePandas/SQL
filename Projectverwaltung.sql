CREATE DATABASE Projectverwaltung;
USE Projectverwaltung;
-- Erstellen von Datenbank und benutzen

CREATE TABLE `Projekt`(
`PNr` int(11) NOT NULL,
`Bezeichnung` varchar(45) NOT NULL,
`Budget` varchar(45) NOT NULL,
`Star` varchar(45) NOT NULL,
`Ende` varchar(45) NOT NULL,
`KID` int(11) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `Kunde`(
`KID` int(11) NOT NULL,
`Postleitzahl` int(5) NOT NULL,
`Ort` varchar(45) NOT NULL,
`Strasse` varchar(45) NOT NULL,
`Telefon` varchar(45) NOT NULL,
`Email` varchar(45) NOT NULL,
`Kundenart` varchar(45) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `Geschaeftskunde`(
`KID` int(11) NOT NULL,
`Firmenname` varchar(45) NOT NULL,
`URL` varchar(45) NOT NULL,
`Ansprechpartner` varchar(45) NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `Privatkunde`(
`KID` int(11) NOT NULL,
`Name` varchar(45) NOT NULL,
`Vorname` varchar(45) NOT NULL,
`Geburtsdatum` date NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- Alle daten hier drin gehören zur keiner Person alles nur als TEST

INSERT INTO `Projekt` (`PNr`, `Bezeichnung`,`KID`) VALUES
(1, 'Zeiterfassung AixDB GmbH', 1),
(11, 'Sicherheitssystem einrichten', 1),
(20, 'Schülerverwaltung', 1),
(5, 'Private Cloud', 2),
(21, 'Schulung OOP', 2),
(4, 'Intranet', 6),
(3, 'Homepage', 7),
(2, 'SQL-Datenbank', 10),
(9, 'Backup von allen Rechnern erstellen', 3),
(6, 'Proxy einrichten', 4),
(8, 'Einrichtung von Servern', 5),
(10, 'Server Backup', 8),
(7, 'Verkabelung Gebäude', 9);



INSERT INTO `Kunde` (`KID`, `Postleitzahl`, `Ort`, `Strasse`, `Telefon`, `Email`) VALUES
(1, '50181', 'Bedburg', 'Augustinerallee 2.', '02272 838126', 'toni_dolfen@aol.de'),
(2, '50737', 'Köln', 'Neusser Str. 520.', '0221 97728910', 'mail@adels-it.de'),
(6, '50189', 'Elsdorf', 'Köln-Aachener-Str. 132.', '02274 6194', 'info@nicom-edv.de'),
(7, '41464', 'Neuss', 'Eichendorfstr. 42.', '02274 6194', 'info@csmeyer.de'),
(10, '41564', 'Kaarst', 'Weißdornweg 2.', '02131 4029433', 'mail@dmdata.de'),
(3, '50181', 'Bedburg', 'Franz-Brandt Str. 503', '02272 981763', 'Uli_Berg@web.de'),
(4, '50737', 'Köln', 'Militärring 50', '0221 97324432', 'Mattias0@gmail.com'),
(5, '50189', 'Elsdorf', 'Musterstraße 999', '02274 98797', 'MaximilianMuster@aol.de'),
(8, '41564', 'Kaarst', 'Holzweg 7', '071 29876133', 'HolzwegFrank@frankus.eu'),
(9, '41464', 'Neuss', 'Furt 123', '0152 0179 28347', 'FritzFritz@aol.de');


INSERT INTO `Geschaeftskunde` VALUES
(1, 'IT-Dienstleistung', 'http://it-dienst24.com/', 'Toni Dolfen'),
(2, 'Adels IT Service', 'http://www.adels-it.de/', 'Torsten Adels'),
(6, 'NICOM-EDV', 'http://www.nicomedv.de/', 'Nicola Tortorelli'),
(7, 'CSMeyer Computer Service', 'http://www.csmeyer.de/', 'Thomas Meyer'),
(10, 'Computer Service Gilsbach', 'http://www.dmdata.de/', 'Detlef Moske');


INSERT INTO `Privatkunde` VALUES
(3, 'Berg', 'Uli', '1967.04.12'), 
(4, 'Zero', 'Mattias', '1971.10.14'),
(5, 'Mehler', 'Maximilian','1990.12.29'),
(8, 'Frankus', 'Frank', '1986.09.07'),
(9, 'Fritz', 'Fritz', '1985.08.07');



-- Testdaten Privatkunden:
select k.KID, p.Name, p.Vorname, date_format(p.Geburtsdatum, "%d.%m.%Y") Geburtsdatum, k.Postleitzahl, k.Ort, k.Strasse, k.Telefon, k.Email, pr.PNr, Pr.Bezeichnung
from Kunde k
inner join Privatkunde p on k.KID=p.KID
inner join Projekt pr on pr.KID=k.KID;

-- Testdaten Geschäftskunden:
select k.KID, g.Firmenname, g.URL, g.Ansprechpartner, k.Postleitzahl, k.Ort, k.Strasse, k.Telefon, k.Email, p.PNr, p.Bezeichnung
from Kunde k
inner join Geschaeftskunde g on k.KID=g.KID
inner join Projekt p on p.KID=k.KID;
