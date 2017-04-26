require 'spec_helper'

# check that zookeeper is installed and the service is started
describe package('zookeeper') do
  it { should be_installed }
end

describe service('zookeeper-server') do
  it { should be_enabled }
  it { should be_running }
end

# check that postgresql 9.4 is installed and the service is started
describe package('postgresql94-server') do
  it { should be_installed }
end

describe service('postgresql-9.4') do
  it { should be_enabled }
  it { should be_running }
end

# check that rabbitmq is installed and the service is started
describe package('rabbitmq-server') do
  it { should be_installed }
end

describe service('rabbitmq-server') do
  it { should be_enabled }
  it { should be_running }
end

# check that 'go version' reports the expected version of golang
describe command('/usr/local/go/bin/go version') do
  its(:stdout) { should match /go version go1.8.1 linux\/amd64/ }
end

# check that rabbitmq server admin port is listening
describe port(15672) do
  it { should be_listening }
end

# check that postgresql port is listening
describe port(5432) do
  it { should be_listening }
end
