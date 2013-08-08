Elixir + Dynamo Quick Setup
===========================

This project helps you to get up and running quickly with Erlang, Elixir, and Dynamo.

It currently uses Chef to set everything up.

Summary of steps:
 1. Install pre-reqs
 2. Clone repo
 3. Start build

Enjoy Elixr + Dynamo!

Usage
-----

To use install http://www.opscode.com/chef/install/ on centos 6 or ubuntu 13.04 

Usually that simply means:

```curl -L https://www.opscode.com/chef/install.sh | sudo bash```

Install GIT if it is not already installed:
 * Ubuntu/Debian: ```sudo apt-get install -y git```
 * Centos: ```sudo yum install -y git```

Download this repo with ```git clone https://github.com/codecafe/coolaid.git```

Edit the coolaid/recipe.rb to specify the versions, branches, tags for the software.

Then let Chef do the rest by running ```chef-apply coolaid/recipe.rb```


Testing with Vagrant
--------------------

 * Install VirtualBox
 * Install Vagrant -- http://downloads.vagrantup.com/tags/v1.2.7
 * Download http://dlc.sun.com.edgesuite.net/virtualbox/4.2.16/SHA256SUMS

Then run

```
vagrant plugin install vagrant-omnibus
vagrant up
```

Author
------

Original authors:

* [Chris McClimans](https://github.com/hh)
* [Taylor Carpenter](https://github.com/taylor)

Contributions
-------------

Submit a pull request

Copyright
---------

Copyright (c) 2013 CodeCafe MIT LICENSE (see LICENSE for details)
