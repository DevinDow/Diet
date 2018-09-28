# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails::Initializer.run do |config|
    config.time_zone = "Pacific Time (US & Canada)"
end