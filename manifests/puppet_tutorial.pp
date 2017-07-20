node "avm4.llnl.gov" {

file { '/root/example_file.txt':
    ensure => "file",
    owner  => "root",
    group  => "root",
    mode   => "700",
    content => "Congratulations!
Puppet has created this file.
",}

file { '/etc/hosts':
    owner => 'root',
    group => 'root',
    source => '/Puppet-Manifests/hosts',
    mode => '0644'
,}

file { '/etc/resolv.conf':
    owner => 'root',
    group => 'root',
    source => '/Puppet-Manifests/resolv.conf',
    mode => '0644'
,}

cron { 'check':
    command => 'cd /Puppet-Manifests && git pull',
    user => 'root',
    minute => '*'
,}

cron { 'puppet_apply':
    command => 'puppet apply /Puppet-Manifests/manifests/puppet_tutorial.pp'
    user => 'root',
    minute => '*'
,}

} # End node mynode.example.com

