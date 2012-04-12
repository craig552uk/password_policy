require 'test/unit'
require_relative '../lib/password_policy'

class PasswordPolicyTests < Test::Unit::TestCase

  def test_password_policy_class_exists
    assert_not_nil PasswordPolicy
  end

end