require 'cucumber/rails'
require 'capybara/cucumber'
require 'selenium-webdriver'

# ค่าเริ่มต้นให้ใช้ headless
Capybara.default_driver    = :selenium_chrome
Capybara.javascript_driver = :selenium_chrome

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new

  # Default = headless
  unless ENV['UI']   # 👈 ถ้าไม่ได้ใส่ ENV['UI'] จะ headless
    options.add_argument('--headless')
  end

  options.add_argument('--disable-gpu')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_argument('--start-maximized')

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation
