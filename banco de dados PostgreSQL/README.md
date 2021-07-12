## **Fundamentos de banco de dados** 🎲                          ![](https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/120/samsung/265/nerd-face_1f913.png)                                                                           

*Modelo relacional* : pode ser definido como tabelas 

**Coisas tangíveis :**:scroll:

- elementos físicos (carro, produto, animal)

*Funções*

- perfis de usuário, status de compra

*Eventos ou ocorrências*

- produtos de um pedido, histórico de dado

***Colunas importantes*** :scroll:

**chaves primarias** : primary key / PK, conjunto de um ou mais campos que nunca se repetem. Identidade da tabela. são utilizados como índice de referência na criação de relacionamento entre tabelas.

**chave estrangeira** : foreign key / FK, valor de referência uma PK  de outra tabela da mesma tabela para criar um relacionamento.

## Configurações :scroll:

***arquivo postgresql.conf*** : fica dentro do diretório **PGDATA** ou **DATA** no windows, arquivo onde estão definidas e armazenadas todas as configurações do servidor, alguns parâmetros só podem ser alterados com uma reinicialização do banco de dados. A view pg_settings, acessada por dentro do banco de dados, guarda todas as configurações atuais.  O **show [parâmetro]**, é possível visualizar todas as configurações.

- *listen_addresses* : endereço TCP/IP das interfaces que o servidor vai escutar / liberar conexão.

- *port* : porta TCP que o servidor vai, o padrão é 5432.

- *max_connections* : número máximo de conexão simultâneas no servidor. 

- *superuser_reserved_connections* : número de conexão (slot) reservadas para conexão ao banco de dados de super usuário. 
- *shared_buffers* : tamanho da memória  compartilhada do servidor para cache / buffer de tabelas, índices e demais relações.
- *work_mem* : tamanho da memória para operações de agrupamento e ordenação  (ORDER BY, DISTINCT, MERGE JOINS).

***arquivo pg_hba.conf*** : arquivo responsável pelo controle de autenticação dos usuários no servidor,  **local:** " database user auth-method [auth-options] "

*Métodos de autenticação:* 

- trust : conexão sem requerimento de senha.
- reject : rejeitar conexão.
- md5 : criptografia md5.
- password : senha sem criptografia.
- gss : generic security service application program interface.
- sspi : (security support provider interface) - somente para windows.
- kpb5 :  kerberos v5.
- ident : utiliza o usuário do sistema operacional do cliente via ident server.
- peer : utiliza o usuário do sistema operacional do cliente.
- ldap : idap server.
- radius : radius server.
- cert: autenticação via certificado ssi do cliente.
- pam : pluggable authentication modules, o usuário precisa estar no banco de dados.

***arquivo pg_ident.conf*** : responsável por mapear os usuários do sistema operacional com os usuários do banco de dados. Localizados no diretório de dados PGDATA de sua instalação, após **ident** deve ser utilizado no arquivo **pg_hba.conf**.

***comandos administrativos*** : Binários do PostgreSQL

-  creatdb
-  createuser
-  dropdb
-  dropuser
-  initdb
-  pg_ctl
-  pg_basebackup
-  pg_dump / pg_dumpall
-  pg_restore
-  psql
-  reindexdb
-  vacuumdb 

**Cluster :**  "ARQUITETURA / HIERARQUIA"- coleção de banco de dados que compartilham as mesmas configurações (arquivos de configurações📂) do PostgreSQL e do sistema operacional (porta, listen_addresses, etc...)

### **PGAdmin**

*Importância para conexão*

1. Liberar acesso ao cluser em postgresql.conf
2. Liberar acesso ao cluster para usuário do banco de dados em pg_hba.conf
3. Criar / editar usuário

### ***Criando banco 🎲***

*Primeiro passo:*

1. selecione SERVERS

2. Object ➡️ Create ➡️ Server Group

   *Segundo passo:*

3. Seleciona banco criado ➡️ Object ➡️ Create ➡️ Server 

   OBS: nome em conexão é (127.0.0.1)

4. seleciona após criado **postigres**, barra lateral esquerda ➡️ tools **Query tool** 

### ***Usuários*** 

1. *Conceitos user / roles / groups*

   - roles : (papéis ou funções). users (usuários) e grupos de usuários são " contas ", perfis de atuação em um banco de dados, que possuem permissões em comum ou especificas.

2. *Administrando  user / roles / groups*

   create role name [ [WITH ] option[...] ]

   - superuser | nosuperuser

   - createdb | nocreatedb

   - createrole | nocreaterole

   - inherit | noinherit

   - login | nologin

   - replication | noreplication

   - bypassrls | nobypassrls

   - connection limit connlimit

   - [encrypted ] password 'password' | password null

   - valod until 'timestamp'

   - in role role_name [,..]

   - in group role_name [,..]

   - role role_name [,...]

   - admin role_name [,...]

   - user role_name [,...]

   - sysid uid   

     **Consulta pelo terminal**

     - lista todas as no banco de dados ' *roles criadas* **\du** ' 

     - mostra todas as rodes disponíveis dentro da role '**select * from pg_roles ;** ' 

     - **\q** sai do terminal

     - ***COMANDOS*** 

       limpar tela: **\\! cls** 

3. *Administrando acessos (GRANT)*

   - são privilégios de acesso aos objetos do banco de dados 

     **PRIVILÉGIOS :** 

     *--tabela                                                     --function*

     *--coluna*                                                    *--large object*

     *--sequence                                               --schema*

     *--database*                                                *--tablespace*

     *--domain*                                                   *--type*

     *--foreign data wrapper*

     *--foreign server*

     

*DATABASE:* é o banco de dados. Grupo de schemas e seus objetos, como types , views, funções, entre outros. Seus schemas e objetos não podem ser compartilhados apenas usuários / roles e configurações do cluster PostgreSQL .

*SCHEMA:* é um grupo de objetos, como tabelas, types, views, funções, entre outros. É possível relacionar objetos entre diversos schemas.

*OBJETOS:* são as tabelas, views, funções, types, sequences, entre outros pertencentes aos schemas. 

*TABELA:* é um conjunto de dados dispostos  em colunas e linhas referentes a um objeto comum.

*COLUNAS:* são considerados como "campos da tabela", como atributos da tabela.

*DML:* data manipulation language(DML), linguagem de manipulação de dados - INSERT, UPDATE, DELETE, SELECT.

*DDL:* data definition language (DDL), linguagem de definição de dados - CRIATE, ALTER, DROP.

**DML** / **CRUD:**  utilizado com condições de uso na tabela

**TRUNCATE:** esvazia tabela



## **Comandos de Seleção**

> ***Selecionar banco SELECT:*** parâmetro, parâmetro FROM tabela;
>
> **Ex: SELECT numero, nome FROM banco;**
>
> ***Selecionar todo o banco:*** SELECT * FROM nome da tabela
>
> ***Informação do conteúdo da tabela:*** SELECT * FROM information_schema.columns  WHERE table_name = 'banco';
>
> ***Informação das colunas:*** SELECT * FROM information_schema.columns  WHERE table_name = 'banco';

## *Funções agregadas*

***AVG*** - média da tabela

- select * from inf da tabela ;  ➡️  ex: select * from cliente_transacoes;  **OU** select avg (valor) from cliente_transacoes;

***COUNT (opção: HAVING)*** - contagem de dados

- select count (numero)
  from cliente;  **OU** 

  > select count (numero),email
  > from cliente
  > where email ilike '%gmail.com'
  > group by email;



***MAX*** - traz o maior número 

EX:

> select max (valor)
> from cliente_transacoes;

**OU**

>select max (valor),tipo_transacao_id
>from cliente_transacoes
>group by tipo_transacao_id;

***MIN*** - traz o menor número 

EX:

> select min (valor)
> from cliente_transacoes;  

**OU** 

> select min (valor),tipo_transacao_id
> from cliente_transacoes
> group by tipo_transacao_id;

***SUM*** - soma de todos os registros 

>select sum (valor)
>from cliente_transacoes;

**OU**

> select sum (valor),tipo_transacao_id
> from cliente_transacoes
> group by tipo_transacao_id;

E TAMBÉM

>select sum (valor),tipo_transacao_id
>from cliente_transacoes
>group by tipo_transacao_id
>order by tipo_transacao_id desc;

## **JOINs**

- *JOIN (INNER)* - seleciona os dados pertencentes a tabelas diferentes 

  >SELECT tabela1_.campos , tabela_2.campos
  >
  >FROM tabela_1
  >
  >JOIN tabela_2
  >
  >ON tabela_2.campo = tabela_1.campo

  

- *LEFT JOIN (OUTER)* - relaciona registros da esquerda para direita de tabelas A e B se houver 

  >SELECT tabela_1.campos, tabela_2.campos
  >
  >FROM tabela_1
  >
  >LEFT JOIN tabela_2
  >
  >ON tabela_2.campo = tabela_1.campo

  

- *RINGHT JOIN(OUTER)* -  relaciona registros da direita para esquerda de tabelas A e B se houver

  >SELECT tabela_1.campo, tabela_2.campo
  >
  >FROM tabela_1
  >
  >RIGHT JOIN tabela_2
  >
  >ON tabela_2.campo = tabela_1.campo

  

- *FULL JOIN (OUTER)* - traz todas as relações possíveis

  >SELECT tabela_1.campos, tabela_2.campos
  >
  >FROM tabela_1
  >
  >FULL JOIN tabela_2
  >
  >ON tabela_2.campo = tabela_1.campo
  >
  >

- *CROSS JOIN* -  todos os dados de uma tabela serão cruzados com todos os dados da tabela referente no CROSS JOIN criando uma matriz

  

  Exemplo de JOIN

  >SELECT tabela_1.campos, tabela_2.campos
  >
  >FROM tabela_1
  >
  >CROSS JOIN tabela_2

  >select 
  >banco.nome,
  >agencia.nome,
  >conta_corrente.numero, 
  >conta_corrente.digito,
  >cliente.nome
  >from banco
  >join agencia on agencia.banco_numero = banco.numero
  >join conta_corrente 
  >on conta_corrente.banco_numero = banco.numero
  >and conta_corrente.agencia_numero = agencia_numero
  >join cliente
  >	on cliente.numero = conta_corrente.cliente_numero;
  >
  >

  

  ## ***CTE - Common Table Expressions***

Forma auxiliar de organizar "statements", ou seja blocos de códigos, para consultar muito grandes, gerando tabelas temporárias e criando relacionamento entre elas.

Dentro dos statements podem ter SELECTs, INSERTs, UPDATEs ou DELETEs.

>WITH [nome1] AS (
>
>SELECT (campos,)
>
>FROM tabela_A
>
>[WHERE]
>
>),[nome2] AS(
>
>SELECET (campo,)
>
>FROM tabela_B
>
>[WRERE]
>
>)
>
>SELECT [nome1].(campo,) , [nome2] . (campos,)
>
>FROM [nome1]
>
>JOIN [nome2]...



## ***Views***

São visões .

São "camadas" para as tabelas.

São "alias" para uma ou mais queries.

Aceitam comandos de *SELECT*, *INSERT*, *UPDATE* E *DELETE*.

> CREATE [ OR REPLACE ]  [ TEMP | TEMPORARY ] [ RECURSIVE ] VIEW name [ (column_name[ ,... ] ) ]
>
> AS query
>
> [ WITH [ CASCADED | LOCAL ] CHECK OPTION ]



## ***Transações***

Conceito fundamental de todos os sistemas de banco de dados.

Conceito de múltiplas etapas / códigos reunidos em apenas 1 transação, onde o resultado precisa ser **tudo ou nada**.

Exemplo:

> **BEGIN;**
>
> UPDATE conta SET valor = valor -100.00
>
> WHERE nome = 'Alice'
>
> UPDATE conta SET valor = valor + 100.00
>
> WHERE nome = 'Bob';
>
> **COMMIT;** | **ROLLBACK;**



## **Funções**

Conjunto de códigos que são executados **dentro de uma transação** com a finalidade de facilitar a programação e obter o reaproveitamento / reutilização de códigos.

Existem 4 tipos de funções:

- query language functions (funções escritas em SQL)
- procedural language functions (funções escritas em, po exemplo, PL/pgSQL ou PL/py ) 
- internal functions 
- C - language functions 



























