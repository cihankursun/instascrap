Gem::Specification.new do |s|
  s.name        = 'instascrap'
  s.version     = '0.0.7'
  s.date        = '2017-08-27'
  s.summary     = 'instascrap'
  s.description = 'instascrap gem allows to download image and videos'
  s.authors     = ['Cihan KURSUN']
  s.email       = 'cihankursun95@gmail.com'
  s.files       = ['lib/instascrap.rb']
  s.homepage    = 'http://rubygems.org/gems/instascrap'
  s.license     = 'MIT'
  s.executables << 'instascrap'
  s.add_runtime_dependency 'nokogiri', '~> 1.8', '>= 1.8.0'
  s.add_runtime_dependency 'mechanize', '~> 2.7', '>= 2.7.5'
  s.add_runtime_dependency 'watir', '~> 6.1', '>= 6.2.1'

end
