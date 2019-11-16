package %w(gdebi-core lib32gcc1 lib32stdc++6 libc6-i386 libclang-6.0-dev libclang-common-6.0-dev libclang-dev libclang1-6.0 libgc1c2 libllvm6.0 libobjc-7-dev libobjc4)

remote_file "#{Chef::Config[:file_cache_path]}/rstudio-server-1.2.5019-amd64.deb" do
  source "https://download2.rstudio.org/server/trusty/amd64/rstudio-server-1.2.5019-amd64.deb"
  not_if {::File.exists?("#{Chef::Config[:file_cache_path]}/rstudio-server-1.2.5019-amd64.deb")}
end

service "rstudio-server" do
  action :nothing
  supports :restart => true
end

# Enable the EPEL yum repo via the downloaded file
# This will only get triggered by the download above
execute "rstudio" do
  command "gdebi --n #{Chef::Config[:file_cache_path]}/rstudio-server-1.2.5019-amd64.deb"
  only_if {::File.exists?("#{Chef::Config[:file_cache_path]}/rstudio-server-1.2.5019-amd64.deb")}
  not_if "apt list --installed 2>/dev/null | grep rstudio-server"
  notifies :restart, "service[rstudio-server]"
end
