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
%w(dpkg-dev build-essential nginx git curl ruby-bundler rubygems postgresql postgresql-server-dev-9.1 libmagickwand-dev).each do |pkg|; package pkg; end

script "install dependencies for kg" do
  interpreter "bash"
  user "root"
  # cwd "#{['p3node']['repo_dir']}"
  # cwd "/opt/picarro/node.js"
  code <<-EOH
    sudo apt-get install imagemagick --fix-missing
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
  EOH
  ignore_failure true
  notifies script("rails s")
end

script "rails s" do
  interpreter "bash"
  user "root"
  # cwd "#{['p3node']['repo_dir']}"
  # cwd "/opt/picarro/node.js"
  cwd "/opt/www/karmagrove"
  code <<-EOH
     sudo bundle exec rake db:migrate
     sudo bundle exec rails s
  EOH
  action :nothing
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

# ERROR: script[install dependencies for kg] (karmagrove::default line 36) had an error: Expected process to exit with [0], but received '1'
# ---- Begin output of "bash"  "/tmp/chef-script20140103-1293-1dbf7yb-0" ----
# STDOUT: Reading package lists...
# Building dependency tree...
# Reading state information...
# The following extra packages will be installed:
#   cmap-adobe-japan1 fontconfig fontconfig-config ghostscript gs-cjk-resource
#   gsfonts imagemagick-common libavahi-client3 libavahi-common-data
#   libavahi-common3 libcairo2 libcdt4 libcroco3 libcups2 libcupsimage2
#   libdatrie1 libdjvulibre-text libdjvulibre21 libfontconfig1
#   libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgraph4 libgs9 libgs9-common
#   libgvc5 libijs-0.35 libilmbase6 libjasper1 libjbig2dec0 liblcms1 liblcms2-2
#   liblqr-1-0 libltdl7 libmagickcore4 libmagickcore4-extra libmagickwand4
#   libnetpbm10 libopenexr6 libpango1.0-0 libpaper-utils libpaper1 libpathplan4
#   libpixman-1-0 librsvg2-2 libthai-data libthai0 libtiff4 libwmf0.2-7
#   libxcb-render0 libxcb-shm0 libxft2 libxrender1 netpbm ttf-dejavu-core
# Suggested packages:
#   ghostscript-cups ghostscript-x hpijs fonts-ipafont-mincho
#   fonts-ipafont-gothic ttf-arphic-ukai ttf-arphic-uming fonts-unfonts-core
#   imagemagick-doc autotrace cups-bsd lpr lprng enscript ffmpeg gimp gnuplot
#   grads hp2xx html2ps libwmf-bin mplayer povray radiance sane-utils
#   texlive-base-bin transfig xdg-utils ufraw-batch cups-common
#   libjasper-runtime liblcms-utils liblcms2-utils ttf-baekmuk
#   ttf-arphic-gbsn00lp ttf-arphic-bsmi00lp ttf-arphic-gkai00mp
#   ttf-arphic-bkai00mp librsvg2-bin libwmf0.2-7-gtk
# The following NEW packages will be installed:
#   cmap-adobe-japan1 fontconfig fontconfig-config ghostscript gs-cjk-resource
#   gsfonts imagemagick imagemagick-common libavahi-client3 libavahi-common-data
#   libavahi-common3 libcairo2 libcdt4 libcroco3 libcups2 libcupsimage2
#   libdatrie1 libdjvulibre-text libdjvulibre21 libfontconfig1
#   libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgraph4 libgs9 libgs9-common
#   libgvc5 libijs-0.35 libilmbase6 libjasper1 libjbig2dec0 liblcms1 liblcms2-2
#   liblqr-1-0 libltdl7 libmagickcore4 libmagickcore4-extra libmagickwand4
#   libnetpbm10 libopenexr6 libpango1.0-0 libpaper-utils libpaper1 libpathplan4
#   libpixman-1-0 librsvg2-2 libthai-data libthai0 libtiff4 libwmf0.2-7
#   libxcb-render0 libxcb-shm0 libxft2 libxrender1 netpbm ttf-dejavu-core
# 0 upgraded, 55 newly installed, 0 to remove and 156 not upgraded.
# Need to get 22.1 MB of archives.
# After this operation, 60.9 MB of additional disk space will be used.
# Do you want to continue [Y/n]? Abort.
# Reading package lists...
# Building dependency tree...
# Reading state information...
# The following extra packages will be installed:
#   comerr-dev krb5-multidev libgssapi-krb5-2 libgssrpc4 libk5crypto3
#   libkadm5clnt-mit8 libkadm5srv-mit8 libkdb5-6 libkrb5-3 libkrb5-dev
#   libkrb5support0 libpq-dev libpq5 postgresql-9.1 postgresql-client-9.1
#   postgresql-client-common postgresql-common ssl-cert
# Suggested packages:
#   doc-base krb5-doc krb5-user postgresql-doc-9.1 oidentd ident-server
#   locales-all openssl-blacklist
# The following NEW packages will be installed:
#   comerr-dev krb5-multidev libgssrpc4 libkadm5clnt-mit8 libkadm5srv-mit8
#   libkdb5-6 libkrb5-dev libpq-dev libpq5 postgresql postgresql-9.1
#   postgresql-client-9.1 postgresql-client-common postgresql-common
#   postgresql-server-dev-9.1 ssl-cert
# The following packages will be upgraded:
#   libgssapi-krb5-2 libk5crypto3 libkrb5-3 libkrb5support0
# 4 upgraded, 16 newly installed, 0 to remove and 152 not upgraded.
# Need to get 7328 kB of archives.
# After this operation, 22.1 MB of additional disk space will be used.
# Do you want to continue [Y/n]? Abort.
# STDERR:
# ---- End output of "bash"  "/tmp/chef-script20140103-1293-1dbf7yb-0" ----
# Ran "bash"  "/tmp/chef-script20140103-1293-1dbf7yb-0" returned 1; ignore_failure is set, continuing

# ================================================================================
# Error executing action `run` on resource 'script[install dependencies for kg]'
# ==================================================================