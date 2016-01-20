require "test_helper"

class TaskFeaturesTest < Capybara::Rails::TestCase
  test "user creates a task" do
    cx = User.create(name: "Copy X", email: "hero@neoarcadia.na", password:"definitelyx", password_confirmation:"definitelyx")
    list = cx.task_lists.create(title: "Erase Resistance")
    log_in_as(cx)
    click_on "Add Task"
    assert_equal new_task_list_task_path(list), current_path
    fill_in :task_title, with: "DESTROY ZERO"
    fill_in :task_notes, with: "what a pain"
    select_date Date.today, from: :task_start
    select_date Date.today+1, from: :task_due
    click_on "Create"
    assert_equal tasks_path, current_path
    assert_content page, "DESTROY ZERO"
  end

  test "user modifies a task" do
    tipan = User.create(name: "Dorian Tipa", email: "caravanlead@tipa.cc", password: "behindit", password_confirmation: "behindit")
    list = tipan.task_lists.create(title: "This Year's Myrrh")
    task = list.tasks.create(title: "River Belle Path Tree", start: Date.today, due: Date.today+60)
    log_in_as(tipan)
    click_on "Change Task Details"
    fill_in :task_title, with: "Goblin Wall Tree"
    fill_in :task_notes, with: "Whoops, we hit the river last year"
    click_on "Change"
    assert_equal tasks_path, current_path
    assert_content page, "Goblin Wall Tree"
    refute_content page, "River Belle Path Tree"
  end
end
