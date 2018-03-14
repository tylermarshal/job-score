require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDISTOGO_URL'], size: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDISTOGO_URL'], size: 4 }
end
