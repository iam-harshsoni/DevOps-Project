FROM node:17.4.0 AS builder

LABEL maintainer="HarshSoni"

WORKDIR /app

COPY package*.json ./

RUN npm install && npm cache clean --force

COPY . .

#--------------------------------------------------------

FROM node:17.4.0-slim

#RUN useradd userui

WORKDIR /app

#RUN chown -R userui /app /home

COPY --from=builder /app .

EXPOSE 3000

#USER userui

CMD [ "npm", "start" ]