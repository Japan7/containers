FROM python:3.14-alpine

WORKDIR /app

RUN --mount=type=bind,source=requirements.txt,target=requirements.txt \
    pip install --no-cache-dir -r requirements.txt 'psycopg[binary,pool]'

COPY dakara_server dakara_server

# compile all modules ahead of time
RUN python -m compileall dakara_server

ENTRYPOINT [ "dakara_server/manage.py" ]
CMD [ "runserver" ]
EXPOSE 8000
