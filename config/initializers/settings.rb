if Setting.table_exists? && !Setting['home_page.general.plugins'].include?('home_page_blog')
  Setting['home_page.general.plugins'] = Setting['home_page.general.plugins'] + ['home_page_blog']
end