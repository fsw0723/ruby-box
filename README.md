ruby-box
========

This is a box for ruby development. It includes:
* Mysql
* git
* rvm
* ruby 1.9
* ruby 2.0
* bundler 1.6.3
* rails 4.0.4
* nodejs

Usage:
1. Create a folder: mkdir RDRC
2. Clone this repository: git clone https://github.com/fsw0723/ruby-box.git
3. Put your ruby project under the same folder
4. Run: vagrant up
5. Run: vagrant ssh. You will be able to see your project under /var/www
6. After start the rails server, the project will be available under localhost:3000.



Do a  gem install capistrano. 

This will generate the following folder structure:
  ├── Capfile
  ├── config
  │   ├── deploy
  │   │   ├── production.rb
  │   │   └── staging.rb
  │   └── deploy.rb
  └── lib
      └── capistrano
              └── tasks



[wip] Then I create a sample task arathi.rake which attempts to copy over our rails app into the rails-dev-box. 

use cap -T to see all tasks

to run a task do : cap <rolename> <namespace>:<taskname>

