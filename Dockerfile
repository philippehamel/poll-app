# Dockerfile
FROM python:3.11-slim

# set workdir
WORKDIR /code

# install system deps (e.g. for psycopg2)
RUN apt-get update \
 && apt-get install -y --no-install-recommends gcc libpq-dev \
 && rm -rf /var/lib/apt/lists/*

# copy & install Python deps
COPY requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# copy project
COPY . /code/

# expose port
EXPOSE 8000

# default command (you can override in docker-compose)
CMD ["gunicorn", "app/wsgi:application", "--bind", "0.0.0.0:8000"]
