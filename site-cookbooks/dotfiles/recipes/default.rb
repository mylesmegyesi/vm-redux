
DOTFILES_USER_HOME = node['dotfiles']['user_home']
dotfiles_dir = File.join(node['dotfiles']['user_home'], '.dotfiles')

# HACK until https://tickets.opscode.com/browse/CHEF-3940 is resolved
class Chef::Provider::MyGit < Chef::Provider::Git
  alias :run_options_old :run_options
  def run_options(run_opts={})
    ret = run_options_old(run_opts)
    ret[:environment] = {} unless ret[:environment]
    ret[:environment]['HOME'] = DOTFILES_USER_HOME
    ret
  end
end

git dotfiles_dir do
  repository 'git@github.com:mylesmegyesi/dotfiles.git'
  action :sync
  user node['dotfiles']['username']
  group node['dotfiles']['username']
  provider Chef::Provider::MyGit
end

bash 'Install the dotfiles' do
  user node['dotfiles']['username']
  code "#{File.join(dotfiles_dir, 'install.rb')} #{node['dotfiles']['user_home']} #{node['dotfiles']['username']}"
end
