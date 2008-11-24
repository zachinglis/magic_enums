require File.join(File.dirname(__FILE__), "test_helper.rb")

class MagicEnumsTest < Test::Unit::TestCase
  def setup
    @person = Person.new
  end

  def test_should_recognize_column_and_associated_class_variables
    assert_respond_to Person, :gender_choices
    assert_respond_to Person, :gender_choices=
    assert_respond_to Person, :gender_is_male
    assert_respond_to Person, :gender_is_female
  end

  def test_should_recognize_instance_variables
    assert_respond_to @person, :gender
    assert_respond_to @person, :gender_is_male?
    assert_respond_to @person, :gender_is_female?
  end

  def test_should_return_true_on_choices
    @person.gender = "male"
    assert @person.gender_is_male?
    @person.gender = "female"
    assert @person.gender_is_female?
  end
end
