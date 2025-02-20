FROM rocker/r-ver:4.4.2

RUN mkdir /project
WORKDIR /project

ENV RENV_PATHS_ROOT=/renv_cache
ENV RENV_PATHS_LIBRARY=/project-library
ENV repo=https://p3m.dev/cran/__linux__/noble/latest

# Copy renv files and dirs
COPY renv.lock /project/renv.lock
COPY .renv_cache /renv_cache
COPY .Rprofile /project/.Rprofile
COPY renv /project/renv

# Restore the project library
RUN R -e "renv::restore()"
