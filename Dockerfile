FROM python:3.9.6
COPY . ./app
WORKDIR ./app
RUN apt update
RUN apt-get update && apt-get install -y sudo
RUN sudo apt install ffmpeg -y
RUN apt-get install chromium -y
RUN pip install -r requirements.txt
RUN webdrivermanager chrome
