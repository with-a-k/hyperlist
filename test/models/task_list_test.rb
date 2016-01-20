require 'test_helper'

class TaskListTest < ActiveSupport::TestCase
  test "a valid task list" do
    meta = TaskList.new(title: "'Hyperlist' Task Manager Assessment", description: "optional")
    assert meta.valid?
  end

  test "not valid with no title" do
    headless = TaskList.new()
    refute headless.valid?
  end
end
