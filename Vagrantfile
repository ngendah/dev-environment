# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# on the base system install do
#
# on the base system
# sudo dnf install libvirt vagrant vagrant-libvirt vagrant-sshfs
#
require 'fileutils'

Vagrant.configure('2') do |config|

  # make projects directory
  FileUtils.mkdir_p './projects/golang/'
  FileUtils.mkdir_p './projects/com/'

  config.vm.box = 'fedora/31-cloud-base'

  config.vm.provider :libvirt do |vp|
    vp.memory = 1024
  end

  config.vm.provider :virtualbox do |vp|
    vp.memory = 2048
  end

  # config.vm.network 'forwarded_port', guest: 80, host: 8080
  # config.vm.network 'forwarded_port', guest: 80, host: 8080, host_ip: '127.0.0.1'
  # config.vm.network 'public_network'

  config.vm.provision 'file', source: './.vimrc', destination: '/home/vagrant/.vimrc'

  config.vm.provider :libvirt do |vp, override|
    override.vm.synced_folder './projects/', '/home/vagrant/projects', type: 'sshfs'
  end

  config.vm.provider :virtualbox do |vp, override|
    override.vm.synced_folder './projects/', '/home/vagrant/projects', type: 'nfs'
  end

  config.vm.provision 'shell', inline: <<-SHELL
    sudo dnf install -y tmux golang vim nodejs patch readline readline-devel \\
                        zlib zlib-devel libyaml-devel libffi-devel \\
                        openssl-devel make bzip2 autoconf automake libtool \\
                        bison sqlite-devel gcc-c++ elixir
    if [[ ! -f "/usr/bin/python" ]]; then
      sudo ln -s /usr/bin/python3 /usr/bin/python
    fi
  SHELL

  config.vm.provision 'shell', privileged: false, inline: <<-SHELL
    pip3 install --user virtualenvwrapper
    pip3 install --user pylint
    echo 'export GOPATH=$HOME/projects/golang' >> $HOME/.bashrc
    echo 'export WORKON_HOME=$HOME/.virtualenvs' >> $HOME/.bashrc
    echo 'source $HOME/.local/bin/virtualenvwrapper.sh' >> $HOME/.bashrc
    source $HOME/.bashrc
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  SHELL
end
