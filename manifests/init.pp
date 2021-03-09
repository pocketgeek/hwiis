# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include hwiis
class hwiis {

  package { 'ruby-pwsh':
    ensure   => 'installed',
    provider => 'gem',
  }

  ->windowsfeature { 'Web-WebServer':
    ensure                 => present,
    installmanagementtools => true,
  }

  ->windowsfeature { 'Web-Scripting-Tools':
    ensure                 => present,
    installmanagementtools => true,
  }

  ->file { 'c:\\hwsite':
    ensure => 'directory',
  }

  ->iis_site { 'hwsite':
    ensure          => 'started',
    physicalpath    => 'c:\\hwsite',
    applicationpool => 'hwsite',
  }

}
