# The first instruction is what image we want to base our container on
# We Use an official Python runtime as a parent image
FROM python:3.10-alpine as base

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
RUN apk add --update --virtual .build-deps \
    build-base \
    postgresql-dev \
    python3-dev \
    libpq

WORKDIR /app

RUN adduser -D -g "" -H -s "/sbin/nologin"  -u 10001 goldenuser

COPY requirements.txt .

RUN pip3 install --upgrade pip --user && pip3 install -r requirements.txt 

COPY . .

RUN chown -R goldenuser start.sh

USER goldenuser

EXPOSE 8009

RUN chmod +x start.sh

ENTRYPOINT "./start.sh"