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
- createuser
- dropdb
- dropuser
- initdb
- pg_ctl
- pg_basebackup
- pg_dump / pg_dumpall
- pg_restore
- psql
- reindexdb
- vacuumdb 

**Cluster :**  "ARQUITETURA / HIERARQUIA"- coleção de banco de dados que compartilham as mesmas configurações (arquivos de configurações📂) do PostgreSQL e do sistema operacional (porta, listen_addresses, etc...)

### **PGAdmin**

*Importância para conexão*

1. Liberar acesso ao cluser em postgresql.conf
2. Liberar acesso ao cluster para usuário do banco de dados em pg_hba.conf
3. Criar / editar usuário

### ***Criando banco 🎲***

1. seleciona SERVERS
2. Object ➡️ Create ➡️ Server Group
3. Seleciona banco criado ➡️ Object ➡️ Create ➡️ Server
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

     

