require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "a valid task" do
    meta = Task.new(title: "Write Task Tests", notes: "Not a difficult job.", due: Date.today, start: Date.today)
    assert meta.valid?
  end

  test "not valid without a title" do
    orphaned = Task.new(notes: "Make sure of sleeping bag", start: Date.today, due: Date.today+2)
    refute orphaned.valid?
  end

  test "not valid with a past due date" do
    old = Task.new(title: "Real Time", start: Date.new(2016,1,12), due: Date.new(2016,1,19))
    refute old.valid?
  end

  test "not valid with a past start date" do
    old = Task.new(title: "Pack for weekend", start: Date.new(2016,1,18), due: Date.new(2016,1,22))
    refute old.valid?
  end

  test "not valid with a due date before its start date" do
    nonsense = Task.new(title: "Turn world inside-out", start: Date.today + 3, due: Date.today + 1)
    refute nonsense.valid?
  end
end
