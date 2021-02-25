docker volume create openstreetmap-tiles
docker run -v openstreetmap-data:/var/lib/postgresql/12/main \
           -v openstreetmap-tiles:/var/lib/mod_tile \
           -e AUTOVACUUM=off \
           -e THREADS=4 \
           -e "OSM2PGSQL_EXTRA_ARGS=-C 4096" \
           -p 9090:80 \
           -p 5432:5432 \
           --name tileserver -d \
           tileserver run
