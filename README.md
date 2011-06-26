Starting setup
==============

run wget https://github.com/Regenersis/chef-vm-setup/raw/master/Install && bash Install

This will download and install all require packages for development environment

Recommended OS
==============

This setup is tested only on Ubuntu Natty Narwhal (11.04). Any other install has not been tested and no guarantee of working

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
- couchapp
- coffeescript
- npm


System Configurations
=====================

Kdiff set for both merge tool and diff tool for git

.gemrc file ignores documentation for all gems

.irbrc added wirble and interactive_editor gems. Auto requires rubygems

.bashcommanddisplay sets rvm and branch display on terminal

.bashhistory configure history for teminal

.aliases add system aliases

.paths added additional paths to session

.bashrvm sets up rvm in terminal

Installed Rubies
================

- Ruby 1.8.7
- Jruby 1.6.0

RVM Gemsets
===========

- 1.8.7@dhl_o2
- jruby@dhl_o2_jruby

Note: some gems may fail to install from gem file. Check error logs after install and install manually

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

Issues
======

- Cannot successfully configure system keyboard and time
- Github occassionlly fails and restart of build required. Need to add graceful failure

Future improvements
===================

- enable bundler on all projects and build gem set from these files
- Run rake db:create and db:migrate for each cloned project
