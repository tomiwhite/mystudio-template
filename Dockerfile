FROM node:20-alpine

WORKDIR /app

ENV NPM_CONFIG_CACHE=/app/.npm

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "run", "dev"]

