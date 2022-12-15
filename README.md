# Assessing the longevity of R code

This repository contains the required code and assets to produce this graph:

![](https://i.imgur.com/OAIGTjE.png)

This graph was made by running examples from standard installations of R version 0.6.0 to 4.2.2 on R version 4.2.2. 
Successes, warnings, messages and errors were tallied and the proportion of each condition is shown.

To run this code, you need to build and run a Docker container.

To build the image use the following command, inside the `Docker/` folder:

```
docker build -t code_longevity .
```

Then, run the container (and change the path to the Docker volume accordingly):

```
docker run --rm --name code_longevity_container -v /path/to/code_longevity/docker/output:/home/project/results:rw code_longevity
```

This image pulls from `brodriguesco/wontrun:r4.2.2`. The `Dockerfile` to this image (and other scripts needed) 
is inside `wontrun_dockerfile/`. This `Dockerfile` is a slight modification of the ones found
inside the Rocker project 
[repository](https://github.com/rocker-org/rocker-versioned2/tree/master/dockerfiles).

It installs R version 4.2.2 from source, sets the CRAN repositories to 
`https://packagemanager.rstudio.com/cran/__linux__/jammy/2022-11-21` (so that packages
get installed as they were on the 21st of November 2022, for reproducibility purposes) and installs
a bunch of libraries to make sure that any package that gets installed will run smoothly.
