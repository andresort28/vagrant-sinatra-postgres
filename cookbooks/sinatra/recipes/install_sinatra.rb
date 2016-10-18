execute 'install_ruby' do
 command 'yum install ruby -y'
end

execute 'gem_install' do
 command 'yum install rubygems'
end

gem_package 'sinatra'

execute 'pg' do
 command 'yum localinstall http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg-centos94-9.4-3.noarch.rpm -y'
end

execute 'install_pg_libs' do
 command 'yum install postgresql94-libs -y'
end

execute 'install_pg_devel' do
 command 'yum install postgresql94-devel -y'
end

execute 'install_ruby_devel' do
 command 'yum -y install ruby-devel'
end

execute 'install_pg' do
 command 'gem install pg -- --with-pg-config=/usr/pgsql-9.4/bin/pg_config'
end

directory "/home/vagrant/api" do
  owner "root"
  group "wheel"
  mode 0644
  action :create
end

cookbook_file "/home/vagrant/api/app.rb" do
	source "app.rb"
	mode 0644
	owner "root"
	group "wheel"
end

bash "open port" do
	user "root"
	code <<-EOH
	iptables -A INPUT -p tcp -m tcp --dport 8585 -j ACCEPT
	EOH
end

bash "execute_services" do
  user "root"
  cwd "/home/vagrant/api"
  code <<-EOH
  ruby app.rb -o 0.0.0.0 -p 8585
  EOH
end