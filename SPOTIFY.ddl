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

create database spoti5;


-- DBSpace Section
-- _______________


-- Tables Section
-- _____________ 

create table ALBUM (
     ID_artista char(1) not null,
     titolo char(1) not null,
     descrizione char(1) not null,
     durata_riproduzione char(1) not null,
     numero_brani char(1) not null,
     constraint ID_ALBUM_ID primary key (ID_artista, titolo));

create table ARTISTA (
     descrizione char(1) not null,
     nome_d_arte char(1) not null,
     ID_artista char(1) not null,
     generi_musicali char(1) not null,
     followers char(1) not null,
     data_fondazione char(1) not null,
     constraint ID_ARTISTA_ID primary key (ID_artista));

create table ascolto (
     ID_brano char(1) not null,
     email char(1) not null,
     constraint ID_ascolto_ID primary key (ID_brano, email));

create table BRANO (
     ID_brano char(1) not null,
     titolo char(1) not null,
     testo char(1),
     durata char(1) not null,
     data_uscita char(1) not null,
     Tra_ID_artista char(1),
     Tra_titolo char(1),
     constraint ID_BRANO_ID primary key (ID_brano));

create table CATEGORIA (
     nome char(1) not null,
     ID_categoria char(1) not null,
     constraint ID_CATEGORIA_ID primary key (ID_categoria));

create table classificazione (
     ID_brano char(1) not null,
     ID_categoria char(1) not null,
     opzione char(1) not null,
     constraint ID_classificazione_ID primary key (ID_categoria, opzione, ID_brano));

create table cogliere (
     ID_brano char(1) not null,
     ID_playlist char(1) not null,
     constraint ID_cogliere_ID primary key (ID_playlist, ID_brano));

create table COMPOSITORE (
     ID_compositore -- Compound attribute -- not null,
     nome_d_arte char(1) not null,
     constraint ID_COMPOSITORE_ID primary key (ID_compositore -- Compound attribute --));

create table composizione (
     ID_brano char(1) not null,
     ID_compositore -- Compound attribute -- not null,
     constraint ID_composizione_ID primary key (ID_compositore -- Compound attribute --, ID_brano));

create table esecuzione (
     ID_artista char(1) not null,
     ID_brano char(1) not null,
     constraint ID_esecuzione_ID primary key (ID_artista, ID_brano));

create table FREE (
     email char(1) not null,
     tempo_attivazione date not null,
     constraint ID_FREE_ID primary key (email, tempo_attivazione));

create table INSERZIONISTA (
     ID_inserzionista char(1) not null,
     nome char(1) not null,
     settore char(1) not null,
     constraint ID_INSERZIONISTA_ID primary key (ID_inserzionista));

create table OPZIONE_CATEGORIA (
     ID_categoria char(1) not null,
     opzione char(1) not null,
     constraint ID_OPZIONE_CATEGORIA_ID primary key (ID_categoria, opzione));

create table PAROLIERE (
     ID_paroliere char(1) not null,
     nome_d_arte char(1) not null,
     constraint ID_PAROLIERE_ID primary key (ID_paroliere));

create table PLAYLIST (
     ID_playlist char(1) not null,
     titolo char(1) not null,
     descrizione char(1) not null,
     Tipo char(1) not null,
     numero_brani char(1) not null,
     email char(1) not null,
     constraint ID_PLAYLIST_ID primary key (ID_playlist));

create table PREMIUM (
     email char(1) not null,
     data_scadenza char(1) not null,
     tempo_attivazione date not null,
     Prezzo char(1) not null,
     constraint ID_PREMIUM_ID primary key (email, tempo_attivazione));

create table proiettare (
     ID_pubblicita char(1) not null,
     email char(1) not null,
     conta_views char(1) not null,
     constraint ID_proiettare_ID primary key (email, ID_pubblicita));

create table PUBBLICITA (
     ID_pubblicita char(1) not null,
     URL char(1) not null,
     durata char(1) not null,
     budget char(1) not null,
     max_visualizzazioni char(1) not null,
     ID_inserzionista char(1) not null,
     constraint ID_PUBBLICITA_ID primary key (ID_pubblicita));

create table scrittura (
     ID_brano char(1) not null,
     ID_paroliere char(1) not null,
     constraint ID_scrittura_ID primary key (ID_paroliere, ID_brano));

create table UTENTE (
     email char(1) not null,
     nome_utente char(1) not null,
     password char(1) not null,
     data_nascita char(1) not null,
     paese char(1) not null,
     constraint ID_UTENTE_ID primary key (email));

create table VERSIONE_BRANO (
     ID_brano char(1) not null,
     dimensione char(1) not null,
     sorgente char(1) not null,
     Tipo char(1) not null,
     constraint ID_VERSIONE_BRANO_ID primary key (ID_brano, Tipo));


-- Constraints Section
-- ___________________ 

alter table ALBUM add constraint ID_ALBUM_CHK
     check(exists(select * from BRANO
                  where BRANO.Tra_ID_artista = ID_artista and BRANO.Tra_titolo = titolo)); 

alter table ALBUM add constraint REF_ALBUM_ARTIS
     foreign key (ID_artista)
     references ARTISTA;

alter table ARTISTA add constraint ID_ARTISTA_CHK
     check(exists(select * from esecuzione
                  where esecuzione.ID_artista = ID_artista)); 

alter table ascolto add constraint REF_ascol_UTENT_FK
     foreign key (email)
     references UTENTE;

alter table ascolto add constraint REF_ascol_BRANO
     foreign key (ID_brano)
     references BRANO;

alter table BRANO add constraint ID_BRANO_CHK
     check(exists(select * from composizione
                  where composizione.ID_brano = ID_brano)); 

alter table BRANO add constraint ID_BRANO_CHK
     check(exists(select * from esecuzione
                  where esecuzione.ID_brano = ID_brano)); 

alter table BRANO add constraint ID_BRANO_CHK
     check(exists(select * from VERSIONE_BRANO
                  where VERSIONE_BRANO.ID_brano = ID_brano)); 

alter table BRANO add constraint EQU_BRANO_ALBUM_FK
     foreign key (Tra_ID_artista, Tra_titolo)
     references ALBUM;

alter table BRANO add constraint EQU_BRANO_ALBUM_CHK
     check((Tra_ID_artista is not null and Tra_titolo is not null)
           or (Tra_ID_artista is null and Tra_titolo is null)); 

alter table classificazione add constraint REF_class_OPZIO
     foreign key (ID_categoria, opzione)
     references OPZIONE_CATEGORIA;

alter table classificazione add constraint REF_class_BRANO_FK
     foreign key (ID_brano)
     references BRANO;

alter table cogliere add constraint REF_cogli_PLAYL
     foreign key (ID_playlist)
     references PLAYLIST;

alter table cogliere add constraint REF_cogli_BRANO_FK
     foreign key (ID_brano)
     references BRANO;

alter table composizione add constraint REF_compo_COMPO
     foreign key (ID_compositore -- Compound attribute --)
     references COMPOSITORE;

alter table composizione add constraint EQU_compo_BRANO_FK
     foreign key (ID_brano)
     references BRANO;

alter table esecuzione add constraint EQU_esecu_BRANO_FK
     foreign key (ID_brano)
     references BRANO;

alter table esecuzione add constraint EQU_esecu_ARTIS
     foreign key (ID_artista)
     references ARTISTA;

alter table FREE add constraint REF_FREE_UTENT
     foreign key (email)
     references UTENTE;

alter table OPZIONE_CATEGORIA add constraint REF_OPZIO_CATEG
     foreign key (ID_categoria)
     references CATEGORIA;

alter table PLAYLIST add constraint REF_PLAYL_UTENT_FK
     foreign key (email)
     references UTENTE;

alter table PREMIUM add constraint REF_PREMI_UTENT
     foreign key (email)
     references UTENTE;

alter table proiettare add constraint REF_proie_UTENT
     foreign key (email)
     references UTENTE;

alter table proiettare add constraint REF_proie_PUBBL_FK
     foreign key (ID_pubblicita)
     references PUBBLICITA;

alter table PUBBLICITA add constraint REF_PUBBL_INSER_FK
     foreign key (ID_inserzionista)
     references INSERZIONISTA;

alter table scrittura add constraint REF_scrit_PAROL
     foreign key (ID_paroliere)
     references PAROLIERE;

alter table scrittura add constraint REF_scrit_BRANO_FK
     foreign key (ID_brano)
     references BRANO;

alter table VERSIONE_BRANO add constraint EQU_VERSI_BRANO
     foreign key (ID_brano)
     references BRANO;


-- Index Section
-- _____________ 

create unique index ID_ALBUM_IND
     on ALBUM (ID_artista, titolo);

create unique index ID_ARTISTA_IND
     on ARTISTA (ID_artista);

create unique index ID_ascolto_IND
     on ascolto (ID_brano, email);

create index REF_ascol_UTENT_IND
     on ascolto (email);

create unique index ID_BRANO_IND
     on BRANO (ID_brano);

create index EQU_BRANO_ALBUM_IND
     on BRANO (Tra_ID_artista, Tra_titolo);

create unique index ID_CATEGORIA_IND
     on CATEGORIA (ID_categoria);

create unique index ID_classificazione_IND
     on classificazione (ID_categoria, opzione, ID_brano);

create index REF_class_BRANO_IND
     on classificazione (ID_brano);

create unique index ID_cogliere_IND
     on cogliere (ID_playlist, ID_brano);

create index REF_cogli_BRANO_IND
     on cogliere (ID_brano);

create unique index ID_COMPOSITORE_IND
     on COMPOSITORE (ID_compositore -- Compound attribute --);

create unique index ID_composizione_IND
     on composizione (ID_compositore -- Compound attribute --, ID_brano);

create index EQU_compo_BRANO_IND
     on composizione (ID_brano);

create unique index ID_esecuzione_IND
     on esecuzione (ID_artista, ID_brano);

create index EQU_esecu_BRANO_IND
     on esecuzione (ID_brano);

create unique index ID_FREE_IND
     on FREE (email, tempo_attivazione);

create unique index ID_INSERZIONISTA_IND
     on INSERZIONISTA (ID_inserzionista);

create unique index ID_OPZIONE_CATEGORIA_IND
     on OPZIONE_CATEGORIA (ID_categoria, opzione);

create unique index ID_PAROLIERE_IND
     on PAROLIERE (ID_paroliere);

create unique index ID_PLAYLIST_IND
     on PLAYLIST (ID_playlist);

create index REF_PLAYL_UTENT_IND
     on PLAYLIST (email);

create unique index ID_PREMIUM_IND
     on PREMIUM (email, tempo_attivazione);

create unique index ID_proiettare_IND
     on proiettare (email, ID_pubblicita);

create index REF_proie_PUBBL_IND
     on proiettare (ID_pubblicita);

create unique index ID_PUBBLICITA_IND
     on PUBBLICITA (ID_pubblicita);

create index REF_PUBBL_INSER_IND
     on PUBBLICITA (ID_inserzionista);

create unique index ID_scrittura_IND
     on scrittura (ID_paroliere, ID_brano);

create index REF_scrit_BRANO_IND
     on scrittura (ID_brano);

create unique index ID_UTENTE_IND
     on UTENTE (email);

create unique index ID_VERSIONE_BRANO_IND
     on VERSIONE_BRANO (ID_brano, Tipo);

