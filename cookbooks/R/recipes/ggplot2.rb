execute "ggplot2-cran" do
  command "R -e \"install.packages('ggplot2', repos='https://cran.rstudio.com/')\""
  not_if {::File.exists?("/usr/local/lib/R/site-library/ggplot2/INDEX")}
end