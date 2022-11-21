FROM python:3

RUN useradd -m -d /app backend
RUN apt-get -q update -y && apt-get -q install -y gettext-base
USER backend
WORKDIR /app/src

COPY . .
RUN python -m pip install -r ./requirements.txt

COPY backend.conf .
EXPOSE 8000
CMD ["/bin/bash", "start.sh"]