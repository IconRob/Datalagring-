-- 'student'
INSERT INTO student (student_id, sibling_group_id, first_name, last_name, person_number, street, zip, city)
VALUES
(1004, 2003, 'David', 'Danielsson', '920404-4567', 'Alley 4', '45678', 'Town'),
(1005, 2003, 'Erika', 'Eriksson', '930505-5678', 'Boulevard 5', '56789', 'Village'),
(1006, 2004, 'Fredrik', 'Fredriksson', '940606-6789', 'Court 6', '67890', 'City'),
(1029, 2014, 'Yngve', 'Yngvesson', '960626-7890', 'Path 26', '89123', 'Hamlet'),
(1030, 2015, 'Zara', 'Zachrisson', '970727-8901', 'Lane 27', '90123', 'Place')
(1031, 2016, 'Axel', 'Axelsson', '980828-9012', 'Drive 28', '91234', 'Metropolis'),
(1032, 2017, 'Bella', 'Björnsson', '990929-0123', 'Route 29', '92345', 'Borough'),
(1033, 2018, 'Carl', 'Carlson', '001030-1234', 'Avenue 30', '93456', 'District')
(1034, 2019, 'Diana', 'Danielsson', '020202-2345', 'Plaza 31', '94567', 'Hamlet'),
(1035, 2020, 'Erik', 'Eriksson', '030303-3456', 'Circle 32', '95678', 'Town'),
(1036, 2021, 'Frida', 'Fredriksson', '040404-4567', 'Bypass 33', '96789', 'Village'),
(1037, 2022, 'Gustav', 'Gustavsson', '050505-5678', 'Parkway 34', '97890', 'City'),
(1038, 2023, 'Hanna', 'Hansson', '060606-6789', 'Square 35', '98901', 'Metropolis'),
(1039, 2024, 'Ivar', 'Ivarsson', '070707-7890', 'Expressway 36', '99012', 'Borough'),
(1040, 2025, 'Johanna', 'Johansson', '080808-8901', 'Terrace 37', '99123', 'District'),
(1041, 2026, 'Karl', 'Karlsson', '090909-9012', 'Trail 38', '99234', 'Hamlet'),
(1042, 2027, 'Linda', 'Lindsson', '101010-0123', 'Way 39', '99345', 'Town'),
(1043, 2028, 'Magnus', 'Magnusson', '111111-1234', 'Lane 40', '99456', 'Village')
(1044, 2029, 'Nina', 'Nilsson', '121212-2345', 'Pathway 41', '99567', 'Metropolis'),
(1045, 2030, 'Oscar', 'Olsson', '131313-3456', 'Alleyway 42', '99678', 'Town'),
(1046, 2031, 'Petra', 'Pettersson', '141414-4567', 'Road 43', '99789', 'Village'),
(1047, 2032, 'Quintus', 'Quist', '151515-5678', 'Street 44', '99890', 'City'),
(1048, 2033, 'Rita', 'Robertsson', '161616-6789', 'Boulevard 45', '99901', 'Hamlet'),
(1049, 2034, 'Stefan', 'Svensson', '171717-7890', 'Drive 46', '100012', 'Borough'),
(1050, 2035, 'Tina', 'Törnqvist', '181818-8901', 'Avenue 47', '100123', 'District'),
(1051, 2036, 'Ulf', 'Ulriksson', '191919-9012', 'Court 48', '100234', 'Hamlet'),
(1052, 2037, 'Vera', 'Viktorsson', '202020-0123', 'Way 49', '100345', 'Town'),
(1053, 2038, 'Wilma', 'Wallin', '212121-1234', 'Route 50', '100456', 'Village');



-- 'instructor'
INSERT INTO instructor (instructor_id, first_name, last_name, person_number, street, zip, city, ensamble)
VALUES
(8001, 'David', 'Dahl', '920404-4567', 'Allén 4', '45678', 'Kommunen', false,)
(8002, 'Bob', 'Berg', '760202-2345', 'Melody Lane 2', '23456', 'Rhythm City', true),
(8003, 'Cecilia', 'Carlson', '770303-3456', 'Harmony Avenue 3', '34567', 'Tune Village', false),
(8004, 'David', 'Dahl', '780404-4567', 'Tempo Terrace 4', '45678', 'Note Metropolis', true),
(8005, 'Eva', 'Eriksson', '790505-5678', 'Rhythm Road 5', '56789', 'Melody Town', false),
(8006, 'Fredrik', 'Fransson', '800606-6789', 'Bass Boulevard 6', '67890', 'Harmony City', true),
(8007, 'Greta', 'Gustafsson', '810707-7890', 'Chord Court 7', '78901', 'Tune Borough', false),
(8008, 'Hans', 'Hansson', '820808-8901', 'Scale Street 8', '89012', 'Note District', true),
(8009, 'Ida', 'Ivarsson', '830909-9012', 'Beat Bypass 9', '90123', 'Rhythm Hamlet', false),
(8010, 'Jakob', 'Johansson', '840910-0123', 'Chorus Circle 10', '91234', 'Melody Village', true)
(8011, 'Alice', 'Andersson', '750101-1234', 'Music Street 1', '12345', 'Harmony Town', false)
(8012, 'Erika', 'Eriksson', '930505-5678', 'Banan 5', '56789', 'Församlingen', true);

--  'instrument'
INSERT INTO instrument (instrument_id, type, brand, price, category, available)
VALUES
(3001, 'Guitar', 'Fender', 1500, 'String', true),
(3002, 'Piano', 'Yamaha', 5000, 'Keyboard', true),
(3003, 'Violin', 'Stradivarius', 3000, 'String', true),
(3004, 'Drum Set', 'Pearl', 2500, 'Percussion', false),
(3005, 'Saxophone', 'Selmer', 3500, 'Woodwind', true),
(3006, 'Flute', 'Yamaha', 1200, 'Woodwind', false),
(3007, 'Trumpet', 'Bach', 2000, 'Brass', true),
(3008, 'Cello', 'Dvorak', 4000, 'String', false),
(3009, 'Clarinet', 'Buffet Crampon', 2200, 'Woodwind', true),
(3010, 'Bass Guitar', 'Gibson', 1800, 'String', true)
(3011, 'Gitarr', 'Yamaha', 1000, 'Stränginstrument', true),
(3012, 'Piano', 'Steinway', 2000, 'Tangentinstrument', false);

-- 'student_number'
INSERT INTO student_number (number_id, student_id)
VALUES
(991, 1004),
(992, 1005),
(993,1006);

-- 'siblingg_group_id' 
INSERT INTO sibling_group (sibling_group_id)
VALUES
(2003)
(2004);

-- 'contact_id' 
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

-- 'student_contact' 
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

-- 'instrument'
INSERT INTO instrument (instrument_id, type, brand, price, category, avalible)
VALUES
(4001, 'PLAYER', 'FENDER', 400, 'Stränginstrument', TRUE),
(4002, 'Solo Max', 'LOTUS', 800, 'Blåsinstrument', TRUE),
(4003, 'Grand Piano', 'YAMAHA', 1500, 'Tangentinstrument', TRUE),
(4004, 'Ukulele', 'KALA', 250, 'Stränginstrument', TRUE),
(4005, 'Clarinet', 'BUFFET', 500, 'Blåsinstrument', TRUE),
(4006, 'Violin', 'STENTOR', 350, 'Stränginstrument', TRUE),
(4007, 'Flute', 'PEARL', 600, 'Blåsinstrument', TRUE),
(4008, 'Drum Kit', 'PEARL', 1000, 'Slagverk', TRUE);



-- 'instrument_booking' 
INSERT INTO instrument_booking (instrument_booking_id, instrument_id, start_date, end_date, delivery, student_id)
VALUES
(5001, 4001, '2023-11-25', '2023-12-25', TRUE, 1004),
(5002, 4003, '2023-11-25', '2023-12-25', TRUE, 1005),
(5003, 4005, '2023-11-25', '2023-12-25', TRUE, 1006),
(5004, 4007, '2023-11-25', '2023-12-25', TRUE, 1029),
(5005, 4002, '2023-11-25', '2023-12-25', TRUE, 1030);


-- 'location'
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

-- 'price'
INSERT INTO price (price_id, payment_id, lecture_price, skill_price,discount)
VALUES
(9001, 10001, 100, 25, 0.8), -- privat nybörjare
(9002, 10002, 100, 50, 0.8), -- privat intermediate
(9003, 10003, 100, 75, 0.8), -- privat advancerad
(9004, 10004, 75, 25, 0.8), -- ensamble nybörjare
(9005, 10005, 75, 50, 0.8), -- ensamble intermediate
(9006, 10006, 75, 75, 0.8), -- ensamble advancerad
(9007, 10007, 50, 25, 0.8), -- grupp nybörjare
(9008, 10008, 50, 50, 0.8), -- grupp intermediate
(9009, 10009, 50, 75, 0.8); -- grupp advanverad

-- 'phone'
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

-- 'instructor phone'
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

-- 'instrument_1'
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

-- 'instructor_instrument_1'
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

-- 'booking'
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
(7001, 8001, 1, 9001, 'Guitar', 'Rock', 'beginner', '08:00-09:00', 'Individual', 1004),
(7002, 8002, 2, 9002, 'Piano', 'Classical', 'intermediate', '09:00-10:00', 'Group', 1005),
(7003, 8003, 3, 9003, 'Violin', 'Jazz', 'advanced', '10:00-11:00', 'Individual', 1006),
(7004, 8004, 4, 9004, 'Trumpet', 'Blues', 'beginner', '11:00-12:00', 'Ensemble', 1029),
(7005, 8005, 5, 9005, 'Flute', 'Classical', 'intermediate', '12:00-13:00', 'Group', 1030),
(7006, 8006, 1, 9006, 'Drums', 'Rock', 'advanced', '13:00-14:00', 'Individual', 1031),
(7007, 8007, 2, 9007, 'Saxophone', 'Jazz', 'beginner', '14:00-15:00', 'Ensemble', 1032),
(7008, 8008, 3, 9008, 'Cello', 'Classical', 'intermediate', '15:00-16:00', 'Group', 1033),
(7009, 8009, 4, 9009, 'Clarinet', 'Blues', 'advanced', '16:00-17:00', 'Individual', 1034),
(7010, 8010, 5, 9001, 'Bass Guitar', 'Rock', 'beginner', '17:00-18:00', 'Group', 1035);


-- 'payment'
-- TODO INSERT INTO payment (payment_id, student_bill, teacher_payment, sibling_discount)

-- TODO Justera booking ifall payment kopplas till Booking - table samt ta bort payment_id ur price-tabellen.

-- TODO spara en ny version av CREATE.SQL när astan är justerad för payment