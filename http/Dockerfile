FROM docker.io/node:22-slim AS build
ENV PNPM_HOME /pnpm
ENV PATH $PNPM_HOME:$PATH
RUN corepack enable

COPY ./blazebooru/frontend /blazebooru/source/frontend
WORKDIR /blazebooru/source/frontend
RUN pnpm install --frozen-lockfile
RUN pnpm run build

FROM docker.io/nginx:mainline-alpine
COPY --from=build /blazebooru/source/frontend/dist /blazebooru/www
