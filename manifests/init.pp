# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include hwiis
class hwiis (
  $websitename,
  $websitedirectory,
) {

  $iis_features = ['Web-WebServer','Web-Scripting-Tools']

  iis_feature { $iis_features:
    ensure => 'present',
  }

  # Delete the default website to prevent a port binding conflict.
  # And because it's terrible and should feel bad.
  iis_site {'Default Web Site':
    ensure  => absent,
    require => Iis_feature['Web-WebServer'],
  }

  iis_site { $websitename:
    ensure          => 'started',
    physicalpath    => $websitedirectory,
    applicationpool => 'DefaultAppPool',
    require         => [
      File[ $websitedirectory ],
      Iis_site['Default Web Site']
    ],
  }

  file { $websitedirectory:
    ensure => 'directory',
  }

  file { 'pony.jpeg':
    ensure => 'present',
    source => 'puppet:///modules/hwiis/pony.jpeg',
  }

  file { 'default.html':
    ensure => 'present',
    source => 'puppet:///modules/hwiis/default.html',
  }
}
