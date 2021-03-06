FROM python:3.8.2

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       postgresql-client \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
RUN pip install -r /app/requirements.txt
# RUN chmod 755 /app/start
WORKDIR /app
EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]