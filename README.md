Starting setup
==============

run wget https://github.com/Regenersis/chef-vm-setup/raw/master/Install && bash Install

This will download and install all require packages for development environment

TODOS
-----
Setup pathogen for vim plugins

- setup rubies
- setup gemsets
- couchapp
- coffeescript (that one is just for funzies really)
- system configuration (time and keyboard)


Installed Packages
==================

The following are installed from there installed from default packages

- git
- ruby
- rubygems
- irb
- rake
- curl
- mysql-server
- mysql-client
- rabbitmq
- couchdb
- vim
- gvim
- rubymine
- nodejs
- pentaho data-integration
- pentaho report-designer
- kdiff
- gitk
- rvm

System Configurations
=====================

Kdiff set for both merge tool and diff tool for git
.gemrc file ignores documentation for all gems
.irbrc added wirble and interactive_editor gems. Auto requires rubygems
.bashcommanddisplay sets rvm and branch display on terminal
.bashhistory configure history for teminal
.aliases add system aliases
.paths added additional paths to session
.bashrvm sets up rvm in terninal

Installed Gems
==============

System Gems
-----------

- chef


Vim Plugins Installed
=====================

- ack-vim
- autotag
- colorscheme
- command-t
- cucumber-vim (pythonandchips fork)
- vim-matchit
- vim-rails
- vim-ruby-refactoring
- ruby-focused-unit-test-vim (pythonandchips fork)
- snipmate
- snipmate-snippets
- vim-supertab
