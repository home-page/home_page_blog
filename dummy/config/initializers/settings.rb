if Setting.table_exists?
  Setting['home_page.general.navigation.items'] = [['blog', 'posts'], 'users', 'settings', 'authentication']
end