library(targets)
library(dplyr)
library(tidyr)
library(tibble)
library(purrr)
library(wontrun)

paths <- "/home/cbrunos/six_to/r_docs/wontrun_download/R/"

scripts_paths <- list.files(paths,
                            all.files = TRUE,
                            recursive = TRUE) %>%
  keep(~grepl("scripts", .))

scripts_df <- scripts_paths %>%
  as_tibble() %>%
  mutate(scripts_paths = paste0("~/six_to/r_docs/wontrun_download/R/", value)) %>%
  separate(value, into = c("version", "name", "scripts", "script"), sep = "/") %>%
  select(name, version, script, scripts_paths)

run_base <- function(scripts_df, ver){
  result <- scripts_df %>%
    filter(grepl(paste0("^", ver, "."), version)) %>%
    run_examples(base = TRUE,
                 ncpus = 8,
                 setup = FALSE,
                 script_path_create = FALSE,
                 wontrun_lib = "~/six_to/wontrun_lib")

  saveRDS(result, paste0("~/six_to/code_longevity/runs_base_", ver, ".rds"))

}

run_base(scripts_df, "0")
run_base(scripts_df, "1")
run_base(scripts_df, "2")
run_base(scripts_df, "3")
run_base(scripts_df, "4")
