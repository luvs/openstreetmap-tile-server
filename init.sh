docker volume create openstreetmap-data
docker run -v $(pwd)/northwestern-fed-district-latest.osm.pbf:/data.osm.pbf \
           -v $(pwd)/northwestern-fed-district.poly:/data.poly \
           -v openstreetmap-data:/var/lib/postgresql/12/main \
           -v openstreetmap-rendered-tiles:/var/lib/mod_tile \
           -e AUTOVACUUM=off \
           -e THREADS=1 \
           -e "OSM2PGSQL_EXTRA_ARGS=-C 8192" \
           --name import-tile-data \
           tileserver import
