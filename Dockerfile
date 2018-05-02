FROM elixir:1.6-alpine
EXPOSE 4000
CMD ["mix", "phx.server"]
RUN apk add --no-cache nodejs nodejs-npm
WORKDIR /usr/src/backend
COPY . .
RUN mix local.hex --force \
 && mix local.rebar --force \
 && mix deps.get \
 && mix deps.compile \
 && npm install \
 && mix
