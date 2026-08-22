FROM ubuntu 

ARG DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && \ 
    apt-get upgrade -y && \ 
    apt-get install -y wget curl git python3 python3-pip nodejs npm vim nano htop build-essential && \ 
    apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN wget --tries=3 --timeout=30 -qO /bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 && \ 
    chmod +x /bin/ttyd 

EXPOSE 8080

# Thêm lệnh CMD để chạy ttyd trên cổng 8080 với giao diện bash shell
CMD ["ttyd", "-p", "8080", "bash"]
