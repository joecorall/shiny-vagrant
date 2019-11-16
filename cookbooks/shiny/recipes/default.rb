# Download the Shiny Server RPM file
remote_file "#{Chef::Config[:file_cache_path]}/shiny-server-1.5.12.933-amd64.deb" do
  source "https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.12.933-amd64.deb"
  not_if {::File.exists?("#{Chef::Config[:file_cache_path]}/shiny-server-1.5.12.933-amd64.deb")}
end

execute "shiny-server-install" do
  command "gdebi --n #{Chef::Config[:file_cache_path]}/shiny-server-1.5.12.933-amd64.deb"
  only_if {::File.exists?("#{Chef::Config[:file_cache_path]}/shiny-server-1.5.12.933-amd64.deb")}
  not_if "apt list --installed 2>/dev/null|grep shiny-server"
end

user 'shiny_apps' do
  comment 'User to host Shiny apps'
  home '/home/shiny_apps'
  manage_home true
  password "$1$MTv7CozP$WA23seLutiND/s9LcEkNk1"
  group "shiny"
  shell '/bin/bash'
end

directory '/home/shiny_apps' do
  owner 'shiny_apps'
  group 'shiny'
  mode '0755'
  action :create
end
service "shiny-server" do
  action :nothing
  supports :status => true, :restart => true, :reload => true
end

# Add a custom shiny server conf file
cookbook_file '/etc/shiny-server/shiny-server.conf' do
  source 'shiny-server.conf'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  notifies :restart, "service[shiny-server]", :immediately
end
