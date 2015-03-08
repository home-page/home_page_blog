SimpleNavigation::Configuration.run do |navigation|
  instance_exec navigation, &HomePageBlog::Navigation.code
end