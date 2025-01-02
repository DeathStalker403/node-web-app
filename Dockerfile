FROM node:10

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

# Clean npm cache before installing dependencies (optional)
RUN npm cache clean --force && \
    npm install

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
