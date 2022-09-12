FROM node:latest

RUN yarn add --dev nodemon ts-node

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

USER node

WORKDIR /app/

COPY package.json /app/
RUN yarn install

COPY ./ /app/

ENTRYPOINT [ "yarn", "start" ]
