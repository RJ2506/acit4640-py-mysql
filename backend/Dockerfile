FROM python:3

RUN useradd -m -d /app backend
RUN apt-get -q update -y && apt-get -q install -y gettext-base

USER backend
WORKDIR /app

COPY . .
RUN python -m pip install -r ./requirements.txt

COPY backend.conf.template .
COPY start.sh .

RUN wget -qq https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && chmod a+x wait-for-it.sh
EXPOSE 8000
CMD ["/bin/bash", "start.sh"]