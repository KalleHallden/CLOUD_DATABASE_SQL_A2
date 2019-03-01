# Usage:
# * Create DB: make create
# * Drop DB: make drop

# Variables
DB_NAME?=websitedb
DB_USER?=postgres

all: db_create build run

db_create:
	createdb $(DB_NAME)

setup: db_create

build:
	mvn compile

run: run_jdbc run_seeder run_queries

run_jdbc:
	mvn exec:java -D"exec.mainClass"="se.chalmers.dm.JDBCTestDriver"

run_seeder:
	mvn exec:java -D"exec.mainClass"="se.chalmers.dm.SeederTestDriver"

run_queries:
	mvn exec:java -D"exec.mainClass"="se.chalmers.dm.QueriesTestDriver"

# Force dropping exiting DB connections based on https://stackoverflow.com/a/5408501/6875981
db_disconnect:
	psql -U $(DB_USER) -d $(DB_NAME) -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = '$(DB_NAME)' AND pid <> pg_backend_pid();"

db_drop:
	dropdb $(DB_NAME) --if-exists

clean: db_drop
	mvn clean
