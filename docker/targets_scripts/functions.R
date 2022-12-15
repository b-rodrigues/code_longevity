read_base <- function(base_rds){
  readRDS(base_rds)
}

clean_classes <- function(x){
  x %>%
    mutate(which_cnd = case_when(grepl("error", classes) ~ "error",
                                 grepl("message", classes) ~ "message",
                                 grepl("warning", classes) ~ "warning",
                                 TRUE ~ "OK!"),
           which_cnd = fct_relevel(which_cnd, "error", "warning", "message", "OK!"))

}

make_freq_plot <- function(x){

  ggplot(data = x) +
    geom_col(aes(y = freq, x = version, fill = which_cnd)) +
    theme(legend.position = "bottom",
          axis.text.x = element_text(angle = 90)) +
    scale_fill_manual(values = c("OK!" = "#59D675",
                                 "error" = "#B34B4A",
                                 "warning" = "#EEAF6B",
                                 "message" = "#3267AC"))

}

make_table_fix <- function(.data){

  reactable::reactable(.data,
                       filterable = TRUE,
                       searchable = TRUE,
                       showPageSizeOptions = TRUE,
                       striped = TRUE,
                       highlight = TRUE,
                       compact = TRUE,
                       defaultPageSize = 30)

}
