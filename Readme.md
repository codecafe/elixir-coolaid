To use install http://www.opscode.com/chef/install/ on centos 6 or ubuntu 13.04 then:


# Install GIT
```sudo apt-get install -y git``` or ```sudo yum install -y git```

```
git clone https://github.com/codecafe/coolaid.git
sudo chef-apply coolaid/recipe.rb
```

To test install http://downloads.vagrantup.com/tags/v1.2.7
and http://dlc.sun.com.edgesuite.net/virtualbox/4.2.16/SHA256SUMS then:

```
vagrant plugin install vagrant-omnibus
vagrant up
```

Current output:

```
[hh@M18xR2:~/elixir (master)] 
☺ ➔  vagrant up
Bringing machine 'ubuntu' up with 'virtualbox' provider...
Bringing machine 'centos' up with 'virtualbox' provider...
[ubuntu] Importing base box 'ubuntu_13.04_base'...
[ubuntu] Matching MAC address for NAT networking...
[ubuntu] Setting the name of the VM...
[ubuntu] Clearing any previously set forwarded ports...
[ubuntu] Fixed port collision for 22 => 2222. Now on port 2202.
[ubuntu] Creating shared folders metadata...
[ubuntu] Clearing any previously set network interfaces...
[ubuntu] Preparing network interfaces based on configuration...
[ubuntu] Forwarding ports...
[ubuntu] -- 22 => 2202 (adapter 1)
[ubuntu] Booting VM...
[ubuntu] Waiting for VM to boot. This can take a few minutes.
[ubuntu] VM booted and ready for use!
[ubuntu] Mounting shared folders...
[ubuntu] -- /vagrant
[ubuntu] Installing Chef 11.6.0 Omnibus package...
[ubuntu] Running provisioner: shell...
[ubuntu] Running: inline script
stdin: is not a tty
[43:14] INFO: Run List is []
[43:14] INFO: Run List expands to []
[43:14] INFO: Processing package[build-essential] action install ((chef-apply cookbook)::(chef-apply recipe) line 33)
[43:15] INFO: Processing package[git-core] action install ((chef-apply cookbook)::(chef-apply recipe) line 33)
[43:21] INFO: Processing package[openjdk-7-jre-headless] action install ((chef-apply cookbook)::(chef-apply recipe) line 33)
[43:33] INFO: Processing package[libwxgtk2.8-0] action install ((chef-apply cookbook)::(chef-apply recipe) line 33)
[43:53] INFO: Processing remote_file[/tmp/esl-erlang.pkgtype] action create ((chef-apply cookbook)::(chef-apply recipe) line 37)
[43:53] INFO: remote_file[/tmp/esl-erlang.pkgtype] created file /tmp/esl-erlang.pkgtype
[44:15] INFO: remote_file[/tmp/esl-erlang.pkgtype] updated file contents /tmp/esl-erlang.pkgtype
[44:15] INFO: Processing package[esl-erlang] action install ((chef-apply cookbook)::(chef-apply recipe) line 41)
[44:20] INFO: Processing git[/opt/elixir] action sync ((chef-apply cookbook)::(chef-apply recipe) line 47)
[44:21] INFO: git[/opt/elixir] cloning repo https://github.com/elixir-lang/elixir.git to /opt/elixir
[44:32] INFO: git[/opt/elixir] checked out branch: v0.10.1 reference: 0523789c334f48cc15fddae70af30a9f045aa617
[44:32] INFO: Processing bash[Compile and Test Elixer] action run ((chef-apply cookbook)::(chef-apply recipe) line 52)
[45:33] INFO: bash[Compile and Test Elixer] ran successfully
[45:33] INFO: Processing git[/var/chef/cache/rebar] action sync ((chef-apply cookbook)::(chef-apply recipe) line 69)
[45:38] INFO: git[/var/chef/cache/rebar] cloning repo https://github.com/rebar/rebar.git to /var/chef/cache/rebar
[45:42] INFO: git[/var/chef/cache/rebar] checked out branch: 2.0.0 reference: 1c98f6ccd4adc915167d4302d732d79e4da3d390
[45:42] INFO: Processing execute[make rebar] action nothing ((chef-apply cookbook)::(chef-apply recipe) line 75)
[45:42] INFO: Processing link[/opt/elixir/bin/rebar] action create ((chef-apply cookbook)::(chef-apply recipe) line 81)
[45:42] INFO: link[/opt/elixir/bin/rebar] created
[45:42] INFO: Processing file[/etc/profile.d/elixier.sh] action create ((chef-apply cookbook)::(chef-apply recipe) line 85)
[45:42] INFO: file[/etc/profile.d/elixier.sh] created file /etc/profile.d/elixier.sh
[45:42] INFO: file[/etc/profile.d/elixier.sh] updated file contents /etc/profile.d/elixier.sh
[45:42] INFO: Processing git[/opt/dynamo] action sync ((chef-apply cookbook)::(chef-apply recipe) line 91)
[45:43] INFO: git[/opt/dynamo] cloning repo https://github.com/elixir-lang/dynamo.git to /opt/dynamo
[45:50] INFO: git[/opt/dynamo] checked out branch: elixir-0.10.0 reference: 541ec3b34278fb0a4a0dcc127d80630d6300fe9a
[45:50] INFO: Processing execute[make dynamo] action nothing ((chef-apply cookbook)::(chef-apply recipe) line 97)
[45:50] INFO: git[/var/chef/cache/rebar] sending run action to execute[make rebar] (delayed)
[45:50] INFO: Processing execute[make rebar] action run ((chef-apply cookbook)::(chef-apply recipe) line 75)
[45:51] INFO: execute[make rebar] ran successfully
[45:51] INFO: git[/opt/dynamo] sending run action to execute[make dynamo] (delayed)
[45:51] INFO: Processing execute[make dynamo] action run ((chef-apply cookbook)::(chef-apply recipe) line 97)
[45:51] INFO: execute[make dynamo] ran successfully
[centos] Importing base box 'centos_6.4_base'...
[centos] Matching MAC address for NAT networking...
[centos] Setting the name of the VM...
[centos] Clearing any previously set forwarded ports...
[centos] Fixed port collision for 22 => 2202. Now on port 2203.
[centos] Creating shared folders metadata...
[centos] Clearing any previously set network interfaces...
[centos] Preparing network interfaces based on configuration...
[centos] Forwarding ports...
[centos] -- 22 => 2203 (adapter 1)
[centos] Booting VM...
[centos] Waiting for VM to boot. This can take a few minutes.
[centos] VM booted and ready for use!
[centos] Mounting shared folders...
[centos] -- /vagrant
[centos] Installing Chef 11.6.0 Omnibus package...
[centos] Running provisioner: shell...
[centos] Running: inline script
[47:30] INFO: Run List is []
[47:30] INFO: Run List expands to []
[47:30] INFO: Processing package[git] action install ((chef-apply cookbook)::(chef-apply recipe) line 37)
[47:35] INFO: Processing package[wxGTK-gl] action install ((chef-apply cookbook)::(chef-apply recipe) line 37)
[47:35] INFO: package[wxGTK-gl] installing wxGTK-gl-2.8.12-1.el6.centos from extras repository
[47:45] INFO: Processing package[unixODBC] action install ((chef-apply cookbook)::(chef-apply recipe) line 37)
[47:45] INFO: package[unixODBC] installing unixODBC-2.2.14-12.el6_3 from base repository
[47:47] INFO: Processing remote_file[/tmp/esl-erlang.pkgtype] action create ((chef-apply cookbook)::(chef-apply recipe) line 41)
[47:47] INFO: remote_file[/tmp/esl-erlang.pkgtype] created file /tmp/esl-erlang.pkgtype
[48:12] INFO: remote_file[/tmp/esl-erlang.pkgtype] updated file contents /tmp/esl-erlang.pkgtype
[48:12] INFO: Processing package[esl-erlang] action install ((chef-apply cookbook)::(chef-apply recipe) line 45)
[48:18] INFO: Processing git[/opt/elixir] action sync ((chef-apply cookbook)::(chef-apply recipe) line 51)
[48:20] INFO: git[/opt/elixir] cloning repo https://github.com/elixir-lang/elixir.git to /opt/elixir
[48:30] INFO: git[/opt/elixir] checked out branch: v0.10.1 reference: 0523789c334f48cc15fddae70af30a9f045aa617
[48:30] INFO: Processing bash[Compile and Test Elixer] action run ((chef-apply cookbook)::(chef-apply recipe) line 56)
[49:57] INFO: bash[Compile and Test Elixer] ran successfully
[49:57] INFO: Processing git[/var/chef/cache/rebar] action sync ((chef-apply cookbook)::(chef-apply recipe) line 73)
[50:04] INFO: git[/var/chef/cache/rebar] cloning repo https://github.com/rebar/rebar.git to /var/chef/cache/rebar
[51:27] INFO: git[/var/chef/cache/rebar] checked out branch: 2.0.0 reference: 1c98f6ccd4adc915167d4302d732d79e4da3d390
[51:27] INFO: Processing execute[make rebar] action nothing ((chef-apply cookbook)::(chef-apply recipe) line 79)
[51:27] INFO: Processing link[/opt/elixir/bin/rebar] action create ((chef-apply cookbook)::(chef-apply recipe) line 85)
[51:27] INFO: link[/opt/elixir/bin/rebar] created
[51:27] INFO: Processing file[/etc/profile.d/elixier.sh] action create ((chef-apply cookbook)::(chef-apply recipe) line 89)
[51:27] INFO: file[/etc/profile.d/elixier.sh] created file /etc/profile.d/elixier.sh
[51:27] INFO: file[/etc/profile.d/elixier.sh] updated file contents /etc/profile.d/elixier.sh
[51:27] INFO: Processing git[/opt/dynamo] action sync ((chef-apply cookbook)::(chef-apply recipe) line 95)
[51:28] INFO: git[/opt/dynamo] cloning repo https://github.com/elixir-lang/dynamo.git to /opt/dynamo
[51:35] INFO: git[/opt/dynamo] checked out branch: elixir-0.10.0 reference: 541ec3b34278fb0a4a0dcc127d80630d6300fe9a
[51:35] INFO: Processing execute[make dynamo] action nothing ((chef-apply cookbook)::(chef-apply recipe) line 101)
[51:35] INFO: git[/var/chef/cache/rebar] sending run action to execute[make rebar] (delayed)
[51:35] INFO: Processing execute[make rebar] action run ((chef-apply cookbook)::(chef-apply recipe) line 79)
[51:37] INFO: execute[make rebar] ran successfully
[51:37] INFO: git[/opt/dynamo] sending run action to execute[make dynamo] (delayed)
[51:37] INFO: Processing execute[make dynamo] action run ((chef-apply cookbook)::(chef-apply recipe) line 101)
[51:37] INFO: execute[make dynamo] ran successfully
```
