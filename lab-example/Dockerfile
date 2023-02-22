FROM node:18

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY app/package*.json ./

# Install packages
RUN npm install

# Bundle app source
COPY app .

# Expose port
EXPOSE 8443

# Run as non-root user
USER 1000:1000

# Start app
CMD [ "npm", "start" ]
