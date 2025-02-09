# Strategies for using renv in Docker

This repository showcases different ways to handle renv cache in
docker.

| Case                                                                   | Description                                                                    |
|------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| [01-cache-in-project](01-cache-in-project)                             | Renv cache is kept locally in the project, restore happens in docker build     |
| [02-cache-in-project-restore-after](02-cache-in-project-restore-after) | Mounts the cache and restores when container is run                            |
| [03-global-cache-restore-after](03-global-cache-restore-after)         | Keeps cache outside the project, restores when container is run, as in case 02 |

> [!TIP]
> To try them out, clone this repo and do:
> * cd 01-cache-in-project
> * make shell
> * R
> * library(tidyverse)

All cases should behave the same, you can run make shell in either. In all of them it should say:

    - Project '/project' loaded. [renv 1.1.1]
    > library(tidyverse)
    ── Attaching core tidyverse packages ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse 2.0.0 ──
    ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ✔ ggplot2   3.5.1     ✔ tibble    3.2.1
    ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
    ✔ purrr     1.0.4
    ── Conflicts ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

# Case 01: Cache in project

This setup keeps the renv cache in the project (in this example in a
subfolder `.renv_cache/`.

This renv cache is ignored by git, but not by docker.

During build, the cache is copied into the image to make it available
for subsequent `renv::restore()`

When running, the cache is mounted as a volume in the container so
that cache from future renv installs are persistently captured in the
cache.

# Case 02: Cache in project, but restore at runtime

This setup is similar to `Case 01` in that it maintains the renv cache
in the project, but `renv::restore()` is not called during
build. Cache is also not copied into the image during build.

# Case 03: Cache outside, shared between projects, and restored at runtime

For all intents and purposes an identical setup to `Case 02`, with the
only difference that cache is kept outside of the project and
potentially shared with other projects.
