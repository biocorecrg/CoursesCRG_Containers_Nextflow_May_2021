# Very Simply Shiny app

In this case, we place executables in a mounted volume.


```bash

cd containers/docker/shiny

docker build -t shinyapp -f Dockerfile ../../scripts/shiny

docker run -d -v $(pwd)/../../scripts/shiny:/srv/shiny-server/myserver -p 3838:3838 --name myserver shinyapp
```

Example query from the browser:

http://127.0.0.1:3838
