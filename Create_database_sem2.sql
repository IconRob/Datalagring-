CREATE TABLE contact (
 contact_id INT NOT NULL,
 phone_number VARCHAR(50)
);

ALTER TABLE contact ADD CONSTRAINT PK_contact PRIMARY KEY (contact_id);


CREATE TABLE instructor (
 instructor_id SERIAL NOT NULL,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 person_number VARCHAR(12) NOT NULL,
 street VARCHAR(50),
 zip VARCHAR(50),
 city VARCHAR(50),
 ensamble BOOLEAN
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instrument (
 instrument_id SERIAL NOT NULL,
 type VARCHAR(50),
 brand VARCHAR(50),
 price INT,
 category VARCHAR(50),
 available BOOLEAN
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);


CREATE TABLE instrument_1 (
 instrument_1_id INT NOT NULL,
 instrument VARCHAR(50),
 skill_level VARCHAR(50)
);

ALTER TABLE instrument_1 ADD CONSTRAINT PK_instrument_1 PRIMARY KEY (instrument_1_id);


CREATE TABLE location (
 classroom_id SERIAL NOT NULL,
 room_nr INT,
 minimun_students INT,
 maximum_students INT
);

ALTER TABLE location ADD CONSTRAINT PK_location PRIMARY KEY (classroom_id);


CREATE TABLE number (
 number_id INT NOT NULL,
 phone_number VARCHAR(50)
);

ALTER TABLE number ADD CONSTRAINT PK_number PRIMARY KEY (number_id);


CREATE TABLE payment (
 payment_id SERIAL NOT NULL,
 student_bill INT,
 teacher_payment INT,
 sibling_discount INT
);

ALTER TABLE payment ADD CONSTRAINT PK_payment PRIMARY KEY (payment_id);


CREATE TABLE phone (
 phone_id INT NOT NULL,
 phone_number VARCHAR(50)
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (phone_id);


CREATE TABLE price (
 price_id SERIAL NOT NULL,
 payment_id INT,
 lecture_price INT,
 skill_price INT,
 discount INT
);

ALTER TABLE price ADD CONSTRAINT PK_price PRIMARY KEY (price_id);


CREATE TABLE sibling_group (
 sibling_group_id SERIAL NOT NULL
);

ALTER TABLE sibling_group ADD CONSTRAINT PK_sibling_group PRIMARY KEY (sibling_group_id);


CREATE TABLE student (
 student_id SERIAL NOT NULL,
 sibling_group_id INT,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 person_number VARCHAR(12) NOT NULL,
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
 classroom_id INT NOT NULL,
 price_id INT,
 instrument_type VARCHAR(50),
 genre VARCHAR(50),
 skill_level VARCHAR(50),
 time_slot TIMESTAMP(10),
 lesson_type VARCHAR(50),
 student_id INT
);

ALTER TABLE booking ADD CONSTRAINT PK_booking PRIMARY KEY (booking_id);


CREATE TABLE instructor_instrument_1 (
 instrument_1_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instructor_instrument_1 ADD CONSTRAINT PK_instructor_instrument_1 PRIMARY KEY (instrument_1_id,instructor_id);


CREATE TABLE instructor_phone (
 phone_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instructor_phone ADD CONSTRAINT PK_instructor_phone PRIMARY KEY (phone_id,instructor_id);


CREATE TABLE instrument_booking (
 instrument_booking_id SERIAL NOT NULL,
 instrument_id INT NOT NULL,
 start_date TIMESTAMP(10) NOT NULL,
 end_date TIMESTAMP(10) NOT NULL,
 delivery BOOLEAN,
 student_id INT
);

ALTER TABLE instrument_booking ADD CONSTRAINT PK_instrument_booking PRIMARY KEY (instrument_booking_id);


ALTER TABLE price ADD CONSTRAINT FK_price_0 FOREIGN KEY (payment_id) REFERENCES payment (payment_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (sibling_group_id) REFERENCES sibling_group (sibling_group_id);


ALTER TABLE student_contact ADD CONSTRAINT FK_student_contact_0 FOREIGN KEY (contact_id) REFERENCES contact (contact_id);
ALTER TABLE student_contact ADD CONSTRAINT FK_student_contact_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE student_number ADD CONSTRAINT FK_student_number_0 FOREIGN KEY (number_id) REFERENCES number (number_id);
ALTER TABLE student_number ADD CONSTRAINT FK_student_number_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE booking ADD CONSTRAINT FK_booking_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE booking ADD CONSTRAINT FK_booking_1 FOREIGN KEY (classroom_id) REFERENCES location (classroom_id);
ALTER TABLE booking ADD CONSTRAINT FK_booking_2 FOREIGN KEY (price_id) REFERENCES price (price_id);
ALTER TABLE booking ADD CONSTRAINT FK_booking_3 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE instructor_instrument_1 ADD CONSTRAINT FK_instructor_instrument_1_0 FOREIGN KEY (instrument_1_id) REFERENCES instrument_1 (instrument_1_id);
ALTER TABLE instructor_instrument_1 ADD CONSTRAINT FK_instructor_instrument_1_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE instructor_phone ADD CONSTRAINT FK_instructor_phone_0 FOREIGN KEY (phone_id) REFERENCES phone (phone_id);
ALTER TABLE instructor_phone ADD CONSTRAINT FK_instructor_phone_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE instrument_booking ADD CONSTRAINT FK_instrument_booking_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);
ALTER TABLE instrument_booking ADD CONSTRAINT FK_instrument_booking_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


