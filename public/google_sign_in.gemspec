Gem::Specification.new do |s|

  s.add_dependency 'google-id-token', '>= 1.4.0'
  s.add_dependency 'oauth2', '>= 1.4.0'

  s.add_development_dependency 'jwt', '>= 1.5.6'
  s.add_development_dependency 'webmock', '>= 3.4.2'

  s.files      = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- test/*`.split("\n")
end
