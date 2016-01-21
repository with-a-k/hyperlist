class Task < ActiveRecord::Base
  belongs_to :task_list
  validates :title, presence: { message: 'required. '}
  validate :no_past_dates, on: :create
  validate :linear_time
  has_attached_file :attachment,
                    storage: :s3
  validates_attachment_file_name :attachment, :matches => [/png\Z/, /jpe?g\Z/, /gif\Z/, /pdf\Z/]
  scope :present, -> { where('start < ?', Date.today+1) }
  scope :incomplete, -> { where(status: false) }

  def complete?
    status
  end

  def display_complete
    status ? 'Completed!' : 'Incomplete'
  end

  def friendly_start_date
    start < Date.today ? 'Began on ' + start.to_s : 'Begins on ' + start.to_s
  end

  def future?
    start > Date.today
  end

  private

  def no_past_dates
    errors.add(:start, "can't be in the past. ") if start < Date.today
    errors.add(:due, "can't be in the past. ") if due < Date.today
  end

  def linear_time
    errors.add(:due, "can't be before the start date. ") if due < start
  end
end
