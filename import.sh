docker run -v $(pwd)/north-america-latest.osm.pbf:/data.osm.pbf \
           -v $(pwd)/north-america.poly:/data.poly \
           -v openstreetmap-data:/var/lib/postgresql/12/main \
           -v openstreetmap-rendered-tiles:/var/lib/mod_tile \
           -e AUTOVACUUM=off \
           -e THREADS=1 \
           -e "OSM2PGSQL_EXTRA_ARGS=-C 8192" \
           --name import-tile-data \
           tileserver import
