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
Installs the gui using apt.

#### Actions
- `install`: Installs the package
- `uninstall`: Uninstalls the package

#### Properties
- `package_name`: The name of the package to install, defaults to 'gnome-core' for a minimal install

#### Examples
With minimal properties:
```ruby
# Install
codenamephp_gnome_package 'install gnome'

# Custom package name
codenamephp_gnome_package 'install gnome' do
  package_name 'gnome'
end
```
