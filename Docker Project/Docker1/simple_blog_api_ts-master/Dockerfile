FROM node:16-alpine as bulider
WORKDIR /usr/app
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run bulid

FROM node:16-alpine
WORKDIR /usr/app
COPY ./package.json ./
RUN npm install
COPY --from=bulider /user/app/dist ./
CMD ["node","server.js"]