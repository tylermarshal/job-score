class CoverLetterSentenceTone < ApplicationRecord
  belongs_to :cover_letter

  def self.confident
    where(tone: "Confident")
  end

  def self.fear
    where(tone: "Fear")
  end

  def self.anger
    where(tone: "Anger")
  end

  def self.joy
    where(tone: "Joy")
  end

  def self.sadness
    where(tone: "Sadness")
  end

  def self.analytical
    where(tone: "Analytical")
  end

  def self.tentative
    where(tone: "Tentative")
  end
end
