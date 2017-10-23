use test;

DROP TABLE IF EXISTS book;

CREATE TABLE book(
  id INT(11) NOT NULL AUTO_INCREMENT,
  title VARCHAR(100),
  description VARCHAR(255),
  author VARCHAR(100),
  isbn VARCHAR(20),
  printYear INT,
  readAlready BOOLEAN,
  PRIMARY KEY (id))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;

INSERT INTO book(title, description, author, isbn, printYear, readAlready) VALUES ('Moskovsky club','Anklavy. Book 1','Vadim Panov','5-699-08658-7',2005,0),
  ('Povodyri na rasputie','Anklavy. Book 2','Vadim Panov','5-699-17737-0',2006,0),
  ('Kostry na altariah','Anklavy. Book 3','Vadim Panov','978-5-699-25283-1',2008,0),
  ('Prodavtsy nevozmozhnogo','Anklavy. Book 4','Vadim Panov','978-5-699-38695-6',2009,0),
  ('Khaosovershenstvo','Anklavi. Book 5','Vadim Panov','978-5-699-43821-1',2010,0),
  ('Volkodav','First book of Volkodav series','Maria Semenova','978-5-389-03967-4',1995,0),
  ('Pravo na poedinok','Second book of Volkodav series','Maria Semenova','978-5-389-10873-8',1997,0),
  ('Istovik-kamen','Third book of Volkodav series','Maria Semenova','978-5-389-10874-5',2000,0),
  ('Znamenie puti','Fourth book of Volkodav series','Maria Semenova','978-5-389-04307-7',2003,0),
  ('Samotsvetnie gory','Fifth book of Volkodav series','Maria Semenova','978-5-389-10875-2',2003,0),
  ('Mir po doroge','Sixth book of Volkodav series','Maria Semenova','978-5-389-07720-1',2014,0),
  ('Troe iz lesa','Troe iz lesa series. Book 1','Yury Nikitin','5-699-15000-5',2007,0),
  ('Troe v peskah','Troe iz lesa series. Book 2','Yury Nikitin','5-699-15434-0',2006,0),
  ('Troe i bogi','Troe iz lesa series. Book 3','Yury Nikitin','5-699-15976-2',2007,0),
  ('Troe v doline','Troe iz lesa series. Book 4','Yury Nikitin','5-699-16819-4',2006,0),
  ('Elfijsky klinok','Koltso tmy. Book 1','Nik Perumov','978-5-699-06964-4',2009,0),
  ('Chernoe kopjo','Koltso tmy. Book 2','Nik Perumov','978-5-699-06963-7',2007,0),
  ('Adamant Khenny','Koltso tmy. Book 3','Nik Perumov','978-5-699-11048-3',2007,0),
  ('Razreshennoe volshebstvo','Tekhnomagia. Book 1','Nik Perumov','5-699-001948-0',2004,0),
  ('Vrag nevedom','Tekhnomagia. Book 2','Nik Perumov','978-5-699-00496-6',2008,0),
  ('Cherep na rukave','Imperia previshe vsego. Book 1','Nik Perumov','978-5-699-11050-6',2008,0),
  ('Cherep v nebesah','Imperia previshe vsego. Book 2','Nik Perumov','978-5-699-07626-0',2007,0);