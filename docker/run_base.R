#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly=TRUE)

library(targets)
library(dplyr)
library(tidyr)
library(tibble)
library(purrr)
library(wontrun)

paths <- "/home/project/R/"

scripts_paths <- list.files(paths,
                            all.files = TRUE,
                            recursive = TRUE) %>%
  keep(!grepl("man/", .))

scripts_df <- scripts_paths %>%
  as_tibble() %>%
  mutate(scripts_paths = paste0("/home/project/R/", value)) %>%
  separate(value, into = c("version", "name", "scripts", "script"), sep = "/") %>%
  select(name, version, script, scripts_paths)

run_base <- function(scripts_df, ver){
  result <- scripts_df %>%
    filter(grepl(paste0("^", ver, "."), version)) %>%
    run_examples(base = TRUE,
                 ncpus = 8,
                 setup = FALSE,
                 script_path_create = FALSE,
                 wontrun_lib = "/usr/local/lib/R/site-library")

  saveRDS(result, paste0("/home/project/intermediary_outputs/runs_base_", ver, ".rds"))

}

#run_base(scripts_df, "0")
run_base(scripts_df, args[1])
