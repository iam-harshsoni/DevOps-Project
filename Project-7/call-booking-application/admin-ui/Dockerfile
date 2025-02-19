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

EXPOSE 3000

CMD [ "npm", "start" ]