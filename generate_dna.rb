require "rubygems"
require "json"

dna = {
  :user => ARGV[0],
  :run_list => ["recipe[main]"]
}

File.open("dna.json", 'w'){|f| f.write(dna.to_json)}

