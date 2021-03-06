class User < ActiveRecord::Base
  has_secure_password
  has_many :task_lists
  validates :email, presence: { message: 'required. ' },
                    uniqueness: { message: 'already in use. '}
  validates :password, presence: { message: 'required. '},
                       confirmation: { message: 'must match confirmation. '}
  validates :password_confirmation, presence: { message: 'required. '}
end
