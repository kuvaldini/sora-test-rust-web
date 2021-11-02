FROM rust:latest as builder
COPY webserver /webserver
WORKDIR /webserver
RUN cargo build --release

FROM ubuntu:latest  
#RUN apk --no-cache add ca-certificates
COPY --from=builder /webserver/target/release/sora-test-rust-web  /bin
CMD ["/bin/sora-test-rust-web"] 
