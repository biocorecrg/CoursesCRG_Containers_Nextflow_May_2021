FROM rocker/shiny-verse:4.0.4

RUN apt-get update; apt-get upgrade -y
RUN apt-get install -y patchelf libudunits2-dev libgdal-dev gdal-bin libproj-dev proj-data proj-bin libgeos-dev
COPY shiny/deps.R /tmp

RUN Rscript /tmp/deps.R

#RUN mkdir -p /srv/shiny-server/myserver/

#COPY shiny/server.R /srv/shiny-server/myserver/
#COPY shiny/ui.R /srv/shiny-server/myserver/

RUN sudo chown -R shiny:shiny /srv/shiny-server

VOLUME /srv/shiny-server/myserver/

# Clean cache
RUN apt-get clean
RUN set -x; rm -rf /var/lib/apt/lists/*

EXPOSE 3838

CMD ["R", "-e", "shiny::runApp('/srv/shiny-server/myserver/', host = '0.0.0.0', port = 3838)"]
