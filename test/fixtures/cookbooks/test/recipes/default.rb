codenamephp_gnome_package 'install gnome'

codenamephp_gui_gnome_gsettings 'Set display idle delay' do
  schema CodenamePHP::Gnome::GSettings::SCHEMA_DESKTOP_SESSION
  key CodenamePHP::Gnome::GSettings::KEY_DESKTOP_SESSION_IDLE_DELAY
  value '0'
  users ['test']
end
