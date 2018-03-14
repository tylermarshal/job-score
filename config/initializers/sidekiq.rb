require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDISTOGO_URL'], size: 2 }
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDISTOGO_URL'], size: 25 }
end
