# Password Policy #

A password policy class for Ruby    

**Author** Craig Russell [craig@craig-russell.co.uk](mailto:craig@craig-russell.co.uk)      
**Version** 0.1     

Password Policy is a library that makes it easy to implement a password format policy on your application. It includes functions to return password validation errors.
## Download ##


## Usage ##

### Getting Started ###

Using Password Policy on your site is simple.

1.  Install the Gem

        $ gem install password_policy

2.  Include the library

        > require 'password_policy'
        
2.  Create the Password Policy object

        > @policy = PasswordPolicy.new
        
3.  Define the policy rules

        > @policy.min_length = 8;
        > @policy.max_length = 64;
        
4.  Validate a password

        puts "Password OK!" if @policy.validate 'passw0rd'


## Advanced ##

### Separate Policy Rules ###

You can define your policy rules separately as a Hash and pass this to the constructor, rather than defining rules on the object. Hash keys should be rule identifiers, values should be the correct type. This is useful if you want to define your policy rules is a separate configuration file.

    @rules = {
      :min_length => 8,
      :max_length => 64
    }
    @policy = PasswordPolicy.new @rules

### Password Validation Errors ###

After validating the password, any errors can be retrieved as an array of strings.

    @policy.errors.each do |error|
      puts error
    end

## Policy Rules ##

A Password Policy has several rules which can be configured, these are detailed below.

Policy rules have different types, a rule will ignore any attempt to set its value to an incorrect type. Please refer to the documentation below.

**IMPORTANT** It is possible to define conflicting rules in a policy, which would make it impossible to set a password.

    @rules = {
      :min_length => 20,
      :max_length => 10
    }

### Minimum Length ###

The minimum length of a password

**Identifier** `min_length`     

    @policy.min_length = 10;

### Maximum Length ###

The maximum length of a password

**Identifier** `max_length`     

    @policy.max_length = 64;

### Minimum Lower-case Characters ###

The minimum number of lower-case characters allowed in a password

**Identifier** `min_lowercase_chars`     

    @policy.min_lowercase_chars = 1;

### Minimum Uppercase Characters ###

The minimum number of uppercase characters allowed in a password

**Identifier** `min_uppercase_chars`     

    @policy.min_uppercase_chars = 1;

### Minimun Numeric Characters ###

The minimum number of numeric characters allowed in a password

**Identifier** `min_numeric_chars`     

    @policy.min_numeric_chars = 1;