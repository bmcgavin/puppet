class cs {

    class {"apache2": } ->
    Class[$name]

    case $environment {
        'stage': {
            $vhost_name = 'stage.cardsounds.net'
        }
        'live': {
            $vhost_name = 'cardsounds.net'
        }
    }

    file { "/etc/apache2/sites-available/${vhost_name}":
        ensure => present,
        owner => 'root',
        group => 'root',
        mode => '0644',
        content => template('apache2/cardsounds.net.erb'),
    }

    file { "/var/www/${vhost_name}":
        ensure => directory,
        owner => 'www-data',
        group => 'www-data',
        mode => '0644',
    }
}

