execute "raster-cran" do
  command "R -e \"install.packages('raster', repos='https://cran.rstudio.com/')\""
  not_if {::File.exists?("/usr/local/lib/R/site-library/raster/INDEX")}
end