# golang-dev
Vagrant machine for golang development using Chef Bento maintained CentOS 7.3 image. Other Bento box files can be located here:
https://atlas.hashicorp.com/bento/

## To build

***PREREQS***
* VMware Fusion >= 6.0
* Vagrant with Fusion Plugin

***Components Installed***
* Zookeeper 3.4.5
* PostgreSQL 9.4
* RabbitMQ 3.3.5
* Golang 1.8.1
* Delve debugger for golang

***Getting up and running***

1. Install Gem Dependencies

    `bundle install`

2. Download puppet module described in Puppetfile

    `bundle exec rake modules`

3. Create and start the vagrant virtual machine

   `vagrant up`

4. Run serverspec tests to make sure all the components properly installed and are running

   `bundle exec rake spec`

5. Simplify downloading modules, creating the virtual machine and running serverspec tests into one easy step?

   `bundle exec rake go`

6. See `rake -T` for all available tasks

```
rake go               # golang-dev first time install
rake modules          # downloads puppet module dependencies
rake psql             # open psql prompt within the golang-dev vm
rake spec:golang-dev  # run serverspec tests to golang-dev
```
