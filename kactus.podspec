Pod::Spec.new do |spec|
    spec.name = 'kactus'
    spec.version = '1.0.5'
    spec.authors = { 'Andreatta Massimiliano' => 'massimiliano.andreatta@gmail.com' }
    spec.homepage = 'https://github.com/maxandreatta/kactus'
    spec.summary = 'A framework for iOS'
    spec.license = { :type => 'MIT' }
    spec.requires_arc = true
    spec.source = { :git => 'https://github.com/maxandreatta/kactus.git', :tag => "#{spec.version}" }
    spec.source_files = 'kactus/*.{h,m}'
# spec.framework = 'UIKit', 'QuartzCore', 'Foundation'
    spec.platform = :ios, '7.0'
end