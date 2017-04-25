require 'rake'

task :default do
  exec('rake -T')
end

def run_vagrant_command(cmd)
  $stdout.puts "Running #{cmd}. Press CTRL-C within 3 seconds if this isn't what you wanted!"
  sleep 3
  IO.popen(cmd).each_line do |line|
    puts line
  end
  rescue Interrupt
    puts "\n"
    Process.kill(9, -Process.getpgrp)
end

def run_ssh_command(cmd)
  system("vagrant ssh -c '#{cmd}'")
end

desc 'golang-dev first time install'
task :go do
  Rake::Task['modules'].invoke
  run_vagrant_command('vagrant up')
end

desc 'downloads puppet module dependencies'
task :modules do
  $stdout.puts "Downloading Puppet modules for provisioning..."
  `r10k puppetfile install -v`
end

