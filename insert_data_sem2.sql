-- Infoga data i 'student'-tabellen
INSERT INTO student (student_id, sibling_group_id, first_name, last_name, person_number, street, zip, city)
VALUES
(1001, 1, 'Anna', 'Andersson', '890101-1234', 'Gatan 1', '12345', 'Staden'),
(1002, 1, 'Bertil', 'Bengtsson', '900202-2345', 'Vägen 2', '23456', 'Byn'),
(1003, 2, 'Cecilia', 'Carlsson', '910303-3456', 'Stigen 3', '34567', 'Orten');
-- Upprepa detta mönster för att lägga till fler rader

-- Infoga data i 'instructor'-tabellen
INSERT INTO instructor (instructor_id, first_name, last_name, person_number, street, zip, city, ensamble)
VALUES
(1, 'David', 'Dahl', '920404-4567', 'Allén 4', '45678', 'Kommunen', FALSE),
(2, 'Erika', 'Eriksson', '930505-5678', 'Banan 5', '56789', 'Församlingen', TRUE);
-- Upprepa för att lägga till fler instruktörer

-- Infoga data i 'instrument'-tabellen
INSERT INTO instrument (instrument_id, type, brand, price, category, available)
VALUES
(1, 'Gitarr', 'Yamaha', 1000, 'Stränginstrument', TRUE),
(2, 'Piano', 'Steinway', 2000, 'Tangentinstrument', FALSE);
-- Lägg till fler instrument efter behov

-- Infoga data i 'student_numbert'-tabellen
INSERT INTO student_number (number_id, student_id)
VALUES
(991, 1001),
(992, 1002),
(993,1003);
-- Lägg till fler efter behov

--Infoga data i 'number'- tabellen
INSERT INTO number (number_id, phone_number)
VALUES
(991, '0714312345'),
(992, '0747634789'),
(993, '0747617634');

--
