[![Python](https://img.shields.io/badge/Python-3.12.2-3776AB?style=flat&logo=Python&logoColor=yellow)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.115.4-009688?style=flat&logo=fastapi&logoColor=white)](https://fastapi.tiangolo.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL--336791?style=flat&logo=PostgreSQL&logoColor=white)](https://www.postgresql.org/)
[![SQLAlchemy](https://img.shields.io/badge/SQLAlchemy-2.0.36-D71F00?style=flat&logo=sqlalchemy&logoColor=white)](https://www.postgresql.org/)
[![Docker](https://img.shields.io/badge/Docker--2496ED?style=flat&logo=Docker&logoColor=white)](https://www.docker.com/)
[![Uvicorn](https://img.shields.io/badge/Uvicorn-0.32-499848?style=flat&logo=gunicorn&logoColor=white)](https://www.uvicorn.org/)

# AIReserve: AI-Powered Meeting Room Reservation System

## Table of Contents

- [Project Description](#Project-Description)
- [Requirements](#Requirements)
- [Quick Start](#Quick-Start)
- [Project Structure](#Project-Structure)
- [API Endpoints](#API-Endpoints)
- [Implemented Makefile Commands](#Implemented-Makefile-Commands)
- [License](#license)

## Project Description

**AIReserve** is a high-performance, asynchronous API designed for booking meeting rooms in large corporate offices. It enables employees to quickly and easily reserve spaces, with real-time availability checks to prevent booking conflicts. Built for scalability and high demand, **AIReserve** offers an efficient and streamlined way to manage meeting spaces in bustling office environments.

***Why AIReserve?***

**AIReserve** stands out for its speed, user-friendliness, and robust conflict prevention. It easily handles a high volume of simultaneous users, ensuring fast response times. Role-based access provides secure, flexible control for both administrators and regular users, making **AIReserve** a top choice for large office centers.

### Key Features:
- ***Real-Time Availability Checks:***
Instantly confirms room availability, preventing double bookings and scheduling conflicts.

- ***Role-Based Access Control:***
Allows administrators to manage settings and reservations, while regular users can book available rooms.

- ***Scalable, Asynchronous Architecture:***
Efficiently processes numerous requests at once, ensuring reliable, fast performance.

- ***Detailed Room Information:***
Displays room capacity, location, and amenities, helping users find the most suitable space.

- ***Centralized Reservation Management:***
A single interface for all bookings, making it easy to manage, view, and update reservations.

***AIReserve** is a powerful and effective solution for modern workplaces, simplifying meeting room bookings and fostering a more productive environment for all.*


## Requirements
*To use this app, ensure you have the following installed on your machine:*

- ***Docker:*** Required for containerizing the Django application and PostgreSQL database.
  - [Install Docker](https://docs.docker.com/get-docker/)
- ***Docker Compose:*** Used to manage multiple Docker containers in a single setup.
  - Docker Desktop includes Docker Compose. Alternatively, install it separately: [Docker Compose Installation](https://docs.docker.com/compose/install/)
- ***Make:*** Allows simplified command execution using the Makefile.
  - *Linux/macOS:* Make is usually pre-installed. If not, install it via your package manager:
```sh
   # Ubuntu/Debian
   sudo apt install make

   # macOS (with Homebrew)
   brew install make
```
  - *Windows:* Use make with [Git Bash](https://gitforwindows.org/) or [WSL](https://docs.microsoft.com/en-us/windows/wsl/install) (Windows Subsystem for Linux).

## Quick Start

1. **Clone the repository:**

   ```sh
   git clone https://github.com/dev-lymar/AIReserve
   cd AIReserve/
   ```

2. Setup environment variables from .env.example:
```sh
    cp .env.example .env
```

3. Run project
```sh
   make app
```

## Project Structure

*The project structure is organized to keep core components isolated and manageable:*

```sh
.
├── .env
├── alembic/
├── alembic.ini
├── Dockerfile
├── entrypoint.sh
├── Makefile
├── pyproject.toml
├── LICENSE
├── README.md
├── app
│   ├── api/
│   │   ├── endpoints/
│   │   │   └── ...
│   │   ├── validators.py
│   │   └── routers.py
│   ├── core/
│   │   ├── base.py
│   │   ├── config.py
│   │   ├── db.py
│   │   └── user.py
│   ├── crud/
│   │    └── ...
│   ├── models/
│   │    └── ...
│   ├── schemas/
│   │    └── ...
│   └── main.py
└── docker_compose
    ├── app.yaml
    ├── db.yaml
    └── docker-compose.prod.yaml
```

## API Endpoints

#### Meeting Rooms
- **POST** `/api/v1/meeting_rooms/` — Create a new meeting room (superuser only).
- **GET** `/api/v1/meeting_rooms/` — Retrieve a list of all meeting rooms.
- **PATCH** `/api/v1/meeting_rooms/{meeting_room_id}` — Partially update meeting room details (superuser only).
- **DELETE** `/api/v1/meeting_rooms/{meeting_room_id}` — Delete a meeting room (superuser only).

#### Reservations
- **POST** `/api/v1/reservations/` — Create a new reservation for a meeting room.
- **GET** `/api/v1/reservations/` — Retrieve all reservations (superuser only).
- **DELETE** `/api/v1/reservations/{reservation_id}` — Delete a reservation (available to superusers or reservation creator).
- **PATCH** `/api/v1/reservations/{reservation_id}` — Update an existing reservation (available to superusers or reservation creator).
- **GET** `/api/v1/meeting_rooms/{meeting_room_id}/`reservations — Retrieve future reservations for a specific meeting room.
- **GET** `/api/v1/reservations/my_reservations` — Retrieve all reservations for the current user.

#### Users & Authentication
- **POST** `/api/v1/auth/jwt/login` — User login.
- **POST** `/api/v1/auth/register` — Register a new user.
- **GET** `/api/v1/users/` — Manage users (superuser only).


## Implemented Makefile Commands

* `make app` - Starts the application and database infrastructure.
* `make app-logs` - Follow the logs in app container.
* `make app-container` - Connects to the application container for interactive commands.
* `make app-down` - Down application and all infrastructure.

* `make db` - Up only infrastructure. You should run your application locally for debugging/developing purposes.
* `make db-logs` - Follow the logs in storages containers.
* `make db-down` - Down all infrastructure.
* `make postgres` - Enter postgres container.

* `make migrate` - Runs database migrations inside the app container.

* `make app-prod` - Launches the application in production mode with production-specific settings.
* `make app-prod-down` - Stops and removes the production setup.
* `make nginx-logs` - Show logs for Nginx container.

## License

This project is licensed under the MIT License. See the LICENSE file for more information.
