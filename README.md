# poll-app

## Local Development

### Using Docker (recommended)
```bash
# Build and start the containers
docker-compose up --build

# To run in detached mode
docker-compose up -d

# To stop the containers
docker-compose down
```

### Using Virtual Environment
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
python manage.py runserver
```

### Useful Docker Commands
```bash
# View logs
docker-compose logs -f

# Run Django management commands
docker-compose exec web python manage.py migrate
docker-compose exec web python manage.py createsuperuser

# Rebuild containers after requirements.txt changes
docker-compose build --no-cache
```