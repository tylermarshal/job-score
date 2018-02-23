Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedIn, ENV["LINKEDIN_CLIENT_ID"], ENV["LINKEDIN_CLIENT_SECRET"]
end
