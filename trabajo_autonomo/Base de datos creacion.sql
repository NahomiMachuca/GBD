/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     18/11/2021 22:33:13                          */
/*==============================================================*/


drop index MANIFIESTA_FK;

drop index ACCIDENTE_LABORAL_PK;

drop table ACCIDENTE_LABORAL;

drop index DIRIGE_FK;

drop index AREA_DEPARTAMENTO_PK;

drop table AREA_DEPARTAMENTO;

drop index POSEE_FK;

drop index CALAMIDAD__DOMESTICA_PK;

drop table CALAMIDAD__DOMESTICA;

drop index CONTRATO_PK;

drop table CONTRATO;

drop index FIRMA_FK;

drop index TRABAJA_FK;

drop index EMPLEADO_PK;

drop table EMPLEADO;

drop index TIENE_FK;

drop index HORARIO_PK;

drop table HORARIO;

drop index HAY_FK;

drop index HORA_EXTRA_PK;

drop table HORA_EXTRA;

drop index JEFE_PK;

drop table JEFE;

drop index SOLICITA_FK;

drop index PERMISO_PK;

drop table PERMISO;

drop index PRESENTA_FK;

drop index RETRASO_PK;

drop table RETRASO;

drop index ESTABLECE_FK;

drop index VACACION_PK;

drop table VACACION;

/*==============================================================*/
/* Table: ACCIDENTE_LABORAL                                     */
/*==============================================================*/
create table ACCIDENTE_LABORAL (
   ID_ACCIDENTE         INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   DESCRIPCION_ACCIDENTE VARCHAR(100)         not null,
   FECHA_ACCIDENTE      DATE                 not null,
   CANT_ACCIDENTE       VARCHAR(10)          not null,
   constraint PK_ACCIDENTE_LABORAL primary key (ID_ACCIDENTE)
);

/*==============================================================*/
/* Index: ACCIDENTE_LABORAL_PK                                  */
/*==============================================================*/
create unique index ACCIDENTE_LABORAL_PK on ACCIDENTE_LABORAL (
ID_ACCIDENTE
);

/*==============================================================*/
/* Index: MANIFIESTA_FK                                         */
/*==============================================================*/
create  index MANIFIESTA_FK on ACCIDENTE_LABORAL (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: AREA_DEPARTAMENTO                                     */
/*==============================================================*/
create table AREA_DEPARTAMENTO (
   ID_AREA              INT4                 not null,
   ID_JEFE              INT4                 not null,
   AREA                 VARCHAR(50)          not null,
   FECHA_INICIO         DATE                 not null,
   TOTAL_EMPLEADO       INT4                 not null,
   TOTAL_JEFE           INT4                 not null,
   constraint PK_AREA_DEPARTAMENTO primary key (ID_AREA)
);

/*==============================================================*/
/* Index: AREA_DEPARTAMENTO_PK                                  */
/*==============================================================*/
create unique index AREA_DEPARTAMENTO_PK on AREA_DEPARTAMENTO (
ID_AREA
);

/*==============================================================*/
/* Index: DIRIGE_FK                                             */
/*==============================================================*/
create  index DIRIGE_FK on AREA_DEPARTAMENTO (
ID_JEFE
);

/*==============================================================*/
/* Table: CALAMIDAD__DOMESTICA                                  */
/*==============================================================*/
create table CALAMIDAD__DOMESTICA (
   ID_CALAMIDAD         INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   FECHA_CALAMIDAD      DATE                 not null,
   DESCRIPCION_CALAMIDAD VARCHAR(100)         not null,
   CANT_CALAMIDAD        VARCHAR(10)          not null,
   constraint PK_CALAMIDAD__DOMESTICA primary key (ID_CALAMIDAD)
);

/*==============================================================*/
/* Index: CALAMIDAD__DOMESTICA_PK                               */
/*==============================================================*/
create unique index CALAMIDAD__DOMESTICA_PK on CALAMIDAD__DOMESTICA (
ID_CALAMIDAD
);

/*==============================================================*/
/* Index: POSEE_FK                                              */
/*==============================================================*/
create  index POSEE_FK on CALAMIDAD__DOMESTICA (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: CONTRATO                                              */
/*==============================================================*/
create table CONTRATO (
   ID_CONTRATO          INT4                 not null,
   FECHA_CONTRATO       DATE                 not null,
   DURACION_CONTRATO    DATE                 not null,
   SEGURO               VARCHAR(100)         not null,
   SUELDO               MONEY                not null,
   constraint PK_CONTRATO primary key (ID_CONTRATO)
);

/*==============================================================*/
/* Index: CONTRATO_PK                                           */
/*==============================================================*/
create unique index CONTRATO_PK on CONTRATO (
ID_CONTRATO
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   ID_EMPLEADO          INT4                 not null,
   ID_AREA              INT4                 not null,
   ID_CONTRATO          INT4                 not null,
   NOMBRE_EMPLEADO      VARCHAR(50)          not null,
   APELLIDO_EMPLEADO   VARCHAR(50)          not null,
   TELEFONO_EMPLEADO    VARCHAR(10)          not null,
   PROVINCIA_EMPLEADO   VARCHAR(50)          not null,
   DIRECCION_EMPLEADO   CHAR(50)             not null,
   EMAIL_EMPLEADO       CHAR(50)             not null,
   CEDULA_EMPLEADO      CHAR(10)             not null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
ID_EMPLEADO
);

/*==============================================================*/
/* Index: TRABAJA_FK                                            */
/*==============================================================*/
create  index TRABAJA_FK on EMPLEADO (
ID_AREA
);

/*==============================================================*/
/* Index: FIRMA_FK                                              */
/*==============================================================*/
create  index FIRMA_FK on EMPLEADO (
ID_CONTRATO
);

/*==============================================================*/
/* Table: HORARIO                                               */
/*==============================================================*/
create table HORARIO (
   ID_HORARIO           INT4                 not null,
   ID_AREA              INT4                 not null,
   HORA_ENTRADA         TIME                 not null,
   HORA_SALIDA          TIME                 not null,
   constraint PK_HORARIO primary key (ID_HORARIO)
);

/*==============================================================*/
/* Index: HORARIO_PK                                            */
/*==============================================================*/
create unique index HORARIO_PK on HORARIO (
ID_HORARIO
);

/*==============================================================*/
/* Index: TIENE_FK                                              */
/*==============================================================*/
create  index TIENE_FK on HORARIO (
ID_AREA
);

/*==============================================================*/
/* Table: HORA_EXTRA                                            */
/*==============================================================*/
create table HORA_EXTRA (
   ID_HORAE             INT4                 not null,
   ID_HORARIO           INT4                 not null,
   TIEMPO_HORAE         TIME                 not null,
   CANT_HORAE           INT4                 not null,
   constraint PK_HORA_EXTRA primary key (ID_HORAE)
);

/*==============================================================*/
/* Index: HORA_EXTRA_PK                                         */
/*==============================================================*/
create unique index HORA_EXTRA_PK on HORA_EXTRA (
ID_HORAE
);

/*==============================================================*/
/* Index: HAY_FK                                                */
/*==============================================================*/
create  index HAY_FK on HORA_EXTRA (
ID_HORARIO
);

/*==============================================================*/
/* Table: JEFE                                                  */
/*==============================================================*/
create table JEFE (
   ID_JEFE              INT4                 not null,
   NOMBRE_JEFE          VARCHAR(50)          not null,
   APELLIDO_JEFE        VARCHAR(50)          not null,
   CEDULA_JEFE          VARCHAR(10)          not null,
   CELULAR_JEFE         VARCHAR(10)          not null,
   CORREO_JEFE          VARCHAR(50)          not null,
   constraint PK_JEFE primary key (ID_JEFE)
);

/*==============================================================*/
/* Index: JEFE_PK                                               */
/*==============================================================*/
create unique index JEFE_PK on JEFE (
ID_JEFE
);

/*==============================================================*/
/* Table: PERMISO                                               */
/*==============================================================*/
create table PERMISO (
   ID_PERMISO           INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   TIPO_PERMISO         VARCHAR(50)          not null,
   FECHA_PERMISO        DATE                 not null,
   DURACION_PERMISO     INT4                 null,
   constraint PK_PERMISO primary key (ID_PERMISO)
);

/*==============================================================*/
/* Index: PERMISO_PK                                            */
/*==============================================================*/
create unique index PERMISO_PK on PERMISO (
ID_PERMISO
);

/*==============================================================*/
/* Index: SOLICITA_FK                                           */
/*==============================================================*/
create  index SOLICITA_FK on PERMISO (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: RETRASO                                               */
/*==============================================================*/
create table RETRASO (
   ID_RETRASO           INT4                 not null,
   ID_EMPLEADO          INT4                 not null,
   TIPO_RETRASO         TEXT                 not null,
   FECHA_RETRASO        DATE                 not null,
   OBSERVACION_         VARCHAR(100)         not null,
   CANT_RETRASO         INT4                 not null,
   constraint PK_RETRASO primary key (ID_RETRASO)
);

/*==============================================================*/
/* Index: RETRASO_PK                                            */
/*==============================================================*/
create unique index RETRASO_PK on RETRASO (
ID_RETRASO
);

/*==============================================================*/
/* Index: PRESENTA_FK                                           */
/*==============================================================*/
create  index PRESENTA_FK on RETRASO (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: VACACION                                              */
/*==============================================================*/
create table VACACION (
   ID_VACACION          INT4                 not null,
   ID_CONTRATO          INT4                 not null,
   FECHA_INICIO         DATE                 not null,
   FECHA_FIN            DATE                 not null,
   DURACION             VARCHAR(10)          not null,
   constraint PK_VACACION primary key (ID_VACACION)
);

/*==============================================================*/
/* Index: VACACION_PK                                           */
/*==============================================================*/
create unique index VACACION_PK on VACACION (
ID_VACACION
);

/*==============================================================*/
/* Index: ESTABLECE_FK                                          */
/*==============================================================*/
create  index ESTABLECE_FK on VACACION (
ID_CONTRATO
);

alter table ACCIDENTE_LABORAL
   add constraint FK_ACCIDENT_MANIFIEST_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table AREA_DEPARTAMENTO
   add constraint FK_AREA_DEP_DIRIGE_JEFE foreign key (ID_JEFE)
      references JEFE (ID_JEFE)
      on delete restrict on update restrict;

alter table CALAMIDAD__DOMESTICA
   add constraint FK_CALAMIDA_POSEE_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_FIRMA_CONTRATO foreign key (ID_CONTRATO)
      references CONTRATO (ID_CONTRATO)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_TRABAJA_AREA_DEP foreign key (ID_AREA)
      references AREA_DEPARTAMENTO (ID_AREA)
      on delete restrict on update restrict;

alter table HORARIO
   add constraint FK_HORARIO_TIENE_AREA_DEP foreign key (ID_AREA)
      references AREA_DEPARTAMENTO (ID_AREA)
      on delete restrict on update restrict;

alter table HORA_EXTRA
   add constraint FK_HORA_EXT_HAY_HORARIO foreign key (ID_HORARIO)
      references HORARIO (ID_HORARIO)
      on delete restrict on update restrict;

alter table PERMISO
   add constraint FK_PERMISO_SOLICITA_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table RETRASO
   add constraint FK_RETRASO_PRESENTA_EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table VACACION
   add constraint FK_VACACION_ESTABLECE_CONTRATO foreign key (ID_CONTRATO)
      references CONTRATO (ID_CONTRATO)
      on delete restrict on update restrict;
	  
