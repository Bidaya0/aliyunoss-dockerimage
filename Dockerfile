FROM alpine/curl:3.14 as builder
RUN mkdir /opt/curl/
WORKDIR /opt/curl/
RUN curl https://gosspublic.alicdn.com/ossutil/1.7.9/ossutil64 -o /opt/curl/ossutils

FROM alpine:3.15
COPY --from=builder /opt/curl/ossutils /usr/local/bin/ossutils
RUN chmod +x /usr/local/bin/ossutils
ENTRYPOINT ['ossutils']
