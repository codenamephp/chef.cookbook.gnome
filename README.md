# GNOME
[![CI](https://github.com/codenamephp/chef.cookbook.gnome/actions/workflows/ci.yml/badge.svg)](https://github.com/codenamephp/chef.cookbook.gnome/actions/workflows/ci.yml)

Cookbook to install the GNOME gui and manage settings and keyboard shortcuts.

## Requirements

### Supported Platforms

- Debian Stretch

### Chef

- Chef 15.3+

### Cookbook Depdendencies

## Usage

Add the cookbook to your Berksfile or Metadata of your (wrapper) cookbook and then use the resources as needed.

## Resources
### Package
The `codenamephp_gui_xfce` resource installs or uninstalls the gnome gui.

#### Actions
- `:install`: Installs the gui using apt
- `:uninstall`: Uninstalls the gui using apt

#### Properties
- `package_name`: The name of the apt package to use for install, defaults to 'gnome-core' for a "minimal" install

#### Examples
```ruby
# Minmal parameters
codenamephp_gnome 'install gnome gui'

# Custom package name
codenamephp_gnome 'install gnome gui' do
  package_name 'gnome'
end

# Uninstall
codenamephp_gnome 'install gnome gui' do
  action :uninstall
end
```
### Gnome Gsettings
Resource to set gsettings configurations. There are constants in `CodenamePHP::Gnome::GSettings` that can be used for known schemas and keys

#### Actions
- `:set`: Sets the configuration

#### Properties
- `schema`: The schema the configuration is located in, e.g. 'org.gnome.desktop.session'
- `key`: The key within the schema to be set, e.g. 'idle-delay'
- `value`: The value to set, e.g. '0'
- `users`: The users to set the settings for as array of usernames

#### Examples
```ruby
# Minimal parameters
codenamephp_gnome_gsettings 'Set display idle delay' do
  schema CodenamePHP::Gnome::GSettings::SCHEMA_DESKTOP_SESSION
  key CodenamePHP::Gnome::GSettings::KEY_DESKTOP_SESSION_IDLE_DELAY
  value '0'
  users ['test']
end
```

### Gnome Keyboard Shortcuts
The `codenamephp_gnome_keyboard_shortcuts` resource adds custom shortcuts for the gnome desktop. This is done by getting the custom shortcuts using gsettings
and then adding the new shortcut and adds back all shortcuts. If a shortcut with the same name already exists it is replaced by the new one

#### Actions
- `set`: Sets a new or replaces an existing shortcut

#### Properties
- `shortcut_name`: The name of the shortcut to set, defaults to the resource name
- `command`: The command the shortcut should execute
- `binding`: The keys the shortcut consists of, also see the `CodenamePHP::Gnome::GSettings::Keys::*` constants
- `users`: The users to set the shortcuts for as array of usernames

#### Examples
```ruby
codenamephp_gnome_keyboard_shortcut 'Terminal' do
  command 'gnome-terminal --maximize'
  binding "#{CodenamePHP::Gnome::GSettings::Keys::SUPER}#{CodenamePHP::Gnome::GSettings::Keys::ALT}t"
  users ['test']
end
```
