FROM python:3.11-slim@sha256:ce81dc539f0aedc9114cae640f8352fad83d37461c24a3615b01f081d0c0583a

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY dakara_server dakara_server

EXPOSE 8000
ENTRYPOINT [ "dakara_server/manage.py" ]
CMD [ "runserver" ]
