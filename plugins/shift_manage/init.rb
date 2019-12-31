Redmine::Plugin.register :shift_manage do
  name 'Shift Manage plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  menu :top_menu, :polls, { :controller => 'index', :action => 'check_in' }, :caption => :label_shift_manage
end
