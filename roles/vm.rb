name 'vm'
run_list [
  'recipe[build-essential]',
  'recipe[mysql::client]',
  'recipe[mysql::server]'
]
