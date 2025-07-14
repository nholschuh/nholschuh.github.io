To set-up the website, there were several steps:

1) download the template, which you did from here:


2) Install Ruby 2.7.X. The latest versions (3+) didn't work with jekyll, but installing ruby 3 was also not straightforward with Ubuntu 22.04. First, you needed to install an older version of openssl. The full instructions for doing that are here:
https://deanpcmad.com/2022/installing-older-ruby-versions-on-ubuntu-22-04/

------------------------------------------------
------------------------------------------------
wget https://www.openssl.org/source/openssl-1.1.1g.tar.gz
tar zxvf openssl-1.1.1g.tar.gz
cd openssl-1.1.1g
./config --prefix=$HOME/.openssl/openssl-1.1.1g --openssldir=$HOME/.openssl/openssl-1.1.1g
make
make test
make install
------------------------------------------------
------------------------------------------------


Then, you need to install rvm, which is a bit of a pain, but can be done as explained here:
https://github.com/rvm/ubuntu_rvm

------------------------------------------------
------------------------------------------------
sudo apt-get install software-properties-common
sudo apt-add-repository -y ppa:rael-gc/rvm
sudo apt-get update
sudo apt-get install rvm
sudo usermod -a -G rvm $USER
echo 'source "/etc/profile.d/rvm.sh"' >> ~/.bashrc
------------------------------------------------
------------------------------------------------


Then, you can install ruby pointing to the newly installed (but old) version of openssl:
https://deepakmahakale.com/blog/2024/01/04/Error-running-__rvm_make-j12.html

------------------------------------------------
------------------------------------------------
rvm install ruby-2.7.3 --with-openssl-dir=$HOME/.openssl/openssl-1.1.1g
bundle install
------------------------------------------------
------------------------------------------------

Then you can run the standard jekyll commands from the website directory to test and build it:
https://jekyllrb.com/

bundle exec jekyll servehttps://jekyllrb.com/