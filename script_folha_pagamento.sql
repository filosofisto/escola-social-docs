--------------------------------------------------------------------------------------------
-- Script Folha de Pagamento: 2019-08-05
--------------------------------------------------------------------------------------------
CREATE SEQUENCE escola_social.folha_pagamento_id_seq;

ALTER SEQUENCE escola_social.folha_pagamento_id_seq
    OWNER TO escola_social_dev;

CREATE TABLE escola_social.folha_pagamento
(
    id                                  integer NOT NULL DEFAULT nextval('escola_social.folha_pagamento_id_seq'::regclass),
    id_sic                              integer not null,
    matricula                           integer not null,
    auxilio_aproveitamento_individual   double precision not null,
    percentual_incentivo_assiduidade    decimal(5, 2) not null,
    incentivo_assiduidade               double precision not null,
    presencas_alimentacao               integer not null,
    auxilio_alimentacao                 double precision not null,
    custo_diario                        double precision not null,
    presencas_transporte                integer not null,
    auxilio_transporte                  double precision not null,
    mes                                 varchar(255) not null,
    ano                                 varchar(255) not null,
    numero_folha                        integer not null,
    dias_uteis                          integer not null
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE escola_social.folha_pagamento
    OWNER to escola_social_dev;

CREATE UNIQUE INDEX idx_folha_pagamento_id
    ON escola_social.folha_pagamento USING btree
    (id)
    TABLESPACE pg_default;
