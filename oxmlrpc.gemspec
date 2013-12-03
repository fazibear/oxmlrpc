Gem::Specification.new do |s|
  s.name        = 'oxmlrpc'
  s.version     = '0.1'
  s.date        = Time.now.strftime("%Y-%m-%d")
  s.authors     = ['fazibear']
  s.email       = 'fazibear@gmail.com'
  s.summary     = 'Fast and simple XML-RPC Client'
  s.homepage    = 'http://github.com/fazibear/oxmlrpc'
  s.description = 'Simple, lightweight and fast XML-RPC client library for ruby based on OX XML parser.'

  s.files       = Dir["lib/**/*"] +
                  Dir["spec/**/*"]
  
  s.add_dependency 'ox', '~> 2.0'
  s.add_development_dependency 'rspec'
end
