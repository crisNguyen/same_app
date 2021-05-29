require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name:"Example User", email:"user@example.com",password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name =" "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email =" "
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    valid_addresses.each do |address|
      @user.email= address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
