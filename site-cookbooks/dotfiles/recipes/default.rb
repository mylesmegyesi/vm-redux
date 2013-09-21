
dotfiles_dir = File.join(node['dotfiles']['user_home'], '.dotfiles')

cache_path  = Chef::Config['file_cache_path']
dotfiles_dir    = "#{cache_path}/mm-dotfiles"

directory dotfiles_dir do
  recursive true
end

git dotfiles_dir do
  repository 'git@github.com:mylesmegyesi/dotfiles.git'
  action :sync
end

bash 'Install the dotfiles' do
  code "#{File.join(dotfiles_dir, 'install.rb')} #{node['dotfiles']['user_home']} #{node['dotfiles']['username']}"
end
