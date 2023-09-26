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

 Date: 26/09/2023 10:47:26
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
  "uv" int4 NOT NULL,
  "codigo" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "id_asignatura" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "nombre" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "estado" bool
)
;

-- ----------------------------
-- Records of asignatura
-- ----------------------------
INSERT INTO "public"."asignatura" VALUES (4, 'MAT-173', '1', 'MATEMATICA 1', 't');
INSERT INTO "public"."asignatura" VALUES (4, 'BIG-173', '21', 'BIOLOGIA GENERAL', 't');
INSERT INTO "public"."asignatura" VALUES (4, 'SOR-173', '31', 'SOCIOLOGIA RURAL', 't');
INSERT INTO "public"."asignatura" VALUES (4, 'QUG-173', '41', 'QUIMICA GENERAL', 't');
INSERT INTO "public"."asignatura" VALUES (4, 'MTI-173', '51', 'METODOS Y TECNICAS DE INVESTIGACION', 't');
INSERT INTO "public"."asignatura" VALUES (4, 'so1701', '202309111739117566-1', 'fisica 3', 't');
INSERT INTO "public"."asignatura" VALUES (4, '1212', '202309252207244177-2', 'aab', 't');

-- ----------------------------
-- Table structure for asignaturadocente
-- ----------------------------
DROP TABLE IF EXISTS "public"."asignaturadocente";
CREATE TABLE "public"."asignaturadocente" (
  "estado" bool,
  "idasignatura" varchar(50) COLLATE "pg_catalog"."default",
  "id_asignaturadocente" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "iddocente" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of asignaturadocente
-- ----------------------------
INSERT INTO "public"."asignaturadocente" VALUES ('t', '21', '21', '21');
INSERT INTO "public"."asignaturadocente" VALUES ('t', '41', '41', '41');
INSERT INTO "public"."asignaturadocente" VALUES ('t', '41', '51', '51');
INSERT INTO "public"."asignaturadocente" VALUES ('t', '51', '61', '61');
INSERT INTO "public"."asignaturadocente" VALUES ('f', '202309111739117566-1', '202309111741436456-1', '1');
INSERT INTO "public"."asignaturadocente" VALUES ('f', '1', '1', '1');
INSERT INTO "public"."asignaturadocente" VALUES ('t', '1', '202309111814242457-1', '1');
INSERT INTO "public"."asignaturadocente" VALUES ('t', '202309111739117566-1', '202309131738575248-1', '1');
INSERT INTO "public"."asignaturadocente" VALUES ('f', '31', '31', '31');
INSERT INTO "public"."asignaturadocente" VALUES ('t', '202309252207244177-2', '202309252207429839-2', '202309252207133117-2');

-- ----------------------------
-- Table structure for aula
-- ----------------------------
DROP TABLE IF EXISTS "public"."aula";
CREATE TABLE "public"."aula" (
  "capacidad" int4 NOT NULL,
  "codigo" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "id_aula" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of aula
-- ----------------------------
INSERT INTO "public"."aula" VALUES (120, 'D-5', '1');
INSERT INTO "public"."aula" VALUES (90, 'A1-1', '21');
INSERT INTO "public"."aula" VALUES (100, 'D-3', '31');
INSERT INTO "public"."aula" VALUES (100, 'A2-3', '41');
INSERT INTO "public"."aula" VALUES (200, 'A1-2', '51');
INSERT INTO "public"."aula" VALUES (35, '2-21', '202309111737445126-1');

-- ----------------------------
-- Table structure for bitacora
-- ----------------------------
DROP TABLE IF EXISTS "public"."bitacora";
CREATE TABLE "public"."bitacora" (
  "fecha" timestamp(6) NOT NULL,
  "id_bitacora" int8 NOT NULL DEFAULT nextval('bitacora_id_bitacora_seq'::regclass),
  "id_usuario" int8,
  "accion" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "hora" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "ip" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "ruta" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of bitacora
-- ----------------------------
INSERT INTO "public"."bitacora" VALUES ('2023-09-24 22:40:14.032', 4, 5, 'Agregar', 'hora', '192.168.1.30', 'a');
INSERT INTO "public"."bitacora" VALUES ('2023-09-24 23:20:56.058', 5, 7, 'Agregar', 'hora', '192.168.1.30', 'a');

-- ----------------------------
-- Table structure for bloque
-- ----------------------------
DROP TABLE IF EXISTS "public"."bloque";
CREATE TABLE "public"."bloque" (
  "id_bloque" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "idasignaturadocente" varchar(255) COLLATE "pg_catalog"."default",
  "idgrupo" varchar(255) COLLATE "pg_catalog"."default",
  "dia" varchar(15) COLLATE "pg_catalog"."default",
  "horafin" time(6),
  "horainicio" time(6),
  "idaula" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of bloque
-- ----------------------------
INSERT INTO "public"."bloque" VALUES ('202309121140445281', '202309111814242457-1', '202309121140003681', NULL, NULL, NULL, NULL);
INSERT INTO "public"."bloque" VALUES ('202309121141223742', '21', '202309121140003681', NULL, NULL, NULL, NULL);
INSERT INTO "public"."bloque" VALUES ('202309121142072293', '31', '202309121140003681', NULL, NULL, NULL, NULL);
INSERT INTO "public"."bloque" VALUES ('202309121143136364', '41', '202309121140003681', NULL, NULL, NULL, NULL);
INSERT INTO "public"."bloque" VALUES ('202309121143551215', '51', '202309121140073732', NULL, NULL, NULL, NULL);
INSERT INTO "public"."bloque" VALUES ('202309252207560966', '202309252207429839-2', '202309252206456493', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for bloquedetalle
-- ----------------------------
DROP TABLE IF EXISTS "public"."bloquedetalle";
CREATE TABLE "public"."bloquedetalle" (
  "horafin" time(6),
  "horainicio" time(6),
  "dia" varchar(15) COLLATE "pg_catalog"."default",
  "id_bloquedetalle" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "idaula" varchar(255) COLLATE "pg_catalog"."default",
  "idbloque" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of bloquedetalle
-- ----------------------------
INSERT INTO "public"."bloquedetalle" VALUES ('12:00:00', '09:00:00', 'MARTES', '202309121140590472', '1', '202309121140445281');
INSERT INTO "public"."bloquedetalle" VALUES ('15:00:00', '13:00:00', 'LUNES', '202309121141114052', '21', '202309121140445281');
INSERT INTO "public"."bloquedetalle" VALUES ('10:00:00', '08:00:00', 'MIÉRCOLES', '202309121141467633', '31', '202309121141223742');
INSERT INTO "public"."bloquedetalle" VALUES ('13:00:00', '10:00:00', 'MIÉRCOLES', '202309121141593813', '1', '202309121141223742');
INSERT INTO "public"."bloquedetalle" VALUES ('09:00:00', '07:00:00', 'MARTES', '202309121142234984', '41', '202309121142072293');
INSERT INTO "public"."bloquedetalle" VALUES ('16:00:00', '14:00:00', 'MIÉRCOLES', '202309121142479834', '51', '202309121142072293');
INSERT INTO "public"."bloquedetalle" VALUES ('15:00:00', '13:00:00', 'MARTES', '202309121143276795', '21', '202309121143136364');
INSERT INTO "public"."bloquedetalle" VALUES ('11:00:00', '08:00:00', 'JUEVES', '202309121143414045', '21', '202309121143136364');
INSERT INTO "public"."bloquedetalle" VALUES ('15:00:00', '13:00:00', 'JUEVES', '202309121144094626', '21', '202309121143551215');
INSERT INTO "public"."bloquedetalle" VALUES ('16:00:00', '13:00:00', 'VIERNES', '202309121144180766', '21', '202309121143551215');
INSERT INTO "public"."bloquedetalle" VALUES ('17:00:00', '15:00:00', 'MARTES', '202309252212302737', '21', '202309252207560966');

-- ----------------------------
-- Table structure for carrera
-- ----------------------------
DROP TABLE IF EXISTS "public"."carrera";
CREATE TABLE "public"."carrera" (
  "nombre" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "codigo" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "iddepartamento" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of carrera
-- ----------------------------
INSERT INTO "public"."carrera" VALUES ('AGRONOMIA', 'AGN213', '1', NULL);
INSERT INTO "public"."carrera" VALUES ('AGROINDUSTRIA', 'AGI120', '21', NULL);
INSERT INTO "public"."carrera" VALUES ('aa', 'a', '202309242320435553-2', NULL);

-- ----------------------------
-- Table structure for departamento
-- ----------------------------
DROP TABLE IF EXISTS "public"."departamento";
CREATE TABLE "public"."departamento" (
  "codigo" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "nombre_departamento" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "id_departamento" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of departamento
-- ----------------------------
INSERT INTO "public"."departamento" VALUES ('ing-170', 'informatica', '1');
INSERT INTO "public"."departamento" VALUES ('2', 'Departamento 2', '2');

-- ----------------------------
-- Table structure for docente
-- ----------------------------
DROP TABLE IF EXISTS "public"."docente";
CREATE TABLE "public"."docente" (
  "telefono" varchar(20) COLLATE "pg_catalog"."default",
  "correo" varchar(50) COLLATE "pg_catalog"."default",
  "especialidad" varchar(50) COLLATE "pg_catalog"."default",
  "institucion" varchar(50) COLLATE "pg_catalog"."default",
  "nombre" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "id_docente" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "numero_unico" varchar(255) COLLATE "pg_catalog"."default",
  "iddepartamento" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of docente
-- ----------------------------
INSERT INTO "public"."docente" VALUES ('76078483', 'a@gmail.com', 'Especialidad', 'Institucion', 'INGA. LOURDES MARIA HERNANDDEZ', '1', '001', NULL);
INSERT INTO "public"."docente" VALUES ('76078483', 'a@gmail.com', 'Especialidad', 'Institucion', 'ING. WILBER SAMUEL ESCOTO UMAÑA', '21', '002', NULL);
INSERT INTO "public"."docente" VALUES ('76078483', 'a@gmail.com', 'Especialidad', 'Institucion', 'ING. JOSE ISIDRO VARGAS CAÑAS', '31', '003', NULL);
INSERT INTO "public"."docente" VALUES ('76078483', 'a@gmail.com', 'Especialidad', 'Institucion', 'LIC. RODRIGO ANTONIO MELENDEZ', '41', '004', NULL);
INSERT INTO "public"."docente" VALUES ('76078483', 'a@gmail.com', 'Especialidad', 'Institucion', 'LIC. CARLOS RENÁN FUNES GUADRON', '51', '005', NULL);
INSERT INTO "public"."docente" VALUES ('76078483', 'a@gmail.com', 'Especialidad', 'Institucion', 'ING. RENÉ FRANCISCO VASQUEZ', '61', '005', NULL);
INSERT INTO "public"."docente" VALUES ('76078482', 'a@ues.edu.sv', 'aaaa', 'aaa', 'aaa', '202309252207133117-2', '0011', NULL);

-- ----------------------------
-- Table structure for grupo
-- ----------------------------
DROP TABLE IF EXISTS "public"."grupo";
CREATE TABLE "public"."grupo" (
  "capacidad" int4,
  "nombre" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "id_grupo" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "idhorario" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of grupo
-- ----------------------------
INSERT INTO "public"."grupo" VALUES (100, 'Teórico 01', '202309121140003681', '202309121139430901-1');
INSERT INTO "public"."grupo" VALUES (100, 'Teórico 02', '202309121140073732', '202309121139430901-1');
INSERT INTO "public"."grupo" VALUES (100, 'a', '202309252206456493', '202309242320560552-2');

-- ----------------------------
-- Table structure for horario
-- ----------------------------
DROP TABLE IF EXISTS "public"."horario";
CREATE TABLE "public"."horario" (
  "ciclo" int4,
  "ciclo_anio" int4,
  "nivel" varchar(20) COLLATE "pg_catalog"."default",
  "titulo" varchar(50) COLLATE "pg_catalog"."default",
  "id_horario" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of horario
-- ----------------------------
INSERT INTO "public"."horario" VALUES (1, 2023, 'Primer Nivel', 'AGRONO2008-AGROINDUSTRIA)', '202309121139430901-1');
INSERT INTO "public"."horario" VALUES (1, 2023, 'Tercer Nivel', '111', '202309242320560552-2');

-- ----------------------------
-- Table structure for horariocarrera
-- ----------------------------
DROP TABLE IF EXISTS "public"."horariocarrera";
CREATE TABLE "public"."horariocarrera" (
  "carrera_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "horario_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of horariocarrera
-- ----------------------------
INSERT INTO "public"."horariocarrera" VALUES ('1', '202309121139430901-1');
INSERT INTO "public"."horariocarrera" VALUES ('21', '202309121139430901-1');
INSERT INTO "public"."horariocarrera" VALUES ('202309242320435553-2', '202309242320560552-2');

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
INSERT INTO "public"."permisos" VALUES (2, 'Docente');
INSERT INTO "public"."permisos" VALUES (1, 'Carrera');
INSERT INTO "public"."permisos" VALUES (3, 'Asignatura');
INSERT INTO "public"."permisos" VALUES (4, 'Aula');
INSERT INTO "public"."permisos" VALUES (5, 'Horario');

-- ----------------------------
-- Table structure for permisos_rol
-- ----------------------------
DROP TABLE IF EXISTS "public"."permisos_rol";
CREATE TABLE "public"."permisos_rol" (
  "crear" bool NOT NULL,
  "editar" bool NOT NULL,
  "eliminar" bool NOT NULL,
  "id_permiso" int8 NOT NULL,
  "id_permisos_rol" int8 NOT NULL DEFAULT nextval('permisos_rol_id_permisos_rol_seq'::regclass),
  "id_rol" int8 NOT NULL
)
;

-- ----------------------------
-- Records of permisos_rol
-- ----------------------------
INSERT INTO "public"."permisos_rol" VALUES ('t', 't', 't', 4, 52, 38);
INSERT INTO "public"."permisos_rol" VALUES ('t', 't', 't', 3, 53, 38);
INSERT INTO "public"."permisos_rol" VALUES ('t', 't', 't', 2, 54, 38);
INSERT INTO "public"."permisos_rol" VALUES ('t', 't', 't', 5, 55, 38);
INSERT INTO "public"."permisos_rol" VALUES ('t', 't', 't', 1, 56, 38);

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
INSERT INTO "public"."rol" VALUES (38, 'JEFEDEDEPARTAMENTO');

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS "public"."usuario";
CREATE TABLE "public"."usuario" (
  "id_usuario" int8 NOT NULL DEFAULT nextval('usuario_id_usuario_seq'::regclass),
  "rol_id" int8,
  "docente" varchar(255) COLLATE "pg_catalog"."default",
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "iddepartamento" varchar(255) COLLATE "pg_catalog"."default",
  "nombre" varchar(255) COLLATE "pg_catalog"."default",
  "nombre_usuario" varchar(255) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "token_password" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of usuario
-- ----------------------------
INSERT INTO "public"."usuario" VALUES (5, 1, '1', 'Kmishell@gmail.com', '1', 'Kely Mishel Rodriguez Perdomo', 'Kmishell', '$2a$10$P670x0Rv6ffOJVphA5am9uTFKn.iDCupPXVTxrV1uWnVV.757yvF.', NULL);
INSERT INTO "public"."usuario" VALUES (7, 38, '41', 'a@gmail.com', '2', 'Ronal Rigan', 'Casita1', '$2a$10$krri4vwtFm7dLMHA2rDyCu8I0MSb5zh3GWcwVnZMTPd3ICYVy969m', NULL);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."bitacora_id_bitacora_seq"
OWNED BY "public"."bitacora"."id_bitacora";
SELECT setval('"public"."bitacora_id_bitacora_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."permisos_id_permiso_seq"
OWNED BY "public"."permisos"."id_permiso";
SELECT setval('"public"."permisos_id_permiso_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."permisos_rol_id_permisos_rol_seq"
OWNED BY "public"."permisos_rol"."id_permisos_rol";
SELECT setval('"public"."permisos_rol_id_permisos_rol_seq"', 56, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rol_id_seq"
OWNED BY "public"."rol"."id";
SELECT setval('"public"."rol_id_seq"', 38, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."usuario_id_usuario_seq"
OWNED BY "public"."usuario"."id_usuario";
SELECT setval('"public"."usuario_id_usuario_seq"', 7, true);

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
ALTER TABLE "public"."usuario" ADD CONSTRAINT "usuario_docente_key" UNIQUE ("docente");
ALTER TABLE "public"."usuario" ADD CONSTRAINT "usuario_nombre_usuario_key" UNIQUE ("nombre_usuario");

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
ALTER TABLE "public"."bloque" ADD CONSTRAINT "fkidli2217c0kbui3xjuba972px" FOREIGN KEY ("idaula") REFERENCES "public"."aula" ("id_aula") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."bloque" ADD CONSTRAINT "fkixv47tltyot1e88ju7onyd75r" FOREIGN KEY ("idasignaturadocente") REFERENCES "public"."asignaturadocente" ("id_asignaturadocente") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."bloque" ADD CONSTRAINT "fkoyxqyfcnpdyuj2sp24oevndn8" FOREIGN KEY ("idgrupo") REFERENCES "public"."grupo" ("id_grupo") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table bloquedetalle
-- ----------------------------
ALTER TABLE "public"."bloquedetalle" ADD CONSTRAINT "fk155l3mydd3tty5fuk6j4d5orc" FOREIGN KEY ("idaula") REFERENCES "public"."aula" ("id_aula") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."bloquedetalle" ADD CONSTRAINT "fkif95sr2p9op55vb77i9swpkd3" FOREIGN KEY ("idbloque") REFERENCES "public"."bloque" ("id_bloque") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table carrera
-- ----------------------------
ALTER TABLE "public"."carrera" ADD CONSTRAINT "fkl2ke8lj40babd12yrdce0j23c" FOREIGN KEY ("iddepartamento") REFERENCES "public"."departamento" ("id_departamento") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table docente
-- ----------------------------
ALTER TABLE "public"."docente" ADD CONSTRAINT "fkc0v286o0kqwdnvfo2970y092g" FOREIGN KEY ("iddepartamento") REFERENCES "public"."departamento" ("id_departamento") ON DELETE NO ACTION ON UPDATE NO ACTION;

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
