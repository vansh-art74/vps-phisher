FROM debian:latest

RUN apt update && apt upgrade -y && \
    apt install -y git python3 python3-pip curl wget unzip tmux && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/KasRoudra/MaxPhisher.git /app/

WORKDIR /app
RUN pip3 install -r requirements.txt --break-system-packages

EXPOSE 8080

CMD ["tail", "-f", "/dev/null"]
