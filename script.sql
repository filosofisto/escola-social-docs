-- User: escola_social_dev
-- DROP USER escola_social_dev;

CREATE USER escola_social_dev WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

CREATE SCHEMA escola_social
    AUTHORIZATION escola_social_dev;

ALTER DEFAULT PRIVILEGES IN SCHEMA escola_social
GRANT SELECT ON TABLES TO escola_social_dev;

-- SEQUENCE: escola_social.absenteismo_id_seq

-- DROP SEQUENCE escola_social.absenteismo_id_seq;

CREATE SEQUENCE escola_social.absenteismo_id_seq;

ALTER SEQUENCE escola_social.absenteismo_id_seq
    OWNER TO escola_social_dev;

-- SEQUENCE: escola_social.assiduidade_id_assiduidade_seq

-- DROP SEQUENCE escola_social.assiduidade_id_assiduidade_seq;

CREATE SEQUENCE escola_social.assiduidade_id_assiduidade_seq;

ALTER SEQUENCE escola_social.assiduidade_id_assiduidade_seq
    OWNER TO escola_social_dev;

-- SEQUENCE: escola_social.quadro_despesa_id_seq

-- DROP SEQUENCE escola_social.quadro_despesa_id_seq;

CREATE SEQUENCE escola_social.quadro_despesa_id_seq;

ALTER SEQUENCE escola_social.quadro_despesa_id_seq
    OWNER TO escola_social_dev;

-- Table: escola_social.absenteismo

-- DROP TABLE escola_social.absenteismo;

CREATE TABLE escola_social.absenteismo
(
    id integer NOT NULL DEFAULT nextval('escola_social.absenteismo_id_seq'::regclass),
    data date NOT NULL,
    matriculados integer NOT NULL,
    presentes integer NOT NULL,
    absenteismo integer NOT NULL,
    percentual double precision NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE escola_social.absenteismo
    OWNER to escola_social_dev;

-- Index: idx_absenteismo_data

-- DROP INDEX escola_social.idx_absenteismo_data;

CREATE UNIQUE INDEX idx_absenteismo_data
    ON escola_social.absenteismo USING btree
    (data)
    TABLESPACE pg_default;

-- Table: escola_social.assiduidade

-- DROP TABLE escola_social.assiduidade;

CREATE TABLE escola_social.assiduidade
(
    id_assiduidade integer NOT NULL DEFAULT nextval('escola_social.assiduidade_id_assiduidade_seq'::regclass),
    id_sic numeric(10,0),
    matricula numeric(10,0) NOT NULL,
    motivo character varying(255) COLLATE pg_catalog."default",
    data date NOT NULL,
    recesso_feriado boolean DEFAULT false,
    falta numeric(1,0) DEFAULT 0,
    presenca numeric(1,0) DEFAULT 0
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE escola_social.assiduidade
    OWNER to escola_social_dev;

-- Index: idx_assiduidade_idsic

-- DROP INDEX escola_social.idx_assiduidade_idsic;

CREATE UNIQUE INDEX idx_assiduidade_idsic
    ON escola_social.assiduidade USING btree
    (id_sic)
    TABLESPACE pg_default;

-- Table: escola_social.quadro_despesa

-- DROP TABLE escola_social.quadro_despesa;

CREATE TABLE escola_social.quadro_despesa
(
    id integer NOT NULL DEFAULT nextval('escola_social.quadro_despesa_id_seq'::regclass),
    ano integer NOT NULL,
    mes integer NOT NULL,
    semana integer NOT NULL,
    lei double precision,
    alteracao_lei double precision,
    percentual_lei numeric(5,2),
    contigenciado double precision,
    percentual_contigenciado numeric(5,2),
    cota double precision,
    percentual_cota numeric(5,2),
    bloqueado double precision,
    despesa_autorizada double precision,
    empenhado double precision,
    disponivel double precision,
    percentual_disponivel numeric(5,2),
    liquidado double precision,
    percentual_liquidado numeric(5,2)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE escola_social.quadro_despesa
    OWNER to escola_social_dev;

-- Index: idx_quadro_despesa_ano_mes_semana

-- DROP INDEX escola_social.idx_quadro_despesa_ano_mes_semana;

CREATE UNIQUE INDEX idx_quadro_despesa_ano_mes_semana
    ON escola_social.quadro_despesa USING btree
    (ano, mes, semana)
    TABLESPACE pg_default;

-- Change user password
ALTER USER escola_social_dev WITH PASSWORD '12345678';

    
