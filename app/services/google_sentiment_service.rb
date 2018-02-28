require "google/cloud/language"
class GoogleSentimentService

  def self.analyze(text_content)
    language = Google::Cloud::Language.new

    response = language.analyze_sentiment content: text_content, type: :PLAIN_TEXT

    response.sentences
  end
end
