#! /bin/bash
rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install puppet-agent-1.3.4 -y
/opt/puppetlabs/bin/puppet module install puppetlabs-rabbitmq --version 5.6.0
/opt/puppetlabs/bin/puppet module install deric-zookeeper --version 0.7.2
/opt/puppetlabs/bin/puppet module install dcoxall-golang --version 1.2.0
/opt/puppetlabs/bin/puppet module install puppetlabs-postgresql --version 4.9.0
/opt/puppetlabs/bin/puppet module install puppetlabs-java --version 1.6.0
/opt/puppetlabs/bin/puppet module install garethr-erlang --version 0.3.0
