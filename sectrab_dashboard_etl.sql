-- SCHEMA: escola_social

-- DROP SCHEMA escola_social ;

CREATE SCHEMA escola_social
    AUTHORIZATION escola_social_dev;

ALTER DEFAULT PRIVILEGES IN SCHEMA escola_social
GRANT SELECT ON TABLES TO escola_social_dev;

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