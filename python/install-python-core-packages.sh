#!/bin/bash
PACKAGES="flake8 pylint virtualenv yapf ipython isort"

pip3 install -U pip && pip3 install -U $PACKAGES
