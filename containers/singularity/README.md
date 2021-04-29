List of Singularity recipes

## Example with mariadb

sudo singularity build mariadb.sif mariadb.singularity

mkdir -p testdir
mkdir -p testdir/db
mkdir -p testdir/socket

singularity exec -B ./testdir/db:/var/lib/mysql mariadb.sif mysql_install_db

singularity instance start -B ./testdir/db:/var/lib/mysql -B ./testdir/socket:/run/mysqld mariadb.sif mydb

singularity instance list

singularity exec instance://mydb mysql -uroot

singularity instance stop mydb

## Example with NGINX
