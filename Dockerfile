# Use a minimal base image
FROM alpine:latest

# Specify the command to echo something
# Install the AWS CLI v2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install && \
    rm -rf awscliv2.zip aws

# Specify the command to run when the container starts
CMD [ "aws", "--version" ]