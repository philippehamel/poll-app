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
# Install system dependencies first
brew install postgresql openssl python@3.11

# Create and activate virtual environment
python3.11 -m venv .venv
source .venv/bin/activate

# Set required environment variables for psycopg2 installation
export LDFLAGS="-L$(brew --prefix openssl)/lib"
export CPPFLAGS="-I$(brew --prefix openssl)/include"

# Install requirements
pip install --upgrade pip wheel setuptools
pip install -r requirements.txt

# Run Django server
python manage.py migrate
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