ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require "selenium/webdriver"
require 'database_cleaner'
require 'faker'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

ActiveRecord::Migration.maintain_test_schema!

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  # capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(chromeOptions: {args: %w(headless disable-gpu)})

  Capybara::Selenium::Driver.new app, browser: :chrome#, desired_capabilities: capabilities

end

Capybara.javascript_driver = :headless_chrome
Capybara.server = :webrick


RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false

  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean_with :truncation

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!
end
