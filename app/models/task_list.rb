class TaskList < ActiveRecord::Base
  validates :title, presence: { message: 'required. ' }
end
