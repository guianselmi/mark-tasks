require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'faker'

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'https://marktasks.herokuapp.com'
end

Capybara.default_max_wait_time = 5
