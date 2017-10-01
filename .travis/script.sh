#!/usr/bin/env bash

set -e  # exit on errors

if [ "${TRAVIS_TAG}" != "" ] && [ "${TRAVIS_PYPI_USER}" != "" ] && [ "${TRAVIS_PYPI_PASS}" != "" ]; then
    echo "publishing tagged release to pypi"
    echo "${TRAVIS_TAG}" > VERSION.txt
    rm -rf dist build
    pip install twine
    python setup.py bdist_wheel
    export TWINE_USERNAME="${TRAVIS_PYPI_USER}"
    export TWINE_PASSWORD="${TRAVIS_PYPI_PASS}"
    twine upload dist/*
else
    echo "skipping publishing to pypi because not a tagged release"
fi
