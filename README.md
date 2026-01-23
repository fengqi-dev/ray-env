# ray-env

Builds a self-contained **Linux x86_64** tarball (`ray-env.tar.gz`) that includes:

- A standalone CPython distribution (downloaded from `python-build-standalone`)
- `ray[all]` installed into that Python

The output tarball is produced inside a Docker build and then copied out to your working directory.

## Requirements

- Docker (BuildKit recommended)
- GNU Make

## Build locally

```bash
make build
```

This creates `./ray-env.tar.gz` in the repo root.

## What’s inside the tarball

The tarball contains a single top-level directory:

- `python/` (standalone CPython + site-packages including `ray[all]`)

## Use the tarball

On a Linux x86_64 machine:

```bash
tar xzf ray-env.tar.gz
./python/bin/python -c "import ray; print(ray.__version__)"
```

If you want to use it like a “portable python”, you can also call:

```bash
./python/bin/pip list
```

## GitHub Actions

The workflow in [.github/workflows/release-tarballs.yml](.github/workflows/release-tarballs.yml) builds the tarball on:

- Tag pushes (any tag name)
- Manual runs (`workflow_dispatch`)

The result is uploaded as a workflow artifact named `ray-env.tar.gz`.

## Customize

Edit [Dockerfile](Dockerfile) to change:

- Python build URL (currently a `python-build-standalone` release)
- `pip install` index URL and the Ray extras/version

Then rebuild with:

```bash
make build
```
