FROM node:14

# Install necessary tools
RUN apt-get update && apt-get install -y openssh-client

# Add GitHub's SSH key to known hosts
RUN mkdir -p ~/.ssh && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Set working directory
WORKDIR /workspace

