require "test_helper"

class AbilityTest < ActiveSupport::TestCase
  test "guest can read but not manage all" do
    ability = Ability.new(nil)
    assert ability.can?(:read, :all)
    refute ability.can?(:manage, :all)
  end

  test "authenticated user can read and update own profile" do
    user = User.create!(
      email: "user@example.com",
      password: "password123",
      password_confirmation: "password123",
      admin: false
    )
    ability = Ability.new(user)

    assert ability.can?(:read, :all)
    assert ability.can?(:read, user)
    assert ability.can?(:update, user)
    refute ability.can?(:manage, :all)
  end

  test "admin can manage everything" do
    admin = User.create!(
      email: "admin@example.com",
      password: "password123",
      password_confirmation: "password123",
      admin: true
    )
    ability = Ability.new(admin)

    assert ability.can?(:manage, :all)
    assert ability.can?(:destroy, User.new)
    assert ability.can?(:create, User.new)
  end
end
