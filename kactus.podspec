Pod::Spec.new do |s|
  s.name         = 'kactus'
  s.version      = '1.0'
  s.license      = 'MIT'
  s.homepage     = 'https://github.com/maxandreatta/kactus'
  s.authors      =  'Andreatta Massimiliano'
  s.summary      = '<#Summary (Up to 140 characters#>'

# Source Info
  s.platform     =  :ios, ''
  s.source       =  :git => 'git://github.com/maxandreatta/kactus.git', :tag => 'v1.0'
  s.source_files = 'Library/*'
# s.framework    =  ''
  s.requires_arc = true
  
# Pod Dependencies

# s.dependency 'SocketRocket'

end