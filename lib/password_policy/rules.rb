class PasswordPolicy

  def rule_definitions
    # Rule definitions are stored in the Hash @rules
    # Hash key describes rule and is used as the accessor
    # :value      Default value for rule (can be overridden in constructor)
    # :error_msg  Message returned if validation fails
    # :test       Proc returning true if password validates against rule


    @rules[:min_length] = {
      :value      => 8,
      :error_msg  => 'Password must be more than #VAL# characters',
      :test       => proc do |password| 
        password.length >= @rules[:min_length][:value]
      end
    }

    @rules[:max_length] = {
      :value      => 64,
      :error_msg  => 'Password must be less than #VAL# characters',
      :test       => proc do |password|
        password.length <= @rules[:max_length][:value]
      end
    }

    @rules[:min_lowercase_chars] = {
      :value      => 0,
      :error_msg  => 'Password must contain at least #VAL# lowercase characters',
      :test       => proc do |password|
        password.scan(/[a-z]/).size >= @rules[:min_lowercase_chars][:value]
      end
    }

    @rules[:min_uppercase_chars] = {
      :value      => 0,
      :error_msg  => 'Password must contain at least #VAL# uppercase characters',
      :test       => proc do |password|
        password.scan(/[A-Z]/).size >= @rules[:min_uppercase_chars][:value]
      end
    }
      
    @rules[:min_numeric_chars] = {
      :value      => 0,
      :error_msg  => 'Password must contain at least #VAL# numeric characters',
      :test       => proc do |password|
        password.scan(/[0-9]/).size >= @rules[:min_numeric_chars][:value]
      end
    }
      
    @rules[:min_special_chars] = {
      :value      => 0,
      :error_msg  => 'Password must contain at least #VAL# special characters',
      :test       => proc do |password|
        password.scan(/[\W]/).size >= @rules[:min_special_chars][:value]
      end
    }
      
    @rules[:max_special_chars] = {
      :value      => 0,
      :error_msg  => 'Password must contain no more than #VAL# special characters',
      :test       => proc do |password|
          password.scan(/[\W]/).size <= @rules[:max_special_chars][:value]
      end
    }
      
  end
end
