ruby-box
========

ruby development box


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

