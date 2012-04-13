require_relative "password_policy/version"
require_relative "password_policy/rules"

class PasswordPolicy

  # Constructor
  #
  # == Parameters:
  # rules::
  #   A Hash of rule values defining the policy
  #
  # == Returns:
  #   A PasswordPolicy object
  def initialize(rules = {})
    
    # Initialize error message and rule data structures
    @errors = []
    @rules  = {}

    # Define rules
    rule_definitions

    # Define accessors for rule values
    @rules.each do |id, rule|
      define_singleton_method(id)       {       rule[:value] }
      define_singleton_method("#{id}=") { |val| rule[:value] = val }
    end

    # Merge provided rules values with defaults
    rules.each do |rule, val|
      @rules[rule.to_sym][:value] = val
    end
  end

  # Validate a password against the password policy
  #
  # == Parameters:
  # password:
  #   A password String to be validated
  #
  # == Returns:
  #   True if the password is validated
  #   false otherwise
  #
  def validate(password)
    # Reset errors
    @errors = []
    # Test password against rules
    @rules.each_value do |rule|
      @errors << vsub(rule[:error_msg], rule[:value]) unless rule[:test].call(password)
    end
    # Password validated if no errors
    @errors.length == 0
  end

  # Get a list of failed validation errors
  #
  # == Returns:
  #  An Array of password error Strings
  #
  def errors
    @errors
  end

  private

  # Globally substitute #VAL# for val in string
  #
  # == Parameters:
  # string:
  #   The host String
  # val:
  #   The value to be substituted in
  #
  # == Returns:
  #   The host Sting with all instances of #VAL# 
  #   replaced with val:
  #
  def vsub(string, val)
    string.gsub('#VAL#', val.to_s)
  end
end
