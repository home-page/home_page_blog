$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'home_page_blog/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'home_page_blog'
  s.version     = HomePageBlog::VERSION
  s.authors     = ['Mathias Gawlista']
  s.email       = ['gawlista@gmail.com']
  s.homepage    = 'http://Blog.Home-Page.Software'
  s.summary     = 'Blog module for home_page gem.'
  s.description = 'Blog module for home_page gem.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'home_page', '~> 0.0.4'

  s.add_development_dependency 'mysql2'
end
