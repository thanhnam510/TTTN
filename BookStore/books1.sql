/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     6/30/2018 8:54:59 AM                         */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('CHI_TIET') and o.name = 'FK_CHI_TIET_CHI_TIET__SACH')
alter table CHI_TIET
   drop constraint FK_CHI_TIET_CHI_TIET__SACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SACH_TAC_GIA') and o.name = 'FK_SACH_TAC_SACH_TAC__SACH')
alter table SACH_TAC_GIA
   drop constraint FK_SACH_TAC_SACH_TAC__SACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SACH_TAC_GIA') and o.name = 'FK_SACH_TAC_SACH_TAC__TAC_GIA')
alter table SACH_TAC_GIA
   drop constraint FK_SACH_TAC_SACH_TAC__TAC_GIA
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SACH_THE_LOAI') and o.name = 'FK_SACH_THE_SACH_THE__THE_LOAI')
alter table SACH_THE_LOAI
   drop constraint FK_SACH_THE_SACH_THE__THE_LOAI
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SACH_THE_LOAI') and o.name = 'FK_SACH_THE_SACH_THE__SACH')
alter table SACH_THE_LOAI
   drop constraint FK_SACH_THE_SACH_THE__SACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TONG__ANH_GIA') and o.name = 'FK_TONG__AN_TONG__ANH_SACH')
alter table TONG__ANH_GIA
   drop constraint FK_TONG__AN_TONG__ANH_SACH
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('Y_KIEN') and o.name = 'FK_Y_KIEN__ANH_GIA_SACH')
alter table Y_KIEN
   drop constraint FK_Y_KIEN__ANH_GIA_SACH
go

if exists (select 1
            from  sysobjects
           where  id = object_id('CHI_TIET')
            and   type = 'U')
   drop table CHI_TIET
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SACH')
            and   type = 'U')
   drop table SACH
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SACH_TAC_GIA')
            and   name  = 'SACH_TAC_GIA2_FK'
            and   indid > 0
            and   indid < 255)
   drop index SACH_TAC_GIA.SACH_TAC_GIA2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SACH_TAC_GIA')
            and   name  = 'SACH_TAC_GIA_FK'
            and   indid > 0
            and   indid < 255)
   drop index SACH_TAC_GIA.SACH_TAC_GIA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SACH_TAC_GIA')
            and   type = 'U')
   drop table SACH_TAC_GIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SACH_THE_LOAI')
            and   name  = 'SACH_THE_LOAI2_FK'
            and   indid > 0
            and   indid < 255)
   drop index SACH_THE_LOAI.SACH_THE_LOAI2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SACH_THE_LOAI')
            and   name  = 'SACH_THE_LOAI_FK'
            and   indid > 0
            and   indid < 255)
   drop index SACH_THE_LOAI.SACH_THE_LOAI_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SACH_THE_LOAI')
            and   type = 'U')
   drop table SACH_THE_LOAI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TAC_GIA')
            and   type = 'U')
   drop table TAC_GIA
go

if exists (select 1
            from  sysobjects
           where  id = object_id('THE_LOAI')
            and   type = 'U')
   drop table THE_LOAI
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TONG__ANH_GIA')
            and   type = 'U')
   drop table TONG__ANH_GIA
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Y_KIEN')
            and   name  = '_ANH_GIA_FK'
            and   indid > 0
            and   indid < 255)
   drop index Y_KIEN._ANH_GIA_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Y_KIEN')
            and   type = 'U')
   drop table Y_KIEN
go

/*==============================================================*/
/* Table: CHI_TIET                                              */
/*==============================================================*/
create table CHI_TIET (
   MA_SACH              char(10)             not null,
   NOI_DUNG             text                 not null,
   GIA                  int                  not null,
   ANH                  varchar(256)         null,
   NGAY_BAN             datetime             not null,
   constraint PK_CHI_TIET primary key (MA_SACH)
)
go

/*==============================================================*/
/* Table: SACH                                                  */
/*==============================================================*/
create table SACH (
   MA_SACH              char(10)             not null,
   TEN_SACH             varchar(50)          not null,
   constraint PK_SACH primary key (MA_SACH)
)
go

/*==============================================================*/
/* Table: SACH_TAC_GIA                                          */
/*==============================================================*/
create table SACH_TAC_GIA (
   MA_SACH              char(10)             not null,
   MA_TAC_GIA           char(10)             not null,
   constraint PK_SACH_TAC_GIA primary key (MA_SACH, MA_TAC_GIA)
)
go

/*==============================================================*/
/* Index: SACH_TAC_GIA_FK                                       */
/*==============================================================*/




create nonclustered index SACH_TAC_GIA_FK on SACH_TAC_GIA (MA_SACH ASC)
go

/*==============================================================*/
/* Index: SACH_TAC_GIA2_FK                                      */
/*==============================================================*/




create nonclustered index SACH_TAC_GIA2_FK on SACH_TAC_GIA (MA_TAC_GIA ASC)
go

/*==============================================================*/
/* Table: SACH_THE_LOAI                                         */
/*==============================================================*/
create table SACH_THE_LOAI (
   MA_THE_LOAI          char(10)             not null,
   MA_SACH              char(10)             not null,
   constraint PK_SACH_THE_LOAI primary key (MA_THE_LOAI, MA_SACH)
)
go

/*==============================================================*/
/* Index: SACH_THE_LOAI_FK                                      */
/*==============================================================*/




create nonclustered index SACH_THE_LOAI_FK on SACH_THE_LOAI (MA_THE_LOAI ASC)
go

/*==============================================================*/
/* Index: SACH_THE_LOAI2_FK                                     */
/*==============================================================*/




create nonclustered index SACH_THE_LOAI2_FK on SACH_THE_LOAI (MA_SACH ASC)
go

/*==============================================================*/
/* Table: TAC_GIA                                               */
/*==============================================================*/
create table TAC_GIA (
   MA_TAC_GIA           char(10)             not null,
   TEN_TAC_GIA          varchar(30)          not null,
   constraint PK_TAC_GIA primary key (MA_TAC_GIA)
)
go

/*==============================================================*/
/* Table: THE_LOAI                                              */
/*==============================================================*/
create table THE_LOAI (
   MA_THE_LOAI          char(10)             not null,
   TEN_THE_LOAI         varchar(20)          not null,
   constraint PK_THE_LOAI primary key (MA_THE_LOAI)
)
go

/*==============================================================*/
/* Table: TONG__ANH_GIA                                         */
/*==============================================================*/
create table TONG__ANH_GIA (
   MA_SACH              char(10)             not null,
   TONG_Y_KIEN_TICH_CUC int                  not null,
   TONG_Y_KIEN_TIEU_CUC int                  not null,
   constraint PK_TONG__ANH_GIA primary key (MA_SACH)
)
go

/*==============================================================*/
/* Table: Y_KIEN                                                */
/*==============================================================*/
create table Y_KIEN (
   MA_SACH              char(10)             not null,
   MA_Y_KIEN            char(100)            not null,
   NOI_DUNG             text                 not null,
   _ANH_GIA             varchar(10)          null,
   constraint PK_Y_KIEN primary key (MA_SACH, MA_Y_KIEN)
)
go

/*==============================================================*/
/* Index: _ANH_GIA_FK                                           */
/*==============================================================*/




create nonclustered index _ANH_GIA_FK on Y_KIEN (MA_SACH ASC)
go

alter table CHI_TIET
   add constraint FK_CHI_TIET_CHI_TIET__SACH foreign key (MA_SACH)
      references SACH (MA_SACH)
go

alter table SACH_TAC_GIA
   add constraint FK_SACH_TAC_SACH_TAC__SACH foreign key (MA_SACH)
      references SACH (MA_SACH)
go

alter table SACH_TAC_GIA
   add constraint FK_SACH_TAC_SACH_TAC__TAC_GIA foreign key (MA_TAC_GIA)
      references TAC_GIA (MA_TAC_GIA)
go

alter table SACH_THE_LOAI
   add constraint FK_SACH_THE_SACH_THE__THE_LOAI foreign key (MA_THE_LOAI)
      references THE_LOAI (MA_THE_LOAI)
go

alter table SACH_THE_LOAI
   add constraint FK_SACH_THE_SACH_THE__SACH foreign key (MA_SACH)
      references SACH (MA_SACH)
go

alter table TONG__ANH_GIA
   add constraint FK_TONG__AN_TONG__ANH_SACH foreign key (MA_SACH)
      references SACH (MA_SACH)
go

alter table Y_KIEN
   add constraint FK_Y_KIEN__ANH_GIA_SACH foreign key (MA_SACH)
      references SACH (MA_SACH)
go

