require "test_helper"

class TaskListFeaturesTest < Capybara::Rails::TestCase
  test "user creates a task list" do
    User.create(name: "Faris Scherwiz Tycoon", email: "captain@tycoon.net", password: "fierycourage", password_confirmation: "fierycourage")
    visit root_path
    click_on "Log In"
    fill_in :email, with: "captain@tycoon.net"
    fill_in :password, with: "fierycourage"
    click_on "Finish"
    assert_equal tasks_path, current_path
    click_on "New Task List"
    assert_equal new_task_list_path, current_path
    fill_in :task_list_title, with: "Collect Legendary Weapons"
    fill_in :task_list_description, with: "They are weapons. They are legendary. There are even twelve of them."
    click_on "Create"
    assert_equal tasks_path, current_path
    assert_content page, "Collect Legendary Weapons"
  end
end
