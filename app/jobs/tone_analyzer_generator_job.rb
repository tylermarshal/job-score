class ToneAnalyzerGeneratorJob < ApplicationJob
  queue_as :default

  def perform(cover_letter)
    puts "got to job"
    ToneAnalyzerBuilder.new(cover_letter).generate
  end
end
