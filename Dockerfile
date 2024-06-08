FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3-full \
    python3-pip \
    python3-venv \
    git

RUN python3 -m venv /appenv && \
    . /appenv/bin/activate && \
    pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]