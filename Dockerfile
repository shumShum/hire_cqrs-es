FROM elixir:1.10.2-slim

RUN apt-get update && apt-get install -y \
  build-essential \
  curl \
  inotify-tools && \
  apt-get install -y --no-install-recommends apt-utils && \
  curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
  apt-get install -y nodejs npm && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /hire
WORKDIR /hire

ARG ENV=prod

ENV MIX_ENV $ENV
ENV NODE_ENV production

RUN mix local.hex --force && \
  mix local.rebar --force

COPY mix* /hire/
RUN mix deps.get
COPY config/config.exs /hire/config/
COPY config/$ENV*.exs /hire/config/
RUN mix deps.compile

COPY assets/package.json /hire/assets/
RUN cd assets && npm install --production=true && cd ..

COPY . /hire

RUN mix compile && \
  mix phx.digest

CMD mix ecto.migrate && mix event_store.init && mix phx.server