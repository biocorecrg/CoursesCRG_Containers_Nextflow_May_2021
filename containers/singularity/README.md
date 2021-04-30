List of Singularity recipes

## Blast processing

** TODO: Change this with Singularity

```bash
cd $HOME/db

curl https://www.uniprot.org/uniprot/O75976.fasta -o O75976.fasta

curl https://www.uniprot.org/uniprot/Q90240.fasta -o Q90240.fasta

docker run -v /home/user/db:/blastdb blast-debian:custom blastp -query /blastdb/O75976.fasta -subject /blastdb/Q90240.fasta

docker run -v /home/user/db:/blastdb blast-debian:custom blastp -query /blastdb/O75976.fasta -subject /blastdb/Q90240.fasta > out.blast

docker run -v /home/user/db:/blastdb blast-debian:custom blastp -query /blastdb/O75976.fasta -subject /blastdb/Q90240.fasta -out /blastdb/output.blast
```

## Retrieving a sequence from a formated FASTA file

Let's download Swissprot

```bash
cd $HOME/db

curl http://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/swissprot.gz -o swissprot.gz

gunzip swissprot.gz
```

Let's format the FASTA file

```bash
cd $HOME/db
docker run -v /home/user/db:/blastdb  blast-debian:custom makeblastdb -dbtype prot -parse_seqids -in /blastdb/swissprot
```

We can retrive a FASTA sequence by ID

```bash
docker run -v /home/user/db:/blastdb  blast-debian:custom blastdbcmd -dbtype prot -db swissprot -entry O75976
```

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

sudo singularity build nginx.sif nginx.singularity

sudo singularity instance start --writable-tmpfs nginx.sif webserver

# We get the version of NGINX
sudo singularity exec instance://webserver nginx -version

# We place in $HOME/www some index.html and we mount it
sudo singularity instance start -B /home/ec2-user/www:/usr/share/nginx/html --writable-tmpfs nginx.sif webserver
