name "shiny"
description "System to host a Shiny Server on Ubuntu 18.04"
run_list(
  "recipe[R]",
  "recipe[R::ggplot2]",
  "recipe[R::gridExtra]",
  "recipe[R::raster]",
  "recipe[R::rmarkdown]",
  "recipe[R::sf]",
  "recipe[R::shiny]",
  "recipe[rstudio]",
  "recipe[shiny]"
)
