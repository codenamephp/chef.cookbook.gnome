require 'spec_helper'

describe 'codenamephp_gnome_package' do
  platform 'debian' # https://github.com/chefspec/chefspec/issues/953

  step_into :codenamephp_gnome_package

  context 'Install when all attributes are default' do
    recipe do
      codenamephp_gnome_package 'install gnome'
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs gnome-core from package' do
      expect(chef_run).to install_package('install gnome from package').with(package_name: %w(gnome-core gnome-tweaks))
    end
  end

  context 'Install with custom package name' do
    recipe do
      codenamephp_gnome_package 'install gnome' do
        package_name 'some package'
        extra_packages ['new package', 'some package', 'another package']
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs gnome-core from package' do
      expect(chef_run).to install_package('install gnome from package').with(package_name: ['some package', 'new package', 'another package'])
    end
  end

  context 'Uninstall with default attributes' do
    recipe do
      codenamephp_gnome_package 'install gnome' do
        action :uninstall
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs gnome-core from package' do
      expect(chef_run).to remove_package('uninstall gnome from package').with(package_name: %w(gnome-core gnome-tweaks))
    end
  end

  context 'Uninstall with custom attributes' do
    recipe do
      codenamephp_gnome_package 'install gnome' do
        package_name 'some package'
        extra_packages ['new package', 'some package', 'another package']
        action :uninstall
      end
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs gnome-core from package' do
      expect(chef_run).to remove_package('uninstall gnome from package').with(package_name: ['some package', 'new package', 'another package'])
    end
  end
end
