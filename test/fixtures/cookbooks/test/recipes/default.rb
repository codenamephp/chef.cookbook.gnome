# frozen_string_literal: true

apt_update

user 'test' do
  manage_home true
  shell '/bin/bash'
  action :create
end

codenamephp_gnome_package 'install gnome'
codenamephp_gnome_gsettings 'Set display idle delay' do
  schema CodenamePHP::Gnome::GSettings::SCHEMA_DESKTOP_SESSION
  key CodenamePHP::Gnome::GSettings::KEY_DESKTOP_SESSION_IDLE_DELAY
  value '0'
  users ['test']
end
codenamephp_gnome_keyboard_shortcut 'Add shortcut for terminal' do
  shortcut_name 'Terminal'
  command 'gnome-terminal --maximize'
  binding "#{CodenamePHP::Gnome::GSettings::Keys::SUPER}#{CodenamePHP::Gnome::GSettings::Keys::ALT}t"
  users ['test']
end
codenamephp_gnome_keyboard_shortcut 'Add shortcut for whatever' do
  shortcut_name 'Whatever'
  command 'echo "Whatever"'
  binding "#{CodenamePHP::Gnome::GSettings::Keys::SUPER}#{CodenamePHP::Gnome::GSettings::Keys::ALT}w"
  users ['test']
end
