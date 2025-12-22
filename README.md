<h1 align="center">
    MySQL with Docker (Docker puro)
</h1>
<p align="center">
  <a href="#-sobre">Sobre</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-tecnologias">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-como-executar">Como executar</a>
</p>

<h5 style="text-align: center"> Obrigado por visitar este repositório! </h5>

---

## 📚 Sobre

Olá! 👋
Este repositório foi criado com o objetivo de **fixar e demonstrar meus conhecimentos em MySQL utilizando Docker puro (sem Docker Compose)**, rodando em ambiente **Ubuntu**.

O foco do projeto é mostrar, de forma prática e organizada, que eu compreendo:

* Como subir um container MySQL usando apenas `docker run`
* Como acessar o container via terminal (`docker exec`)
* Como utilizar o cliente MySQL dentro do container
* Criação de banco de dados e tabelas
* Inserção de dados (linha única e múltiplas linhas)
* Consulta de dados via `SELECT`
* Uso de `AUTO_INCREMENT` para geração automática de IDs
* Conexão e visualização do banco tanto pelo **terminal** quanto pelo **MySQL Workbench**
* Uso do comando `USE testDB` para definir o banco de dados ativo
* Aplicação da restrição `NOT NULL` para garantir que campos obrigatórios não aceitem valores nulos
* Aplicação da restrição `UNIQUE` para evitar duplicidade de dados (e-mail)
* Definição de chaves primária (PRIMARY KEY) para identificação única dos registros

Este projeto não tem foco em aplicação web ou API, mas sim em **ambiente, banco de dados e fundamentos**, simulando o que é feito no dia a dia de desenvolvimento.

---

## 📁 Estrutura do projeto

```
mysql-docker-ubuntu/
├─ README.md
└─ sql/
   ├─ 00-create-database.sql
   ├─ 01-create-table-people.sql
   └─ 02-insert-people.sql
```

Os arquivos SQL estão organizados por **ordem lógica de execução**, facilitando entendimento e reaproveitamento.

---

## 🧪 Tecnologias

Esse projeto foi desenvolvido usando as seguintes tecnologias:

* [Docker](https://www.docker.com/)
* [MySQL](https://www.mysql.com/)
* [Ubuntu](https://ubuntu.com/)
* [MySQL Workbench](https://www.mysql.com/products/workbench/)

---

## 🚀 Como executar

### 1️⃣ Subir o MySQL com Docker puro

⚠️ **Observação sobre a senha**
Neste projeto, a senha foi definida diretamente no comando apenas para fins de **estudo e aprendizado**.

Em ambientes reais de produção, o ideal é não versionar senhas, utilizando variáveis de ambiente externas `.env`, secrets ou ferramentas de gerenciamento seguro.

```bash
$ docker run -e MYSQL_ROOT_PASSWORD=senha \
  --name mysql-A \
  -d \
  -p 3308:3306 \
  mysql
```

Esse comando:

* cria e inicia um container MySQL
* define a senha do usuário root
* expõe a porta 3306 do container na porta 3308 do host
* executa o container em background

---

### 2️⃣ Acessar o container

```bash
$ docker exec -it mysql-A bash
```

Dentro do container:

```bash
$ mysql -u root -p
```

---

### 3️⃣ Criar o banco de dados

```sql
CREATE DATABASE testDB;
SHOW DATABASES;
```

---

### 4️⃣ Criar tabela

```sql
USE testDB;

CREATE TABLE People (
  PersonID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(100) UNIQUE,
  Lastname VARCHAR(255) NOT NULL,
  Country VARCHAR(255)
);
```

---

### 5️⃣ Inserir dados

Múltiplos registros:

```sql
INSERT INTO People (Name, Lastname, Country)
VALUES
('Fernando', 'Santos', 'Brasil', 'fernandozs@email.com'),
('Alice', 'Sebastiana', 'Mexico');
```

Ou um por vez:

```sql
INSERT INTO People (Name, Lastname, Country)
VALUES ('Fernando', 'Santos', 'Brasil');
```

---

### 6️⃣ Consultar dados

```sql
SELECT * FROM People;
```

---

## 🖥️ Visualização no MySQL Workbench

Para conectar no MySQL usando o Workbench:

* **Host:** 127.0.0.1
* **Port:** 3308
* **Username:** root
* **Password:** senha

Dessa forma é possível visualizar e manipular os dados tanto pelo **terminal** quanto pela interface gráfica.

---

## 📌 Considerações finais

Este repositório representa o processo de aprendizado em **banco de dados e containers**, reforçando conceitos fundamentais que são amplamente utilizados no mercado, como:

* ambientes reproduzíveis
* isolamento com containers
* comandos essenciais do MySQL
* organização de scripts SQL

---

---

## 📘 About

Hello! 👋
This repository was created to **practice and demonstrate my knowledge of MySQL using pure Docker (without Docker Compose)**, running on an **Ubuntu** environment.

The main goal of this project is to show, in a clear and practical way, that I understand:

* How to start a MySQL container using only `docker run`
* How to access the container using `docker exec`
* How to use the MySQL client inside the container
* Database and table creation
* Data insertion (single and multiple rows)
* Data querying using `SELECT`
* Usage of `AUTO_INCREMENT` for automatic ID generation
* Connecting and visualizing the database using both **terminal** and **MySQL Workbench**
* Using the `USE testDB` command to set the active database
* Applying the `NOT NULL` constraint to ensure that required fields do not accept null values
* Applying the `UNIQUE` constraint to avoid data duplication (email)
* Defining primary keys (PRIMARY KEY) for unique identification of records

This project is not focused on building a web application or API, but rather on **database fundamentals and containerized environments**, simulating real-world development scenarios.

---

### 📁 Project structure

```
mysql-docker-ubuntu/
├─ README.md
└─ sql/
   ├─ 00-create-database.sql
   ├─ 01-create-table-people.sql
   └─ 02-insert-people.sql
```

The SQL files are organized by **logical execution order**, improving readability and reuse.

---

## 🧪 Technologies

This project was developed using the following technologies:

* [Docker](https://www.docker.com/)
* [MySQL](https://www.mysql.com/)
* [Ubuntu](https://ubuntu.com/)
* [MySQL Workbench](https://www.mysql.com/products/workbench/)

---

### 🚀 How to run

#### 1️⃣ Start MySQL using pure Docker

⚠️ **Note about the password**
In this project, the password was set directly in the command for **study and learning** purposes only.

In real production environments, it is best not to version passwords, using external environment variables `.env`, secrets, or secure management tools.

```bash
$ docker run -e MYSQL_ROOT_PASSWORD=senha \
  --name mysql-A \
  -d \
  -p 3308:3306 \
  mysql
```

This command:

* creates and starts a MySQL container
* sets the root password
* maps container port 3306 to host port 3308
* runs the container in detached mode

---

#### 2️⃣ Access the container

```bash
$ docker exec -it mysql-A bash
```

Inside the container:

```bash
$ mysql -u root -p
```

---

#### 3️⃣ Create Database

```sql
CREATE DATABASE testDB;
SHOW DATABASES;
```

---

### 4️⃣ Create Table

```sql
USE testDB;

CREATE TABLE People (
  PersonID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(100) UNIQUE,
  Lastname VARCHAR(255) NOT NULL,
  Country VARCHAR(255)
);
```

---

#### 5️⃣ Insert data

Multiple records:

```sql
INSERT INTO People (Name, Lastname, Country)
VALUES
('Fernando', 'Santos', 'Brasil', 'fernandozs@email.com'),
('Alice', 'Sebastiana', 'Mexico');
```

Or:

```sql
INSERT INTO People (Name, Lastname, Country)
VALUES ('Fernando', 'Santos', 'Brasil');
```

---

### 6️⃣ Query data

```sql
SELECT * FROM People;
```

---

## 🖥️ Viewing in MySQL Workbench

To connect to MySQL using Workbench:

* **Host:** 127.0.0.1
* **Port:** 3308
* **Username:** root
* **Password:** senha

This way, it's possible to view and manipulate the data both through the terminal and the graphical interface.

---

## 📌 Final considerations

This repository represents the learning process in **databases and containers**, reinforcing fundamental concepts that are widely used in the market, such as:

* Reproducible environments
* Isolation with containers
* Essential MySQL commands
* Organization of SQL scripts

---

Developed by ⚙️ **Arthur Silva**
[GitHub](https://github.com/arthursj) ⚙️ **Arthur Silva**
[GitHub](https://github.com/arthursj)
