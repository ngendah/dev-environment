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

  #base image
  config.vm.box = 'fedora/29-cloud-base'
  config.vm.box_version = '29.20181024.1'

  # config.vm.box_check_update = false

  # config.vm.network 'forwarded_port', guest: 80, host: 8080
  # config.vm.network 'forwarded_port', guest: 80, host: 8080, host_ip: '127.0.0.1'
  # config.vm.network 'public_network'

  config.vm.network 'private_network', ip: '192.168.33.10'

  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.synced_folder './projects/', '/home/vagrant/projects', type: 'sshfs'

  config.vm.provision 'file', source: './.vimrc', destination: '/home/vagrant/.vimrc'
  config.vm.provision 'shell', inline: <<-SHELL
    sudo dnf update -y
    sudo dnf install -y tmux golang vim nodejs
    sudo dnf install -y patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison sqlite-devel gcc-c++
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
    mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle
    curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    git clone https://github.com/srcery-colors/srcery-vim $HOME/.vim/bundle/srcery-vim
    git clone https://tpope.io/vim/sensible.git $HOME/.vim/bundle/sensible
    git clone --depth=1 https://github.com/vim-syntastic/syntastic.git $HOME/.vim/bundle/syntastic
    git clone https://github.com/kien/ctrlp.vim.git $HOME/.vim/bundle/ctrlp.vim
    git clone https://github.com/othree/html5.vim $HOME/.vim/bundle/html5.vim
    git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
    git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
  SHELL
end
