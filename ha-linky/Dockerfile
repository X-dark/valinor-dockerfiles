FROM docker.io/alpine:latest

LABEL org.opencontainers.image.source=https://github.com/bokub/ha-linky
LABEL org.opencontainers.image.description="HA Linky Standalone"
LABEL org.opencontainers.image.licenses=MIT

RUN apk add --no-cache nodejs npm

ADD https://github.com/bokub/ha-linky.git /linky

WORKDIR /linky

# Install dependencies
RUN npm ci --ignore-scripts

# Transpile TypeScript
RUN npm run build

CMD [ "node", "--experimental-modules", "dist/index.js" ]
