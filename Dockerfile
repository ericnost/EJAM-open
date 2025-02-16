RUN R -e "devtools::install_local(build=FALSE, dependencies = TRUE, repos='https://mirror.csclub.uwaterloo.ca/CRAN/')"

FROM trestletech/plumber
LABEL maintainer="mark"

COPY [".", "./"]

ENTRYPOINT ["R", "-e", "pr <- plumber::plumb(commandArgs()[4]); pr$run(host='0.0.0.0', port=as.numeric(Sys.getenv('PORT')))"]
CMD ["reporter.R"]