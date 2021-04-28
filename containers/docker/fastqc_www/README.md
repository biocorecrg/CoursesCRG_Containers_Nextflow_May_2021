# Dummy FASTQC Web service

Place B7_input_s_chr19.fastq.gz file from available datasets in ```$HOME/myscratch```

```bash
mdkir -p $HOME/myscratch

cp testdata/* $HOME/myscratch

cd containers/docker/fastqc_www

docker build -t fastqcwww -f Dockerfile ../../scripts/fastqc

docker run -d -v $HOME/myscratch:/scratch -p 3838:8083 --name myfastqc fastqcwww
```

Example query from the browser:

http://127.0.0.1:3838/?file=B7_input_s_chr19.fastq
