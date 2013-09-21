require 'etc'

USERNAME  = 'mylesmegyesi'
USER_HOME = Etc.getpwnam(USERNAME).dir
ZSH_DIR   = File.join(USER_HOME, '.zsh')

name 'vm'
run_list [
  'recipe[build-essential]',
  'recipe[mysql::client]',
  'recipe[mysql::server]',
  'recipe[git]',
  'recipe[zsh]',
  'recipe[chruby]',
  'recipe[ruby_build]'
]

default_attributes({
  :chruby => {
    :sh_dir      => ZSH_DIR,
    :sh_name     => 'chruby.zsh',
    :auto_switch => true
  },
  :mysql => {
    :client => {
      :packages => %w(mysql-client libmysqlclient-dev ruby-mysql)
    },
    :server_root_password   => '',
    :server_repl_password   => '',
    :server_debian_password => ''
  }
})
