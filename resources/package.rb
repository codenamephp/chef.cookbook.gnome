# frozen_string_literal: true

unified_mode true

property :package_name, String, default: 'gnome-core', description: 'The package name that is used to install gnome'
property :extra_packages, Array, default: ['gnome-tweaks'], description: 'Additional packages to be installed together with the base package'

action :install do
  package 'install gnome from package' do
    package_name [new_resource.package_name] | new_resource.extra_packages
  end
end

action :uninstall do
  package 'uninstall gnome from package' do
    package_name [new_resource.package_name] | new_resource.extra_packages
    action :remove
  end
end
