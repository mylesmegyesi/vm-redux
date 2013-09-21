require 'etc'

name 'vm'
run_list [
  'recipe[build-essential]',
  'recipe[mysql::client]',
  'recipe[mysql::server]'
  'recipe[git]',
  'recipe[zsh]'
]

USERNAME  = 'mylesmegyesi'

log '*' * 8
log Etc.getpwnam(USERNAME)
log '*' * 8

USER_HOME = "/home/#{USERNAME}"
ZSH_DIR   = File.join(USER_HOME, '.zsh')

default_attributes({
  :chruby => {
    :sh_dir  => ZSH_DIR,
    :sh_name => 'chruby.zsh'
  },
  :mysql => {
    :client => {
      :packages => %w(mysql-client libmysqlclient-dev ruby-mysql)
    },
    :server_root_password   => '',
    :server_repl_password   => '',
    :server_debian_password => ''
  },
})
