FROM rocker/r-ver:4.4.2 AS base-image

RUN mkdir /project
WORKDIR /project

ENV RENV_PATHS_ROOT=/renv_cache
ENV RENV_PATHS_LIBRARY=/project-library
ENV repo=https://packagemanager.posit.co/cran/__linux__/jammy/latest

# Copy renv files and dirs
COPY renv.lock /project/renv.lock
COPY .Rprofile /project/.Rprofile
COPY renv /project/renv

# Trigger renv install
RUN R -e 1
