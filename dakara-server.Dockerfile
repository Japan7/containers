FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY dakara_server dakara_server

EXPOSE 8000
ENTRYPOINT [ "dakara_server/manage.py" ]
CMD [ "runserver" ]
