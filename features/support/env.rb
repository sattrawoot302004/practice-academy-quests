require 'cucumber/rails'
require 'capybara/cucumber'
require 'selenium-webdriver'

# ใช้ UI จริงเป็นค่าเริ่มต้น และกับ @javascript
Capybara.default_driver    = :selenium_chrome
Capybara.javascript_driver = :selenium_chrome

# ลงทะเบียน driver ชื่อเดียวกับที่ใช้จริง
Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  # อย่าใส่ 'headless' ถ้าต้องการเห็นหน้าต่างจริง
  options.add_argument('--disable-gpu')
  options.add_argument('--no-sandbox')
  options.add_argument('--headless') if ENV['HEADLESS'] # 👈 toggle ได้
  # ไม่จำเป็น แต่ช่วยให้เห็นเต็มจอ
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
