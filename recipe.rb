
%w{
 build-essential
 openjdk-7-jre-headless
 libwxgtk2.8-0
}.each do |pkg| # install each of the above
  package pkg
end

# https://www.erlang-solutions.com/downloads/download-erlang-otp
erlpkg_file = '/tmp/esl-erlang.deb'
erlpkg_url = 'https://elearning.erlang-solutions.com/couchdb//rbingen_adapter//package_R16B01_raring64_1371559180/esl-erlang_16.b.1-1~ubuntu~raring_amd64.deb'

remote_file erlpkg_file do
  source erlpkg_url
end

dpkg_package 'esl-erlang' do
  source erlpkg_file
end
