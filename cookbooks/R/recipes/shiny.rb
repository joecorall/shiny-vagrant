execute "shiny-cran" do
  command "R -e \"install.packages('shiny', repos='https://cran.rstudio.com/')\""
  not_if {::File.exists?("/usr/local/lib/R/site-library/shiny/INDEX")}
end