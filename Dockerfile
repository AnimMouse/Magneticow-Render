FROM frolvlad/alpine-glibc:latest
RUN apk add --no-cache libstdc++ zstd
WORKDIR app
RUN wget https://github.com/boramalper/magnetico/releases/latest/download/magneticow && chmod +x magneticow
RUN wget -O - https://github.com/AnimMouse/magneticod-actions/releases/latest/download/database.sqlite3.zst | zstd -d -o /app/database.sqlite3 && chmod +w /app/database.sqlite3
COPY magneticow.sh .
USER nobody
ENTRYPOINT ["/app/magneticow.sh"]