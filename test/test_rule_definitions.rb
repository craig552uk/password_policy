require 'test/unit'
require File.expand_path('../../lib/password_policy', __FILE__)

class PasswordPolicyRulesTests < Test::Unit::TestCase

  def test_min_length_rule
    assert pp1 = PasswordPolicy.new
    assert pp2 = PasswordPolicy.new(:min_length => 6)

    assert_respond_to pp1, :min_length
    assert_respond_to pp1, :min_length=

    assert_equal 8, pp1.min_length
    assert_equal 6, pp2.min_length

    assert_equal false, pp1.validate('x' * 7)
    assert_equal true,  pp1.validate('x' * 8)

    assert pp1.min_length = 10
    assert_equal 10, pp1.min_length

    assert_equal false, pp1.validate('x' * 9)
    assert_equal true,  pp1.validate('x' * 10)
  end

  def test_max_length_rule
    assert pp1 = PasswordPolicy.new
    assert pp2 = PasswordPolicy.new(:max_length => 10)

    assert_respond_to pp1, :max_length
    assert_respond_to pp1, :max_length=

    assert_equal 64, pp1.max_length
    assert_equal 10, pp2.max_length

    assert_equal false, pp1.validate('x' * 65)
    assert_equal true,  pp1.validate('x' * 64)

    assert pp1.max_length = 32
    assert_equal 32, pp1.max_length

    assert_equal false, pp1.validate('x' * 33)
    assert_equal true,  pp1.validate('x' * 32)
  end

  def test_min_lowercase_chars_rule
    assert pp1 = PasswordPolicy.new
    assert pp2 = PasswordPolicy.new(:min_lowercase_chars => 1)

    assert_respond_to pp1, :min_lowercase_chars
    assert_respond_to pp1, :min_lowercase_chars=

    assert_equal 0, pp1.min_lowercase_chars
    assert_equal 1, pp2.min_lowercase_chars

    assert_equal false, pp2.validate('ABCDEFGHI')
    assert_equal true,  pp2.validate('AaBCDEFGHI')

    assert pp1.min_lowercase_chars = 3
    assert_equal 3, pp1.min_lowercase_chars

    assert_equal false, pp1.validate('AaBbCDEFGHI')
    assert_equal true,  pp1.validate('AaBbCcDEFGHI')
  end

  def test_min_uppercase_chars_rule
    assert pp1 = PasswordPolicy.new
    assert pp2 = PasswordPolicy.new(:min_uppercase_chars => 1)

    assert_respond_to pp1, :min_uppercase_chars
    assert_respond_to pp1, :min_uppercase_chars=

    assert_equal 0, pp1.min_uppercase_chars
    assert_equal 1, pp2.min_uppercase_chars

    assert_equal false, pp2.validate('abcdefghi')
    assert_equal true,  pp2.validate('aAbcdefghi')

    assert pp1.min_uppercase_chars = 3
    assert_equal 3, pp1.min_uppercase_chars

    assert_equal false, pp1.validate('aAbBcdefghi')
    assert_equal true,  pp1.validate('aAbBcCdefghi')
  end

  def test_min_numeric_chars_rule
    assert pp1 = PasswordPolicy.new
    assert pp2 = PasswordPolicy.new(:min_numeric_chars => 1)
    
    assert_respond_to pp1, :min_numeric_chars
    assert_respond_to pp1, :min_numeric_chars=

    assert_equal 0, pp1.min_numeric_chars
    assert_equal 1, pp2.min_numeric_chars
    
    assert_equal false, pp2.validate('abcdefghi')
    assert_equal true,  pp2.validate('abcdefghi1')
    
    assert pp1.min_numeric_chars = 3
    assert_equal 3, pp1.min_numeric_chars
    
    assert_equal false, pp1.validate('abcdefghi1')
    assert_equal true,  pp1.validate('abcdefghi123')
  end
    
  def test_min_special_chars_rule
    assert pp1 = PasswordPolicy.new
    assert pp2 = PasswordPolicy.new(:min_special_chars => 1)

    assert_respond_to pp1, :min_special_chars
    assert_respond_to pp1, :min_special_chars=

    assert_equal 0, pp1.min_special_chars

    assert_equal false, pp2.validate('abcdefghi')
    assert_equal true,  pp2.validate('abcdefghi!@')

    assert pp1.min_special_chars = 3
    assert_equal 3, pp1.min_special_chars

    assert_equal false, pp1.validate('abcdefghi&')
    assert_equal true,  pp1.validate('abcdefghi!!!')
  end
    
  def test_max_special_chars_rule
    assert pp1 = PasswordPolicy.new
    assert pp2 = PasswordPolicy.new(:max_special_chars => 1)

    assert_respond_to pp1, :max_special_chars
    assert_respond_to pp1, :max_special_chars=

    assert_equal 0, pp1.max_special_chars
    assert_equal 1, pp2.max_special_chars

    assert_equal false, pp2.validate('abcdefghi&^')

    assert pp1.max_special_chars = 3
    assert_equal 3, pp1.max_special_chars
    assert_equal false, pp1.validate('abcdefghi$@#!{')
    assert_equal true,  pp1.validate('abcdefghi*$%')
  end
end