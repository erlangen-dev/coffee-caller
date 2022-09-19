FROM node:latest

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

WORKDIR /app/

COPY package.json /app/
RUN yarn install

COPY ./ /app/

RUN chown -R node /app/

USER node

ENTRYPOINT [ "yarn", "start" ]
