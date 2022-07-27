FROM alpine:3.14 as builder

RUN apk add --no-cache postgresql==13.7-r0

FROM alpine:3.14

RUN apk add --no-cache libpq==13.7-r0
COPY --from=builder /usr/bin/pgbench /usr/bin/pgbench

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
