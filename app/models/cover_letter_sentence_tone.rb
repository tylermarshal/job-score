class CoverLetterSentenceTone < ApplicationRecord
  belongs_to :cover_letter

  def self.confident
    where(tone: "Confident").order(score: :desc)
  end

  def self.fear
    where(tone: "Fear").order(score: :desc)
  end

  def self.anger
    where(tone: "Anger").order(score: :desc)
  end

  def self.joy
    where(tone: "Joy").order(score: :desc)
  end

  def self.sadness
    where(tone: "Sadness").order(score: :desc)
  end

  def self.analytical
    where(tone: "Analytical").order(score: :desc)
  end

  def self.tentative
    where(tone: "Tentative").order(score: :desc)
  end
end
