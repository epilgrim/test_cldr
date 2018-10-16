FROM elixir:1.7-alpine

ARG MIX_ENV=prod
ARG PORT=80

ENV MIX_ENV=$MIX_ENV
EXPOSE $PORT

RUN mix local.hex --force
RUN mix local.rebar --force


WORKDIR /app

ADD mix.exs .

RUN apk --no-cache add build-base \
    && mix do deps.get, deps.compile \
    && apk del build-base

ADD . .

RUN mix do compile

RUN ls -la _build/prod/lib/appsignal/priv/
