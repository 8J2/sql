CREATE TABLE animals
(animal_id NUMBER(6),
 name VARCHAR2(25),
 license_tag_number NUMBER(10),
 admit_date DATE NOT NULL,
 adoption_id NUMBER(5),
 vaccination_date DATE NOT NULL,
 CONSTRAINT animals_pk PRIMARY KEY (animal_id),
 CONSTRAINT animals_tag_num_uk UNIQUE (license_tag_number));

DESCRIBE animals;

INSERT INTO animals (animal_id, name, license_tag_number, admit_date, adoption_id, vaccination_date)
VALUES (101, 'Spot', 35540, '10-Oct-2004', 205, '12-Oct-2004');

SELECT * FROM animals;
