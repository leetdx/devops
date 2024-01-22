# postgresql via docker commands

```bash
mkdir temp_pgdata

docker run -dp 5432:5432 \
    --name temp-postgres \
    -e POSTGRES_USER=admin \
    -e POSTGRES_PASSWORD=admin@12345 \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v /temp_pgdata:/var/lib/postgresql/data \
    postgres:16
```

### PGDATA

#### Important Note
when mounting a volume to **/var/lib/postgresql**, the **/var/lib/postgresql/data** path is a local volume from the container runtime, thus data is not persisted on the mounted volume.

This optional variable can be used to define another location - like a subdirectory - for the database files. The default is **/var/lib/postgresql/data**. If the data volume you're using is a filesystem mountpoint (like with GCE persistent disks), or remote folder that cannot be chowned to the postgres user (like some NFS mounts), or contains folders/files (e.g. lost+found), Postgres initdb requires a subdirectory to be created within the mountpoint to contain the data.

e.g.

```bash
docker run -d \
	--name some-postgres \
	-e POSTGRES_PASSWORD=mysecretpassword \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
	-v /custom/mount:/var/lib/postgresql/data \
	postgres
```

This is an environment variable that is not Docker specific. Because the variable is used by the postgres server binary (see the PostgreSQL docs), the entrypoint script takes it into account.