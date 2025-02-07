FROM rocker/r-ver:4.4.2 AS base-image

RUN mkdir /project
WORKDIR /project

ENV RENV_PATHS_ROOT=/renv_cache
ENV RENV_PATHS_LIBRARY=/project-library
ENV RENV_VERSION=1.1.0
ENV repo=https://packagemanager.posit.co/cran/__linux__/jammy/latest

# Install renv
RUN <<EOR
R --vanilla -e "install.packages('remotes', repos='${repo}')
remotes::install_version('renv', version = '${RENV_VERSION}', repos='${repo}')"
EOR

# Copy renv files and dirs
COPY renv.lock /project/renv.lock
COPY .renv_cache /renv_cache
COPY .Rprofile /project/.Rprofile
COPY renv /project/renv

# Install renv in the project library
RUN <<EOR
R --vanilla -e "dir.create(renv::paths\$library(), recursive=TRUE)
file.copy(find.package('renv'), renv::paths\$library(), recursive = TRUE)"
EOR

# Restore the project library
RUN R -e "renv::restore()"

FROM base-image AS dev

FROM base-image AS prod
