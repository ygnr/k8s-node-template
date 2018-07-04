FROM node:8-alpine

WORKDIR /usr/src/app
COPY . /usr/src/app

RUN yarn install --force

ENV NODE_ENV production
EXPOSE 5000

CMD [ "yarn", "start" ]
