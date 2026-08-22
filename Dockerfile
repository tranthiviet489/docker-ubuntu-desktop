FROM ubuntu

ARG UBUNTU_VERSION

ENV DEBIAN_FRONTEND=noninteractive

# 1. install neofetch, if failed -> fastfetch
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget sudo nano openssh-server dialog curl git python3 python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget -qO /bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 && \
    chmod +x /bin/ttyd

RUN mkdir -p /root/workspace


EXPOSE 8080

CMD ["/bin/bash", "-c", "/bin/ttyd -p 8080 /bin/bash"]
