FROM python:3.10

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /aladdin

RUN wget https://github.com/astral-sh/python-build-standalone/releases/download/20260114/cpython-3.10.19+20260114-x86_64-unknown-linux-gnu-install_only.tar.gz -O python-3.10.tar.gz && tar xf python-3.10.tar.gz && rm -rf python-3.10.tar.gz

RUN /aladdin/python/bin/pip install -U "ray[all]"

RUN tar czf ray-env.tar.gz python