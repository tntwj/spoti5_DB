-- *********************************************
-- * Standard SQL generation                   
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Sun Mar  2 19:55:11 2025 
-- * LUN file: C:\Users\weiji\OneDrive\Desktop\unibo\db\SPOTIFY.lun 
-- * Schema: schema-logico/SQL 
-- ********************************************* 


-- Database Section
-- ________________ 

CREATE DATABASE spoti5;

USE spoti5;

-- Tables Section
-- _____________ 

CREATE TABLE ALBUM (
     ID_artista VARCHAR(50) NOT NULL,
     titolo VARCHAR(200) NOT NULL,
     descrizione TEXT NOT NULL,
     CONSTRAINT ID_ALBUM_ID PRIMARY KEY (ID_artista, titolo)
);

CREATE TABLE ARTISTA (
     ID_artista VARCHAR(50) NOT NULL,
     nome_d_arte VARCHAR(100) NOT NULL,
     descrizione TEXT NOT NULL,
     generi_musicali VARCHAR(255) NOT NULL,
     followers INT NOT NULL,
     data_fondazione DATE NOT NULL,
     CONSTRAINT ID_ARTISTA_ID PRIMARY KEY (ID_artista)
);

CREATE TABLE BRANO (
     ID_brano VARCHAR(50) NOT NULL,
     titolo VARCHAR(200) NOT NULL,
     testo TEXT,
     durata INT NOT NULL, -- in seconds
     data_uscita DATE NOT NULL,
     Tra_ID_artista VARCHAR(50),
     Tra_titolo VARCHAR(200),
     CONSTRAINT ID_BRANO_ID PRIMARY KEY (ID_brano)
);

CREATE TABLE CATEGORIA (
     ID_categoria VARCHAR(50) NOT NULL,
     nome VARCHAR(100) NOT NULL,
     CONSTRAINT ID_CATEGORIA_ID PRIMARY KEY (ID_categoria)
);

CREATE TABLE OPZIONE_CATEGORIA (
     ID_categoria VARCHAR(50) NOT NULL,
     opzione VARCHAR(100) NOT NULL,
     CONSTRAINT ID_OPZIONE_CATEGORIA_ID PRIMARY KEY (ID_categoria, opzione)
);

CREATE TABLE COMPOSITORE (
     ID_compositore VARCHAR(50) NOT NULL,
     nome_d_arte VARCHAR(100) NOT NULL,
     CONSTRAINT ID_COMPOSITORE_ID PRIMARY KEY (ID_compositore)
);

CREATE TABLE PAROLIERE (
     ID_paroliere VARCHAR(50) NOT NULL,
     nome_d_arte VARCHAR(100) NOT NULL,
     CONSTRAINT ID_PAROLIERE_ID PRIMARY KEY (ID_paroliere)
);

CREATE TABLE UTENTE (
     email VARCHAR(100) NOT NULL,
     nome_utente VARCHAR(50) NOT NULL,
     password VARCHAR(100) NOT NULL,
     data_nascita DATE NOT NULL,
     paese VARCHAR(50) NOT NULL,
     CONSTRAINT ID_UTENTE_ID PRIMARY KEY (email)
);

CREATE TABLE PLAYLIST (
     ID_playlist VARCHAR(50) NOT NULL,
     titolo VARCHAR(200) NOT NULL,
     descrizione TEXT NOT NULL,
     Tipo VARCHAR(50) NOT NULL,
     email VARCHAR(100) NOT NULL,
     CONSTRAINT ID_PLAYLIST_ID PRIMARY KEY (ID_playlist)
);

CREATE TABLE VERSIONE_BRANO (
     ID_brano VARCHAR(50) NOT NULL,
     Tipo VARCHAR(50) NOT NULL,
     dimensione INT NOT NULL, -- in KB
     sorgente VARCHAR(255) NOT NULL,
     CONSTRAINT ID_VERSIONE_BRANO_ID PRIMARY KEY (ID_brano, Tipo)
);

CREATE TABLE FREE (
     email VARCHAR(100) NOT NULL,
     tempo_attivazione DATETIME NOT NULL,
     CONSTRAINT ID_FREE_ID PRIMARY KEY (email, tempo_attivazione)
);

CREATE TABLE PREMIUM (
     email VARCHAR(100) NOT NULL,
     tempo_attivazione DATETIME NOT NULL,
     data_scadenza DATE NOT NULL,
     Prezzo DECIMAL(10,2) NOT NULL,
     CONSTRAINT ID_PREMIUM_ID PRIMARY KEY (email, tempo_attivazione)
);

CREATE TABLE INSERZIONISTA (
     ID_inserzionista VARCHAR(50) NOT NULL,
     nome VARCHAR(100) NOT NULL,
     settore VARCHAR(100) NOT NULL,
     CONSTRAINT ID_INSERZIONISTA_ID PRIMARY KEY (ID_inserzionista)
);

CREATE TABLE PUBBLICITA (
     ID_pubblicita VARCHAR(50) NOT NULL,
     URL VARCHAR(255) NOT NULL,
     durata INT NOT NULL, -- in seconds
     budget DECIMAL(15,2) NOT NULL,
     max_visualizzazioni INT NOT NULL,
     ID_inserzionista VARCHAR(50) NOT NULL,
     CONSTRAINT ID_PUBBLICITA_ID PRIMARY KEY (ID_pubblicita)
);

-- Relationship Tables
-- _________________ 

CREATE TABLE ascolto (
     ID_brano VARCHAR(50) NOT NULL,
     email VARCHAR(100) NOT NULL,
     CONSTRAINT ID_ascolto_ID PRIMARY KEY (ID_brano, email)
);

CREATE TABLE classificazione (
     ID_brano VARCHAR(50) NOT NULL,
     ID_categoria VARCHAR(50) NOT NULL,
     opzione VARCHAR(100) NOT NULL,
     CONSTRAINT ID_classificazione_ID PRIMARY KEY (ID_categoria, opzione, ID_brano)
);

CREATE TABLE cogliere (
     ID_brano VARCHAR(50) NOT NULL,
     ID_playlist VARCHAR(50) NOT NULL,
     CONSTRAINT ID_cogliere_ID PRIMARY KEY (ID_playlist, ID_brano)
);

CREATE TABLE composizione (
     ID_brano VARCHAR(50) NOT NULL,
     ID_compositore VARCHAR(50) NOT NULL,
     CONSTRAINT ID_composizione_ID PRIMARY KEY (ID_compositore, ID_brano)
);

CREATE TABLE esecuzione (
     ID_artista VARCHAR(50) NOT NULL,
     ID_brano VARCHAR(50) NOT NULL,
     CONSTRAINT ID_esecuzione_ID PRIMARY KEY (ID_artista, ID_brano)
);

CREATE TABLE proiettare (
     ID_pubblicita VARCHAR(50) NOT NULL,
     email VARCHAR(100) NOT NULL,
     data_proiezione DATETIME NOT NULL,
     CONSTRAINT ID_proiettare_ID PRIMARY KEY (email, ID_pubblicita, data_proiezione)
);

CREATE TABLE scrittura (
     ID_brano VARCHAR(50) NOT NULL,
     ID_paroliere VARCHAR(50) NOT NULL,
     CONSTRAINT ID_scrittura_ID PRIMARY KEY (ID_paroliere, ID_brano)
);

-- Constraints Section
-- ___________________ 

ALTER TABLE ALBUM ADD CONSTRAINT REF_ALBUM_ARTIS
     FOREIGN KEY (ID_artista)
     REFERENCES ARTISTA(ID_artista);

ALTER TABLE BRANO ADD CONSTRAINT EQU_BRANO_ALBUM_FK
     FOREIGN KEY (Tra_ID_artista, Tra_titolo)
     REFERENCES ALBUM(ID_artista, titolo);

ALTER TABLE ascolto ADD CONSTRAINT REF_ascol_UTENT_FK
     FOREIGN KEY (email)
     REFERENCES UTENTE(email);

ALTER TABLE ascolto ADD CONSTRAINT REF_ascol_BRANO
     FOREIGN KEY (ID_brano)
     REFERENCES BRANO(ID_brano);

ALTER TABLE classificazione ADD CONSTRAINT REF_class_OPZIO
     FOREIGN KEY (ID_categoria, opzione)
     REFERENCES OPZIONE_CATEGORIA(ID_categoria, opzione);

ALTER TABLE classificazione ADD CONSTRAINT REF_class_BRANO_FK
     FOREIGN KEY (ID_brano)
     REFERENCES BRANO(ID_brano);

ALTER TABLE cogliere ADD CONSTRAINT REF_cogli_PLAYL
     FOREIGN KEY (ID_playlist)
     REFERENCES PLAYLIST(ID_playlist);

ALTER TABLE cogliere ADD CONSTRAINT REF_cogli_BRANO_FK
     FOREIGN KEY (ID_brano)
     REFERENCES BRANO(ID_brano);

ALTER TABLE composizione ADD CONSTRAINT REF_compo_COMPO
     FOREIGN KEY (ID_compositore)
     REFERENCES COMPOSITORE(ID_compositore);

ALTER TABLE composizione ADD CONSTRAINT REF_compo_BRANO_FK
     FOREIGN KEY (ID_brano)
     REFERENCES BRANO(ID_brano);

ALTER TABLE esecuzione ADD CONSTRAINT REF_esecu_BRANO_FK
     FOREIGN KEY (ID_brano)
     REFERENCES BRANO(ID_brano);

ALTER TABLE esecuzione ADD CONSTRAINT REF_esecu_ARTIS
     FOREIGN KEY (ID_artista)
     REFERENCES ARTISTA(ID_artista);

ALTER TABLE FREE ADD CONSTRAINT REF_FREE_UTENT
     FOREIGN KEY (email)
     REFERENCES UTENTE(email);

ALTER TABLE OPZIONE_CATEGORIA ADD CONSTRAINT REF_OPZIO_CATEG
     FOREIGN KEY (ID_categoria)
     REFERENCES CATEGORIA(ID_categoria);

ALTER TABLE PLAYLIST ADD CONSTRAINT REF_PLAYL_UTENT_FK
     FOREIGN KEY (email)
     REFERENCES UTENTE(email);

ALTER TABLE PREMIUM ADD CONSTRAINT REF_PREMI_UTENT
     FOREIGN KEY (email)
     REFERENCES UTENTE(email);

ALTER TABLE proiettare ADD CONSTRAINT REF_proie_UTENT
     FOREIGN KEY (email)
     REFERENCES UTENTE(email);

ALTER TABLE proiettare ADD CONSTRAINT REF_proie_PUBBL_FK
     FOREIGN KEY (ID_pubblicita)
     REFERENCES PUBBLICITA(ID_pubblicita);

ALTER TABLE PUBBLICITA ADD CONSTRAINT REF_PUBBL_INSER_FK
     FOREIGN KEY (ID_inserzionista)
     REFERENCES INSERZIONISTA(ID_inserzionista);

ALTER TABLE scrittura ADD CONSTRAINT REF_scrit_PAROL
     FOREIGN KEY (ID_paroliere)
     REFERENCES PAROLIERE(ID_paroliere);

ALTER TABLE scrittura ADD CONSTRAINT REF_scrit_BRANO_FK
     FOREIGN KEY (ID_brano)
     REFERENCES BRANO(ID_brano);

ALTER TABLE VERSIONE_BRANO ADD CONSTRAINT REF_VERSI_BRANO
     FOREIGN KEY (ID_brano)
     REFERENCES BRANO(ID_brano);

-- Index Section
-- _____________ 

CREATE UNIQUE INDEX ID_ALBUM_IND
     ON ALBUM (ID_artista, titolo);

CREATE UNIQUE INDEX ID_ARTISTA_IND
     ON ARTISTA (ID_artista);

CREATE UNIQUE INDEX ID_ascolto_IND
     ON ascolto (ID_brano, email);

CREATE INDEX REF_ascol_UTENT_IND
     ON ascolto (email);

CREATE UNIQUE INDEX ID_BRANO_IND
     ON BRANO (ID_brano);

CREATE INDEX EQU_BRANO_ALBUM_IND
     ON BRANO (Tra_ID_artista, Tra_titolo);

CREATE UNIQUE INDEX ID_CATEGORIA_IND
     ON CATEGORIA (ID_categoria);

CREATE UNIQUE INDEX ID_classificazione_IND
     ON classificazione (ID_categoria, opzione, ID_brano);

CREATE INDEX REF_class_BRANO_IND
     ON classificazione (ID_brano);

CREATE UNIQUE INDEX ID_cogliere_IND
     ON cogliere (ID_playlist, ID_brano);

CREATE INDEX REF_cogli_BRANO_IND
     ON cogliere (ID_brano);

CREATE UNIQUE INDEX ID_COMPOSITORE_IND
     ON COMPOSITORE (ID_compositore);

CREATE UNIQUE INDEX ID_composizione_IND
     ON composizione (ID_compositore, ID_brano);

CREATE INDEX EQU_compo_BRANO_IND
     ON composizione (ID_brano);

CREATE UNIQUE INDEX ID_esecuzione_IND
     ON esecuzione (ID_artista, ID_brano);

CREATE INDEX EQU_esecu_BRANO_IND
     ON esecuzione (ID_brano);

CREATE UNIQUE INDEX ID_FREE_IND
     ON FREE (email, tempo_attivazione);

CREATE UNIQUE INDEX ID_INSERZIONISTA_IND
     ON INSERZIONISTA (ID_inserzionista);

CREATE UNIQUE INDEX ID_OPZIONE_CATEGORIA_IND
     ON OPZIONE_CATEGORIA (ID_categoria, opzione);

CREATE UNIQUE INDEX ID_PAROLIERE_IND
     ON PAROLIERE (ID_paroliere);

CREATE UNIQUE INDEX ID_PLAYLIST_IND
     ON PLAYLIST (ID_playlist);

CREATE INDEX REF_PLAYL_UTENT_IND
     ON PLAYLIST (email);

CREATE UNIQUE INDEX ID_PREMIUM_IND
     ON PREMIUM (email, tempo_attivazione);

CREATE UNIQUE INDEX ID_proiettare_IND
     ON proiettare (email, ID_pubblicita);

CREATE INDEX REF_proie_PUBBL_IND
     ON proiettare (ID_pubblicita);

CREATE UNIQUE INDEX ID_PUBBLICITA_IND
     ON PUBBLICITA (ID_pubblicita);

CREATE INDEX REF_PUBBL_INSER_IND
     ON PUBBLICITA (ID_inserzionista);

CREATE UNIQUE INDEX ID_scrittura_IND
     ON scrittura (ID_paroliere, ID_brano);

CREATE INDEX REF_scrit_BRANO_IND
     ON scrittura (ID_brano);

CREATE UNIQUE INDEX ID_UTENTE_IND
     ON UTENTE (email);

CREATE UNIQUE INDEX ID_VERSIONE_BRANO_IND
     ON VERSIONE_BRANO (ID_brano, Tipo);
