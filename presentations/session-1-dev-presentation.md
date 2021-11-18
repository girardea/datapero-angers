--author Yannick ALLUSSE
--title Dat'Apero - Getting a Good 'Dev-Env' for Machine Learning
--date today
Today's goal are:

  * To setup your system with some of the best open source tools to deal with Machine Learning.

  * Introduce Python for machine learning.

  * See some developpemnt best practices.

=> You will need an internt connexion...



--newpage DEALING_WITH_DATA_PROCESSING
--heading Dealing with data processing

Intensive data processing raise many technical challenges for developpers:

  * Computing is to intensive for a local developer laptop => How to distribute my algorithms?

  * How to be sure that my results are constant in time (given a stable dataset), on different servers?

  * Is it easy for other to reproduce experiences?

  * Can I resume a processing step without restarting from scratch?

  * How do I know how much processing time is remaining?

  * How can I visualize data and results?

  * What toolboxs should I use?



--newpage KNOW_YOUR_BASICS
--heading Know your basics

  * 1971: First shell (terminal) interface, created by Ken Thompson for UNIX.

  * 2021: We have 4k 32" screens, VR Headsets... but still using shells... and VIM.

Shells allow:

=> Scripts developpement and automation.
=> Easy environnement setup and distributions.
=> Quick access to remote servers.



--newpage USING_TPP
--heading Using TPP

Why using TPP for presenting this session?

Pros:

  * 'Low Tech' presentation tool, the format is easy to edit and follow with GIT.

  * Used inside a shell session manager (ex: tmux) => Allow to view the slides and type commands inside the same terminal.

  * Easy to use on a shared screen.

Cons:

  * Kind of hard to show images and graphs, but that's ok for now...



--newpage WINDOWS_USERS
--heading Windows users

Windows / MacOS users...
=> please install Docker, docker-compose and GIT

=> Skip further TMUX settings and tutorials.



--newpage LINUX_USERS
--heading LINUX users

Make sure you have the following tools on your system: docker GIT, tmux, tpp

--beginoutput
# install packages
sudo apt-get update -y; apt-get install -y docker tmux git tpp

# start docker service
sudo service docker start
# or
sudo /etc/init.d/docker start
--endoutput



--newpage CLONE_REPO
--heading Clone Dat'Apero git files

Get all source files:
--beginoutput
git clone https://github.com/girardea/datapero-angers.git
--endoutput

Linux users, start a local TPP for 'easy copy/paste':
--beginoutput
tpp presentations/session-1-dev-presentation.md
--endoutput




--newpage TMUX_SETUP
--heading TMUX setup
TMUX ... or how to fully control your bash sessions.

--beginoutput
# Run a new tmux session
tmux new -f config_files/tmux.conf -s datapero
# Run a simple command
ls ./
# Press CTRL-B + D to detach from tmux session
# List existing tmux session
tmux ls
# Re-attach to given session
tmux a -t datapero
--endoutput



--newpage TMUX_SHORCUTS
--heading TMUX quick shortcuts

Inside a TMUX session:

--beginoutput
# Press:
# CTRL-B + | to split into a new vertical pane
# CTRL-B + - to split into a new horizontal pane
# CTRL-B + z to switch between full screen mode / splitted pane mode
# CTRL-D to kill a pane
# CTRL-B + ARROWS to change active pane
# CTRL-B + CTRL-ARROWS to change pane dimensions
--endoutput



--newpage EX-TMUX
--heading Exercice: TMUX

Setup the following tmux session using previous shortcuts:

___________________________________________________________________________________
|____________________________________________________________________________ - o x
|> tpp presentations/session-1-dev-presentation.md | > htop                       |
|                                                  |                              |
|                                                  |                              |
|                                                  |                              |
|                                                  |                              |
|                                                  |                              |
|                                                  |                              |
|                                                  |                              |
|_________________________________________________________________________________|
|> _ (we will type here any further commands)                                     |
|                                                                                 |
|                                                                                 |
|_________________________________________________________________________________|



--newpage WHY_DOCKER
--heading Why Docker?

Docker tools allows to create 'Docker Images' that contains Linux environnements with pre-installed tools and services, what does it means:

  * A complete isolated Linux environnement runs on your OS.
  * Lighter than Virtual Machines images.
  * No need to allocate ressources (Disk, Ram, CPU), a Docker uses what it needs.
  * A multi-layers build steps -> easy to customize and redistribute.
  * Used by many distributed solutions (Kubernetes, Docker Swarm, etc...).
  * Your Docker container running your service is corrupted, juste restart it!
  * No dependencies issues, as they are all packaged into the Docker image.
  * Shared volumes and custom networks can be defined.


Pull out your first Python 3/Machine Learning Docker image:

--beginoutput
# Project and Dockerfiles available here:
# https://github.com/tiangolo/python-machine-learning-docker/
docker pull tiangolo/python-machine-learning:python3.7
--endoutput



--newpage STARTING_A_DOCKER
--heading Starting a Docker

Let's start a local Docker container for experimenting.
--beginoutput
# Get a lightwight Linux image and run it with
# - A local mounting point
# - A local mounting port
docker run -ti -v $PWD:/source/ tiangolo/python-machine-learning:python3.7 /bin/bash

# get python version
python --version

# get pre-installed python package list
pip freeze

# check local files
ls .

# add a new file /usr/datapero.txt
echo "Welcome to Dat'Apero sessio" >  /usr/datapero.txt

# exit the docker (or CTRL+D)
exit
--endoutput

--newpage STARTING_A_DOCKER_2
--heading Starting a Docker (2)

Let's restart it.

--beginoutput
# Start another docker session
docker run -ti -v $PWD:/source/ --rm tiangolo/python-machine-learning:python3.7 /bin/bash

# Look for our file /usr/datapero.txt
ls /usr/datapero.txt

# exit the docker (or CTRL+D)
--endoutput



--newpage BUILDING_A_DOCKER
--heading Building a Docker

Let's check local docker/Dockerfile and build it.

--beginoutput
# Build it manually, and tag the output image to 'my_docker'
docker build -f docker/Dockerfile ./ -t my_docker
--endoutput

Let's add a new package and rebuild it:

--beginoutput
# in file docker/Dockerfile
# Add:
RUN apt-get install htop
--endoutput

Build the Docker image.
--beginoutput

# Find what's wrong?

# Run it
htop
--endoutput



--newpage DOCKER_COMPOSE
--heading Docker-compose

How to customize your Docker service settings => let's look at docker-compose and its file docker/docker-compose.yml

--beginoutput
# Get commands
docker-compose

# Build it with Docker-Compose
docker-compose -f docker/docker-compose.yml build

# Run a bash session inside the docker:
docker-compose -f docker/docker-compose.yml run --rm --service-port --name datapero python-learning bash
--endoutput



--newpage LEVEL_UP_PYTHON
--heading Level Up Python

We have a working isolated, stable environnement.

=> Let's do some Python

=> Let's do it in Notebooks...

--beginoutput
# Inside your previous docker session, start Jyputer NoteBook
./notebooks/start_notebooks.sh
--endoutput

!! NOTE: running the docker without any command will run the start_notebooks.sh entrypoint. !!
