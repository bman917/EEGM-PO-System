ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  class ActionController::TestCase
  	include Devise::TestHelpers
  def setup
  	if @request
  	  
      @request.env["devise.mapping"] = Devise.mappings[:one]
      sign_in users(:one)
    end
  end
  end

end
