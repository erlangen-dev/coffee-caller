FROM node:latest

ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

WORKDIR /build

COPY package.json yarn.lock /build
RUN yarn install

COPY . /build
RUN yarn build

FROM nginx:latest

COPY --from=0 /build/dist /usr/share/nginx/html
