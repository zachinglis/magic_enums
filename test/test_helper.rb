require "test/unit"
require "rubygems"
require "active_record"
require File.join(File.dirname(__FILE__), "..", "lib", "magic_enums")

ActiveRecord::Schema.verbose = false
ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")
ActiveRecord::Base.configurations = true
ActiveRecord::Schema.define(:version => 1) do
  create_table :people do |t|
    t.datetime :created_at
    t.datetime :updated_at
    t.string :name
    t.string :gender
  end
end

class Person < ActiveRecord::Base
  enum_column :gender, %w(male female)
end
