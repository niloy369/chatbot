FROM continuumio/miniconda3:latest

RUN apt-get update \
    && apt-get install g++ libc6-dev-i386 -y

EXPOSE 5000

RUN mkdir /home/chatbot

WORKDIR /home/chatbot

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt \
    && python -m spacy download en


CMD [ "flask", "run", "--host=0.0.0.0" ]
