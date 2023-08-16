# Use a minimal base image
FROM summerwind/actions-runner-dind:v2.307.1-ubuntu-20.04

# Specify the command to echo something
# Install the AWS CLI v2
RUN sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    sudo unzip awscliv2.zip && \
    sudo ./aws/install && \
    sudo rm -rf awscliv2.zip aws

# Specify the command to run when the container starts
CMD [ "aws", "--version" ]