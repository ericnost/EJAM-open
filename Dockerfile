
# Base image https://hub.docker.com/r/rocker/rstudio
FROM rocker/rstudio:4.4

## Create directories
RUN mkdir -p /rstudio
RUN mkdir -p /rscripts

## Install R packages
RUN R -e "install.packages(c('remotes', 'geojson_sf'), repos='https://mirror.csclub.uwaterloo.ca/CRAN/')"
RUN R -e "remotes::install_local(build=FALSE, dependencies=TRUE, repos='https://mirror.csclub.uwaterloo.ca/CRAN/')"


## Install plumber and run api
FROM trestletech/plumber
LABEL maintainer="mark"

COPY [".", "./"]

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=as.numeric(Sys.getenv('PORT')))"]
CMD ["reporter.R"]