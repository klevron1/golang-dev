require 'spec_helper'

describe "Test zookeeper package and service" do

  describe package('zookeeper') do
    it { should be_installed }
  end

  describe service('zookeeper-server') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(2181) do
    it { should be_listening }
  end
end

describe "Test postgresql-9.4 package and service" do
  describe package('postgresql94-server') do
    it { should be_installed }
  end

  describe package('postgresql94-contrib') do
    it { should be_installed }
  end

  describe service('postgresql-9.4') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(5432) do
    it { should be_listening }
  end
end

describe "Test rabbitmq packages and service" do
  describe package('java-1.8.0-openjdk') do
    it { should be_installed }
  end

  describe package('erlang') do
    it { should be_installed }
  end

  describe package('rabbitmq-server') do
    it { should be_installed }
  end

  describe service('rabbitmq-server') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(15672) do
    it { should be_listening }
  end
end
describe "Test golang package" do
  describe command('/usr/local/go/bin/go version') do
    its(:stdout) { should match /go version go1.8.1 linux\/amd64/ }
  end

  describe package('gcc') do
    it { should be_installed }
  end
end
