require 'spec_helper'

# check that zookeeper is installed
describe package('zookeeper') do
  it { should be_installed.with_version('3.4.5') }
end

# check that zookeeper service is started and enabled to start on boot
describe service('zookeeper-server') do
  it { should be_enabled }
  it { should be_running }
end

# check that zookeeper port is listening
describe port(2181) do
  it { should be_listening }
end

# check that postgresql 9.4 is installed
describe package('postgresql94-server') do
  it { should be_installed }
end

# check that postgresql 9.4 service is started and enabled to start on boot
describe service('postgresql-9.4') do
  it { should be_enabled }
  it { should be_running }
end

# check that postgresql port is listening
describe port(5432) do
  it { should be_listening }
end

# check that rabbitmq is installed
describe package('rabbitmq-server') do
  it { should be_installed.with_version('3.3.5') }
end

# check that rabbitmq service is started and enabled to start on boot
describe service('rabbitmq-server') do
  it { should be_enabled }
  it { should be_running }
end

# check that rabbitmq server admin port is listening
describe port(15672) do
  it { should be_listening }
end

# check that 'go version' reports the expected version of golang
describe command('/usr/local/go/bin/go version') do
  its(:stdout) { should match /go version go1.8.1 linux\/amd64/ }
end

