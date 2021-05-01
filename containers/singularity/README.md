List of Singularity recipes

## Example with Blast

Compare with the previous Docker examples

First of all, let's generate a ```blast.sif``` image. We have plenty of ways to do this. One example below:

```
singularity build blast.sif docker://ncbi/blast:2.10.1
```

### Blast command-line (1)

```bash
# If not there create a DB dir
mkdir $HOME/db

cd $HOME/db

curl -L https://www.uniprot.org/uniprot/O75976.fasta -o O75976.fasta

curl -L https://www.uniprot.org/uniprot/Q90240.fasta -o Q90240.fasta

singularity exec blast.sif blastp -query O75976.fasta -subject Q90240.fasta

# We can mount if we prefer (as we did with Docker), but it's not strictly necessary
singularity exec -B /home/ec2-user/db:/blastdb blastp -query /blastdb/O75976.fasta -subject /blastdb/Q90240.fasta > out.blast

singularity exec -B /home/ec2-user/db:/blastdb blast-debian:custom blastp -query /blastdb/O75976.fasta -subject /blastdb/Q90240.fasta -out /blastdb/output.blast
```

### Blast command-line (2)

```bash
# If not there create a DB dir
mkdir $HOME/db

cd $HOME/db

# Let's download Swissprot DB
curl -L https://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/swissprot.gz -o swissprot.gz

gunzip swissprot.gz

# Let format the Swissprot DB
singularity exec blast.sif makeblastdb -dbtype prot -parse_seqids -in swissprot
```

We can retrieve a FASTA sequence by ID

```bash
singularity exec blast.sif blastdbcmd -dbtype prot -db swissprot -entry O75976
```

## Instance example with mariadb

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
