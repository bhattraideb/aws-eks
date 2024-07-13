# Use the official Python 3.10 image as the base image
FROM python:3.10-alpine
LABEL maintainer="BhattraiDeb"

# set environment variables & Poetry
ENV PYTHONUNBUFFERED=1 \
    PYTHONFAULTHANDLER=1 \
    PYTHONHASHSEED=random \
    PYTHONDONTWRITEBYTECODE=1 \
    POETRY_CACHE_DIR=/opt/.cache \
    POETRY_VERSION=1.7.0 \
    POETRY_HOME=/opt/poetry \
    POETRY_VENV=/opt/poetry-venv

## Install poetry separated from system interpreter
RUN python3 -m venv $POETRY_VENV \
	&& $POETRY_VENV/bin/pip install -U pip setuptools \
	&& $POETRY_VENV/bin/pip install poetry==${POETRY_VERSION}

# Add `poetry` to PATH
ENV PATH="${PATH}:${POETRY_VENV}/bin"


# Set the working directory inside the container & Copy Application
COPY ./backend-api /app
#COPY ./scripts /scripts
WORKDIR /app

## Copy Dependencies
COPY ./backend-api/poetry.lock /backend-api/pyproject.toml ./

# Install the Python dependencies
RUN apk add --update curl jq
RUN pip install --upgrade pip
RUN pip install flake8 pytest
RUN poetry install --no-interaction --no-cache --without dev

# [OPTIONAL] Validate the project is properly configured
RUN poetry check

# Expose the port on which the Flask app will run
EXPOSE 5000
ENV FLASK_APP=app/backend_api

#RUN chmod +x /scripts/*

# Specify the command to run the application
#CMD ["entrypoint.sh"]
CMD [ "poetry", "run", "python", "-m", "flask", "run", "--host=0.0.0.0" ]

