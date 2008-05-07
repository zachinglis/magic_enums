module MagicEnums
  def self.included(base)
   base.extend(ClassMethods)
  end
 
  module ClassMethods
    def enum_column(column_name, choices=[])
      array_in_text = "[#{choices.collect { |choice| "'#{choice}'" }.join(", ")}]" # Make the array into text form.
      class_eval "
        class_inheritable_accessor  :#{column_name}_choices
        write_inheritable_attribute :#{column_name}_choices, #{array_in_text}
      "
      
      choices.each do |choice|
        class_eval "
          named_scope :#{column_name}_is_#{choice}, :conditions => {:#{column_name} => \"#{choice}\"}
        
          def #{column_name}_is_#{choice}?
            self.#{column_name} == '#{choice}'
          end
          "
      end
    end
  end
end