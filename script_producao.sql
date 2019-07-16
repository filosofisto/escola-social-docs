-----------------------------------------------------------------------------
-- Script funcionalidade: Producao - 04/07/2019
------------------------------------------------------------------------------
CREATE SEQUENCE escola_social.producao_id_seq;

ALTER SEQUENCE escola_social.producao_id_seq
    OWNER TO escola_social_dev;

--drop table escola_social.producao;

CREATE TABLE escola_social.producao
(
    id                       integer NOT NULL DEFAULT nextval('escola_social.producao_id_seq'::regclass),
    sic_id                   integer not null,
    cod_etapa                integer not null,
    data_operacao            date not null,
    matricula                integer not null,
    nome                     varchar(255),
    quantidade               numeric(8),
    tipo_produto             varchar(255)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE escola_social.producao
    OWNER to escola_social_dev;

alter table escola_social.producao
  add valor_etapa decimal(10,2), add valor decimal(10,2);

--drop index escola_social.idx_producao;

CREATE INDEX idx_producao
    ON escola_social.producao USING btree
    (data_operacao)
    TABLESPACE pg_default;
------------------------------------------------------------------------------
