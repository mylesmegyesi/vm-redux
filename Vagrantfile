
Vagrant.configure('2') do |config|

  config.ssh.forward_agent = true
  config.ssh.keep_alive    = true
  config.ssh.username      = 'mylesmegyesi'

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider 'virtualbox' do |v, override|
    override.vm.box = 'ubuntu-13.04.amd64.virtualbox'
  end

  config.librarian_chef.cheffile_dir = '.'
  config.vm.provision :chef_solo do |chef|

    chef.cookbooks_path = ['cookbooks', 'site-cookbooks']
    chef.roles_path     = 'roles'
    chef.add_role('vm')

  end
end
