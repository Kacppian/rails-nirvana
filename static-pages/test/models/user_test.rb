require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: 	"Example User", email: "examplebae@biscuit.com", 
  										password: "foobar", password_confirmation: "foobar")
  end

  test "Should be valid" do
  	assert @user.valid?
	end

	test "Name not present" do 
		@user.name = ""
		assert_not @user.valid?
	end

	test "Email should be present" do
		@user.email = ""
		assert_not @user.valid?
	end

	test "Name should be less than 50 chars" do
		@user.name = "a"*51
		assert_not @user.valid?
	end

	test "Email should be less than 255 chars" do
		@user.email = "a"*256
		assert_not @user.valid?
	end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "Unique emails" do
  	duplicate_user = @user.dup
  	duplicate_user.email = @user.email.upcase
  	@user.save
  	assert_not duplicate_user.valid?
  end

  test "email should be downcased" do
  	@user.email = "DAMN@BIGGY.COM"
  	@user.save if @user.valid?
  	@user.reload
  	assert_equal @user.email, "damn@biggy.com"
  end

  test "password should not be blank" do 
  	@user.password = @user.password_confirmation = " " * 6
  	assert_not @user.valid?
  end

  test "password should be a minimum length" do
  	@user.password = @user.password_confirmation = "a"*5
  	assert_not @user.valid?
  end
end
