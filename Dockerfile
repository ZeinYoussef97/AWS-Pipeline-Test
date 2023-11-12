# stage 1
FROM node:latest as node
LABEL desc="docker image of angular 9 app"
WORKDIR /app
COPY ["package.json","package-lock.json","/app/"]
RUN npm install
RUN npm install -g @angular/cli

# stage 2
COPY . /app
RUN ng build
CMD ng serve --host 0.0.0.0 --port 4200

