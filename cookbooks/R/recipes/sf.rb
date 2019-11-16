package %w(gdal-bin libgdal-dev libudunits2-dev)

# After GDAL is nstalled, install sf package
execute "sf-cran" do
  command "R -e \"install.packages('sf', repos='https://cran.rstudio.com/')\""
  not_if {::File.exists?("/usr/local/lib/R/site-library/sf/INDEX")}
end
