class npp{
        notify{"Installing notepad++":}
        $package = "npp.6.9.1"
        $temp_path = "${staging_windir}\\npp"
        $source = "https://notepad-plus-plus.org/repository/6.x/6.9.1/npp.6.9.1.Installer.exe"

        staging::file{ "${package}.exe":
                source => $source,
                before      => File["${package}.exe"],
        }
        file { "${package}.exe":
            ensure => "file",
            path => "${temp_path}\\${package}.exe",
            owner => 'Administrator',
            group => 'Users',
            mode => '0755',
            notify => Package[$package],
         }

        package {$package:
            ensure          => installed,
            source          => "${temp_path}\\${package}.exe",
            install_options => ['/S']
        }
}
