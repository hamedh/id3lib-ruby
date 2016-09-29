# -*- encoding: utf-8 -*-
# stub: id3lib-ruby 0.6.0 ruby lib
# stub: ext/id3lib_api/extconf.rb

Gem::Specification.new do |s|
  s.name = "id3lib-ruby"
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Robin Stocker"]
  s.date = "2010-05-15"
  s.description = "= id3lib-ruby\n\nid3lib-ruby provides a Ruby interface to the id3lib C++ library for easily\nediting ID3 tags (v1 and v2) of MP3 audio files.\n\nThe class documentation starts at ID3Lib::Tag.\n\n\n== Features\n\n* Read and write ID3v1 and ID3v2 tags\n* Simple interface for adding, changing and removing frames\n* Quick access to common text frames like title and performer\n* Custom data frames like attached picture (APIC)\n* Pretty complete coverage of id3lib's features\n* UTF-16 support (warning: id3lib writes broken UTF-16 frames)\n* Windows binary gem available\n\nThe CHANGES file contains a list of changes between versions.\n\n\n== Installation\n\nSee INSTALL.\n\n\n== Online Information\n\nThe home of id3lib-ruby is http://id3lib-ruby.rubyforge.org\n\n\n== Usage\n\n  require 'rubygems'\n  require 'id3lib'\n  \n  # Load a tag from a file\n  tag = ID3Lib::Tag.new('talk.mp3')\n  \n  # Get and set text frames with convenience methods\n  tag.title  #=> \"Talk\"\n  tag.album = 'X&Y'\n  tag.track = '5/13'\n  \n  # Tag is a subclass of Array and each frame is a Hash\n  tag[0]\n  #=> { :id => :TPE1, :textenc => 0, :text => \"Coldplay\" }\n  \n  # Get the number of frames\n  tag.length  #=> 7\n  \n  # Remove all comment frames\n  tag.delete_if{ |frame| frame[:id] == :COMM }\n  \n  # Get info about APIC frame to see which fields are allowed\n  ID3Lib::Info.frame(:APIC)\n  #=> [ 2, :APIC, \"Attached picture\",\n  #=>   [:textenc, :mimetype, :picturetype, :description, :data] ]\n  \n  # Add an attached picture frame\n  cover = {\n    :id          => :APIC,\n    :mimetype    => 'image/jpeg',\n    :picturetype => 3,\n    :description => 'A pretty picture',\n    :textenc     => 0,\n    :data        => File.read('cover.jpg')\n  }\n  tag << cover\n  \n  # Last but not least, apply changes\n  tag.update!\n\n\n== Licence\n\nThis library has Ruby's licence:\n\nhttp://www.ruby-lang.org/en/LICENSE.txt\n\n\n== Author\n\nRobin Stocker <robinstocker at rubyforge.org>\n"
  s.email = "robinstocker@rubyforge.org"
  s.extensions = ["ext/id3lib_api/extconf.rb"]
  s.extra_rdoc_files = ["README", "INSTALL", "TODO", "CHANGES"]
  s.files = ["CHANGES", "INSTALL", "README", "TODO", "ext/id3lib_api/extconf.rb"]
  s.homepage = "http://id3lib-ruby.rubyforge.org"
  s.rdoc_options = ["--inline-source", "--line-numbers", "--main", "README"]
  s.requirements = ["id3lib C++ library"]
  s.rubyforge_project = "id3lib-ruby"
  s.rubygems_version = "2.4.6"
  s.summary = "id3lib-ruby provides a Ruby interface to the id3lib C++ library for easily editing ID3 tags (v1 and v2) of MP3 audio files."

  s.installed_by_version = "2.4.6" if s.respond_to? :installed_by_version
end
