require "google/cloud/language"
class GoogleEntitySentimentService

  def self.analyze(text_content)
    language = Google::Cloud::Language.new

    response = language.analyze_entity_sentiment content: text_content, type: :PLAIN_TEXT

    response.entities
  end
end
