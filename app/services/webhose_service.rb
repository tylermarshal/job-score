class WebhoseService

  attr_reader :company, :news

  def initialize(company)
    @company = URI::encode(company)
    @news = parse[:posts].map { |article| WebhoseArticle.new(article) }
  end

  def conn
    Faraday.new(:url => 'http://webhose.io') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def response
    conn.get("/filterWebContent?token=#{ENV["WEBHOSE_KEY"]}&format=json&sort=crawled&q=#{company}%20language%3Aenglish%20thread.country%3AUS")
  end

  def parse
    JSON.parse(response.body, symbolize_names: true)
  end

end
