-- Schema bazy0301
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bazy0301
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bazy0301` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bazy0301` ;

-- -----------------------------------------------------
-- Table `bazy0301`.`miejscowosci`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`miejscowosci` (
  `id_miejscowosci` INT NOT NULL,
  `nazwa` VARCHAR(400) NULL DEFAULT NULL,
  `kod_pocztowy` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id_miejscowosci`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bazy0301`.`klient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`klient` (
  `klient_id` INT NOT NULL,
  `imie` VARCHAR(80) NULL DEFAULT NULL,
  `nazwisko` VARCHAR(80) NULL DEFAULT NULL,
  `miejscowosci_id_miejscowosci` INT NOT NULL,
  `ulica` VARCHAR(40) NULL DEFAULT NULL,
  `nr_domu_mieszkania` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`klient_id`),
  INDEX `klient_miejscowosci_fk` (`miejscowosci_id_miejscowosci` ASC) VISIBLE,
  CONSTRAINT `klient_miejscowosci_fk`
    FOREIGN KEY (`miejscowosci_id_miejscowosci`)
    REFERENCES `bazy0301`.`miejscowosci` (`id_miejscowosci`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bazy0301`.`kuch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`kuch` (
  `id_kucharza` INT NOT NULL,
  `imie` VARCHAR(80) NULL DEFAULT NULL,
  `nazwisko` VARCHAR(80) NULL DEFAULT NULL,
  `nr_tel` INT NULL DEFAULT NULL,
  `miejscowosci_id_miejscowosci` INT NOT NULL,
  `ulica` VARCHAR(40) NULL DEFAULT NULL,
  `nr_domu_mieszkania` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id_kucharza`),
  INDEX `kuch_miejscowosci_fk` (`miejscowosci_id_miejscowosci` ASC) VISIBLE,
  CONSTRAINT `kuch_miejscowosci_fk`
    FOREIGN KEY (`miejscowosci_id_miejscowosci`)
    REFERENCES `bazy0301`.`miejscowosci` (`id_miejscowosci`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `bazy0301`.`prac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`prac` (
  `id_prac` INT NOT NULL,
  `imie` VARCHAR(80) NULL DEFAULT NULL,
  `nazwisko` VARCHAR(80) NULL DEFAULT NULL,
  `nr_tel` INT NULL DEFAULT NULL,
  `ulica` VARCHAR(80) NULL DEFAULT NULL,
  `nr_domu_mieszkania` VARCHAR(80) NULL DEFAULT NULL,
  `miejscowosci_id_miejscowosci` INT NOT NULL,
  PRIMARY KEY (`id_prac`),
  INDEX `prac_miejscowosci_fk` (`miejscowosci_id_miejscowosci` ASC) VISIBLE,
  CONSTRAINT `prac_miejscowosci_fk`
    FOREIGN KEY (`miejscowosci_id_miejscowosci`)
    REFERENCES `bazy0301`.`miejscowosci` (`id_miejscowosci`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `bazy0301`.`magazyn`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`magazyn` (
  `id_magazynu` INT NOT NULL,
  `miejscowosci_id_miejscowosci` INT NOT NULL,
  `ulica` VARCHAR(40) NULL DEFAULT NULL,
  `nr_domu_mieszkania` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`id_magazynu`),
  INDEX `magazyn_miejscowosci_fk` (`miejscowosci_id_miejscowosci` ASC) VISIBLE,
  CONSTRAINT `magazyn_miejscowosci_fk`
    FOREIGN KEY (`miejscowosci_id_miejscowosci`)
    REFERENCES `bazy0301`.`miejscowosci` (`id_miejscowosci`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bazy0301`.`manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`manager` (
  `id_managera` INT NOT NULL,
  `imie` VARCHAR(80) NULL DEFAULT NULL,
  `nazwisko` VARCHAR(80) NULL DEFAULT NULL,
  `nr_tel` INT NULL DEFAULT NULL,
  `miejscowosci_id_miejscowosci` INT NOT NULL,
  `ulica` VARCHAR(40) NULL DEFAULT NULL,
  `nr_domu_mieszkania` VARCHAR(40) NULL DEFAULT NULL,
  PRIMARY KEY (`id_managera`),
  INDEX `manager_miejscowosci_fk` (`miejscowosci_id_miejscowosci` ASC) VISIBLE,
  CONSTRAINT `manager_miejscowosci_fk`
    FOREIGN KEY (`miejscowosci_id_miejscowosci`)
    REFERENCES `bazy0301`.`miejscowosci` (`id_miejscowosci`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `bazy0301`.`restaur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`restaur` (
  `id_restaur` INT NOT NULL,
  `nazwa_restaur` VARCHAR(80) NULL DEFAULT NULL,
  `manager_id_managera` INT NOT NULL,
  `magazyn_id_magazynu` INT NOT NULL,
  `miejscowosci_id_miejscowosci` INT NOT NULL,
  `ulica` VARCHAR(40) NULL DEFAULT NULL,
  `nr_domu_mieszkania` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id_restaur`),
  UNIQUE INDEX `restaur__idx` (`manager_id_managera` ASC) VISIBLE,
  UNIQUE INDEX `restaur__idxv1` (`magazyn_id_magazynu` ASC) VISIBLE,
  INDEX `restaur_miejscowosci_fk` (`miejscowosci_id_miejscowosci` ASC) VISIBLE,
  CONSTRAINT `restaur_miejscowosci_fk`
    FOREIGN KEY (`miejscowosci_id_miejscowosci`)
    REFERENCES `bazy0301`.`miejscowosci` (`id_miejscowosci`),
  CONSTRAINT `restaur_magazyn_fk`
    FOREIGN KEY (`magazyn_id_magazynu`)
    REFERENCES `bazy0301`.`magazyn` (`id_magazynu`),
  CONSTRAINT `restaur_manager_fk`
    FOREIGN KEY (`manager_id_managera`)
    REFERENCES `bazy0301`.`manager` (`id_managera`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bazy0301`.`Zmiana_lub_zaloga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`Zmiana_lub_zaloga` (
  `Zmiana_lub_zaloga_ID` INT NOT NULL,
  `data` DATE NULL DEFAULT NULL,
  `godzina` TIME NULL DEFAULT NULL,
  `restaur_id_restaur` INT NOT NULL,
  PRIMARY KEY (`Zmiana_lub_zaloga_ID`),
  CONSTRAINT `Zmiana_lub_zaloga_restaur_FK`
    FOREIGN KEY (`restaur_id_restaur`)
    REFERENCES `bazy0301`.`restaur` (`id_restaur`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `bazy0301`.`aktual_kuch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`aktual_kuch` (
  `aktual_kuch_id` INT NOT NULL,
  `kuch_id_kucharza` INT NOT NULL,
  `Zmiana_lub_zaloga_Zmiana_lub_zaloga_ID` INT NOT NULL,
  PRIMARY KEY (`aktual_kuch_id`),
  CONSTRAINT `aktual_kuch_kuch_fk`
    FOREIGN KEY (`kuch_id_kucharza`)
    REFERENCES `bazy0301`.`kuch` (`id_kucharza`),
  CONSTRAINT `aktual_kuch_Zmiana_lub_zaloga`
	FOREIGN KEY (`Zmiana_lub_zaloga_Zmiana_lub_zaloga_ID`)
	REFERENCES `bazy0301`.`Zmiana_lub_zaloga`(`Zmiana_lub_zaloga_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `bazy0301`.`aktual_prac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`aktual_prac` (
  `aktual_prac_id` INT NOT NULL,
  `prac_id_prac` INT NOT NULL,
  `Zmiana_lub_zaloga_Zmiana_lub_zaloga_ID` INT NOT NULL,
  PRIMARY KEY (`aktual_prac_id`),
  INDEX `aktual_prac_prac_fk` (`prac_id_prac` ASC) VISIBLE,
  CONSTRAINT `aktual_prac_prac_fk`
    FOREIGN KEY (`prac_id_prac`)
    REFERENCES `bazy0301`.`prac` (`id_prac`),
CONSTRAINT `aktual_prac_Zmiana_lub_zaloga`
	FOREIGN KEY (`Zmiana_lub_zaloga_Zmiana_lub_zaloga_ID`)
	REFERENCES `bazy0301`.`Zmiana_lub_zaloga`(`Zmiana_lub_zaloga_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `bazy0301`.`Zamow`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`Zamow` (
  `id_zamow` INT NOT NULL,
  `ilosc` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_zamow`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `bazy0301`.`rezerwacje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`rezerwacje` (
  `rezerwacje_id` INT NOT NULL,
  `wymagania` VARCHAR(150) NULL DEFAULT NULL,
  `data` DATE NULL DEFAULT NULL,
  `godzina` TIME NULL DEFAULT NULL,
  `restaur_id_restaur` INT NOT NULL,
  `klient_klient_id` INT NOT NULL,
  `zamow_id_zamow` INT NOT NULL,
  PRIMARY KEY (`rezerwacje_id`),
  UNIQUE INDEX `rezerwacje__idx` (`zamow_id_zamow` ASC) VISIBLE,
  INDEX `rezerwacje_restaur_fk` (`restaur_id_restaur` ASC) VISIBLE,
  CONSTRAINT `rezerwacje_klient_fk`
    FOREIGN KEY (`klient_klient_id`)
    REFERENCES `bazy0301`.`klient` (`klient_id`),
  CONSTRAINT `rezerwacje_restaur_fk`
    FOREIGN KEY (`restaur_id_restaur`)
    REFERENCES `bazy0301`.`restaur` (`id_restaur`),
  CONSTRAINT `rezerwacje_zamow_fk`
    FOREIGN KEY (`zamow_id_zamow`)
    REFERENCES `bazy0301`.`Zamow` (`id_zamow`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bazy0301`.`przepis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`przepis` (
  `id_przepisu` INT NOT NULL,
  PRIMARY KEY (`id_przepisu`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------danie
-- Table `bazy0301`.`danie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`danie` (
  `id_dania` INT NOT NULL,
  `alergeny` VARCHAR(80),
  `gramatura` DOUBLE,
  `przepis_id_przepisu` INT NOT NULL,
  `cena` DOUBLE,
  `nazwa` varchar(80),
  PRIMARY KEY (`id_dania`),
  CONSTRAINT `danie_przepis_FK`
    FOREIGN KEY (`przepis_id_przepisu`)
    REFERENCES `bazy0301`.`przepis` (`id_przepisu`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;




-- -----------------------------------------------------
-- Table `bazy0301`.`skladniki`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`skladniki` (
  `id_skladnika` INT NOT NULL,
  `nazwa` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`id_skladnika`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bazy0301`.`magazyn_skladniki`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`magazyn_skladniki` (
  `magazyn_id_magazynu` INT NOT NULL,
  `skladniki_id_skladnika` INT NOT NULL,
  `ilosc_skladnika` INT,
  INDEX `magazyn_skladniki_Magazyn_FK` (`magazyn_id_magazynu` ASC) VISIBLE,
  INDEX `magazyn_skladniki_Skladniki_FK` (`skladniki_id_skladnika` ASC) VISIBLE,
  CONSTRAINT `magazyn_skladniki_Magazyn_FK`
    FOREIGN KEY (`magazyn_id_magazynu`)
    REFERENCES `bazy0301`.`magazyn` (`id_magazynu`),
  CONSTRAINT `magazyn_skladniki_Skladniki_FK`
    FOREIGN KEY (`skladniki_id_skladnika`)
    REFERENCES `bazy0301`.`skladniki` (`id_skladnika`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;



-- -----------------------------------------------------
-- Table `bazy0301`.`paragon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`paragon` (
  `id_paragonu` INT NOT NULL,
  `koszt` FLOAT NULL DEFAULT NULL,
  `data` DATE NULL DEFAULT NULL,
  `godzina` TIME NULL DEFAULT NULL,
  `Zamow_id_zamow` INT NOT NULL,
  PRIMARY KEY (`id_paragonu`),
  CONSTRAINT `paragon_zamow`
	FOREIGN KEY (`Zamow_id_zamow`)
    REFERENCES `bazy0301`.`Zamow` (`id_zamow`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bazy0301`.`przepis_skladnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`przepis_skladnik` (
  `przepis_id_przepisu` INT NOT NULL,
  `skladniki_id_skladnika` INT NOT NULL,
  `ilosc_skladnika` DOUBLE,
  INDEX `przepis_skladnik_przepis_fk` (`przepis_id_przepisu` ASC) VISIBLE,
  INDEX `przepis_skladnik_skladniki_fk` (`skladniki_id_skladnika` ASC) VISIBLE,
  CONSTRAINT `przepis_skladnik_przepis_fk`
    FOREIGN KEY (`przepis_id_przepisu`)
    REFERENCES `bazy0301`.`przepis` (`id_przepisu`),
  CONSTRAINT `przepis_skladnik_skladniki_fk`
    FOREIGN KEY (`skladniki_id_skladnika`)
    REFERENCES `bazy0301`.`skladniki` (`id_skladnika`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bazy0301`.`sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`sale` (
  `id_sali` INT NOT NULL,
  `nazwa` VARCHAR(80) NULL DEFAULT NULL,
  `restaur_id_restaur` INT NOT NULL,
  PRIMARY KEY (`id_sali`),
  INDEX `sale_restaur_fk` (`restaur_id_restaur` ASC) VISIBLE,
  CONSTRAINT `sale_restaur_fk`
    FOREIGN KEY (`restaur_id_restaur`)
    REFERENCES `bazy0301`.`restaur` (`id_restaur`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bazy0301`.`stoliki`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`stoliki` (
  `id_stolika` INT NOT NULL,
  `ilosc_osob` INT NULL DEFAULT NULL,
  `sale_id_sali` INT NOT NULL,
  PRIMARY KEY (`id_stolika`),
  INDEX `stoliki_sale_fk` (`sale_id_sali` ASC) VISIBLE,
  CONSTRAINT `stoliki_sale_fk`
    FOREIGN KEY (`sale_id_sali`)
    REFERENCES `bazy0301`.`sale` (`id_sali`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bazy0301`.`zamow_danie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`zamow_danie` (
  `zamow_id_zamow` INT NOT NULL,
  `danie_id_dania` INT NOT NULL,
  INDEX `zamow_danie_Danie_FK` (`danie_id_dania` ASC) VISIBLE,
  INDEX `zamow_danie_Zamow_FK` (`zamow_id_zamow` ASC) VISIBLE,
  CONSTRAINT `zamow_danie_Danie_FK`
    FOREIGN KEY (`danie_id_dania`)
    REFERENCES `bazy0301`.`danie` (`id_dania`),
  CONSTRAINT `zamow_danie_Zamow_FK`
    FOREIGN KEY (`zamow_id_zamow`)
    REFERENCES `bazy0301`.`Zamow` (`id_zamow`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bazy0301`.`zamow_na_sklad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bazy0301`.`zamow_na_sklad` (
  `id_zamow_na_sklad` INT NOT NULL,
  `manager_id_managera` INT NOT NULL,
  `magazyn_id_magazynu` INT NOT NULL,
  `ilosc` INT,
  `skladniki_id_skladnika` INT,
  PRIMARY KEY (`id_zamow_na_sklad`),
  INDEX `zamow_na_sklad_magazyn_fk` (`magazyn_id_magazynu` ASC) VISIBLE,
  INDEX `zamow_na_sklad_manager_fk` (`manager_id_managera` ASC) VISIBLE,
  CONSTRAINT `zamow_na_sklad_magazyn_fk`
    FOREIGN KEY (`magazyn_id_magazynu`)
    REFERENCES `bazy0301`.`magazyn` (`id_magazynu`),
CONSTRAINT `zamow_na_sklad_skladniki_FK`
    FOREIGN KEY (`skladniki_id_skladnika`)
    REFERENCES `bazy0301`.`skladniki` (`id_skladnika`),
  CONSTRAINT `zamow_na_sklad_manager_fk`
    FOREIGN KEY (`manager_id_managera`)
    REFERENCES `bazy0301`.`manager` (`id_managera`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into zamow
values (1, 2), (2,1), (3,4), (4,1), (5,2), (6,7), (7,3), (8,2), (9,4), (10, 10), (11,2), (12,3), (13,1), (14,5), (15,3), (16,2),(17,1), (18,3), (19,2);

insert into miejscowosci
values  (1, 'Bogatynia', '82-601'), (2, 'Kalisz', '06-236'), (3,'Rumia', '30-744'), (4, 'Jozefow', '33-802'), (5, 'Mikolow', '67-875'), (6, 'Plazw', '32-217'), (7, 'Kamieniec Zabkowicki', '04-600'), (8, 'Wroclaw', '70-167'), (9, 'Wejherowo', '77-748'), (10, 'Studzienice', '65-566'), (11, 'Malbork', '00-417'), (12, 'Kamien', '87-087'), (13, 'Lodz', '99-676'), (14, 'Swiebodzin', '61-384'), (15, 'Gdansk', '20-880');

insert into magazyn
values (1, 2, 'Kwiatowa', 6), (2,4,'Okulickiego',13), (3,11,'Sikorskiego',3);

insert into klient
values (1, 'Grzegorz', 'Wawrzyniak', 4, 'Warszawska', '333b'), (2, 'Brajan', 'Kozak', 1, 'Urocza', '5/12'), 
       (3, 'Natalia', 'Koziol', 6, 'Sosnowa', '12/3'), (4, 'Dominika', 'Bednarczyk', 11, 'Torunska', '986a'), 
       (5, 'Leon', 'Sadowski', 9, 'Hebanowa', '545'), (6, 'Karina', 'Krawczyk', 9, 'Kujawska', '234c'), 
       (7, 'Aleksandra', 'Zielinska', 3, 'Bielawska', '1/1'), (8, 'Sebastian', 'Wilk', 1, 'Parkowa', '2/3'), 
       (9, 'Wincenty', 'Klimek', 5, 'Norwida', '190d'), (10, 'Nikola', 'Malek', 7, 'Akacjowa', '4/10');
       
insert into manager
values (1, 'Andrzej', 'Kolek', '123654789', 8, 'Dworcowa', '764f'), (2, 'Julia', 'Janik', '675123543', 4, 'Piastowska', '1/15'), (3, 'Waleria', 'Socha', '984213564', 1, 'Kasztanowa', '654a');       

insert into kuch
values (1, 'Iryna', 'Kalinowska', '456123987', 10, 'Krzywon', '154a'), (2, 'Arkadiusz', 'Kropka', '765423087', 2, 'Ogrodowa', '234e'), 
       (3, 'Ewelina', 'Owczarek', '324678543', 6, 'Lubelska', '2/7'), (4, 'Blanka', 'Ostrowska', '765123543', 10, 'Dwornicka', '654'), 
       (5, 'Tymoteusz', 'Michalak', '543675103', 15, 'Rzemieniewicka', '4/10'), (6, 'Albert', 'Marek', '692461049', 13, 'Grunwaldzka', '5/3');
       

insert into prac
values (1, 'Marian', 'Kopec', '402312865', 'Lakowa', '43b', 3), (2, 'Wiktoria', 'Madej', '659162059', 'Jarominiaka', '3/7', 14),
 (3, 'Feliks', 'Szulc', '103927458', 'Laskowa', '1235', 1), (4, 'Benedykt', 'Ciesielski', '281944273', 'Uliczna', '758c', 11),
 (5, 'Julian', 'Krol', '283910345', 'Brudna', '12/1', 12), (6, 'Nataniel', 'Mazurek', '283718234', 'Piwna', '1/17', 10),
 (7, 'Mariusz', 'Wolski', '271634192', 'Miarki', '3/13', 7), (8, 'Julia','Kwiatek', '293847584', 'Wielka', '6/5', 10),
 (9, 'Bozena','Gorecka', '758475234', 'Wigury', '673', 9), (10, 'Danuta', 'Bluszcz', '857293456', 'Stokrotek', '4/12', 15);


insert into przepis
values(1),(2),(3),(4),(5),(6);

insert into restaur
values (1, 'Alfa', 1, 1, 4, 'Markowa', '312b'), (2, 'Beta', 2, 2, 3, 'Gustowna', '20/23'), (3, 'Gamma', 3, 3, 10, 'Weselna', '23');
       
insert into rezerwacje
values (1, 'Serpentyny i wgl duzo rzeczy', '2023-01-07', '16:00:00', 1, 1, 1),
(2, 'brak', '2023-01-08', '12:00:00', 1, 2, 2),
(3, 'kotlet welldone', '2023-01-012', '18:30:00', 1, 3, 3),
(4, 'bez laktozy', '2023-01-06', '16:00:00', 2, 4, 4),
(5, 'brak', '2023-01-08', '12:00:00', 2, 5, 5),
(6, 'przy oknie poprosze ', '2023-01-011', '13:15:00', 2, 6, 6),
(7, 'czapeczke urodzinowa albo 2', '2023-01-30', '14:00:00', 3, 7, 7),
(8, 'brak', '2023-01-05', '21:00:00', 3, 8, 8),
(9, 'prosze polaczyc stoly', '2023-01-27', '17:45:00', 3, 9, 10),
(10, 'brak', '2023-01-27', '18:00:00', 1, 2, 11),
(11, 'brak', '2023-01-28', '09:30:00', 3, 3, 12),
(12, 'brak', '2023-01-28', '13:30:00', 1, 4, 13),
(13, 'brak', '2023-01-28', '16:00:00', 1, 5, 14),
(14, 'brak', '2023-01-28', '18:00:00', 1, 6, 15),
(15, 'brak', '2023-01-29', '10:00:00', 3, 7, 16),
(16, 'brak', '2023-01-28', '12:40:00', 3, 8, 17),
(17, 'brak', '2023-01-28', '15:00:00', 2, 9, 18);


insert into danie
values (1,'jaja',100.00,1,15.00,'Nalesniki'),(2,null,200.00,2,10.00, 'Frytki'), (3,'jaja',250.00,3,13.00,'Pierogi ruskie'), (4,'jaja',250.00,4,13.00,'Pierogi z kapusta'), (5,null,250.00,3,5.00,'kompot'),(6,'jaja',100.00,5,6.00,'ciasto');

insert into skladniki
values(1,'jaja'),(2,'maka'),(3,'woda'),(4,'olej'),(5,'mleko'),(6,'ziemniaki'),(7,'twarog'),(8,'kapusta wloska'),(9,'owoce'),(10,'drozdze');


insert into magazyn_skladniki
values (1,1,100),(1,2,50000),(1,3,80000),(1,4,4000),(1,5,6000),(1,6,800),(1,7,3000),(1,8,50),(1,9,9999),(1,10,333),
(2,1,200),(2,2,40000),(2,3,90000),(2,4,2000),(2,5,0),(2,6,0),(2,7,3000),(2,8,10),(2,9,9999),(2,10,833),
(3,1,100),(3,2,0),(3,3,80000),(3,4,7000),(3,5,1000),(3,6,770),(3,7,3090),(3,8,77),(3,9,7999),(3,10,333);


insert into Zmiana_lub_zaloga 
values (1, '2023-01-01', '08:00:00', 1), (2, '2023-01-01', '16:00:00', 1), 
       (3, '2023-01-01', '08:00:00', 2), (4, '2023-01-01', '16:00:00', 2), 
       (5, '2023-01-01', '08:00:00', 3), (6, '2023-01-01', '16:00:00', 3), 
       (7, '2023-01-02', '08:00:00', 1), (8, '2023-01-02', '16:00:00', 1),
       (9, '2023-01-02', '08:00:00', 2), (10, '2023-01-02', '16:00:00', 2),
       (11, '2023-01-02', '08:00:00', 3), (12, '2023-01-02', '16:00:00', 3),
       (13, '2023-01-03', '08:00:00', 1), (14, '2023-01-03', '16:00:00', 1),
       (15, '2023-01-03', '08:00:00', 2), (16, '2023-01-03', '16:00:00', 2),
       (17, '2023-01-03', '08:00:00', 3), (18, '2023-01-03', '16:00:00', 3),
       (19, '2023-01-04', '08:00:00', 1), (20, '2023-01-04', '16:00:00', 1),
       (21, '2023-01-04', '08:00:00', 2), (22, '2023-01-04', '16:00:00', 2),
       (23, '2023-01-04', '08:00:00', 3), (24, '2023-01-04', '16:00:00', 3);

insert into sale 
values (1, 'diamentowa',1),
(2, 'zlota',1),
(3, 'platynowa',1),
(4, 'srebrna',2),
(5, 'drewniana',2),
(6, 'mithrilowa',3),
(7, 'unobtainowa',3),
(8, 'fiolkowa',3);

insert stoliki
values (1,5,1),(2,5,1),(3,8,1),(4,4,1),
(5,2,1),(6,5,2),(7,5,2),(8,6,2),(9,4,2),
(10,2,2),(11,5,3),(12,5,3),(13,8,3),(14,8,3),
(15,2,3),(16,5,4),(17,5,4),(18,2,4),(19,2,4),
(20,4,4),(21,5,5),(22,5,5),(23,6,5),(24,8,5),
(25,4,5),(26,7,6),(27,5,6),(28,7,6),(29,5,6),
(30,3,6),(31,2,7),(32,4,7),(33,6,7),(34,8,7),
(35,10,7),(36,5,8),(37,5,8),(38,2,8),(39,5,8),(40,6,8);


insert into zamow_na_sklad
values (1,2,2,5000,5),(2,2,2,5000,6), (3,3,3,45000,2);

insert into aktual_prac
values (1,1,1), (2,2,1), (3,3,1), (4,4,2), (5,5,2), (6,6,2), (7,7,3), (8,8,3), (9,9,3), (10,10,4), 
       (11,1,4), (12,2,4), (13,3,5), (14,4,5), (15,5,5), (16,6,6), (17,7,6), (18, 8,6), (19,9,7), (20,10,7), 
       (21,1,7), (22,2,8), (23,3,8), (24,4,8), (25,5,9), (26,6,9), (27,7,9), (28,8,10), (29,9,10), (30,10,10), 
       (31,1,11), (32,3,11),(33,4,11),(34,5,12),(35,6,12),(36,7,12),(37, 8,13),(38,9,13),(39,10,13),
       (40,1,14),(41,2,14),(42,3,14),(43, 4,14),(44,5,15),(45,6,15),(46,7,15),(47,8,16),(48,9,16),(49,10,16),
       (50,1,17),(51,2,17),(52,3,18),(53,4,18),(54,5,19),(55,6,19),(56,7,20),(57,8,20),(58,9,21),(59,10,21),
       (60,1,22),(61,2,22),(62,3,22),(63,4,23),(64,5,23),(65,6,23),(66,7,24),(67,8,24),(68,9,24);

insert into zamow_danie
values (1,6),(2,3),(3,1),(4,5),(5,2),(4,1),(5,1),(6,3),(7,4),(8,5),(9,2),(10,1);       

select*from aktual_kuch;
insert into aktual_kuch 
values (1, 1, 1), (2, 2, 1), (3, 3, 2), (4, 4, 2), (5, 5, 3), (6, 6, 3), (7, 1, 4), (8, 2, 4), 
       (9,3,5), (10,4,5), (11,5,6), (12,6,6), (13,1,7), (14,2,7), (15,3,8), (16,4,8), (17,5,9), 
       (18, 6,9), (19,1,10),(20,2,10), (21,3,11),(22,4,11),(23,5,12),(24,6,12),(25,1,13),
       (26,2,13),(27,3,14),(28,4,14),(29,5,15),(30,6,15),(31,1,16),(32,2,16),(33,3,17),(34,4,17),
       (35,5,18),(36,6,18),(37,1,19),(38,2,19),(39,3,20),(40,4,20),(41,5,21),(42,6,21),(43,1,22),
       (44,2,22),(45,3,23),(46,4,23),(47,5,24),(48,6,24);
       
insert paragon
values (1,30.00,'2023-01-05','17:41:41',1), (2,10.00,'2023-01-05','21:37:13',2), (3,62.00,'2023-01-05','10:10:10',3),
 (4,13.00,'2023-01-04','08:12:59',4), (5,10.00,'2023-01-04','15:18:38',5), (6,42.00,'2023-01-04','21:30:30',6), (7,45.00,'2023-01-03','12:12:12',7), 
(8,20.00,'2023-01-03','15:16:17',8), (9,24.00,'2023-01-03','19:12:14',9), (10,130.00,'2023-01-05','14:16:18',10);

SELECT 
    *
FROM
    przepis_skladnik;
insert into przepis_skladnik
values (1,1,2),(1,2,250),(1,3,250),(1,4,5),(1,5,250),
	(2,6,10),(2,4,500),
    (3,1,1),(3,2,500),(3,3,250),(3,6,5),(3,7,120),
    (4,1,1),(4,2,500),(4,3,250),(4,6,5),(4,7,120),(4,8,1),
    (5,3,1000),(5,9,1),
    (6,2,500),(6,1,2),(6,10,150),(6,9,200);
    
/* kwerendy
1. Rezerwacje dokonane na najbliższy tydzień */
SELECT 
    rezerwacje_id,
    data,
    godzina,
    (data - CURRENT_DATE) AS Pozostalo_dni
FROM
    rezerwacje
HAVING Pozostalo_dni < 7 and Pozostalo_dni >= 0 
ORDER BY Pozostalo_dni ASC;


#Klient, który dokonał największej liczby rezerwacji
SELECT 
    klient.imie,
    klient.nazwisko,
    COUNT(rezerwacje.rezerwacje_id) AS Liczba_rezerwacji
FROM
    rezerwacje
        LEFT JOIN
    klient ON klient.klient_id = rezerwacje.klient_klient_id
GROUP BY klient.imie , klient.nazwisko
ORDER BY Liczba_rezerwacji DESC
LIMIT 1;


#Klient, który dokonał najmniejszej liczby rezerwacji
SELECT 
    klient.imie,
    klient.nazwisko,
    COUNT(rezerwacje.rezerwacje_id) AS Liczba_rezerwacji
FROM
    rezerwacje
        LEFT JOIN
    klient ON klient.klient_id = rezerwacje.klient_klient_id
GROUP BY klient.imie , klient.nazwisko
ORDER BY Liczba_rezerwacji ASC
LIMIT 1;


#Pracownicy wybrani według miejscowości, w których mieszkają
SELECT	
	prac.imie,
	prac.nazwisko,
	prac.nr_tel,
	miejscowosci.nazwa,
	miejscowosci.kod_pocztowy
FROM 
	prac LEFT JOIN miejscowosci ON prac.miejscowosci_id_miejscowosci=miejscowosci.id_miejscowosci
WHERE 
	miejscowosci.nazwa = 'Studzienice';
    
#Pięć paragonów o najwyższej sumie do zapłaty
SELECT 
    koszt, data, godzina
FROM
    paragon
ORDER BY paragon.koszt DESC
LIMIT 5;
    
#Manager, który złożył najwięcej zamówień na składniki
SELECT 
    manager.imie,
    manager.nazwisko,
    manager.nr_tel,
    COUNT(id_zamow_na_sklad) AS Liczba_zamowien
FROM
    manager
        LEFT JOIN
    zamow_na_sklad ON manager.id_managera = zamow_na_sklad.manager_id_managera
GROUP BY manager.imie , manager.nazwisko , manager.nr_tel
ORDER BY Liczba_zamowien DESC
LIMIT 1;

#Restauracja, w których dokonano największej liczby rezerwacji
SELECT 
    restaur.nazwa_restaur,
    COUNT(rezerwacje.rezerwacje_id) AS Liczba_rezerwacji
FROM
    restaur
        LEFT JOIN
    rezerwacje ON restaur.id_restaur = rezerwacje.restaur_id_restaur
GROUP BY restaur.nazwa_restaur
ORDER BY Liczba_rezerwacji DESC
LIMIT 1;


  #Kucharze, będący na zmianie w określonym dniu
SELECT 
    kuch.imie,
    kuch.nazwisko,
    kuch.nr_tel,
    zmiana_lub_zaloga.data,
    zmiana_lub_zaloga.godzina,
    zmiana_lub_zaloga.restaur_id_restaur
FROM
    aktual_kuch
        LEFT JOIN
    kuch ON aktual_kuch.kuch_id_kucharza = kuch.id_kucharza
        LEFT JOIN
    zmiana_lub_zaloga ON aktual_kuch.Zmiana_lub_zaloga_Zmiana_lub_zaloga_ID = zmiana_lub_zaloga.Zmiana_lub_zaloga_ID
WHERE
    zmiana_lub_zaloga.data = '2023-01-01';
    
#Pracownicy, będący na zmianie w dzisiejszym dniu
SELECT 
    prac.imie,
    prac.nazwisko,
    prac.nr_tel,
    zmiana_lub_zaloga.data,
    zmiana_lub_zaloga.godzina,
    zmiana_lub_zaloga.restaur_id_restaur
FROM
    aktual_prac
        LEFT JOIN
    prac ON prac.id_prac = aktual_prac.prac_id_prac
        LEFT JOIN
    zmiana_lub_zaloga ON aktual_prac.Zmiana_lub_zaloga_Zmiana_lub_zaloga_ID = zmiana_lub_zaloga.Zmiana_lub_zaloga_ID
WHERE
    zmiana_lub_zaloga.data = '2023-01-01';
    
#Najdroższe danie w menu
SELECT
    id_dania,
    nazwa,
    cena
FROM
    danie
WHERE
    cena IN
    (
        SELECT
            DISTINCT
            MAX(cena)
        FROM
            danie
    );


#Składnik w magazynie, którego stan jest najniższy

SELECT
	magazyn.id_magazynu,
	magazyn.ulica,
	miejscowosci.nazwa as nazwa_miejscowosci,
   	 magazyn_skladniki.skladniki_id_skladnika,
	magazyn_skladniki.ilosc_skladnika as ilosc_skladnika
FROM magazyn LEFT JOIN miejscowosci ON magazyn.miejscowosci_id_miejscowosci=miejscowosci.id_miejscowosci
LEFT JOIN magazyn_skladniki ON magazyn.id_magazynu=magazyn_skladniki.magazyn_id_magazynu
WHERE
    ilosc_skladnika IN
    (
        SELECT
            DISTINCT
            MIN(ilosc_skladnika)
        FROM magazyn 
        LEFT JOIN miejscowosci ON magazyn.miejscowosci_id_miejscowosci=miejscowosci.id_miejscowosci
		LEFT JOIN magazyn_skladniki ON magazyn.id_magazynu=magazyn_skladniki.magazyn_id_magazynu
    );

#Składnik w magazynie, którego stan jest najwyższy
SELECT
	magazyn.id_magazynu,
	magazyn.ulica,
	miejscowosci.nazwa as nazwa_miejscowosci,
	magazyn_skladniki.skladniki_id_skladnika,
	magazyn_skladniki.ilosc_skladnika as ilosc_skladnika
FROM
magazyn LEFT JOIN miejscowosci ON magazyn.miejscowosci_id_miejscowosci=miejscowosci.id_miejscowosci
LEFT JOIN magazyn_skladniki ON magazyn.id_magazynu=magazyn_skladniki.magazyn_id_magazynu
WHERE
    ilosc_skladnika IN
    (
        SELECT
            DISTINCT
            MAX(ilosc_skladnika)
			FROM magazyn 
            LEFT JOIN miejscowosci ON magazyn.miejscowosci_id_miejscowosci=miejscowosci.id_miejscowosci
			LEFT JOIN magazyn_skladniki ON magazyn.id_magazynu=magazyn_skladniki.magazyn_id_magazynu
    );


#Dania posortowane malejąco wedlug gramatury
SELECT 
    nazwa, gramatura
FROM
    danie
ORDER BY gramatura DESC;

#Ilosc paragonow w okreslonym dniu
SELECT 
    data,
    COUNT(id_paragonu) AS Liczba_paragonow,
    SUM(koszt) AS Dzisiejszy_utarg
FROM
    paragon
WHERE
    data = '2023-01-05'
GROUP BY data;
    
#Rezerwacja na najbardziej odległy termin 
SELECT 
    rezerwacje_id,
    data,
    godzina,
    (rezerwacje.data - CURRENT_DATE) AS Pozostalo_dni
FROM
    rezerwacje
ORDER BY Pozostalo_dni DESC
LIMIT 1;


