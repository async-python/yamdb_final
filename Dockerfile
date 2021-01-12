FROM python:3.9-slim
WORKDIR /code
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
RUN python manage.py collectstatic --no-input
CMD python manage.py migrate && gunicorn api_yamdb.wsgi -b 0.0.0.0:8000