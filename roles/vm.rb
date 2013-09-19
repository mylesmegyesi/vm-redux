name 'vm'
run_list [
  'recipe[build-essential]',
  'recipe[mysql::client]',
  'recipe[mysql::server]'
]

default_attributes({
  :mysql => {
    :client => {
      :packages => %w(mysql-client libmysqlclient-dev ruby-mysql)
    },
    :server_root_password   => '',
    :server_repl_password   => '',
    :server_debian_password => ''
  }
})
