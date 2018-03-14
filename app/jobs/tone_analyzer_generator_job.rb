class ToneAnalyzerGeneratorJob < ApplicationJob
  queue_as :default

  def perform(cover_letter)
    ToneAnalyzerBuilder.new(cover_letter).generate
  end
end
