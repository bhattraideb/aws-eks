#!/bin/bash

set -e

DJANGO_SUPER_USER_EMAIL=${SUPER_USER_EMAIL:-"hello@gmail.com"}

cd /app/
poetry run python manage.py migrate --noinput
poetry run python manage.py createsuperuser --email $DJANGO_SUPER_USER_EMAIL --noinput || true
