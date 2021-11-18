#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

jupyter notebook --allow-root --port=2347 --ip=0.0.0.0 --no-browser --NotebookApp.default_url=notebooks/notebooks/welcome.ipynb