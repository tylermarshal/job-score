require 'uri'

class WatsonService

  attr_reader :text

  def initialize(text)
    @text = URI::encode(text)
  end

  def conn
    Faraday.new(:url => 'https://gateway.watsonplatform.net') do |faraday|
      faraday.basic_auth(ENV["WATSON_USERNAME"], ENV["WATSON_PASSWORD"])
      faraday.adapter  Faraday.default_adapter
    end
  end

  def response
    conn.get("/tone-analyzer/api/v3/tone?version=2017-09-21&text=#{text}")
  end

  def parse
    JSON.parse(response.body, symbolize_names: true)
  end

end
