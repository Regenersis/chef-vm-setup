require "rubygems"
require "json"

dna = {
  :user => ARGV[0],
  :home_dir => "/home/#{ARGV[0]}",
  :github => {:username => ARGV[1], :password => ARGV[2]},
  :vim_plugins => [
    "https://github.com/mileszs/ack.vim.git",
    "https://github.com/vim-scripts/AutoTag.git",
    "https://github.com/flazz/vim-colorschemes.git",
    "https://github.com/wincent/Command-T.git",
    "git://github.com/pythonandchips/vim-cucumber.git",
    "https://github.com/tsaleh/vim-matchit.git",
    "https://github.com/tpope/vim-rails.git",
    "https://github.com/ecomba/vim-ruby-refactoring.git",
    "git@github.com:pythonandchips/ruby_focused_unit_test_vim.git",
    "https://github.com/msanders/snipmate.vim.git",
    "https://github.com/scrooloose/snipmate-snippets.git",
    "https://github.com/tsaleh/vim-supertab.git"],
  :nodejs => {:dir => "/usr/local", :version => "0.4.8" },
  :pentaho => {:install_dir => "/opt"},
  :rubymine => {:install_dir => "/opt/rubymine"},
  :temp_folder => "/tmp",
  :run_list => ["recipe[main]"]
}

File.open("dna.json", 'w'){|f| f.write(dna.to_json)}













