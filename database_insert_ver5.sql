 -- sibling_group

INSERT INTO sibling_group (student_id, sibling_group_id)
VALUES 
(1050, 100), -- Törnkvist
(1051, 100),
(1052, 100);
INSERT INTO sibling_group (student_id, sibling_group_id)
VALUES 
(1005, 101), -- Erika Eriksson
(1035, 101); -- Erik Eriksson
INSERT INTO sibling_group (student_id, sibling_group_id)
VALUES 
(1006, 102), -- Fredrik Fredriksson
(1036, 102); -- Frida Fredriksson
INSERT INTO sibling_group (student_id, sibling_group_id)
VALUES 
(1004, 103), -- David Danielsson
(1034, 103); -- Diana Danielsson





-- 'number' --
INSERT INTO number (number_id, phone_number)
VALUES
(401, '0751863865'),
(402, '0751863866'),
(403, '0751863867'),
(404, '0751863868'),
(405, '0751863869'),
(406, '0751863870'),
(407, '0751863871'),
(408, '0751863872'),
(409, '0751863873'),
(410, '0751863874'),
(411, '0751863875'),
(412, '0751863876'),
(413, '0751863877'),
(414, '0751863878'),
(415, '0751863879'),
(416, '0751863880'),
(417, '0751863881'),
(418, '0751863882'),
(419, '0751863883'),
(420, '0751863884'),
(421, '0751863885'),
(422, '0751863886'),
(423, '0751863887'),
(424, '0751863888'),
(425, '0751863889'),
(426, '0751863890'),
(427, '0751863891'),
(428, '0751863892'),
(429, '0757823401');




-- student --
INSERT INTO student (student_id, first_name, last_name, person_number, street, zip, city)
VALUES
(1004, 'David', 'Danielsson', '920404-4567', 'Alley 4', '45678', 'Town'),
(1005, 'Erika', 'Eriksson', '930505-5678', 'Boulevard 5', '56789', 'Village'),
(1006, 'Fredrik', 'Fredriksson', '940606-6789', 'Court 6', '67890', 'City'),
(1030, 'Zara', 'Zachrisson', '970727-8901', 'Lane 27', '90123', 'Place'),
(1031, 'Axel', 'Axelsson', '980828-9012', 'Drive 28', '91234', 'Metropolis'),
(1032, 'Bella', 'Björnsson', '990929-0123', 'Route 29', '92345', 'Borough'),
(1033, 'Carl', 'Carlson', '001030-1234', 'Avenue 30', '93456', 'District'),
(1034, 'Diana', 'Danielsson', '020202-2345', 'Plaza 31', '94567', 'Hamlet'),
(1035, 'Erik', 'Eriksson', '030303-3456', 'Circle 32', '95678', 'Town'),
(1036, 'Frida', 'Fredriksson', '040404-4567', 'Bypass 33', '96789', 'Village'),
(1037, 'Gustav', 'Gustavsson', '050505-5678', 'Parkway 34', '97890', 'City'),
(1038, 'Hanna', 'Hansson', '060606-6789', 'Square 35', '98901', 'Metropolis'),
(1039, 'Ivar', 'Ivarsson', '070707-7890', 'Expressway 36', '99012', 'Borough'),
(1040, 'Johanna', 'Johansson', '080808-8901', 'Terrace 37', '99123', 'District'),
(1041, 'Karl', 'Karlsson', '090909-9012', 'Trail 38', '99234', 'Hamlet'),
(1042, 'Linda', 'Lindsson', '101010-0123', 'Way 39', '99345', 'Town'),
(1043, 'Magnus', 'Magnusson', '111111-1234', 'Lane 40', '99456', 'Village'),
(1044, 'Nina', 'Nilsson', '121212-2345', 'Pathway 41', '99567', 'Metropolis'),
(1045, 'Oscar', 'Olsson', '131313-3456', 'Alleyway 42', '99678', 'Town'),
(1046, 'Petra', 'Pettersson', '141414-4567', 'Road 43', '99789', 'Village'),
(1047, 'Quintus', 'Quist', '151515-5678', 'Street 44', '99890', 'City'),
(1048, 'Rita', 'Robertsson', '161616-6789', 'Boulevard 45', '99901', 'Hamlet'),
(1049, 'Stefan', 'Svensson', '171717-7890', 'Drive 46', '100012', 'Borough'),
(1050, 'Tina', 'Törnqvist', '181818-8901', 'Avenue 47', '100123', 'District'),
(1051, 'Ulf', 'Ulriksson', '191919-9012', 'Court 48', '100234', 'Hamlet'),
(1052, 'Vera', 'Viktorsson', '202020-0123', 'Way 49', '100345', 'Town'),
(1053, 'Wilma', 'Wallin', '212121-1234', 'Route 50', '100456', 'Village');




-- 'student_number' --
INSERT INTO student_number (number_id, student_id)
VALUES
(402, 1004),
(403, 1005),
(404, 1006),
--(405, 1029),
(406, 1030),
(407, 1031),
(408, 1032),
(409, 1033),
(410, 1034),
(411, 1035),
(412, 1036),
(413, 1037),
(414, 1038),
(415, 1039),
(416, 1040),
(417, 1041),
(418, 1042),
(419, 1043),
(420, 1044),
(421, 1045),
(422, 1046),
(423, 1047),
(424, 1048),
(425, 1049),
(426, 1050),
(427, 1051),
(428, 1052),
(429, 1053);

-- 'contact_id' --
INSERT INTO contact (contact_id, first_name, last_name, relation, phone_number) VALUES
(3001, 'Fredrik', 'Andersson', 'Pappa', '0736271826'),
(3002, 'Donna', 'Svensson', 'Assistent', '0761234569'),
(3003, 'Anna', 'Karlsson', 'Kusin', '0741234567'),
(3004, 'Erik', 'Svensson', 'Morbror', '0752345678'),
(3005, 'Maria', 'Lindgren', 'Farmor', '0763456789'),
(3006, 'Johan', 'Eriksson', 'Bror', '0774567890'),
(3007, 'Sara', 'Johansson', 'Syster', '0785678901'),
(3008, 'Karl', 'Nilsson', 'Farfar', '0796789012'),
(3009, 'Emma', 'Gustafsson', 'Mosters dotter', '0807890123'),
(3010, 'Oscar', 'Larsson', 'Morfars bror', '0818901234'),
(3011, 'Lisa', 'Öberg', 'Fasters dotter', '0829012345'),
(3012, 'Peter', 'Ström', 'Svärfar', '0830123456');


-- 'student_contact' --
INSERT INTO student_contact (contact_id, student_id)
VALUES 
(3001, 1047),
(3002, 1030),
(3003, 1031),
(3004, 1032),
(3005, 1033),
(3006, 1034),
(3007, 1035),
(3008, 1036),
(3009, 1037),
(3010, 1038),
(3011, 1039);


-- instrument_rental --
INSERT INTO instrument_rental (instrument_rental_id, type, brand, price_per_month, category, available, date)
VALUES 
(4001,'Guitar', 'Yamaha', 30.00, 'String', TRUE, '2023-01-01'),
(4002,'Violin', 'Stentor', 25.00, 'String', TRUE, '2023-01-02'),
(4003,'Piano', 'Steinway', 100.00, 'Keyboard', FALSE, '2023-01-03'),
(4004,'Flute', 'Yamaha', 20.00, 'Woodwind', TRUE, '2023-01-04'),
(4005,'Clarinet', 'Buffet', 35.00, 'Woodwind', TRUE, '2023-01-05'),
(4006,'Saxophone', 'Selmer', 40.00, 'Woodwind', TRUE, '2023-01-06'),
(4007,'Trumpet', 'Bach', 30.00, 'Brass', TRUE, '2023-01-07'),
(4008,'Trombone', 'Conn', 35.00, 'Brass', TRUE, '2023-01-08'),
(4009,'Drums', 'Pearl', 50.00, 'Percussion', TRUE, '2023-01-09'),
(4010,'Cello', 'Stradivari', 45.00, 'String', TRUE, '2023-01-10'),
(4011,'Bass Guitar', 'Fender', 33.00, 'String', TRUE, '2023-01-11'),
(4012,'Accordion', 'Hohner', 27.00, 'Keyboard', TRUE, '2023-01-12'),
(4013,'Harp', 'Lyon & Healy', 60.00, 'String', TRUE, '2023-01-13'),
(4014,'Oboe', 'Yamaha', 40.00, 'Woodwind', TRUE, '2023-01-14'),
(4015,'French Horn', 'Holton', 45.00, 'Brass', TRUE, '2023-01-15'),
(4016,'Tuba', 'Miraphone', 55.00, 'Brass', TRUE, '2023-01-16'),
(4017,'Xylophone', 'Musser', 25.00, 'Percussion', TRUE, '2023-01-17'),
(4018,'Banjo', 'Gibson', 28.00, 'String', TRUE, '2023-01-18'),
(4019,'Mandolin', 'Fender', 22.00, 'String', TRUE, '2023-01-19'),
(4020,'Ukulele', 'Kamaka', 18.00, 'String', TRUE, '2023-01-20');


-- instrument_booking --
INSERT INTO instrument_booking (instrument_booking_id, instrument_rental_id, start_date, end_date, delivery)
VALUES 
(5001 ,4001, '2023-01-01', '2023-06-01', TRUE),
(5002 ,4002, '2023-02-01', '2023-07-01', FALSE),
(5003 ,4003, '2023-03-01', '2023-08-01', TRUE),
(5004 ,4004, '2023-04-01', '2023-09-01', FALSE),
(5005 ,4005, '2023-05-01', '2023-10-01', TRUE),
(5006 ,4006, '2023-06-01', '2023-11-01', FALSE),
(5007 ,4007, '2023-07-01', '2023-12-01', TRUE),
(5008 ,4008, '2023-08-01', '2024-01-01', FALSE),
(5009 ,4009, '2023-09-01', '2024-02-01', TRUE);

-- rental --
INSERT INTO rental (student_id, instrument_booking_id)
VALUES 
(1034, 5001),
(1035, 5002),
(1036, 5003),
(1037, 5004),
(1038, 5005),
(1039, 5006),
(1040, 5007),
(1041, 5008),
(1042, 5009);


-- 'phone' --
INSERT INTO phone (phone_id, phone_number)
VALUES
(4001, '0734523587'),
(4002, '0700001234'),
(4003, '0700001235'),
(4004, '0700001236'),
(4005, '0700001237'),
(4006, '0700001238'),
(4007, '0700001239'),
(4008, '0700001240'),
(4009, '0700001241'),
(4010, '0700001242'),
(4011, '0700001243'),
(4012, '0700001244'),
(4013, '0700001245');


-- 'instructor' --
INSERT INTO instructor (instructor_id, first_name, last_name, person_number, street, zip, city, ensamble)
VALUES
(8001, 'David', 'Dahl', '920404-4567', 'Allén 4', '45678', 'Kommunen', false),
(8002, 'Bob', 'Berg', '760202-2345', 'Melody Lane 2', '23456', 'Rhythm City', true),
(8003, 'Cecilia', 'Carlson', '770303-3456', 'Harmony Avenue 3', '34567', 'Tune Village', false),
(8004, 'David', 'Dahl', '780404-4567', 'Tempo Terrace 4', '45678', 'Note Metropolis', true),
(8005, 'Eva', 'Eriksson', '790505-5678', 'Rhythm Road 5', '56789', 'Melody Town', false),
(8006, 'Fredrik', 'Fransson', '800606-6789', 'Bass Boulevard 6', '67890', 'Harmony City', true),
(8007, 'Greta', 'Gustafsson', '810707-7890', 'Chord Court 7', '78901', 'Tune Borough', false),
(8008, 'Hans', 'Hansson', '820808-8901', 'Scale Street 8', '89012', 'Note District', true),
(8009, 'Ida', 'Ivarsson', '830909-9012', 'Beat Bypass 9', '90123', 'Rhythm Hamlet', false),
(8010, 'Jakob', 'Johansson', '840910-0123', 'Chorus Circle 10', '91234', 'Melody Village', true),
(8011, 'Alice', 'Andersson', '750101-1234', 'Music Street 1', '12345', 'Harmony Town', false),
(8012, 'Erika', 'Eriksson', '930505-5678', 'Banan 5', '56789', 'Församlingen', true);


-- 'instructor phone' --
INSERT INTO instructor_phone (phone_id, instructor_id)
VALUES
(4001, 8001),
(4002, 8001),
(4003, 8002),
(4004, 8003),
(4005, 8004),
(4006, 8005),
(4007, 8006),
(4008, 8007),
(4009, 8008),
(4010, 8009),
(4011, 8010),
(4012, 8011),
(4013, 8012);


-- booking ( Cross Reference to allow multiple students on single lesson ) -- (EDIT TIMES TO FIT REQUIREMENTS)
INSERT INTO booking(booking_id, instructor_id, start_time, end_time)
VALUES
-- solo bookings -- 
(2001, 8001, '2023-01-01 11:00:00', '2023-01-01 12:00:00'),
(2002, 8002, '2023-02-01 11:00:00', '2023-02-01 12:00:00'),
(2003, 8003, '2023-03-01 11:00:00', '2023-03-01 12:00:00'),

(2006, 8005, '2023-04-01 11:00:00', '2023-04-01 12:00:00'), -- singel
(2007, 8006, '2023-05-01 11:00:00', '2023-05-01 12:00:00'), -- singel
(2008, 8001, '2023-12-03 11:00:00', '2023-12-03 12:00:00'), -- singel
(2009, 8012, '2023-12-04 11:00:00', '2023-12-04 12:00:00'), -- singel
-- group bookings -- 
(2005, 8010, '2023-06-01 11:00:00', '2023-06-01 12:00:00'), -- group lesson 4 students
-- ensamble bookings -- 

(2004, 8004, '2023-07-01 11:00:00', '2023-07-01 12:00:00'),
(2010, 8008, '2023-12-10 11:00:00', '2023-12-10 12:00:00'),
(2011, 8010, '2023-12-11 11:00:00', '2023-12-11 12:00:00'),
(2012, 8012, '2023-12-12 11:00:00', '2023-12-12 12:00:00');

/*-- Uppdatera bokning 2001
UPDATE booking
SET start_time = '2023-01-01 11:00:00',
    end_time = '2023-01-01 12:00:00'
WHERE booking_id = 2001;

-- Uppdatera bokning 2002
UPDATE booking
SET start_time = '2023-02-01 11:00:00',
    end_time = '2023-02-01 12:00:00'
WHERE booking_id = 2002;

-- Uppdatera bokning 2003
UPDATE booking
SET start_time = '2023-03-01 11:00:00',
    end_time = '2023-03-01 12:00:00'
WHERE booking_id = 2003;

-- Uppdatera bokning 2004
UPDATE booking
SET start_time = '2023-07-01 11:00:00',
    end_time = '2023-07-01 12:00:00'
WHERE booking_id = 2004;*/


SELECT to_char(to_timestamp (4::text, 'MM'), 'TMmon')

-- 'instrument_id' ( Sets instrument type and skill level of lesson ) --
INSERT INTO instrument (instrument_id, instrument, skill_level)
VALUES
(6001, 'gitarr', 'beginner'),
(6002, 'piano', 'intermediate'),
(6003, 'violin', 'advanced'),
(6004, 'trumpet', 'beginner'),
(6005, 'flute', 'intermediate'),
(6006, 'drums', 'advanced'),
(6007, 'saxophone', 'beginner'),
(6008, 'cello', 'intermediate'),
(6009, 'clarinet', 'advanced'),
(6010, 'bass guitar', 'beginner'),
(6011, 'trumpet', 'advanced'),
(6012, 'piano', 'advanced');



-- 'instructor_instrument' ( Sets the instrument that the instructor is playing ) --
INSERT INTO instructor_instrument (instrument_id, instructor_id)
VALUES
(6001, 8001),
(6002, 8002),
(6003, 8003),
(6004, 8004),
(6005, 8005),
(6006, 8006),
(6007, 8007),
(6008, 8008),
(6009, 8009),
(6010, 8010),
(6011, 8011),
(6012, 8012);



-- booking_lesson ( Creates a booking for each student, regardle ) --
INSERT INTO booking_lesson(student_id, booking_id)
VALUES
(1004, 2001), -- singel
(1005, 2002), -- singel
(1006, 2003), -- singel
(1035, 2004), -- ensamble
(1036, 2004), -- ensamble
(1037, 2004), -- ensamble
(1038, 2005), -- grupp
(1039, 2005), -- group
(1040, 2005), -- group
(1041, 2005), -- group
(1042, 2006), -- singel
(1043, 2007), -- singel
(1044, 2008), -- singel
(1044, 2009), -- singel

(1045, 2010), -- ensamble
(1038, 2010), -- ensamble
(1053, 2010), -- ensamble

(1052, 2011), -- ensamble
(1051, 2011), -- ensamble
(1045, 2011), -- ensamble
(1046, 2011), -- ensamble

(1047, 2012), -- ensamble
(1048, 2012), -- ensamble
(1049, 2012), -- ensamble
(1050, 2012), -- ensamble
(1051, 2012), -- ensamble
(1006, 2012); -- ensamble
(1044, 2012), -- ensamble



-- solo_lesson
INSERT INTO solo_lesson(solo_lession_id, booking_id, instrument_id, skill_level)
VALUES
(9001, 2001, 6001, 'beginner'), -- nybörjare gitarr solo
(9002, 2002, 6002, 'intermediate'), -- intermediate piano solo
(9003, 2003, 6001, 'beginner'), -- nybörjare gitarr solo

(9004, 2006, 6001, 'beginner'), -- nybörjare gitarr solo
(9005, 2007, 6001, 'beginner'), -- nybörjare gitarr solo

(9006, 2008, 6001, 'beginner'), -- nybörjare gitarr solo
(9007, 2009, 6012, 'intermediate'); --intermediate piano solo

-- ensamble
INSERT INTO ensamble(ensamble_id, booking_id, genre, min_students, max_students)
VALUES
(7001, 2004, 'rock', 5, 10),
(7002, 2010, 'punk', 3, 4),
(7003, 2011, 'rock', 4, 7),
(7004, 2012, 'house' 5, 7);

-- group_lesson
INSERT INTO group_lesson (booking_id, instrument_id, min_students, max_students, skill_level)
VALUES 

(2005, 6007, 3, 10, 'beginner');

-- importerar syskon till databasen
INSERT INTO sibling_group (student_id, sibling_group_id)
VALUES 
(1005, 1035), -- Erika är syskon med Erik
(1035, 1005); -- Erik är syskon med Erika

INSERT INTO sibling_group (student_id, sibling_group_id)
VALUES 
(1006, 1036), -- Fredrik är syskon med Frida
(1036, 1006); -- Frida är syskon med Fredrik
INSERT INTO sibling_group (student_id, sibling_group_id)
VALUES 
(1004, 1034), -- David är syskon med Diana
(1034, 1004); -- Diana är syskon med David
INSERT INTO sibling_group (student_id, sibling_group_id)
VALUES 
(1050, 1051), -- Tina är syskon med Ulf
(1050, 1052), -- Tina är syskon med Vera
(1051, 1050), -- Ulf är syskon med Tina
(1051, 1052), -- Ulf är syskon med Vera
(1052, 1050), -- Vera är syskon med Tina
(1052, 1051); -- Vera är syskon med Ulf


/*
-- Group Lesson 1
INSERT INTO booking (instructor_id, start_time, end_time) VALUES (8004, '2023-01-05 14:00:00', '2023-01-05 15:00:00');
INSERT INTO group_lesson (booking_id, instrument_id, min_students, max_students, skill_level) VALUES (LAST_INSERT_ID(), 6007, 3, 10, 'beginner');
INSERT INTO booking_lesson (student_id, booking_id) VALUES (1038, LAST_INSERT_ID());
INSERT INTO booking_lesson (student_id, booking_id) VALUES (1041, LAST_INSERT_ID());
INSERT INTO booking_lesson (student_id, booking_id) VALUES (1016, LAST_INSERT_ID());

-- Group Lesson 2
INSERT INTO booking (instructor_id, start_time, end_time) VALUES (8010, '2023-01-03 16:00:00', '2023-01-03 17:00:00');
INSERT INTO group_lesson (booking_id, instrument_id, min_students, max_students, skill_level) VALUES (LAST_INSERT_ID(), 6010, 5, 9, 'intermediate');
INSERT INTO booking_lesson (student_id, booking_id) VALUES (1033, LAST_INSERT_ID());
INSERT INTO booking_lesson (student_id, booking_id) VALUES (1005, LAST_INSERT_ID());
INSERT INTO booking_lesson (student_id, booking_id) VALUES (1015, LAST_INSERT_ID());
-- ... continue for the remaining group lessons
*/

--TODO
/*
INSERT INTO price (lecture_price, group_lecture_price, beginner, intermediate, advanced, sibling_discount, ensamble_price, date, solo_lession_id, ensamble_id, group_lesson_id)
VALUES 
(20.0, 15.0, 25.0, 30.0, 35.0, 10.0, 12.0, '2023-12-01', 1, 1, 1),
(22.0, 17.0, 27.0, 32.0, 37.0, 12.0, 14.0, '2023-12-02', 2, 2, 2),
(24.0, 19.0, 29.0, 34.0, 39.0, 14.0, 16.0, '2023-12-03', 3, 3, 3),
(26.0, 21.0, 31.0, 36.0, 41.0, 16.0, 18.0, '2023-12-04', 4, 4, 4),
(28.0, 23.0, 33.0, 38.0, 43.0, 18.0, 20.0, '2023-12-05', 5, 5, 5);
*/






















