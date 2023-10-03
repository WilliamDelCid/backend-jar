/*
 Navicat Premium Data Transfer

 Source Server         : PostgreSQL
 Source Server Type    : PostgreSQL
 Source Server Version : 140008 (140008)
 Source Host           : localhost:5432
 Source Catalog        : HorariosDB
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140008 (140008)
 File Encoding         : 65001

 Date: 02/10/2023 21:27:21
*/


-- ----------------------------
-- Sequence structure for bitacora_id_bitacora_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bitacora_id_bitacora_seq";
CREATE SEQUENCE "public"."bitacora_id_bitacora_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permisos_id_permiso_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."permisos_id_permiso_seq";
CREATE SEQUENCE "public"."permisos_id_permiso_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for permisos_rol_id_permisos_rol_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."permisos_rol_id_permisos_rol_seq";
CREATE SEQUENCE "public"."permisos_rol_id_permisos_rol_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for rol_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rol_id_seq";
CREATE SEQUENCE "public"."rol_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for usuario_id_usuario_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."usuario_id_usuario_seq";
CREATE SEQUENCE "public"."usuario_id_usuario_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for asignatura
-- ----------------------------
DROP TABLE IF EXISTS "public"."asignatura";
CREATE TABLE "public"."asignatura" (
  "id_asignatura" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "codigo" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "estado" bool,
  "nombre" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "uv" int4 NOT NULL
)
;

-- ----------------------------
-- Records of asignatura
-- ----------------------------
INSERT INTO "public"."asignatura" VALUES ('202310022118171291-1', 'mat-173', 't', 'matematica i', 4);
INSERT INTO "public"."asignatura" VALUES ('202310022119337862-1', 'smt-173', 't', 'sistema de medicion de tierras', 4);

-- ----------------------------
-- Table structure for asignaturadocente
-- ----------------------------
DROP TABLE IF EXISTS "public"."asignaturadocente";
CREATE TABLE "public"."asignaturadocente" (
  "id_asignaturadocente" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "estado" bool,
  "idasignatura" varchar(50) COLLATE "pg_catalog"."default",
  "iddocente" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of asignaturadocente
-- ----------------------------
INSERT INTO "public"."asignaturadocente" VALUES ('202310022119430870-1', 't', '202310022118171291-1', '202310022116552423-1');
INSERT INTO "public"."asignaturadocente" VALUES ('202310022120049291-1', 't', '202310022119337862-1', '1');

-- ----------------------------
-- Table structure for aula
-- ----------------------------
DROP TABLE IF EXISTS "public"."aula";
CREATE TABLE "public"."aula" (
  "id_aula" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "capacidad" int4 NOT NULL,
  "codigo" varchar(20) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of aula
-- ----------------------------
INSERT INTO "public"."aula" VALUES ('202310022118323701-1', 100, 'D-5');
INSERT INTO "public"."aula" VALUES ('202310022118395302-1', 100, 'A1-1');

-- ----------------------------
-- Table structure for bitacora
-- ----------------------------
DROP TABLE IF EXISTS "public"."bitacora";
CREATE TABLE "public"."bitacora" (
  "id_bitacora" int8 NOT NULL DEFAULT nextval('bitacora_id_bitacora_seq'::regclass),
  "accion" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "fecha" timestamp(6) NOT NULL,
  "hora" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "ip" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "ruta" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id_usuario" int8
)
;

-- ----------------------------
-- Records of bitacora
-- ----------------------------
INSERT INTO "public"."bitacora" VALUES (1, 'Agregar', '2023-10-02 21:09:09.942', 'hora', '192.168.1.30', 'a', 1);
INSERT INTO "public"."bitacora" VALUES (2, 'Agregar', '2023-10-02 21:21:35.422', 'hora', '192.168.1.30', 'a', 1);

-- ----------------------------
-- Table structure for bloque
-- ----------------------------
DROP TABLE IF EXISTS "public"."bloque";
CREATE TABLE "public"."bloque" (
  "id_bloque" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "idasignaturadocente" varchar(255) COLLATE "pg_catalog"."default",
  "idgrupo" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of bloque
-- ----------------------------
INSERT INTO "public"."bloque" VALUES ('202310022122128231', '202310022119430870-1', '202310022122036091');

-- ----------------------------
-- Table structure for bloquedetalle
-- ----------------------------
DROP TABLE IF EXISTS "public"."bloquedetalle";
CREATE TABLE "public"."bloquedetalle" (
  "id_bloquedetalle" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "dia" varchar(15) COLLATE "pg_catalog"."default",
  "horafin" time(6),
  "horainicio" time(6),
  "idaula" varchar(255) COLLATE "pg_catalog"."default",
  "idbloque" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of bloquedetalle
-- ----------------------------
INSERT INTO "public"."bloquedetalle" VALUES ('202310022122303722', 'MARTES', '12:00:00', '09:00:00', '202310022118323701-1', '202310022122128231');
INSERT INTO "public"."bloquedetalle" VALUES ('202310022122397212', 'LUNES', '15:00:00', '13:00:00', '202310022118395302-1', '202310022122128231');

-- ----------------------------
-- Table structure for carrera
-- ----------------------------
DROP TABLE IF EXISTS "public"."carrera";
CREATE TABLE "public"."carrera" (
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "codigo" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "nombre" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of carrera
-- ----------------------------
INSERT INTO "public"."carrera" VALUES ('202310022114156471-1', 'I70304', 'Agronómia');
INSERT INTO "public"."carrera" VALUES ('202310022114299172-1', 'I70305', 'Agroindustrial');

-- ----------------------------
-- Table structure for departamento
-- ----------------------------
DROP TABLE IF EXISTS "public"."departamento";
CREATE TABLE "public"."departamento" (
  "id_departamento" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "codigo" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "nombre_departamento" varchar(50) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of departamento
-- ----------------------------
INSERT INTO "public"."departamento" VALUES ('2', '002', 'Sistemas Informaticos');
INSERT INTO "public"."departamento" VALUES ('1', '001', 'Ciencias Agronomicas');

-- ----------------------------
-- Table structure for docente
-- ----------------------------
DROP TABLE IF EXISTS "public"."docente";
CREATE TABLE "public"."docente" (
  "id_docente" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "correo" varchar(50) COLLATE "pg_catalog"."default",
  "especialidad" varchar(50) COLLATE "pg_catalog"."default",
  "institucion" varchar(50) COLLATE "pg_catalog"."default",
  "nombre" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "numero_unico" varchar(255) COLLATE "pg_catalog"."default",
  "telefono" varchar(20) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of docente
-- ----------------------------
INSERT INTO "public"."docente" VALUES ('2', 'virna.urquilla@ues.edu.sv', 'programacion', 'universidad de el salvador', 'Virna Urquilla', '00001', '76078854');
INSERT INTO "public"."docente" VALUES ('202310022116552423-1', 'lourdesmaria@ues.edu.sv', 'matematica i', 'universidad de el salvador', 'lourdes maria hernandez', '00001', '78876743');
INSERT INTO "public"."docente" VALUES ('1', 'jose.cruz6@ues.edu.sv', 'medicion de terrenos', 'universidad de el salvador', 'josé fredy cruz', '00001', '79503320');

-- ----------------------------
-- Table structure for grupo
-- ----------------------------
DROP TABLE IF EXISTS "public"."grupo";
CREATE TABLE "public"."grupo" (
  "id_grupo" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "capacidad" int4,
  "nombre" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "idhorario" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of grupo
-- ----------------------------
INSERT INTO "public"."grupo" VALUES ('202310022122036091', 100, 'Teorico 1', '202310022121354151-1');

-- ----------------------------
-- Table structure for horario
-- ----------------------------
DROP TABLE IF EXISTS "public"."horario";
CREATE TABLE "public"."horario" (
  "id_horario" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "ciclo" int4,
  "ciclo_anio" int4,
  "nivel" varchar(20) COLLATE "pg_catalog"."default",
  "titulo" varchar(50) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of horario
-- ----------------------------
INSERT INTO "public"."horario" VALUES ('202310022121354151-1', 1, 2023, 'Primer Nivel', 'AGRONO2008-AGROINDUSTRIA');

-- ----------------------------
-- Table structure for horariocarrera
-- ----------------------------
DROP TABLE IF EXISTS "public"."horariocarrera";
CREATE TABLE "public"."horariocarrera" (
  "horario_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "carrera_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of horariocarrera
-- ----------------------------
INSERT INTO "public"."horariocarrera" VALUES ('202310022121354151-1', '202310022114156471-1');
INSERT INTO "public"."horariocarrera" VALUES ('202310022121354151-1', '202310022114299172-1');

-- ----------------------------
-- Table structure for permisos
-- ----------------------------
DROP TABLE IF EXISTS "public"."permisos";
CREATE TABLE "public"."permisos" (
  "id_permiso" int8 NOT NULL DEFAULT nextval('permisos_id_permiso_seq'::regclass),
  "nombre" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of permisos
-- ----------------------------
INSERT INTO "public"."permisos" VALUES (1, 'ASIGNATURA');
INSERT INTO "public"."permisos" VALUES (2, 'DOCENTE');
INSERT INTO "public"."permisos" VALUES (3, 'AULA');
INSERT INTO "public"."permisos" VALUES (4, 'CARRERA');
INSERT INTO "public"."permisos" VALUES (6, 'HORARIO');

-- ----------------------------
-- Table structure for permisos_rol
-- ----------------------------
DROP TABLE IF EXISTS "public"."permisos_rol";
CREATE TABLE "public"."permisos_rol" (
  "id_permisos_rol" int8 NOT NULL DEFAULT nextval('permisos_rol_id_permisos_rol_seq'::regclass),
  "crear" bool NOT NULL,
  "editar" bool NOT NULL,
  "eliminar" bool NOT NULL,
  "id_permiso" int8 NOT NULL,
  "id_rol" int8 NOT NULL
)
;

-- ----------------------------
-- Records of permisos_rol
-- ----------------------------
INSERT INTO "public"."permisos_rol" VALUES (1, 't', 't', 't', 4, 2);
INSERT INTO "public"."permisos_rol" VALUES (2, 't', 't', 't', 2, 2);
INSERT INTO "public"."permisos_rol" VALUES (3, 't', 't', 't', 3, 2);
INSERT INTO "public"."permisos_rol" VALUES (4, 't', 't', 't', 1, 2);
INSERT INTO "public"."permisos_rol" VALUES (5, 't', 't', 't', 6, 2);

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS "public"."rol";
CREATE TABLE "public"."rol" (
  "id" int8 NOT NULL DEFAULT nextval('rol_id_seq'::regclass),
  "rol_nombre" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of rol
-- ----------------------------
INSERT INTO "public"."rol" VALUES (1, 'ADMINISTRADOR');
INSERT INTO "public"."rol" VALUES (2, 'JEFEDEDEPARTAMENTO');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS "public"."usuario";
CREATE TABLE "public"."usuario" (
  "id_usuario" int8 NOT NULL DEFAULT nextval('usuario_id_usuario_seq'::regclass),
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "nombre" varchar(255) COLLATE "pg_catalog"."default",
  "nombre_usuario" varchar(255) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "token_password" varchar(255) COLLATE "pg_catalog"."default",
  "iddepartamento" varchar(255) COLLATE "pg_catalog"."default",
  "docente" varchar(255) COLLATE "pg_catalog"."default",
  "rol_id" int8
)
;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO "public"."usuario" VALUES (1, 'jose.cruz@gmail.com', 'José Fredy Cruz', 'JoseCruz', '$2a$10$Gax6ykKnxtXSswpVsZYdm.0PWywnIpFVW5CY7yp.R47U9L2jnPIxu', NULL, '1', '1', 2);
INSERT INTO "public"."usuario" VALUES (2, 'virna.urquilla@ues.edu.sv', 'Virna Urquilla', 'VirnaUrquilla', '$2a$10$GV1Qc0sbInOVL0CG298Is.6OY2sCGEiSZsewDT4GkW7jqxgjVHJM.', NULL, '2', '2', 2);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."bitacora_id_bitacora_seq"
OWNED BY "public"."bitacora"."id_bitacora";
SELECT setval('"public"."bitacora_id_bitacora_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."permisos_id_permiso_seq"
OWNED BY "public"."permisos"."id_permiso";
SELECT setval('"public"."permisos_id_permiso_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."permisos_rol_id_permisos_rol_seq"
OWNED BY "public"."permisos_rol"."id_permisos_rol";
SELECT setval('"public"."permisos_rol_id_permisos_rol_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rol_id_seq"
OWNED BY "public"."rol"."id";
SELECT setval('"public"."rol_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."usuario_id_usuario_seq"
OWNED BY "public"."usuario"."id_usuario";
SELECT setval('"public"."usuario_id_usuario_seq"', 2, true);

-- ----------------------------
-- Primary Key structure for table asignatura
-- ----------------------------
ALTER TABLE "public"."asignatura" ADD CONSTRAINT "asignatura_pkey" PRIMARY KEY ("id_asignatura");

-- ----------------------------
-- Primary Key structure for table asignaturadocente
-- ----------------------------
ALTER TABLE "public"."asignaturadocente" ADD CONSTRAINT "asignaturadocente_pkey" PRIMARY KEY ("id_asignaturadocente");

-- ----------------------------
-- Primary Key structure for table aula
-- ----------------------------
ALTER TABLE "public"."aula" ADD CONSTRAINT "aula_pkey" PRIMARY KEY ("id_aula");

-- ----------------------------
-- Primary Key structure for table bitacora
-- ----------------------------
ALTER TABLE "public"."bitacora" ADD CONSTRAINT "bitacora_pkey" PRIMARY KEY ("id_bitacora");

-- ----------------------------
-- Primary Key structure for table bloque
-- ----------------------------
ALTER TABLE "public"."bloque" ADD CONSTRAINT "bloque_pkey" PRIMARY KEY ("id_bloque");

-- ----------------------------
-- Primary Key structure for table bloquedetalle
-- ----------------------------
ALTER TABLE "public"."bloquedetalle" ADD CONSTRAINT "bloquedetalle_pkey" PRIMARY KEY ("id_bloquedetalle");

-- ----------------------------
-- Primary Key structure for table carrera
-- ----------------------------
ALTER TABLE "public"."carrera" ADD CONSTRAINT "carrera_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table departamento
-- ----------------------------
ALTER TABLE "public"."departamento" ADD CONSTRAINT "departamento_pkey" PRIMARY KEY ("id_departamento");

-- ----------------------------
-- Primary Key structure for table docente
-- ----------------------------
ALTER TABLE "public"."docente" ADD CONSTRAINT "docente_pkey" PRIMARY KEY ("id_docente");

-- ----------------------------
-- Primary Key structure for table grupo
-- ----------------------------
ALTER TABLE "public"."grupo" ADD CONSTRAINT "grupo_pkey" PRIMARY KEY ("id_grupo");

-- ----------------------------
-- Primary Key structure for table horario
-- ----------------------------
ALTER TABLE "public"."horario" ADD CONSTRAINT "horario_pkey" PRIMARY KEY ("id_horario");

-- ----------------------------
-- Primary Key structure for table permisos
-- ----------------------------
ALTER TABLE "public"."permisos" ADD CONSTRAINT "permisos_pkey" PRIMARY KEY ("id_permiso");

-- ----------------------------
-- Primary Key structure for table permisos_rol
-- ----------------------------
ALTER TABLE "public"."permisos_rol" ADD CONSTRAINT "permisos_rol_pkey" PRIMARY KEY ("id_permisos_rol");

-- ----------------------------
-- Primary Key structure for table rol
-- ----------------------------
ALTER TABLE "public"."rol" ADD CONSTRAINT "rol_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table usuario
-- ----------------------------
ALTER TABLE "public"."usuario" ADD CONSTRAINT "uk_puhr3k3l7bj71hb7hk7ktpxn0" UNIQUE ("nombre_usuario");
ALTER TABLE "public"."usuario" ADD CONSTRAINT "uk_hoxoe2ecql8t55nyxyxv2nkem" UNIQUE ("docente");

-- ----------------------------
-- Primary Key structure for table usuario
-- ----------------------------
ALTER TABLE "public"."usuario" ADD CONSTRAINT "usuario_pkey" PRIMARY KEY ("id_usuario");

-- ----------------------------
-- Foreign Keys structure for table asignaturadocente
-- ----------------------------
ALTER TABLE "public"."asignaturadocente" ADD CONSTRAINT "fk6juv4ui2jqkmom6c5ag3px5mm" FOREIGN KEY ("iddocente") REFERENCES "public"."docente" ("id_docente") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."asignaturadocente" ADD CONSTRAINT "fkkekgmcnk44s6ajco60rbh37la" FOREIGN KEY ("idasignatura") REFERENCES "public"."asignatura" ("id_asignatura") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table bitacora
-- ----------------------------
ALTER TABLE "public"."bitacora" ADD CONSTRAINT "fk8f6lcny5g2e6tknq7dhtx2wsq" FOREIGN KEY ("id_usuario") REFERENCES "public"."usuario" ("id_usuario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table bloque
-- ----------------------------
ALTER TABLE "public"."bloque" ADD CONSTRAINT "fkixv47tltyot1e88ju7onyd75r" FOREIGN KEY ("idasignaturadocente") REFERENCES "public"."asignaturadocente" ("id_asignaturadocente") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."bloque" ADD CONSTRAINT "fkoyxqyfcnpdyuj2sp24oevndn8" FOREIGN KEY ("idgrupo") REFERENCES "public"."grupo" ("id_grupo") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table bloquedetalle
-- ----------------------------
ALTER TABLE "public"."bloquedetalle" ADD CONSTRAINT "fk155l3mydd3tty5fuk6j4d5orc" FOREIGN KEY ("idaula") REFERENCES "public"."aula" ("id_aula") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."bloquedetalle" ADD CONSTRAINT "fkif95sr2p9op55vb77i9swpkd3" FOREIGN KEY ("idbloque") REFERENCES "public"."bloque" ("id_bloque") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table grupo
-- ----------------------------
ALTER TABLE "public"."grupo" ADD CONSTRAINT "fknafjl5bg2nxypay6u4kuqt1ts" FOREIGN KEY ("idhorario") REFERENCES "public"."horario" ("id_horario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table horariocarrera
-- ----------------------------
ALTER TABLE "public"."horariocarrera" ADD CONSTRAINT "fk5bbehilwd7l7ee7egv5rfvf0f" FOREIGN KEY ("carrera_id") REFERENCES "public"."carrera" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."horariocarrera" ADD CONSTRAINT "fkmuf2ybbahe0n5148qdhs9p0im" FOREIGN KEY ("horario_id") REFERENCES "public"."horario" ("id_horario") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table permisos_rol
-- ----------------------------
ALTER TABLE "public"."permisos_rol" ADD CONSTRAINT "fk1al377i445pljlq2x1o1svliy" FOREIGN KEY ("id_permiso") REFERENCES "public"."permisos" ("id_permiso") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."permisos_rol" ADD CONSTRAINT "fkjto2gjgqpd4h7uihfph30kwm9" FOREIGN KEY ("id_rol") REFERENCES "public"."rol" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table usuario
-- ----------------------------
ALTER TABLE "public"."usuario" ADD CONSTRAINT "fk53jec78sapyk4pqs0p5ii87mb" FOREIGN KEY ("iddepartamento") REFERENCES "public"."departamento" ("id_departamento") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."usuario" ADD CONSTRAINT "fkcqi5bfo3sk1ngrtqpf2wre2f1" FOREIGN KEY ("docente") REFERENCES "public"."docente" ("id_docente") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."usuario" ADD CONSTRAINT "fkshkwj12wg6vkm6iuwhvcfpct8" FOREIGN KEY ("rol_id") REFERENCES "public"."rol" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
