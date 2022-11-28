FROM docker.io/node:18 AS build
COPY ./blazebooru/frontend /blazebooru/source/frontend
COPY ./http/build-frontend.sh /build-frontend.sh
RUN /build-frontend.sh

FROM docker.io/nginx:mainline-alpine
COPY --from=build /blazebooru/source/frontend/dist /blazebooru/www
