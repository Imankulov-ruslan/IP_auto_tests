FROM python:3.9.6
COPY . ./app
WORKDIR ./app
RUN apt update
RUN apt install sudo
RUN apt-get install chromium -y
RUN pip install -r requirements.txt
RUN webdrivermanager chrome
