DROP DATABASE IF EXISTS friends_person;
CREATE DATABASE IF NOT EXISTS friends_person;

USE friends_person;

CREATE TABLE IF NOT EXISTS animal
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    animals VARCHAR(45)
);

INSERT INTO animal(animals)
VALUES
	("Домашние животные"),
    ("Вьючные животные");

CREATE TABLE IF NOT EXISTS pets
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    pets_id INT,
    pets_animal VARCHAR(100),
    FOREIGN KEY (pets_id) REFERENCES animal(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO pets(pets_id, pets_animal)
VALUES
	(1, "Собака"),
    (1, "Кошка"),
    (1, "Хомяк");
    
CREATE TABLE IF NOT EXISTS pack_animals
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    packAnimal_id INT,
    packAnimal VARCHAR(100),
    FOREIGN KEY (packAnimal_id) REFERENCES animal(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO pack_animals(packAnimal_id, packAnimal)
VALUES
	(2, "Лошадь"),
    (2, "Верблюд"),
    (2, "Осел");

CREATE TABLE IF NOT EXISTS dog
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    dog_id INT,
    _name VARCHAR(45),
    command VARCHAR(45),
    date_of_birth DATE,
    FOREIGN KEY (dog_id) REFERENCES pets(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO dog(dog_id, _name, command, date_of_birth)
VALUES
	(1, "Бобик", "Сидеть", '2021-02-25'),
    (1, "Шарик", "Атаковать", '2020-11-15'),
	(1, "Чарли", "Давать лапу", '2017-03-21');
    
CREATE TABLE IF NOT EXISTS cat
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    cat_id INT,
    _name VARCHAR(45),
    command VARCHAR(45),
    date_of_birth DATE,
    FOREIGN KEY (cat_id) REFERENCES pets(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO cat(cat_id, _name, command, date_of_birth)
VALUES
	(2, "Борис", "Сидеть", '2020-02-05'),
    (2, "Дина", "Мяукать", '2021-05-11'),
	(2, "Люся", "Давать лапу", '2022-10-21');
    
CREATE TABLE IF NOT EXISTS hamster
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    hamster_id INT,
    _name VARCHAR(45),
    command VARCHAR(45),
    date_of_birth DATE,
    FOREIGN KEY (hamster_id) REFERENCES pets(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO hamster(hamster_id, _name, command, date_of_birth)
VALUES
	(3, "Степа", "Стоять", '2023-12-31'),
    (3, "Хома", "Перевернуться", '2024-01-01'),
	(3, "Богдан", "Прыгать", '2023-12-21');
    
CREATE TABLE IF NOT EXISTS horse
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    horse_id INT,
    _name VARCHAR(45),
    command VARCHAR(45),
    date_of_birth DATE,
    FOREIGN KEY (horse_id) REFERENCES pack_animals(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO horse(horse_id, _name, command, date_of_birth)
VALUES
	(1, "Апполон", "Рысь", '2019-10-11'),
    (1, "Буран", "Шагом", '2021-10-15');
    
CREATE TABLE IF NOT EXISTS camels
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    camel_id INT,
    _name VARCHAR(45),
    command VARCHAR(45),
    date_of_birth DATE,
    FOREIGN KEY (camel_id) REFERENCES pack_animals(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO camels(camel_id, _name, command, date_of_birth)
VALUES
	(2, "Ибил", "Лечь", '2020-03-11'),
    (2, "Хиджен", "Шагом", '2019-05-21');
    
CREATE TABLE IF NOT EXISTS donkey
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    donkey_id INT,
    _name VARCHAR(45),
    command VARCHAR(45),
    date_of_birth DATE,
    FOREIGN KEY (donkey_id) REFERENCES pack_animals(id) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO donkey(donkey_id, _name, command, date_of_birth)
VALUES
	(3, "Иа", "Лечь", '2020-03-01'),
    (3, "Осел", "Идти", '2021-02-21');
 
DROP TABLE camels;
SELECT
	pa.packAnimal,
	ho._name,
    ho.command,
    ho.date_of_birth
FROM horse ho
JOIN pack_animals pa ON ho.horse_id = pa.id
UNION
SELECT 
	pa.packAnimal,
	don._name,
    don.command,
    don.date_of_birth
FROM donkey don
JOIN pack_animals pa ON don.donkey_id = pa.id;

CREATE TABLE IF NOT EXISTS young_animals AS
SELECT 'Собака' AS _view, _name, command, date_of_birth FROM dog
UNION
SELECT 'Кошка' AS _view, _name, command, date_of_birth FROM cat
UNION
SELECT 'Хомяк' AS _view, _name, command, date_of_birth FROM hamster
UNION
SELECT 'Лошадь' AS _view, _name, command, date_of_birth FROM horse
UNION
SELECT 'Осел' AS _view, _name, command, date_of_birth FROM donkey;

SELECT
	*,
    TIMESTAMPDIFF(MONTH, date_of_birth, CURDATE()) AS age_month
FROM young_animals
WHERE date_of_birth BETWEEN ADDDATE(curdate(), INTERVAL -3 YEAR) AND ADDDATE(CURDATE(), INTERVAL -1 YEAR);

SELECT
	 d._name, d.command, d.date_of_birth, pe.pets_animal, a.animals
FROM pets pe
JOIN dog d ON d.dog_id = pe.id
JOIN animal a ON a.id = pe.pets_id
UNION
SELECT
	 c._name, c.command, c.date_of_birth, pe.pets_animal, a.animals
FROM pets pe
JOIN cat c ON c.cat_id = pe.id
JOIN animal a ON a.id = pe.pets_id
UNION
SELECT
	 ha._name, ha.command, ha.date_of_birth, pe.pets_animal, a.animals
FROM pets pe
JOIN hamster ha ON ha.hamster_id = pe.id
JOIN animal a ON a.id = pe.pets_id
UNION
SELECT
	 ho._name, ho.command, ho.date_of_birth, pa.packAnimal, a.animals
FROM pack_animals pa
JOIN horse ho ON ho.horse_id = pa.id
JOIN animal a ON a.id = pa.packAnimal_id
UNION
SELECT
	 don._name, don.command, don.date_of_birth, pa.packAnimal, a.animals
FROM pack_animals pa
JOIN donkey don ON don.donkey_id = pa.id
JOIN animal a ON a.id = pa.packAnimal_id;