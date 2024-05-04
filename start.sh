#!/bin/sh

# Start Gunicorn processes
echo Starting Gunicorn.

# echo Migrating Database Models
# python manage.py makemigrations &&
# python manage.py migrate 

# python manage.py runserver 8009
exec /usr/local/bin/gunicorn --chdir /app goldenapi.wsgi:application \
    --bind 0.0.0.0:8009 \
    --workers 1

    # echo Loading Database With Questions &
    # python manage.py loaddata recharge/fixtures/recharge.json --app recharge
