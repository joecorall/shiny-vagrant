execute "rmarkdown-cran" do
  command "R -e \"install.packages('rmarkdown', repos='https://cran.rstudio.com/')\""
  not_if {::File.exists?("/usr/local/lib/R/site-library/rmarkdown/INDEX")}
end