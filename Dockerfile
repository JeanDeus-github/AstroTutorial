# Start your image with a node base image
FROM node:22-alpine

#copy project
COPY . /app

#add non-root user
RUN adduser -D -s /bin/sh devuser

# Add git
RUN apk add --no-cache git

# Give user ownership of app folder
RUN chown -R devuser:devuser /app

# The /app directory should act as the main application directory
WORKDIR /app

USER devuser

RUN npm i
RUN npm run build
