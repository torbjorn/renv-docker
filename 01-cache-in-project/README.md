# Cache in project

* Cache is kept locally in project in `.renv_cache/` but ignored by git.
* Cache is `COPY`'ed in during docker build.
* `renv::restore()` is then run, with access to cache.

> [!IMPORTANT]
> During build, if you restore a package not in cache, the package
> will not be available from cache the next time you build either

A [script](../useful-scripts/build-r-cache.R) demonstrates how the
cache can be rebuilt from packages currently in library.
