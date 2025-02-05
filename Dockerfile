# syntax=docker/dockerfile:1

FROM python:3.9.5-slim-buster

WORKDIR /django-app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc

COPY requirements.txt requirements.txt

RUN pip install --upgrade pip \
    && pip install -r requirements.txt

COPY . .

ENTRYPOINT [ "./scripts/docker-entrypoint.sh" ]
