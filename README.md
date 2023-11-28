# Agro Sales API

Product
- name
- category
- price
- description

User
- name
- username
- password
- role

Categories
- name
- products


### Setting up project in MVC

- controllers
- routes
- prisma (models)

### Using Prisma

- Install Prisma
```bash
npm install prisma --save-dev
```
- You need to create a Database
- Have a database connection URL

- Execute Prisma to see all the commands that you can use
```bash
npx prisma
```

- Create project with prisma; this create schema file in prisma folder & .env file
```bash
npx prisma init
```

## Next steps:
1. Set the DATABASE_URL in the .env file to point to your existing database. If your database has no tables yet, read https://pris.ly/d/getting-started
2. Set the provider of the datasource block in schema.prisma to match your database: postgresql, mysql, sqlite, sqlserver, mongodb or cockroachdb.
4. Run **prisma generate** to generate the Prisma Client. You can then start querying your database.

### Create DB

- Open postgreSQL terminal (psql)

Common Commands
* \!cls = clear
* \l = List all DBs
*  CREATE DATABASE database-name;
* \c db-name = connect to your db
* \dt = list database tables

## PostgreSQL DB URL
DATABASE_URL="postgresql://username:password@localhost:5432/database-name?schema=public"


## Create a Database Schema

- Get yourself the prisma vscode extension

## Data Model Definition
https://www.prisma.io/docs/concepts/components/prisma-schema/data-model

## Create migrate files and Prisma Client

```bash
npx prisma migrate dev --name initial
```

## Query the Database
const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()


# Deploying App to render
Render is a PaaS (Platform As A Service).  



## Database
if you had data locally and you want to add data to it, you do the following
- Run migrations against new DB
```bash
npx prisma migrate deploy
```
- create a database dump

```bash
pg_dump --host=localhost --port=5432 --username=postgress --dbname=mydb > db_export.sql
```

then to import that sql file into the remot db, you need to access the DB from PSQL
then run the following command
```bash
\i db_export.sql
```

## Using JWT
Docs: https://github.com/auth0/node-jsonwebtoken

### Sign a Token
jwt.sign(payload, secretOrPrivateKey, {})

### Verify
jwt.verify(token, secretOrPublicKey, [options, callback])



C:\Users\hp\Desktop\backend-bootcamp\agro-sales-api\agro_db_export.sql