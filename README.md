# Courses@CRG_Containers_Nextflow_May_2021

## Title

Reproducible research and data analysis with Linux containers and Nextflow pipelines
<br>
Course page: https://biocorecrg.github.io/CoursesCRG_Containers_Nextflow_May_2021/

## About the course

This slow-paced hands-on course is designed for absolute beginners who want to start using containers and Nextflow pipelines to achieve reproducibility of data analysis. Linux containers allow the storage of code and applications in an host-independent lightweight environment. They became a fast and popular way to share and deploy applications in different environments. [Nextflow](https://www.nextflow.io) is a powerful polyglot workflow language that, coupled with [Docker](https://www.docker.com/) and [Singularity](https://sylabs.io/singularity/) containers, provides a robust, scalable and reproducible way to run computational pipelines.


### Outline

The 4-day Containers and Nextflow course will train participants to use and build Docker and Singularity containers and Nextflow pipelines.

It is designed to provide trainees with short and frequent hands-on sessions, while keeping theoretical sessions to a minimum.

The course will be fully virtual via the [Zoom](https://zoom.us/) platform.

Trainees will work in a dedicated [AWS environment](https://en.wikipedia.org/wiki/AWS).


### Learning objectives

About containers:
* Locate and fetch Docker/Singularity images from dedicated repositories.
* Execute/Run a Docker/Singularity container from the command line.
* Build Docker container from an existing recipe.
* Design/Write a Docker recipe.
* Convert Docker to Singularity image.

About Nextflow:
* Locate and fetch Nextflow pipelines from dedicated repositories.
* Execute/Run a Nextflow pipeline.
* Describe and explain Nextflow's basic concepts.
* Test and modify a Nextflow pipeline.
* Implement short blocks of code into a Nextflow pipeline.
* Develop a Nextflow pipeline from scratch.
* Run pipeline in diverse computational environments (local, HPC, cloud )

### Prerequisite

Being comfortable working with the CLI (command-line interface) in a Linux-based environment.
Applicants are not expected to have used neither Linux containers nor Nextflow workflows before.

Practitioners will need to connect during the course to a remove server via the "ssh" protocotol. You can learn about it here: https://www.hostinger.com/tutorials/ssh-tutorial-how-does-ssh-work

Those who follow the coursw should be able to use a command-line/screen-oriented text editor (such as nano or vi/vim, which are already available in the server) or to be able to use an editor able to connect remotely. For sake of information, below the basics of "nano":
https://wiki.gentoo.org/wiki/Nano/Basics_Guide

For some parts of the course, having a [GitHub account](https://github.com/join), a [Docker Hub](https://hub.docker.com/signup) and a [Sylabs Cloud](https://cloud.sylabs.io) accounts are recommended.

## Dates, time, location

* Dates: May 2021:
 * Containers: Monday 3rd, Tuesday 4th
 * Nextflow: Monday 10th, Tuesday 11th

* Time: 9:30-17:30:
  * Morning coffee break: 11:00-11:30am
  * Lunch break: 1pm-2pm
  * Afternoon coffee break: 3:30-4:00pm

* Location: virtual, via Zoom.

## Preliminary program

### Day 1 & 2: Containers

#### Day 1: Docker

* Containers: introduction and history.
* Docker hub: find existing containers.
* Fetch (and build) an image from public registries (Docker Hub, Quay.io, etc.)
 * Discovery of different relevant base images
* Run Docker container based on an existing image (also run it interactively).
* Build an image from an existing recipe:
  * Explain sections and keywords.
  * Build options (e.g. cache or build variables).
* Write a Docker recipe and build an image from it.

#### Day 2: Docker + Singularity

* Docker:
  * Work with volumes and ports.
  * Upload image to registries.
* Singularity:
  * Singularity versus Docker.
    * Differences, pros and cons for each system.
  * Fetch (and build) Singularity images.
    * Build from existing public registries.
    * Build from local Docker instances.
  * Run Singularity container (interactively).
  * Understanding and working with volumes.
  * Singularity build recipes.
  * Advanced features: services, etc.

### Day 3 & 4: Nextflow

#### Day 3: Fetch, understand, run, modify

* Nextflow pipeline repositories.
  * hands-on: fetch X pipeline.
* Run an existing Nextflow pipeline.
* Understand Nextflow main files (main.nf and config files).
* Basic concepts:
  * Processes and channels
* Nextflow configuration files.
* Modify and run a Nextflow pipeline.

#### Day 4: Write and share

* Write Nextflow pipeline from scratch.
* Run Nextflow with containers.
* Choose either Docker or Singularity.
* Run Nextflow in a computing cluster (e.g. HPC).
  * Definition of computing requirements and queues.
  * Profiles.
* Share Nextflow pipelines and good practices.


## Acknowledgements

* [Bookdown](https://bookdown.org/). The publication system for our course pages.
* [ELIXIR Workshop Hackathon](https://github.com/vibbits/containers-workflow-hackathon). Joined initiative with other colleagues to exchange materials for courses and approaches for courses like this.
