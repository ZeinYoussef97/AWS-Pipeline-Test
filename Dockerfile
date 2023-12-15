# stage 1
FROM node:latest as node
LABEL desc="docker image of angular 9 app"
WORKDIR /app
COPY ["package.json","package-lock.json","/app/"]
RUN npm install
RUN npm install -g @angular/cli

# stage 2
COPY . /app
CMD ["npm" , "start" ]
