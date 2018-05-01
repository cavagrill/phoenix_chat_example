FROM elixir:1.6-alpine
EXPOSE 4000
CMD ["mix", "phx.server"]
RUN ["apk", "add", "--no-cache", "nodejs", "nodejs-npm"]
WORKDIR /usr/src/backend
COPY . .
RUN ["mix", "local.hex", "--force"]
RUN ["mix", "local.rebar", "--force"]
RUN ["mix", "deps.get"]
RUN ["mix", "deps.compile"]
RUN ["npm", "install"]
RUN ["mix"]
