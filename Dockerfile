FROM debian:latest

RUN apt update && apt upgrade -y && \
    apt install -y git python3 python3-pip curl wget unzip tmux && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com /app

WORKDIR /app
RUN pip3 install -r requirements.txt --break-system-packages

# Render ko fake port dikhane ke liye taaki deploy fail na ho
EXPOSE 8080

CMD python3 maxphisher.py --noupdate
