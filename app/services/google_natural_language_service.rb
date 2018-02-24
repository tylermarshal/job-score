require "google/cloud/language"
class GoogleNaturalLanguageService

  def analyze(text_content)
    language = Google::Cloud::Language.new

    response = language.analyze_entity_sentiment content: text_content, type: :PLAIN_TEXT

    response.entities
    # entities = response.entities

    # entities.each do |entity|
    #   puts "Entity #{entity.name} #{entity.type}"
    #
    #   if entity.metadata["wikipedia_url"]
    #     puts "URL: #{entity.metadata['wikipedia_url']}"
    #   end
    # end
  end
end
