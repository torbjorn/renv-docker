# Strategies for using renv in Docker

This repository showcases different ways to handle renv cache in
docker.

| Case                              | Description                                                                |
|-----------------------------------|----------------------------------------------------------------------------|
| 01-cache-in-project               | Renv cache is kept locally in the project, restore happens in docker build |
| 02-cache-in-project-restore-after | Mounts the cache and restores when container is run                        |
