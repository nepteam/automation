Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin" ] }

package { "python":
    ensure => "latest"
}

package { "python-pip":
    ensure => "latest"
}

package { "git":
    ensure => "latest"
}

package { "rabbitmq-server":
    ensure => "latest"
}

package { "mongodb":
    ensure => "latest"
}

package { "redis-server":
    ensure => "latest"
}

exec { "pip_pika_install":
    command => "git clone git@github.com:pika/pika.git; cd pika; python setup.py install; cd ../; rm -rf pika",
    require => Package["python", "git"]
}

exec { "pip_others":
    command => "pip install tornado pymongo jinja2 kotoba imagination tori",
    require => Package["python", "python-pip"]
}
