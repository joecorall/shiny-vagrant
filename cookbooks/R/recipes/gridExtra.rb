execute "gridExtra-cran" do
  command "R -e \"install.packages('gridExtra', repos='https://cran.rstudio.com/')\""
  not_if {::File.exists?("/usr/local/lib/R/site-library/gridExtra/INDEX")}
end