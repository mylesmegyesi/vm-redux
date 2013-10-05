%w(openjdk-7-jre-headless openjdk-7-jdk).each do |p|
    package p
end

lein_dir = node['clojure']['lein_home']
lein_bin_dir = File.join(lein_dir, 'bin')
lein_self_install_dir = File.join(lein_dir, 'self-installs')
lein_bin = File.join(lein_dir, 'bin', 'lein')

directory lein_bin_dir do
  recursive true
  owner node['clojure']['username']
end

file lein_bin do
  action :delete
  owner node['clojure']['username']
end

directory lein_self_install_dir do
  action :delete
  recursive true
  owner node['clojure']['username']
end

directory lein_self_install_dir do
  recursive true
  owner node['clojure']['username']
end

remote_file lein_bin do
  mode 0755
  source 'https://raw.github.com/technomancy/leiningen/stable/bin/lein'
  owner node['clojure']['username']
end

bash 'install leiningen' do
  code "#{lein_bin} self-install"
  user node['clojure']['username']
end
