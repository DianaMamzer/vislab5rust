FROM rust:1.70-buster as builder
WORKDIR /app
ARG DATABASE_URL
ENV DATABASE_URL=$DATABASE_URL
COPY . .
RUN cargo build --release
FROM debian:buster-slim
WORKDIR /usr/local/bin
COPY --from=builder /app/target/release/vislaba5rust ./
CMD ["./vislaba5rust"]

