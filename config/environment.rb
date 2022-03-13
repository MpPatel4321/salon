# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

Sidekiq.configure_server do |config|
  	config.redis = { url: 'redis://localhost:6379/0' }
end
Sidekiq.configure_client do |config|
	config.redis = { url: 'redis://localhost:6379/0' }
end
