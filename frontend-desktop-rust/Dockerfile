FROM rust:1.63.0

WORKDIR /build

COPY Cargo.lock Cargo.toml /build/
RUN cargo fetch

RUN mkdir /out/

COPY ./ /build/

CMD ["cargo", "build", "--release", "--target-dir", "/out/"]