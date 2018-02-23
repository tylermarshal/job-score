class LinkedinService

  def conn
    Faraday.new(:url => 'https://api.linkedin.com') do |faraday|
      # faraday.headers['Authorization'] = "Bearer #{ENV["LINKEDIN_TOKEN"]}"
      faraday.adapter  Faraday.default_adapter
    end
  end

  def response
    conn.get("v2/me?oauth2_access_token=#{ENV["LINKEDIN_TOKEN"]}")
  end


end
