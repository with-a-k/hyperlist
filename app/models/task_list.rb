class TaskList < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :title, presence: { message: 'required. ' }
end
