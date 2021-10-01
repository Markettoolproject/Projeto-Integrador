/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     01/10/2021 03:19:31                          */
/*==============================================================*/


/*==============================================================*/
/* Table: atributo                                              */
/*==============================================================*/
create table atributo
(
   nome                 text,
   valor                text
);

/*==============================================================*/
/* Table: categoria                                             */
/*==============================================================*/
create table categoria
(
   codigoproduto        integer not null,
   id_categoria         integer(50) not null,
   cat_id_categoria     integer(50),
   nome                 text(50)
);

alter table categoria
   add primary key (id_categoria);

/*==============================================================*/
/* Table: cliente                                               */
/*==============================================================*/
create table cliente
(
   id_cliente_          integer(25) not null,
   nome_cliente         text(50),
   cpf_cliente          text(11),
   telefone_cliente     text(11)
);

alter table cliente
   add primary key (id_cliente_);

/*==============================================================*/
/* Table: endereco                                              */
/*==============================================================*/
create table endereco
(
   tipo_logradouro      char(15),
   logradouro           text(50),
   codigo_fornec        integer
);

/*==============================================================*/
/* Table: enderecoretirada                                      */
/*==============================================================*/
create table enderecoretirada
(
   id_cliente_          integer(25),
   id_pedido            integer(11),
   id_pagamento         integer,
   cep                  varbinary(50),
   logradouro           varchar(50),
   numero               int(10),
   complemento          varbinary(100),
   bairro               varbinary(50),
   cidade               varchar(50)
);

/*==============================================================*/
/* Table: estoque                                               */
/*==============================================================*/
create table estoque
(
   id_estoque           integer not null,
   quantidade           integer
);

alter table estoque
   add primary key (id_estoque);

/*==============================================================*/
/* Table: item_pedido                                           */
/*==============================================================*/
create table item_pedido
(
   id_cliente_          integer(25) not null,
   id_pedido            integer(11) not null,
   id_pagamento         integer not null,
   preco_produto        decimal(0,0),
   quantidade           integer(100000)
);

/*==============================================================*/
/* Table: merchants                                             */
/*==============================================================*/
create table merchants
(
   codigo_fornec        integer not null,
   razaosocial          text(50),
   cnpj                 text(50),
   endereco             text(100),
   fone                 text(15),
   e_mail               text(50)
);

alter table merchants
   add primary key (codigo_fornec);

/*==============================================================*/
/* Table: pagamento                                             */
/*==============================================================*/
create table pagamento
(
   id_pagamento         integer not null
);

alter table pagamento
   add primary key (id_pagamento);

/*==============================================================*/
/* Table: pagamentoboleto                                       */
/*==============================================================*/
create table pagamentoboleto
(
   id_pagamento         integer,
   data_vencimeno       date(8),
   codigo_barras        text(50)
);

/*==============================================================*/
/* Table: pagamentocartao                                       */
/*==============================================================*/
create table pagamentocartao
(
   id_pagamento         integer,
   numero_cartao        text
);

/*==============================================================*/
/* Table: pedido                                                */
/*==============================================================*/
create table pedido
(
   id_cliente_          integer(25) not null,
   id_pedido            integer(11) not null,
   id_pagamento         integer not null,
   data_ciracao         integer(8),
   data_conclusao       integer(8),
   total                dec
);

alter table pedido
   add primary key (id_cliente_, id_pedido, id_pagamento);

/*==============================================================*/
/* Table: produto                                               */
/*==============================================================*/
create table produto
(
   codigoproduto        integer not null,
   codigo_fornec        integer not null,
   id_estoque           integer,
   descricao            text(200),
   marca                text(50),
   tamanho              real(15),
   valor                double
);

alter table produto
   add primary key (codigoproduto);

/*==============================================================*/
/* Table: sexo_cliente                                          */
/*==============================================================*/
create table sexo_cliente
(
   id_cliente_          integer(25) not null,
   masculino            char(10),
   feminino             char(10)
);

/*==============================================================*/
/* Table: statuspagamento                                       */
/*==============================================================*/
create table statuspagamento
(
   id_pagamento         integer not null,
   processando          char(10),
   cancelado            char(10),
   recebido             char(10)
);

/*==============================================================*/
/* Table: statuspedido                                          */
/*==============================================================*/
create table statuspedido
(
   id_cliente_          integer(25) not null,
   id_pedido            integer(11) not null,
   id_pagamento         integer not null,
   aguardando           char(10),
   cancelado            char(10),
   pago                 char(10)
);

/*==============================================================*/
/* Table: telefone                                              */
/*==============================================================*/
create table telefone
(
   tipo_telefone        smallint,
   numero_telefone      char(15),
   codigo_fornec        char(10) not null
);

alter table categoria add constraint fk_categoria foreign key (codigoproduto)
      references produto (codigoproduto) on delete restrict on update restrict;

alter table categoria add constraint fk_subcategorias foreign key (cat_id_categoria)
      references categoria (id_categoria) on delete restrict on update restrict;

alter table endereco add constraint fk_endereco foreign key ()
      references merchants (codigo_fornec) on delete restrict on update restrict;

alter table enderecoretirada add constraint fk_retirada foreign key (id_cliente_, id_pedido, id_pagamento)
      references pedido (id_cliente_, id_pedido, id_pagamento) on delete restrict on update restrict;

alter table item_pedido add constraint fk_reference_6 foreign key (id_cliente_, id_pedido, id_pagamento)
      references pedido (id_cliente_, id_pedido, id_pagamento) on delete restrict on update restrict;

alter table pagamentoboleto add constraint fk_boleto foreign key (id_pagamento)
      references pagamento (id_pagamento) on delete restrict on update restrict;

alter table pagamentocartao add constraint fk_cartao foreign key (id_pagamento)
      references pagamento (id_pagamento) on delete restrict on update restrict;

alter table pedido add constraint fk_cliente foreign key (id_cliente_)
      references cliente (id_cliente_) on delete restrict on update restrict;

alter table pedido add constraint fk_pagamento foreign key (id_pagamento)
      references pagamento (id_pagamento) on delete restrict on update restrict;

alter table produto add constraint fk_atributo foreign key ()
      references atributo on delete restrict on update restrict;

alter table produto add constraint fk_estoque foreign key (id_estoque)
      references estoque (id_estoque) on delete restrict on update restrict;

alter table produto add constraint fk_fornecedor foreign key (codigo_fornec)
      references merchants (codigo_fornec) on delete restrict on update restrict;

alter table produto add constraint fk_reference_10 foreign key ()
      references item_pedido on delete restrict on update restrict;

alter table sexo_cliente add constraint fk_sexo foreign key (id_cliente_)
      references cliente (id_cliente_) on delete restrict on update restrict;

alter table statuspagamento add constraint fk_reference_9 foreign key (id_pagamento)
      references pagamento (id_pagamento) on delete restrict on update restrict;

alter table statuspedido add constraint fk_status foreign key (id_cliente_, id_pedido, id_pagamento)
      references pedido (id_cliente_, id_pedido, id_pagamento) on delete restrict on update restrict;

alter table telefone add constraint fk_telefone foreign key (codigo_fornec)
      references merchants (codigo_fornec) on delete restrict on update restrict;

