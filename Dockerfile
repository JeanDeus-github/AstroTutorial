# Start your image with a node base image
FROM node:24-slim

# The /app directory should act as the main application directory
WORKDIR /app

#copy project
 COPY . .

# add non-root user
RUN useradd -m -r -s /bin/bash devuser


# update the image
RUN apt-get update && apt-get upgrade -y git && rm -rf /var/lib/apt/lists/*
    
# Add git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Give user ownership of app folder
RUN chown -R devuser:devuser /app

#set devuser as the current user
USER devuser

# Git setup & pull
RUN git config --global --add safe.directory /workspaces/AstroTutorial
RUN git pull

# # restore packages & build
RUN npm install
RUN npm run build
