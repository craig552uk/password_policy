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

  end
end
