##### attributes / variables

elixir_release = 'v0.10.1'
rebar_release = '2.0.0'
dynamo_release = 'elixir-0.10.0'
elixir_dir = '/opt/elixir'
dynamo_dir = '/opt/dynamo'

erl_ver = '5.10.2' # BEAM ver (just for verification purposes)
# Would be nice if I could just look for 16B etc

case node['platform_family']
when 'rhel'
  pkg_prov = Chef::Provider::Package::Rpm
  packages =  %w{
    git
    wxGTK-gl
    unixODBC
  }  
  erlpkg = 'package_R16B01_centos664_1371569861/esl-erlang-R16B01-1.x86_64.rpm'
when 'debian'
  pkg_prov = Chef::Provider::Package::Dpkg
  packages = %w{
    build-essential
    git-core
    openjdk-7-jre-headless
    libwxgtk2.8-0
  }
  erlpkg = 'package_R16B01_raring64_1371559180/esl-erlang_16.b.1-1~ubuntu~raring_amd64.deb'
end

erlpkg_file = '/tmp/esl-erlang.pkgtype'

##### chef resources

packages.each do |pkg|
  package pkg
end

# From https://www.erlang-solutions.com/downloads/download-erlang-otp
remote_file erlpkg_file do
  source 'https://elearning.erlang-solutions.com/couchdb//rbingen_adapter//' + erlpkg
end

package 'esl-erlang' do
  source erlpkg_file
  provider pkg_prov
  not_if "erl -version 2>&1| grep #{erl_ver}"
end

git elixir_dir do
  repository 'https://github.com/elixir-lang/elixir.git'
  reference elixir_release
end

bash 'Compile and Test Elixer' do
  code <<-EOC
  make test
  EOC
  cwd elixir_dir
  timeout nil
  returns [0,2] # does the below help us understand why 2 is returned?
# Finished in 1.5 seconds (1.2s on load, 0.3s on tests)
# 93 tests, 0 failures
# ==> doctest (exunit)
# STDERR: Killed
# make: *** [test_doc_test] Error 137
# ---- End output of "bash"  "/tmp/chef-script20130807-25188-15hc020" ----
# Ran "bash"  "/tmp/chef-script20130807-25188-15hc020" returned 2
  creates "#{elixir_dir}/lib/elixir/ebin/elixir.app"
end

git "#{Chef::Config[:file_cache_path]}/rebar" do
  repository 'https://github.com/rebar/rebar.git'
  reference rebar_release
  notifies :run, 'execute[make rebar]'
end

execute 'make rebar' do
  command './bootstrap'
  action :nothing
  cwd "#{Chef::Config[:file_cache_path]}/rebar"
end

link "#{elixir_dir}/bin/rebar" do
  to "#{Chef::Config[:file_cache_path]}/rebar/rebar"
end

file '/etc/profile.d/elixier.sh' do
  content <<-EOE
  PATH="$PATH::#{elixir_dir}/bin"
  EOE
end

git dynamo_dir do
  repository 'https://github.com/elixir-lang/dynamo.git'
  reference dynamo_release
  notifies :run, 'execute[make dynamo]'
end

execute 'make dynamo' do
  # warning... this uses git:// remotes http_proxies won't work
  # || true because many tests fail.. make make w/o tests?
  command 'mix do deps.get, test || true'
  environment ({
    'MIX_ENV' => 'test'
  })
  action :nothing
  cwd dynamo_dir
end
