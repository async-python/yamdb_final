![yamdb_workflow](https://github.com/vardeath/yamdb_final/workflows/yamdb_workflow/badge.svg)
# Yamdb API
## Provides an API for the YaMDb service, a database of reviews of movies, books, and music.

### User role:
- Anonymous — can view descriptions of works, read reviews and comments.
- Authenticated user (user) — can read everything, as well as Anonymous, can additionally publish reviews and rate works (movies/books/songs), can comment on other people's reviews and give them ratings; can edit and delete their reviews and comments.
- Moderator (moderator) — the same rights as an Authenticated user, plus the right to delete and edit any reviews and comments.
- Administrator (admin) — full rights to manage the project and all its contents. Can create and delete works, categories, and genres. Can assign roles to users.
- Django administrator — the same rights as the Administrator role.

### User registration algorithm:
- The user sends a POST request with the email parameter to / api/v1/auth/email/.
- YaMDB sends an email with a confirmation code (confirmation_code) to the email address.
- The user sends a POST request with the email and confirmation_code parameters to /api/v1/auth/token/, and receives a token (JWT token) in response to the request.

## Detailed API documentation
Available at the local address: 127.0.0.1/redoc/ when the app is running.

## This is a Docker setup for a web application based on Django.
- The [Django] application is served by [Gunicorn] (WSGI application).
- We use [NginX] as reverse proxy and static files server. Static and media files are
  persistently stored in volumes.
- We use the [Postgres] database. Data is permanently stored in volumes.

##Requirements
You need to install [Docker] and [Docker-Compose].

## Build
`docker-compose build`

## Migrate databases
`docker-compose run --rm web python manage.py migrate`

## Collect static files
`docker-compose run --rm web python manage.py collectstatic --no-input`

## Run
`docker-compose up`

## Create superuser
`docker-compose run --rm web python manage.py createsuperuser`

## Load fixture data
`docker-compose run --rm web python manage.py loaddata fixtures.json`

[Docker]: https://www.docker.com/
[Django]: https://www.djangoproject.com/
[Gunicorn]: http://gunicorn.org/
[NginX]: https://www.nginx.com/
[Postgres]: https://www.postgresql.org/
[Docker-Compose]: https://docs.docker.com/compose/