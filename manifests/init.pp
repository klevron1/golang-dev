class { 'erlang': epel_enable => true}

class { 'rabbitmq':
  service_manage    => true,
  service_ensure    => 'running',
  port              => '5672',
  require           => Class['erlang'],
}

rabbitmq_user { 'testuser':
  admin    => true,
  password => 'S3cr3t',
  provider => 'rabbitmqctl',
}

rabbitmq_vhost { 'vhost':
  ensure   => present,
  provider => 'rabbitmqctl',
}

rabbitmq_user_permissions { 'testuser@/':
  configure_permission => '.*',
  read_permission      => '.*',
  write_permission     => '.*',
}

rabbitmq_exchange { 'testexchange@/':
  user     => 'testuser',
  password => 'S3cr3t',
  type     => 'topic',
  ensure   => present,
  internal => false,
  auto_delete => false,
  durable => true,
  arguments => {
    hash-header => 'message-distribution-hash'
  }
}

rabbitmq_queue { 'testqueue@/':
  user        => 'testuser',
  password    => 'S3cr3t',
  durable     => true,
  auto_delete => false,
  arguments   => {
    x-message-ttl => 123,
    x-dead-letter-exchange => 'other'
  },
  ensure      => present,
}

class { 'java' :
  package => 'java-1.8.0-openjdk-devel',
}

class { 'zookeeper':
  #manage_service_file  => true,
  manage_service       => true,
  service_provider    => 'systemd',
  repo                 => 'cloudera',
  cdhver               => '5',
  initialize_datastore => true,
  require              => Class['java'],
}

class { 'golang':
  version   => '1.8.1',
  workspace => '/usr/local/src/go',
}

class { 'postgresql::globals':
  manage_package_repo => true,
#  contrib_package_name => 'postgresql94-contrib',
  version             => '9.4',
}->
class { 'postgresql::server':
  service_manage             => true,
  ip_mask_deny_postgres_user => '0.0.0.0/32',
  ip_mask_allow_all_users    => '0.0.0.0/0',
  listen_addresses           => '*',
  postgres_password          => 'S3cr3t',
}

class { 'postgresql::server::contrib':
  package_ensure => 'present',
  package_name => 'postgresql94-contrib',
}

postgresql::server::db { 'golang-database':
  user     => 'testuser',
  password => postgresql_password('testuser', 'S3cr3t'),
}
