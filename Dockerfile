# Python version can be changed, e.g.
# FROM python:3.8
# FROM docker.io/fnndsc/conda:python3.10.2-cuda11.6.0
FROM docker.io/python:3.10.6-slim-bullseye

LABEL org.opencontainers.image.authors="FNNDSC <dbassey@redhat.com>" \
      org.opencontainers.image.title="A ChRIS statsmodels plugin app" \
      org.opencontainers.image.description="A ChRIS plugin to perform statsmodels operations"

WORKDIR /usr/local/src/pl-statsmodels

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
ARG extras_require=none
RUN pip install ".[${extras_require}]"

CMD ["statsmodels", "--help"]
