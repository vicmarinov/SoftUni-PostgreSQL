PostgreSQL
==========

This repository contains my solutions to the problems provided during the lectures and exercises in the [PostgreSQL](https://softuni.bg/trainings/4974/postgresql-may-2026) course at [SoftUni](https://softuni.bg). All solutions here can be successfully tested with SoftUni's [Alpha Judge system](https://alpha.judge.softuni.org).

🛠️ Technologies & tools used
---------------------------

- PostgreSQL
- JetBrains DataGrip
- pgAdmin 4
- Docker & Docker Compose (for local database setup)

🚀 How to run the local database
--------------------------------

The repository includes a [`docker-compose.yml`](./docker-compose.yml) file for a quick local setup of PostgreSQL and pgAdmin. To start the services:

1. Copy the [`.env.example`](./.env.example) file to `.env` and fill in your desired credentials.
2. Run `docker compose up` in the repository root directory.
3. The database will be accessible on port `5432`, and pgAdmin will be available at `http://localhost:5050`.

📚 Course structure
------------------

| Lesson topic                                                | Lesson type | Date         |
| ----------------------------------------------------------- | ----------- | ------------ |
| PostgreSQL Introduction, Data Types and Working with Tables | lecture     |  12 May 2026 |
| PostgreSQL Introduction, Data Types and Working with Tables | exercise    |  14 May 2026 |
| Basic CRUD                                                  | lecture     |  15 May 2026 |
| Basic CRUD                                                  | exercise    |  18 May 2026 |
| Built-in Functions                                          | lecture     |  19 May 2026 |
| Built-in Functions                                          | exercise    |  21 May 2026 |
| Data Aggregation                                            | lecture     |  22 May 2026 |
| Data Aggregation                                            | exercise    |  28 May 2026 |
| Table Relations                                             | lecture     |  29 May 2026 |
| Table Relations                                             | exercise    |  1 June 2026 |
| Subqueries and JOINs                                        | lecture     |  2 June 2026 |
| Subqueries and JOINs                                        | exercise    |  4 June 2026 |
| Database Programmability and Transactions                   | lecture     |  5 June 2026 |
| Database Programmability and Transactions                   | exercise    |  8 June 2026 |
| Supabase                                                    | workshop    | 11 June 2026 |