ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails/capybara'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def log_in_with(email, password)
    click_on "Log In"
    fill_in :email, with: email
    fill_in :password, with: password
    click_on "Finish"
  end

  def log_in_as(user)
    visit root_path
    log_in_with(user.email, user.password)
  end

  def select_date(date, options = {})
    field = options[:from]
    select date.strftime('%Y'),  :from => "#{field}_1i"
    select date.strftime('%B'),  :from => "#{field}_2i"
    select date.strftime('%-d'), :from => "#{field}_3i"
  end
end
