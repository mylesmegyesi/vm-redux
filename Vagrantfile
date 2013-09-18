
Vagrant.configure('2') do |config|

  config.librarian_chef.cheffile_dir = 'chef'

  config.vm.provision :chef_solo do |chef|

    chef.cookbooks_path = ['chef/cookbooks', 'site-cookbooks']
    chef.cookbooks_path = ['chef/cookbooks', 'site-cookbooks']
    chef.roles_path     = 'roles'
    chef.add_role('dev_vm')

  end
end
