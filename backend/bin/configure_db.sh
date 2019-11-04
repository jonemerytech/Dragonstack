#!/bin/bash

echo "Configuring dragonstackdb"

sudo -u johnny dropdb dragonstackdb
sudo -u johnny createdb dragonstackdb

sudo -u johnny psql dragonstackdb < ./bin/sql/generation.sql
sudo -u johnny psql dragonstackdb < ./bin/sql/dragon.sql
sudo -u johnny psql dragonstackdb < ./bin/sql/trait.sql
sudo -u johnny psql dragonstackdb < ./bin/sql/dragonTrait.sql

node ./bin/insertTraits.js

echo "dragonstackdb configured"