/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     28/09/2021 02:28:57                          */
/*==============================================================*/


/*==============================================================*/
/* Table: Endereco                                              */
/*==============================================================*/
create table Endereco
(
   Codigo_Fornec        integer not null,
   Tipo_Logradouro      char(15),
   Logradouro           text(50),
   Codigo_Fornecedor    integer
);

/*==============================================================*/
/* Table: Merchants                                             */
/*==============================================================*/
create table Merchants
(
   Codigo_Fornec        integer not null,
   RazaoSocial          text(50),
   CNPJ                 text(50),
   Endereco             text(100),
   Fone                 text(15),
   E_mail               text(50)
);

alter table Merchants
   add primary key (Codigo_Fornec);

/*==============================================================*/
/* Table: Produto                                               */
/*==============================================================*/
create table Produto
(
   CodigoProduto        integer not null,
   CodigoFornec         integer not null,
   Descricao            text(200),
   Marca                text(50),
   Tamanho              real(15),
   Valor                double
);

alter table Produto
   add primary key (CodigoProduto);

/*==============================================================*/
/* Table: Telefone                                              */
/*==============================================================*/
create table Telefone
(
   tipo_telefone        smallint,
   numero_telefone      char(15),
   Codigo_Fornec        char(10) not null
);

alter table Endereco add constraint FK_Reference_2 foreign key (Codigo_Fornec)
      references Merchants (Codigo_Fornec) on delete restrict on update restrict;

alter table Produto add constraint FK_Reference_1 foreign key (CodigoFornec)
      references Merchants (Codigo_Fornec) on delete restrict on update restrict;

alter table Telefone add constraint FK_Reference_3 foreign key (Codigo_Fornec)
      references Merchants (Codigo_Fornec) on delete restrict on update restrict;

