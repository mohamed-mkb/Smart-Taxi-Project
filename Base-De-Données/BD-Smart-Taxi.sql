/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 11                        */
/* Date de cr�ation :  25/02/2025 09:30:41                      */
/*==============================================================*/

/*==============================================================*/
/* Table : CAPTEUR                                              */
/*==============================================================*/
create table CAPTEUR 
(
   ID_CAPTEUR           integer                        not null,
   LATITUDE             varchar(255)                   null,
   LONGITUDE            varchar(255)                   null,
   constraint PK_CAPTEUR primary key (ID_CAPTEUR)
);

/*==============================================================*/
/* Index : CAPTEUR_PK                                           */
/*==============================================================*/
create unique index CAPTEUR_PK on CAPTEUR (
ID_CAPTEUR ASC
);

/*==============================================================*/
/* Table : EQUIPEMENT                                           */
/*==============================================================*/
create table EQUIPEMENT 
(
   ID_EQUIPEMENT        integer                        not null,
   ETAT_ROUTE           varchar(255)                   null,
   LIBELLE_EQUIPEMENT   varchar(255)                   null,
   constraint PK_EQUIPEMENT primary key (ID_EQUIPEMENT)
);

/*==============================================================*/
/* Index : EQUIPEMENT_PK                                        */
/*==============================================================*/
create unique index EQUIPEMENT_PK on EQUIPEMENT (
ID_EQUIPEMENT ASC
);

/*==============================================================*/
/* Table : RESERVATION                                          */
/*==============================================================*/
create table RESERVATION 
(
   ID_USER              integer                        not null,
   ID_TARIFICATION      integer                        not null,
   ID_VEHICULE          integer                        not null,
   ADRESSE_DEPART       varchar(255)                   null,
   ADRESSE_ARRIVEE      varchar(255)                   null,
   DISTANCE_COURSE      decimal(10,2)                  null,
   TEMPS_COURSE         decimal(10,2)                  null,
   `DATE`               timestamp                      null,
   PRIX_TOTAL_COURSE    decimal(10,2)                  null,
   NBR_CLIENTS          integer                        null,
   NBR_BAGAGES          integer                        null,
   constraint PK_RESERVATION primary key (ID_USER, ID_TARIFICATION, ID_VEHICULE)
);

/*==============================================================*/
/* Index : RESERVATION_PK                                       */
/*==============================================================*/
create unique index RESERVATION_PK on RESERVATION (
ID_USER ASC,
ID_TARIFICATION ASC,
ID_VEHICULE ASC
);

/*==============================================================*/
/* Index : RESERVATION_FK                                       */
/*==============================================================*/
create index RESERVATION_FK on RESERVATION (
ID_USER ASC
);

/*==============================================================*/
/* Index : RESERVATION2_FK                                      */
/*==============================================================*/
create index RESERVATION2_FK on RESERVATION (
ID_TARIFICATION ASC
);

/*==============================================================*/
/* Index : RESERVATION3_FK                                      */
/*==============================================================*/
create index RESERVATION3_FK on RESERVATION (
ID_VEHICULE ASC
);

/*==============================================================*/
/* Table : SUPPLEMENT                                           */
/*==============================================================*/
create table SUPPLEMENT 
(
   ID_SUPPLEMENT        integer                        not null,
   SUPPLEMENT_BAGAGE    smallint                       null,
   MAJORATION_NUIT      smallint                       null,
   MAJORATION_RETOUR_VIDE smallint                       null,
   MAJORATION_FERIE_OU_DIMANCHE smallint                       null,
   constraint PK_SUPPLEMENT primary key (ID_SUPPLEMENT)
);

/*==============================================================*/
/* Index : SUPPLEMENT_PK                                        */
/*==============================================================*/
create unique index SUPPLEMENT_PK on SUPPLEMENT (
ID_SUPPLEMENT ASC
);

/*==============================================================*/
/* Table : TARIFICATION                                         */
/*==============================================================*/
create table TARIFICATION 
(
   ID_TARIFICATION      integer                        not null,
   ID_TYPE_TARIFICATION integer                        not null,
   ID_SUPPLEMENT        integer                        not null,
   PRIX_DE_BASE         decimal(10,2)                  null,
   PRIX_PAR_KM          decimal(10,2)                  null,
   PRIX_PAR_H           decimal(10,2)                  null,
   constraint PK_TARIFICATION primary key (ID_TARIFICATION)
);

/*==============================================================*/
/* Index : TARIFICATION_PK                                      */
/*==============================================================*/
create unique index TARIFICATION_PK on TARIFICATION (
ID_TARIFICATION ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_2_FK                                     */
/*==============================================================*/
create index ASSOCIATION_2_FK on TARIFICATION (
ID_TYPE_TARIFICATION ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_11_FK                                    */
/*==============================================================*/
create index ASSOCIATION_11_FK on TARIFICATION (
ID_SUPPLEMENT ASC
);

/*==============================================================*/
/* Table : TYPE_TARIFICATION                                    */
/*==============================================================*/
create table TYPE_TARIFICATION 
(
   ID_TYPE_TARIFICATION integer                        not null,
   LIBELLE_TYPE_TARIFICATION varchar(255)                   null,
   constraint PK_TYPE_TARIFICATION primary key (ID_TYPE_TARIFICATION)
);

/*==============================================================*/
/* Index : TYPE_TARIFICATION_PK                                 */
/*==============================================================*/
create unique index TYPE_TARIFICATION_PK on TYPE_TARIFICATION (
ID_TYPE_TARIFICATION ASC
);

/*==============================================================*/
/* Table : TYPE_USER                                            */
/*==============================================================*/
create table TYPE_USER 
(
   ID_TYPE_USER         varchar(3)                     not null,
   LEBELLE_TYPE_USER    varchar(255)                   null,
   constraint PK_TYPE_USER primary key (ID_TYPE_USER)
);

/*==============================================================*/
/* Index : TYPE_USER_PK                                         */
/*==============================================================*/
create unique index TYPE_USER_PK on TYPE_USER (
ID_TYPE_USER ASC
);

/*==============================================================*/
/* Table : "USER"                                               */
/*==============================================================*/
create table `USER` 
(
   ID_USER              integer                        not null,
   ID_TYPE_USER         varchar(3)                     not null,
   NOM_USER             varchar(255)                   null,
   PRENOM_USER          varchar(255)                   null,
   EMAIL_USER           varchar(255)                   null,
   MOT_DE_PASSE_USER    varchar(255)                   null,
   TELEPHONE_USER       varchar(15)                    null,
   DATE_CREATION_USER   date                           null,
   constraint PK_USER primary key (ID_USER)
);

/*==============================================================*/
/* Index : USER_PK                                              */
/*==============================================================*/
create unique index USER_PK on `USER` (
ID_USER ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_1_FK                                     */
/*==============================================================*/
create index ASSOCIATION_1_FK on `USER` (
ID_TYPE_USER ASC
);

/*==============================================================*/
/* Table : VEHICULE                                             */
/*==============================================================*/
create table VEHICULE 
(
   ID_VEHICULE          integer                        not null,
   ID_CAPTEUR           integer                        not null,
   ID_EQUIPEMENT        integer                        not null,
   IMMATRICULATION      varchar(20)                    null,
   MODELE               varchar(255)                   null,
   MARQUE               varchar(255)                   null,
   CAPACITE             integer                        null,
   STATUS               varchar(50)                    null,
   constraint PK_VEHICULE primary key (ID_VEHICULE)
);

/*==============================================================*/
/* Index : VEHICULE_PK                                          */
/*==============================================================*/
create unique index VEHICULE_PK on VEHICULE (
ID_VEHICULE ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_3_FK                                     */
/*==============================================================*/
create index ASSOCIATION_3_FK on VEHICULE (
ID_EQUIPEMENT ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_4_FK                                     */
/*==============================================================*/
create index ASSOCIATION_4_FK on VEHICULE (
ID_CAPTEUR ASC
);

alter table RESERVATION
   add constraint FK_RESERVAT_RESERVATI_USER foreign key (ID_USER)
      references `USER` (ID_USER)
      on update restrict
      on delete restrict;

alter table RESERVATION
   add constraint FK_RESERVAT_RESERVATI_TARIFICA foreign key (ID_TARIFICATION)
      references TARIFICATION (ID_TARIFICATION)
      on update restrict
      on delete restrict;

alter table RESERVATION
   add constraint FK_RESERVAT_RESERVATI_VEHICULE foreign key (ID_VEHICULE)
      references VEHICULE (ID_VEHICULE)
      on update restrict
      on delete restrict;

alter table TARIFICATION
   add constraint FK_TARIFICA_ASSOCIATI_SUPPLEME foreign key (ID_SUPPLEMENT)
      references SUPPLEMENT (ID_SUPPLEMENT)
      on update restrict
      on delete restrict;

alter table TARIFICATION
   add constraint FK_TARIFICA_ASSOCIATI_TYPE_TAR foreign key (ID_TYPE_TARIFICATION)
      references TYPE_TARIFICATION (ID_TYPE_TARIFICATION)
      on update restrict
      on delete restrict;

alter table `USER`
   add constraint FK_USER_ASSOCIATI_TYPE_USE foreign key (ID_TYPE_USER)
      references TYPE_USER (ID_TYPE_USER)
      on update restrict
      on delete restrict;

alter table VEHICULE
   add constraint FK_VEHICULE_ASSOCIATI_EQUIPEME foreign key (ID_EQUIPEMENT)
      references EQUIPEMENT (ID_EQUIPEMENT)
      on update restrict
      on delete restrict;

alter table VEHICULE
   add constraint FK_VEHICULE_ASSOCIATI_CAPTEUR foreign key (ID_CAPTEUR)
      references CAPTEUR (ID_CAPTEUR)
      on update restrict
      on delete restrict;

