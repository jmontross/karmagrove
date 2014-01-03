#
# Cookbook Name:: karmagrove
# Recipe:: default
#
# Copyleft 2013, karma grove
#
# All rights are ours - Redistribute at will
#


execute "apt-get-update" do
  command "sudo apt-get update"
  ignore_failure true
  action :run
end

# provides /var/lib/apt/periodic/update-success-stamp on apt-get update
package "update-notifier-common" do
  ignore_failure true
  notifies :run, resources(:execute => "apt-get-update"), :immediately
end

execute "apt-get-update-periodic" do
  # command "apt-get update"
  ignore_failure true
  only_if do
    File.exists?('/var/lib/apt/periodic/update-success-stamp') &&
    File.mtime('/var/lib/apt/periodic/update-success-stamp') < Time.now - 86400
  end
  notifies :run, resources(:execute => "apt-get-update"), :immediately
end

# install lots of aptitude packages needed for it all to work.
%w(dpkg-dev build-essential nginx git curl ruby-bundler rubygems postgresql-devel).each do |pkg|; package pkg; end

script "install dependencies for kg" do
  interpreter "bash"
  user "root"
  # cwd "#{['p3node']['repo_dir']}"
  # cwd "/opt/picarro/node.js"
  code <<-EOH
    sudo apt-get install imagemagick --fix-missing
    sudo apt-get install postgresql postgresql-server-dev-9.1
  EOH
  ignore_failure true
end

directory "/opt/www/karmagrove" do
  action :create
  recursive true
end


git "/opt/www/karmagrove" do
  user "root"
  group "root"
  destination "/opt/www/karmagrove"
  # this is not a real repo.... where does reportgen
  repository "https://jmontross@github.com/jmontross/karmagrove.git"
  reference "master"
  action :sync
  # not_if {File.exists?('#{node['dev']['host_path']}/p3')}
end

script "install dependencies for kg" do
  interpreter "bash"
  user "root"
  # cwd "#{['p3node']['repo_dir']}"
  # cwd "/opt/picarro/node.js"
  cwd "/opt/www/karmagrove"
  code <<-EOH
     sudo gem install bundler
     sudo bundle install
     sudo bundle exec rake db:migrate
     sudo bundle exec rails s
  EOH
  ignore_failure true
end

cookbook_file "/etc/nginx/sites-available/karmagrove" do
  source "nginx-karmagrove"
  mode 0644
  # notifies nginx restart
end

link "/etc/nginx/sites-enabled/karmagrove" do
  to "/etc/nginx/sites-available/karmagrove"
end

service "nginx" do
  supports :restart => true, :reload => true
  action :restart
end

# Gem::Installer::ExtensionBuildError: ERROR: Failed to build gem native extension.

#         /usr/bin/ruby1.8 extconf.rb
# checking for pg_config... no
# No pg_config... trying anyway. If building fails, please try again with
#  --with-pg-config=/path/to/pg_config
# checking for libpq-fe.h... no
# Can't find the 'libpq-fe.h header
# *** extconf.rb failed ***
# Could not create Makefile due to some reason, probably lack of
# necessary libraries and/or headers.  Check the mkmf.log file for more
# details.  You may need configuration options.


# gem install pg -- --with-pg-config=/usr/pgsql-9.1/bin/pg_config

# sudo apt-get install postgresql postgresql-server-dev-9.1