require 'test/unit'
require File.join(File.dirname(__FILE__), '../lib/magic_enums')

class MagicEnumsTest < Test::Unit::TestCase
  def test_should_recognize_column_and_associated_class_variable
    assert true
  end
end

class Person
   enum_column    :gender, %w(male female)
   attr_accessor  :gender, :database_gender
   
   def read_attribute(column)
     class_eval "#{attribute_column(column)}"
   end
   
   def write_attribute(column, value)
     class_eval "#{attribute_column(column)} = '#{value}'"
   end
   
   def attribute_column(column)
    "self.database_#{column}"
   end
   
   
end
