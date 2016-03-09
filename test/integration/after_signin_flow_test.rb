require 'test_helper'

class AfterSigninFlowTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user logs in and adds a friend" do 
    visit root_url
    expect(page).has_content('You need to sign in or sign up before continuing.
')
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
