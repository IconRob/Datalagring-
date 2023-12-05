CREATE TABLE contact (
 contact_id INT NOT NULL,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 relation VARCHAR(50) NOT NULL,
 phone_number VARCHAR(50) NOT NULL
);

ALTER TABLE contact ADD CONSTRAINT PK_contact PRIMARY KEY (contact_id);


CREATE TABLE instructor (
 instructor_id SERIAL NOT NULL,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 person_number VARCHAR(12) NOT NULL UNIQUE,
 street VARCHAR(50),
 zip VARCHAR(50),
 city VARCHAR(50),
 ensamble BOOLEAN
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instrument (
 instrument_id INT NOT NULL,
 instrument VARCHAR(50),
 skill_level VARCHAR(50)
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);


CREATE TABLE instrument_rental (
 instrument_rental_id SERIAL NOT NULL,
 type VARCHAR(50),
 brand VARCHAR(50),
 price_per_month FLOAT(4),
 category VARCHAR(50),
 available BOOLEAN,
 date DATE
);

ALTER TABLE instrument_rental ADD CONSTRAINT PK_instrument_rental PRIMARY KEY (instrument_rental_id);


CREATE TABLE number (
 number_id INT NOT NULL,
 phone_number VARCHAR(50)
);

ALTER TABLE number ADD CONSTRAINT PK_number PRIMARY KEY (number_id);


CREATE TABLE phone (
 phone_id INT NOT NULL,
 phone_number VARCHAR(50)
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (phone_id);


CREATE TABLE student (
 student_id SERIAL NOT NULL,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 person_number VARCHAR(12) NOT NULL UNIQUE,
 street VARCHAR(50),
 zip VARCHAR(50),
 city VARCHAR(50)
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE student_contact (
 contact_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE student_contact ADD CONSTRAINT PK_student_contact PRIMARY KEY (contact_id,student_id);


CREATE TABLE student_number (
 number_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE student_number ADD CONSTRAINT PK_student_number PRIMARY KEY (number_id,student_id);


CREATE TABLE booking (
 booking_id SERIAL NOT NULL,
 instructor_id INT NOT NULL,
 start_time TIMESTAMP(0),
 end_time TIMESTAMP(0)
);

ALTER TABLE booking ADD CONSTRAINT PK_booking PRIMARY KEY (booking_id);


CREATE TABLE booking_lesson (
 student_id SERIAL NOT NULL,
 booking_id SERIAL NOT NULL
);

ALTER TABLE booking_lesson ADD CONSTRAINT PK_booking_lesson PRIMARY KEY (student_id,booking_id);


CREATE TABLE ensamble (
 ensamble_id SERIAL NOT NULL,
 booking_id INT,
 genre VARCHAR(50),
 min_students INT,
 max_students INT
);

ALTER TABLE ensamble ADD CONSTRAINT PK_ensamble PRIMARY KEY (ensamble_id);


CREATE TABLE group_lesson (
 group_lesson_id SERIAL NOT NULL,
 booking_id INT,
 instrument_id INT,
 min_students INT,
 max_students INT,
 skill_level VARCHAR(50)
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (group_lesson_id);


CREATE TABLE instructor_instrument (
 instrument_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instructor_instrument ADD CONSTRAINT PK_instructor_instrument PRIMARY KEY (instrument_id,instructor_id);


CREATE TABLE instructor_phone (
 phone_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instructor_phone ADD CONSTRAINT PK_instructor_phone PRIMARY KEY (phone_id,instructor_id);


CREATE TABLE instrument_booking (
 instrument_booking_id SERIAL NOT NULL,
 instrument_rental_id INT NOT NULL,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL,
 delivery BOOLEAN
);

ALTER TABLE instrument_booking ADD CONSTRAINT PK_instrument_booking PRIMARY KEY (instrument_booking_id);


CREATE TABLE rental (
 student_id SERIAL NOT NULL,
 instrument_booking_id SERIAL NOT NULL
);

ALTER TABLE rental ADD CONSTRAINT PK_rental PRIMARY KEY (student_id,instrument_booking_id);


CREATE TABLE sibling_group (
 student_id INT NOT NULL,
 sibling_group_id INT NOT NULL
);

ALTER TABLE sibling_group ADD CONSTRAINT PK_sibling_group PRIMARY KEY (student_id,sibling_group_id);


CREATE TABLE solo_lesson (
 solo_lession_id SERIAL NOT NULL,
 booking_id INT,
 instrument_id INT,
 skill_level VARCHAR(50)
);

ALTER TABLE solo_lesson ADD CONSTRAINT PK_solo_lesson PRIMARY KEY (solo_lession_id);


CREATE TABLE price (
 price_id SERIAL NOT NULL,
 lecture_price FLOAT(4),
 group_lecture_price FLOAT(4),
 beginner FLOAT(4),
 intermediate FLOAT(4),
 advanced FLOAT(4),
 ensamble_price FLOAT(4),
 sibling_discount FLOAT(4),
 date DATE,
 solo_lession_id INT,
 group_lesson_id INT,
 ensamble_id INT
);

ALTER TABLE price ADD CONSTRAINT PK_price PRIMARY KEY (price_id);


ALTER TABLE student_contact ADD CONSTRAINT FK_student_contact_0 FOREIGN KEY (contact_id) REFERENCES contact (contact_id) ON DELETE CASCADE;
ALTER TABLE student_contact ADD CONSTRAINT FK_student_contact_1 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;


ALTER TABLE student_number ADD CONSTRAINT FK_student_number_0 FOREIGN KEY (number_id) REFERENCES number (number_id) ON DELETE CASCADE;
ALTER TABLE student_number ADD CONSTRAINT FK_student_number_1 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;


ALTER TABLE booking ADD CONSTRAINT FK_booking_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE NO ACTION;


ALTER TABLE booking_lesson ADD CONSTRAINT FK_booking_lesson_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE booking_lesson ADD CONSTRAINT FK_booking_lesson_1 FOREIGN KEY (booking_id) REFERENCES booking (booking_id) ON DELETE CASCADE;


ALTER TABLE ensamble ADD CONSTRAINT FK_ensamble_0 FOREIGN KEY (booking_id) REFERENCES booking (booking_id) ON DELETE SET NULL;


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (booking_id) REFERENCES booking (booking_id) ON DELETE SET NULL;
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id) ON DELETE SET NULL;


ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id) ON DELETE CASCADE;
ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE;


ALTER TABLE instructor_phone ADD CONSTRAINT FK_instructor_phone_0 FOREIGN KEY (phone_id) REFERENCES phone (phone_id) ON DELETE CASCADE;
ALTER TABLE instructor_phone ADD CONSTRAINT FK_instructor_phone_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE;


ALTER TABLE instrument_booking ADD CONSTRAINT FK_instrument_booking_0 FOREIGN KEY (instrument_rental_id) REFERENCES instrument_rental (instrument_rental_id) ON DELETE NO ACTION;


ALTER TABLE rental ADD CONSTRAINT FK_rental_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE rental ADD CONSTRAINT FK_rental_1 FOREIGN KEY (instrument_booking_id) REFERENCES instrument_booking (instrument_booking_id) ON DELETE CASCADE;


ALTER TABLE sibling_group ADD CONSTRAINT FK_sibling_group_0 FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE;
ALTER TABLE sibling_group ADD CONSTRAINT FK_sibling_group_1 FOREIGN KEY (sibling_group_id) REFERENCES student (student_id) ON DELETE CASCADE;


ALTER TABLE solo_lesson ADD CONSTRAINT FK_solo_lesson_0 FOREIGN KEY (booking_id) REFERENCES booking (booking_id) ON DELETE SET NULL;
ALTER TABLE solo_lesson ADD CONSTRAINT FK_solo_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id) ON DELETE SET NULL;


ALTER TABLE price ADD CONSTRAINT FK_price_0 FOREIGN KEY (solo_lession_id) REFERENCES solo_lesson (solo_lession_id) ON DELETE SET NULL;
ALTER TABLE price ADD CONSTRAINT FK_price_1 FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (group_lesson_id) ON DELETE SET NULL;
ALTER TABLE price ADD CONSTRAINT FK_price_2 FOREIGN KEY (ensamble_id) REFERENCES ensamble (ensamble_id) ON DELETE SET NULL;


