# datapero-angers

Contains all code shown in the Datapero events.

## Session 1 - Setup a good dev-env for machine learning

This first session introduce Python as 'the machine learning language', so our main focus will be how to setup
the best environement for python/IA developpement.

How to start the session?
```bash
# in a bash terminal, install tpp for 'in shell presentation'
sudo apt-get update -y; apt-get install -y tpp

# then start the presentation and follow instructions
tpp presentations/session-1-dev-presentation.md
```

## Starting the docker

The given docker file is based on https://github.com/tiangolo/python-machine-learning-docker images that supports
many optimized drivers and libraries (CUDA, Intel MKL). it includes some additionnal tools such as Python Jupyter Notebooks.

```bash
# Run the Docker container, it will build it if necessary
docker-compose -f docker/docker-compose.yml run --rm --service-port --name datapero python-learning bash

# Run anything you want into it.
# ...
```

## Juputer Notebooks

In your Docker session, run:

```bash
./notebooks/start_notebooks.sh
```

Then open http://127.0.0.1:2347/notebooks/notebooks/welcome.ipynb in your browser.

### Testing all notebooks

To be sure all notebooks are always fully functionnal and pass python module upgrade, let's run some unit test:

```bash
pytest --nbmake "./notebooks/"
```