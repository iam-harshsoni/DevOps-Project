FROM node:17.4.0 AS builder

LABEL maintainer="HarshSoni"

WORKDIR /app

COPY package*.json ./

RUN npm install && npm cache clean --force

COPY . .

#--------------------------------------------------------

FROM node:17.4.0-slim

WORKDIR /app

COPY --from=builder /app .

ENV MONGO_URL=""

ENV ADMIN_EMAIL=""

EXPOSE 1004

CMD [ "npm", "start" ]