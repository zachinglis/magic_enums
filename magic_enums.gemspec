# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{magic_enums}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Zach Inglis"]
  s.date = %q{2008-11-23}
  s.description = %q{A nice way to have enums in Rails.}
  s.email = %q{zach@lt3media.com}
  s.extra_rdoc_files = ["README.textile", "lib/magic_enums.rb"]
  s.files = ["init.rb", "README.textile", "Rakefile", "MIT-LICENSE", "lib/magic_enums.rb", "test/magic_enums_test.rb", "Manifest", "magic_enums.gemspec", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/zachinglis/magic_enums/tree/master}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Magic_enums", "--main", "README.textile"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{magic_enums}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A nice way to have enums in Rails.}
  s.test_files = ["test/magic_enums_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
