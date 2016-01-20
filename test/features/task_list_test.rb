require "test_helper"

class TaskListFeaturesTest < Capybara::Rails::TestCase
  test "user creates a task list" do
    User.create(name: "Faris Scherwiz Tycoon", email: "captain@tycoon.net", password: "fierycourage", password_confirmation: "fierycourage")
    visit root_path
    log_in_with("captain@tycoon.net", "fierycourage")
    assert_equal tasks_path, current_path
    click_on "New Task List"
    assert_equal new_task_list_path, current_path
    fill_in :task_list_title, with: "Collect Legendary Weapons"
    fill_in :task_list_description, with: "They are weapons. They are legendary. There are even twelve of them."
    click_on "Create"
    assert_equal tasks_path, current_path
    assert_content page, "Collect Legendary Weapons"
  end

  test "user edits a task list" do
    gunvolt = User.create(name: "Gunvolt", email: "azurestriker@gunvolt.net", password: "astrasphere", password_confirmation: "astrasphere")
    gunvolt.task_lists.create(title: "Stop Sumeragi")
    visit root_path
    log_in_with("azurestriker@gunvolt.net", "astrasphere")
    click_on "Change Details"
    fill_in :task_list_title, with: "Stop Asimov"
    fill_in :task_list_description, with: "AUGH HOW DID I MISS THAT?"
    click_on "Change"
    assert_equal tasks_path, current_path
    assert_content page, "Stop Asimov"
    refute_content page, "Stop Sumeragi"
  end

  test "doesn't work with a blank title field" do
    exdeath = User.create(name: "Exdeath", email: "voidbringer@ffvillains.net", password: "almagest", password_confirmation: "almagest")
    voidlist = exdeath.task_lists.create(title: "Send Things to the Void")
    visit root_path
    log_in_with("voidbringer@ffvillains.net", "almagest")
    click_on "Change Details"
    fill_in :task_list_title, with: ""
    fill_in :task_list_description, with: ""
    click_on "Change"
    assert_equal edit_task_list_path(voidlist), current_path
  end

  test "doesn't allow editing someone else's task list" do
    zero = User.create(name: "Zero", email: "replihero@resistance.net", password: "cannonballsaber", password_confirmation: "cannonballsaber")
    aile = User.create(name: "Aile", email: "modelzxer@giro.ex", password: "fortitudecreed", password_confirmation: "fortitudecreed")
    zxmissions = aile.task_lists.create(title: "War Against W")
    visit root_path
    log_in_with("replihero@resistance.net", "cannonballsaber")
    visit edit_task_list_path(zxmissions)
    assert_equal tasks_path, current_path
    assert_content page, "That's not yours!"
  end
end
