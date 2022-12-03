library(targets)

source("targets_scripts/functions.R")

options(clustermq.scheduler = "multiprocess")

tar_option_set(packages = c("chronicler",
                            "dplyr",
                            "ggplot2",
                            "forcats",
                            "wontrun",
                            "colorspace"))

list(
  tar_target(
    runs_base_0_file,
    "runs_base_0.rds",
    format = "file"
  ),

  tar_target(
    runs_base_1_file,
    "runs_base_1.rds",
    format = "file"
  ),

  tar_target(
    runs_base_2_file,
    "runs_base_2.rds",
    format = "file"
  ),

  tar_target(
    runs_base_3_file,
    "runs_base_3.rds",
    format = "file"
  ),

  tar_target(
    runs_base_4_file,
    "runs_base_4.rds",
    format = "file"
  ),

  tar_target(
    runs_base_0,
    read_base(runs_base_0_file)
  ),

  tar_target(
    runs_base_1,
    read_base(runs_base_1_file)
  ),

  tar_target(
    runs_base_2,
    read_base(runs_base_2_file)
  ),

  tar_target(
    runs_base_3,
    read_base(runs_base_3_file)
  ),

  tar_target(
    runs_base_4,
    read_base(runs_base_4_file)
  ),

  tar_target(
    base_runs,
    bind_rows(
      runs_base_0,
      runs_base_1,
      runs_base_2,
      runs_base_3,
      runs_base_4
    )
  ),

  tar_target(
    summary_runs,
    decode_wontrun(base_runs)
  ),

  tar_target(
    errors_freq,
    {count(summary_runs, version, classes) |>
       group_by(version) |>
       mutate(total = sum(n),
              freq = n/total) |>
       clean_classes()}
  ),

  tar_target(
    errors_plot,
    make_freq_plot(errors_freq)
  )

)
