# Start with Amazon Linux as the base image
FROM amazonlinux:2023

# Update the package repository and install Node.js
RUN yum update -y && \
    curl -sL https://rpm.nodesource.com/setup_14.x | bash - && \
    yum install -y nodejs

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY ["package.json", "package-lock.json", "/app/"]

# Install NPM packages
RUN npm install

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Copy the rest of your application
COPY . /app

# Command to run the application
CMD ["npm", "run", "start"]