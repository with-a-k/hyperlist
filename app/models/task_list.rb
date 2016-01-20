class TaskList < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: { message: 'required. ' }
end
