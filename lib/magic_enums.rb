module MagicEnums
  def self.included(base)
   base.extend(ClassMethods)
  end

  module ClassMethods
    def enum_column(column_name, choices=[], options={})
      configuration = { :message => "is not a valid choice" }
      configuration.merge!(options)

      array_in_text = "[#{choices.collect { |choice| "'#{choice}'" }.join(", ")}]" # Make the array into text form.

      class_eval "
        class_inheritable_accessor  :#{column_name}_choices
        write_inheritable_attribute :#{column_name}_choices, #{array_in_text}

        validate :validate_#{column_name}_choice

        def validate_#{column_name}_choice
          errors.add(\"#{column_name}\", \"#{configuration[:message]}\") unless self.#{column_name}_choices.include?(self.#{column_name})
        end
      "

      choices.each do |choice|
        class_eval "
          named_scope :#{column_name}_is_#{clean(choice)}, :conditions => {:#{column_name} => \"#{choice}\"}

          def #{column_name}_is_#{clean(choice)}?
            self.#{column_name} == '#{choice}'
          end
          "
      end
    end

    private

    def clean(text)
      return nil if text.blank?
      str = Iconv.iconv('ascii//translit', 'utf-8', text).to_s
      str.gsub!(/\W+/, ' ')
      str.strip!
      str.downcase!
      str.gsub!(/\ +/, '_')
      return str
    end
  end
end
