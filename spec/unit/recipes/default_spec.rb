#
# Cookbook:: nodejs_nginx
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'nodejs_nginx::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    # Installing
      # Install Nginx
    it 'Should install Nginx' do
      expect(chef_run).to install_package 'nginx'
    end
      # Install Nodejs
    it 'Should install Nodejs' do
      expect(chef_run).to install_package 'nodejs'
    end

    # Services
      # start and enable
    it 'Should Enable Nginx' do
      expect(chef_run).to enable_service 'nginx'
    end

    it 'Should Start Nginx' do
      expect(chef_run).to enable_service 'nginx'
    end

    # if we created a new proxy.config file for Nginx
    it 'should create a proxy.conf template in /etc/nginx/sites-available' do
      expect(chef_run).to create_template '/etc/nginx/sites-available/proxy.conf'
    end

    it 'Should create a symlink from proxy.conf.erb to /etc/nginx/sites-enabled' do
      expect(chef_run).to create_link "/etc/nginx/sites-enabled/proxy.conf"
    end

    it 'should delete link from proxy.conf.erb to /etc/nginx/sites-enabled' do
      expect(chef_run).to delete_link "/etc/nginx/sites-enabled/default"
    end
  end
end
