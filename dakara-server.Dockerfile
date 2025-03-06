FROM python:3.13-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt 'psycopg[binary,pool]'

COPY dakara_server dakara_server

# compile all modules ahead of time
RUN python -c 'import sys; import compileall; [compileall.compile_dir(d) for d in sys.path]'

EXPOSE 8000
ENTRYPOINT [ "dakara_server/manage.py" ]
CMD [ "runserver" ]
