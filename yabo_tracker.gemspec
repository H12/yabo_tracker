Gem::Specification.new do |s|
  s.add_dependency 'nokogiri', '~> 1.6'
  s.name        = 'yabo_tracker'
  s.version     = '0.0.1'
  s.date        = '2016-03-18'
  s.summary     = "MLB Homerun Tracker"
  s.description = "Resource for accessing homerun data by ballpark"
  s.authors     = ["Henry Firth"]
  s.email       = 'henrynf12@gmail.com'
  s.files       = ["lib/yabo_tracker.rb", "lib/yabo_tracker/homerun.rb"]
  s.homepage    =
    'https://github.com/H12/yabo_tracker'
  s.license       = 'MIT'
end