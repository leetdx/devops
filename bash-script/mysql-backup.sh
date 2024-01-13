#!/bin/bash

# Set the current date and time
now=$(date +"%Y-%m-%d_%H-%M-%S")
MYSQL_ROOT_PASSWORD=mypassword
USER=$(whoami)

# Backup the MySQL database to a file
docker exec mysql-container sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > "/home/${USER}/backup/mysql-ba>
