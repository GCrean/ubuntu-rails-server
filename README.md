ec2-ubuntu-rails-server
============================

My notes on setting up a simple production server with Amazon EC2, Ubuntu, Nginx, Passenger and PostgreSQL for Rails.

Update and upgrade the system
-------------------------------

    sudo apt-get update
    sudo apt-get upgrade

Configure timezone
-------------------

    sudo dpkg-reconfigure tzdata
    sudo apt-get install ntp
    sudo ntpdate ntp.ubuntu.com # Update time
    
Verify that you have to correct date and time with

    date

Configure hostname
-------------------

    sudo hostname your-hostname

Add 127.0.0.1 your-hostname

    sudo vim /etc/hosts
    
Write your-hostname in 
    
    sudo vim /etc/hostname
    
Verify that hostname is set
    
    hostname

Install PostgreSQL
---------------

This should be installed before Ruby Enterprise Edition becouse that will install the mysql gem.

    sudo apt-get -y install postgresql libpq-dev
    
    
Gemrc
-------

Add the following lines to ~/.gemrc, this will speed up gem installation and prevent rdoc and ri from being generated, this is not nessesary in the production environment.

    ---
    :sources:
    - http://gems.rubyforge.org
    - http://gems.github.com
    gem: --no-ri --no-rdoc


Ruby 1.9.3
------------------------

Check for newer version at http://www.rubyenterpriseedition.com/download.html

sudo apt-get install python-software-properties
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update

sudo apt-get install ruby1.9.3

Install required packages: C compiler, Zlib development headers, OpenSSL development headers, GNU Readline development headers

    sudo apt-get install build-essential zlib1g-dev libssl-dev libreadline5-dev

Verify the ruby installation

    ruby -v

Installing git
----------------

    sudo apt-get install git-core

Nginx
-------

sudo apt-add-repository ppa:brightbox/passenger-nginx
sudo apt-get update
sudo apt-get install passenger-common1.9.1 nginx-full 

cat <<EOF > /etc/nginx/conf.d/passenger.conf
passenger_root /usr/lib/phusion-passenger;
EOF

Github
-------------------

More information on http://wiki.nginx.org/Nginx-init-ubuntu

    ssh -T git@github.com

Installning ImageMagick and RMagick
-----------------------------------

If you want to install the latest version of ImageMagick. I used MiniMagick that shell-out to the mogrify command, worked really well for me.

    # If you already installed imagemagick from apt-get
    sudo apt-get remove imagemagick

    sudo apt-get install libperl-dev gcc libjpeg62-dev libbz2-dev libtiff4-dev libwmf-dev libz-dev libpng12-dev libx11-dev libxt-dev libxext-dev libxml2-dev libfreetype6-dev liblcms1-dev libexif-dev perl libjasper-dev libltdl3-dev graphviz gs-gpl pkg-config

Use wget to grab the source from ImageMagick.org.

Once the source is downloaded, uncompress it:


    tar xvfz ImageMagick.tar.gz


Now configure and make:

    cd ImageMagick-6.5.0-0
    ./configure
    make
    sudo make install

To avoid an error such as:

convert: error while loading shared libraries: libMagickCore.so.2: cannot open shared object file: No such file or directory

    sudo ldconfig

Install RMagick
 
    sudo /opt/ruby/bin/ruby /opt/ruby/bin/gem install rmagick

Test a rails applicaton with nginx
----------------------------------

    rails -d mysql testapp
    cd testapp
    
Enter your mysql password
    
    vim database.yml
    rake db:create:all
    ruby script/generate scaffold post title:string body:text
    rake db:migrate RAILS_ENV=production
    
Check so the rails app start as normal
    
    ruby script/server

    sudo vim /opt/nginx/conf/nginx.conf
    
Add a new virutal host

    server {
        listen 80;
        # server_name www.mycook.com;
        root /home/deploy/testapp/public;
        passenger_enabled on;
    }
    
Restart nginx

    sudo /etc/init.d/nginx restart
    
Check you ipaddress and see if you can acess the rails application
        
