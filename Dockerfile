FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y \
    curl \
    gnupg \
    lsb-release \
    git

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

RUN kubectl version --client

ENTRYPOINT ["bash"]
