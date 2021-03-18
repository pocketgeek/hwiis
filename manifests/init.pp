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

  #IIS and required features
  $iis_features = ['Web-WebServer','Web-Scripting-Tools']

  #Make sure IIS and required features are installed
  iis_feature { $iis_features:
    ensure => 'present',
  }

  # Delete the default website to prevent a port binding conflict.
  # And because it's terrible and should feel bad.
  iis_site {'Default Web Site':
    ensure  => absent,
    require => Iis_feature['Web-WebServer'],
  }

  #Build website
  iis_site { $websitename:
    ensure          => 'started',
    physicalpath    => $websitedirectory,
    applicationpool => 'DefaultAppPool',
    require         => [
      File[ $websitedirectory ],
      Iis_site['Default Web Site']
    ],
  }

  #Make sure the website base directory exsits and no extra stuff is in it
  file { $websitedirectory:
    ensure  => directory,
    purge   => true,
    recurse => true,
    source  => 'puppet:///modules/hwiis/empty',
  }

  #Website content.
  file { "${websitedirectory}\\pony.jpeg":
    ensure => 'present',
    source => 'puppet:///modules/hwiis/pony.jpeg',
  }

  #Website content
  file { "${websitedirectory}\\default.htm":
    ensure => 'present',
    source => 'puppet:///modules/hwiis/default.htm',
  }
}
