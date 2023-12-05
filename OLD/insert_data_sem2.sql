-- 'student' --
INSERT INTO student (student_id, sibling_group_id, first_name, last_name, person_number, street, zip, city)
VALUES
(1004, 2003, 'David', 'Danielsson', '920404-4567', 'Alley 4', '45678', 'Town'),
(1005, 2003, 'Erika', 'Eriksson', '930505-5678', 'Boulevard 5', '56789', 'Village'),
(1006, 2004, 'Fredrik', 'Fredriksson', '940606-6789', 'Court 6', '67890', 'City'),
(1029, null, 'Yngve', 'Yngvesson', '960626-7890', 'Path 26', '89123', 'Hamlet'),
(1030, null, 'Zara', 'Zachrisson', '970727-8901', 'Lane 27', '90123', 'Place'),
(1031, null, 'Axel', 'Axelsson', '980828-9012', 'Drive 28', '91234', 'Metropolis'),
(1032, null, 'Bella', 'Björnsson', '990929-0123', 'Route 29', '92345', 'Borough'),
(1033, null, 'Carl', 'Carlson', '001030-1234', 'Avenue 30', '93456', 'District'),
(1034, null, 'Diana', 'Danielsson', '020202-2345', 'Plaza 31', '94567', 'Hamlet'),
(1035, null, 'Erik', 'Eriksson', '030303-3456', 'Circle 32', '95678', 'Town'),
(1036, null, 'Frida', 'Fredriksson', '040404-4567', 'Bypass 33', '96789', 'Village'),
(1037, null, 'Gustav', 'Gustavsson', '050505-5678', 'Parkway 34', '97890', 'City'),
(1038, null, 'Hanna', 'Hansson', '060606-6789', 'Square 35', '98901', 'Metropolis'),
(1039, null, 'Ivar', 'Ivarsson', '070707-7890', 'Expressway 36', '99012', 'Borough'),
(1040, null, 'Johanna', 'Johansson', '080808-8901', 'Terrace 37', '99123', 'District'),
(1041, null, 'Karl', 'Karlsson', '090909-9012', 'Trail 38', '99234', 'Hamlet'),
(1042, null, 'Linda', 'Lindsson', '101010-0123', 'Way 39', '99345', 'Town'),
(1043, null, 'Magnus', 'Magnusson', '111111-1234', 'Lane 40', '99456', 'Village'),
(1044, null, 'Nina', 'Nilsson', '121212-2345', 'Pathway 41', '99567', 'Metropolis'),
(1045, null, 'Oscar', 'Olsson', '131313-3456', 'Alleyway 42', '99678', 'Town'),
(1046, null, 'Petra', 'Pettersson', '141414-4567', 'Road 43', '99789', 'Village'),
(1047, null, 'Quintus', 'Quist', '151515-5678', 'Street 44', '99890', 'City'),
(1048, null, 'Rita', 'Robertsson', '161616-6789', 'Boulevard 45', '99901', 'Hamlet'),
(1049, null, 'Stefan', 'Svensson', '171717-7890', 'Drive 46', '100012', 'Borough'),
(1050, null, 'Tina', 'Törnqvist', '181818-8901', 'Avenue 47', '100123', 'District'),
(1051, null, 'Ulf', 'Ulriksson', '191919-9012', 'Court 48', '100234', 'Hamlet'),
(1052, null, 'Vera', 'Viktorsson', '202020-0123', 'Way 49', '100345', 'Town'),
(1053, null, 'Wilma', 'Wallin', '212121-1234', 'Route 50', '100456', 'Village');



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
(428, '0751863892')
(429, '0757823401');

-- 'student_number' --
INSERT INTO student_number (number_id, student_id)
VALUES
(402, 1004),
(403, 1005),
(404, 1006),
(405, 1029),
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

-- 'siblingg_group_id' --
INSERT INTO sibling_group (sibling_group_id)
VALUES
(2003)
(2004);

-- 'contact_id' --
INSERT INTO contact (contact_id, phone_number)
VALUES
(3001, 0727618523),
(3002, 0739123456),
(3003, 0741234567),
(3004, 0752345678),
(3005, 0763456789),
(3006, 0774567890),
(3007, 0785678901),
(3008, 0796789012),
(3009, 0707890123),
(3010, 0718901234),
(3011, 0729012345);

-- 'student_contact' --
INSERT INTO student_contact (contact_id, student_id)
VALUES 
(3001, 1029)
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

-- 'instrument' --
INSERT INTO instrument (instrument_id, type, brand, price, category, available)
VALUES
(4001, 'PLAYER', 'FENDER', 400, 'Stränginstrument', TRUE),
(4002, 'Solo Max', 'LOTUS', 800, 'Blåsinstrument', TRUE),
(4003, 'Grand Piano', 'YAMAHA', 1500, 'Tangentinstrument', TRUE),
(4004, 'Ukulele', 'KALA', 250, 'Stränginstrument', TRUE),
(4005, 'Clarinet', 'BUFFET', 500, 'Blåsinstrument', TRUE),
(4006, 'Violin', 'STENTOR', 350, 'Stränginstrument', TRUE),
(4007, 'Flute', 'PEARL', 600, 'Blåsinstrument', TRUE),
(4008, 'Drum Kit', 'PEARL', 1000, 'Slagverk', TRUE);



-- 'instrument_booking' --
INSERT INTO instrument_booking (instrument_booking_id, instrument_id, start_date, end_date, delivery, student_id)
VALUES
(5001, 4001, '2023-11-25', '2023-12-25', TRUE, 1004),
(5002, 4003, '2023-11-25', '2023-12-25', TRUE, 1005),
(5003, 4005, '2023-11-25', '2023-12-25', TRUE, 1006),
(5004, 4007, '2023-11-25', '2023-12-25', TRUE, 1029),
(5005, 4002, '2023-11-25', '2023-12-25', TRUE, 1030);


-- 'location' --
INSERT INTO location (classroom_id, room_nr, minimun_students, maximum_students)
VALUES
(1, '101', 5, 10),
(2, '102', 5, 15),
(3, '103', 5, 20),
(4, '104', 10, 20),
(5, '105', 2, 8),
(6, '106', 1, 2),
(7, '107', 1, 2),
(8, '108', 1, 2),
(9, '109', 1, 5),
(10, '110', 1, 80);

-- 'price' --
INSERT INTO price (price_id, lecture_price, skill_price,discount)
VALUES
(9001, 100, 25, 0.8), -- privat nybörjare
(9002, 100, 50, 0.8), -- privat intermediate
(9003, 100, 75, 0.8), -- privat advancerad
(9004, 75, 25, 0.8), -- ensamble nybörjare
(9005, 75, 50, 0.8), -- ensamble intermediate
(9006, 75, 75, 0.8), -- ensamble advancerad
(9007, 50, 25, 0.8), -- grupp nybörjare
(9008, 50, 50, 0.8), -- grupp intermediate
(9009, 50, 75, 0.8); -- grupp advanverad

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

-- 'instrument_1' --
INSERT INTO instrument_1 (instrument_1_id, instrument, skill_level)
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

-- 'instructor_instrument_1' --
INSERT INTO instructor_instrument_1 (instrument_1_id, instructor_id)
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

-- 'booking' --
INSERT INTO booking 
    (booking_id, 
    instructor_id, 
    classroom_id, 
    price_id, 
    instrument_type, 
    genre, 
    skill_level, 
    time_slot,
    lesson_type,
    student_id)
VALUES
(7001, 8001, 1, 9001, 'Guitar', 'Rock', 'beginner', '2023-11-27 08:00:00', 'Individual', 1004),
(7002, 8002, 2, 9002, 'Piano', 'Classical', 'intermediate', '2023-11-27 09:00:00', 'Group', 1005),
(7003, 8003, 3, 9003, 'Violin', 'Jazz', 'advanced', '2023-11-27 10:00:00', 'Individual', 1006),
(7004, 8004, 4, 9004, 'Trumpet', 'Blues', 'beginner', '2023-11-27 11:00:00', 'Ensemble', 1029),
(7005, 8005, 5, 9005, 'Flute', 'Classical', 'intermediate', '2023-11-27 12:00:00', 'Group', 1030),
(7006, 8006, 1, 9006, 'Drums', 'Rock', 'advanced', '2023-11-27 13:00:00', 'Individual', 1031),
(7007, 8007, 2, 9007, 'Saxophone', 'Jazz', 'beginner', '2023-11-27 14:00:00', 'Ensemble', 1032),
(7008, 8008, 3, 9008, 'Cello', 'Classical', 'intermediate', '2023-11-27 15:00:00', 'Group', 1033),
(7009, 8009, 4, 9009, 'Clarinet', 'Blues', 'advanced', '2023-11-27 16:00:00', 'Individual', 1034),
(7010, 8010, 5, 9001, 'Bass Guitar', 'Rock', 'beginner', '2023-11-27 17:00:00', 'Group', 1035);


