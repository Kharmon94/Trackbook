require "test_helper"

class UsersFlowTest < ActionDispatch::IntegrationTest
  test "user can register, sign in and sign out" do
    # visit the registration page
    get new_user_registration_path
    assert_response :success

    # create a new user
    post user_registration_path, params: {
      user: {
        email: "example@example.com",
        password: "password",
        password_confirmation: "password"
      }
    }

    # devise redirects to root by default
    follow_redirect!
    assert_response :success

    # sign out
    delete destroy_user_session_path
    follow_redirect!
    assert_response :success
  end
end
