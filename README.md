# golang-dev
Vagrant machine for golang development

## To build

***PREREQS***
* VMware Fusion >= 6.0
* Vagrant with Fusion Plugin

1. Install Gem Dependencies

    `bundle install`

2. Download puppet module described in Puppetfile

    `bundle exec rake modules`

3. Create and start the vagrant virtual machine

   `vagrant up`

4. Run serverspec tests to make sure all the services properly installed

   `bundle exec rake spec:all`

5. Simplify downloading modules, creating the virtual machine and running serverspec tests into one easy step?

   `bundle exec rake go`

6. See `rake -T` for all available tasks

```
rake go               # golang-dev first time install
rake modules          # downloads puppet module dependencies
rake spec:golang-dev  # Run serverspec tests to golang-dev
```
