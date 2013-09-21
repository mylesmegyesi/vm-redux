
dotfiles_dir = File.join(node['dotfiles']['user_home'], '.dotfiles')

directory dotfiles_dir do
  recursive true
  ownder node['dotfiles']['username']
end

git dotfiles_dir do
  repository 'git@github.com:mylesmegyesi/dotfiles.git'
  action :sync
  user node['dotfiles']['username']
  group node['dotfiles']['username']
end

bash 'Install the dotfiles' do
  user node['dotfiles']['username']
  code "#{File.join(dotfiles_dir, 'install.rb')} #{node['dotfiles']['user_home']} #{node['dotfiles']['username']}"
end
