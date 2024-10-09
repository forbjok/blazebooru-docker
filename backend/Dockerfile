FROM docker.io/clux/muslrust:stable AS chef
RUN cargo install cargo-chef --locked
WORKDIR /app

FROM chef AS planner
COPY ./blazebooru/backend .
RUN cargo chef prepare --recipe-path recipe.json

FROM chef AS builder
COPY --from=planner /app/recipe.json recipe.json

# Build dependencies - this is the caching Docker layer!
RUN cargo chef cook --release --recipe-path recipe.json

# Build application
COPY ./blazebooru/backend .
ENV SQLX_OFFLINE true
RUN cargo build --release
RUN mkdir -p /blazebooru && cp ./target/x86_64-unknown-linux-musl/release/blazebooru /blazebooru/


# Final image
FROM gcr.io/distroless/static-debian12:latest
COPY --from=builder /blazebooru/blazebooru /blazebooru/
ENV DATABASE_URL postgres://blazebooru:blazebooru@db/blazebooru
ENV BLAZEBOORU_FILES_PATH /mnt/data/files
EXPOSE 3000
WORKDIR /blazebooru
CMD ["./blazebooru", "--migrate", "server"]
