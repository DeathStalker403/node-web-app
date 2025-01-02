FROM node:10

# Create app directory
WORKDIR /usr/src/app

# Set npm cache directory to a location that won't have ownership issues
ENV NPM_CONFIG_CACHE=/usr/src/app/.npm

# Install app dependencies
COPY package*.json ./

# Create the .npm directory and set correct ownership for OpenShift user (UID 1000820000)
RUN mkdir -p /usr/src/app/.npm && \
    chown -R 1000820000:0 /usr/src/app/.npm && \
    npm install

# Bundle app source
COPY . .

EXPOSE 8080
CMD [ "node", "server.js" ]
