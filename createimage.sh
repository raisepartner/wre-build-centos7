#!/bin/bash
docker build -t centos7compil .
# docker run --rm --env BUILD_NUMBER="1515" centoscompil7
docker run --rm centoscompil7
