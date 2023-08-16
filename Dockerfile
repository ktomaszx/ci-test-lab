# Use a minimal base image
FROM summerwind/actions-runner-dind:v2.307.1-ubuntu-20.04

# Specify the command to echo something
# Install the AWS CLI v2
RUN sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    sudo unzip -q awscliv2.zip && \
    sudo ./aws/install && \
    sudo rm -rf awscliv2.zip aws

# Install necessary packages
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/

# Install helm
RUN curl -LO "https://get.helm.sh/helm-v3.7.1-linux-amd64.tar.gz" && \
    tar -zxvf helm-v3.7.1-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/ && \
    rm -rf linux-amd64 helm-v3.7.1-linux-amd64.tar.gz

# Specify the command to run when the container starts
CMD [ "aws --version"]