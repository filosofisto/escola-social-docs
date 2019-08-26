--------------------------------------------------------------------------------------------
-- Script Folha de Pagamento: 2019-08-25
--------------------------------------------------------------------------------------------
CREATE SEQUENCE escola_social.folha_pagamento_resumo_id_seq;

ALTER SEQUENCE escola_social.folha_pagamento_resumo_id_seq
    OWNER TO escola_social_dev;

CREATE TABLE escola_social.folha_pagamento_resumo
(
    id                                  integer NOT NULL DEFAULT nextval('escola_social.folha_pagamento_resumo_id_seq'::regclass),
    auxilio_aproveitamento_individual   double precision not null,
    incentivo_assiduidade               double precision not null,
    auxilio_alimentacao                 double precision not null,
    auxilio_transporte                  double precision not null,
    mes                                 int not null,
    ano                                 int not null
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE escola_social.folha_pagamento_resumo
    OWNER to escola_social_dev;

CREATE UNIQUE INDEX idx_folha_pagamento_resumo_id
    ON escola_social.folha_pagamento_resumo USING btree
    (id)
    TABLESPACE pg_default;

CREATE INDEX idx_folha_pagamento_ano_mes_numero_folha
    ON escola_social.folha_pagamento USING btree
    (ano,mes,numero_folha)
    TABLESPACE pg_default;

-----------------------------------------------------------------------------------------
