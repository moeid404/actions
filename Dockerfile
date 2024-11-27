# Base image
FROM node:16

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY ./src/package*.json ./
RUN npm install

# Copy application files
COPY ./src .

# Expose application port
EXPOSE 3000

# Command to run the app
CMD ["npm", "start"]
