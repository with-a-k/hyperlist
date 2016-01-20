class Task < ActiveRecord::Base
  belongs_to :task_list
  validates :title, presence: { message: 'required. '}
  validate :no_past_dates, on: :create
  validate :linear_time

  private

  def no_past_dates
    errors.add(:start, "can't be in the past. ") if start < Date.today
    errors.add(:due, "can't be in the past. ") if due < Date.today
  end

  def linear_time
    errors.add(:due, "can't be before the start date. ") if due < start
  end
end
