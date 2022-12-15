FROM brodriguesco/wontrun:r4.2.2

RUN R -e "install.packages(c('remotes', 'reactable', 'targets', 'tarchetypes', 'quarto', 'chronicler', 'ggplot2', 'colorspace', 'forcats'))"

RUN R -e "remotes::install_github('b-rodrigues/wontrun', ref = 'master')"

RUN mkdir /home/project

RUN mkdir /home/project/intermediary_outputs/

RUN mkdir /home/project/results/

COPY _targets.R /home/project/_targets.R

COPY run_base.R /home/project/run_base.R

COPY paper.Rmd /home/project/paper.Rmd

COPY targets_scripts/functions.R /home/project/targets_scripts/functions.R

COPY r_base_scripts.tar.xz /home/project/r_base_scripts.tar.xz

RUN tar -C /home/project/ -xf /home/project/r_base_scripts.tar.xz

RUN Rscript '/home/project/run_base.R' "0"
RUN Rscript '/home/project/run_base.R' "1"
RUN Rscript '/home/project/run_base.R' "2"
RUN Rscript '/home/project/run_base.R' "3"
RUN Rscript '/home/project/run_base.R' "4"

CMD R -e "setwd('/home/project/');targets::tar_config_set(store = '/home/project/results/');targets::tar_make()"


