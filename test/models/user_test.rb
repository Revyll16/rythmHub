require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without email" do
    user = User.new(password: "password")
    assert_not user.save, "Saved the user without an email"
  end

  test "should not save user without password" do
    user = User.new(email: "test@example.com")
    assert_not user.save, "Saved the user without a password"
  end

  test "should not save user with duplicate email" do
    user1 = User.create(email: "test@example.com", password: "password")
    user2 = User.new(email: "test@example.com", password: "password123")
    assert_not user2.save, "Saved the user with a duplicate email"
  end

  test "should save user with valid email and password" do
    user = User.new(email: "valid@example.com", password: "password")
    assert user.save, "Failed to save the user with valid email and password"
  end
end
