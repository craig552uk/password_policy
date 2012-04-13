require 'test/unit'
require File.expand_path('../../lib/password_policy', __FILE__)

class PasswordPolicyTests < Test::Unit::TestCase

  def setup
    @pp = PasswordPolicy.new
  end

  def test_password_policy_object
    assert_not_nil PasswordPolicy
    assert_equal PasswordPolicy, @pp.class
  end

  def test_error_message_method
    assert @pp.respond_to? :errors
    assert_equal Array, @pp.errors.class
    assert_equal [], @pp.errors
  end

  def test_validation_method
    assert @pp.respond_to? :validate
    assert @pp.validate('').is_a?(TrueClass) || @pp.validate('').is_a?(FalseClass)
  end
end