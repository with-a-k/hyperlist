require "test_helper"

class RegisterTest < Capybara::Rails::TestCase
  test "root page has login and register links" do
    visit root_path
    assert_content page, "Log In"
    assert_content page, "Sign Up"
    click_on "Log In"
    assert_equal login_path, current_path
    visit root_path
    click_on "Sign Up"
    assert_equal new_user_path, current_path
  end

  test "a user can sign up and log out" do
    visit root_path
    click_on "Sign Up"
    fill_in :user_name, with: "Yu Narukami"
    fill_in :user_email, with: "howareyudoing@inaba.jp"
    fill_in :user_password, with: "neoizanagi"
    fill_in :user_password_confirmation, with: "neoizanagi"
    click_on "Finish"
    assert_equal tasks_path, current_path
    click_on "Log Out"
    assert_equal root_path, current_path
  end

  test "a user can log in and log out" do
    User.create(name: "Sigma Klim", email: "zeroii@crashkeys.net", password: "BQZRGJDXR", password_confirmation: "BQZRGJDXR")
    visit root_path
    click_on "Log In"
    fill_in :email, with: "zeroii@crashkeys.net"
    fill_in :password, with: "BQZRGJDXR"
    click_on "Finish"
    assert_equal tasks_path, current_path
    click_on "Log Out"
    assert_equal root_path, current_path
  end

  test "signup with bad information shows errors" do
    visit root_path
    click_on "Sign Up"
    fill_in :user_name, with: "Dixie Kong"
    fill_in :user_email, with: "hairpropel@kong.net"
    fill_in :user_password, with: "whipbackandforth"
    click_on "Finish"
    assert_equal new_user_path, current_path
    assert_content page, "Password confirmation required."
  end

  test "logged in user redirected to tasks" do
    visit root_path
    click_on "Sign Up"
    fill_in :user_name, with: "Mitsuru Kirijo"
    fill_in :user_email, with: "mitsuru@kirijo.net"
    fill_in :user_password, with: "penthesileartemisia"
    fill_in :user_password_confirmation, with: "penthesileartemisia"
    click_on "Finish"
    assert_equal tasks_path, current_path
    visit root_path
    assert_equal tasks_path, current_path
  end
end
