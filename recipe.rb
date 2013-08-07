# what dev tools do we actually need?
   # autoconf
   # automake
   # binutils
   # bison
   # flex
   # gcc
   # gcc-c++
   # gettext
   # libtool
   # make
   # patch
   # pkgconfig
   # redhat-rpm-config
   # rpm-build
   # byacc
   # git
   # patchutils

packages = case node['platform_family']
           when 'rhel'
             %w{
   wxGTK-gl
   unixODBC
}
           when 'debian'
             %w{
 build-essential
 openjdk-7-jre-headless
 libwxgtk2.8-0
}
           end

# https://www.erlang-solutions.com/downloads/download-erlang-otp
packages.each do |pkg| # install each of the above
  package pkg
end

erlpkg_url = case node['platform_family']
            when 'debian'
              # currently this is for raring only... might need futher logic for 12.04 12.10 etc
              'https://elearning.erlang-solutions.com/couchdb//rbingen_adapter//package_R16B01_raring64_1371559180/esl-erlang_16.b.1-1~ubuntu~raring_amd64.deb'
            when 'rhel'
               # currently targeting centos 6
              'https://elearning.erlang-solutions.com/couchdb//rbingen_adapter//package_R16B01_centos664_1371569861/esl-erlang-R16B01-1.x86_64.rpm'
            end

erlpkg_file = '/tmp/esl-erlang.pkgtype'

remote_file erlpkg_file do
  source erlpkg_url
end

package 'esl-erlang' do
  source erlpkg_file
  provider case node['platform_family']
            when 'rhel'
             Chef::Provider::Package::Rpm
            when 'debian'
             Chef::Provider::Package::Dpkg
            end
end

