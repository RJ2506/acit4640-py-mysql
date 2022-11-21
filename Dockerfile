FROM python:3

RUN useradd -m -d /app backend

USER backend
WORKDIR /app/src

COPY . .
RUN python -m pip install -r ./requirements.txt

COPY backend.conf .
EXPOSE 8080
CMD /app/.local/bin/gunicorn wsgi:app -b 0.0.0.0:8080