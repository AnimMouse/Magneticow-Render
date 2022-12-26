#!/bin/sh
wget -O - https://github.com/AnimMouse/magneticod-actions/releases/latest/download/database.sqlite3.zst | zstd -d -o /app/database.sqlite3
./magneticow -a :10000 -d sqlite3:///app/database.sqlite3 --no-auth