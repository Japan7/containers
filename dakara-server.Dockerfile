FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt 'psycopg[binary,pool]'

COPY dakara_server dakara_server

# compile all modules ahead of time
RUN python -m compileall dakara_server

EXPOSE 8000
ENTRYPOINT [ "dakara_server/manage.py" ]
CMD [ "runserver" ]
