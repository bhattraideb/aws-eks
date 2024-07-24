#!/bin/sh

set -e

APP_PORT=${PORT:-8000}
cd /app/
#/opt/poetry-venv/bin/gunicorn --worker-tmp-dir /dev/shm django_api.wsgi:application --bind "0.0.0.0:${APP_PORT}"
poetry run python manage.py runserver 0.0.0.0:8000