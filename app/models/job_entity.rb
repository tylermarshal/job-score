class JobEntity < ApplicationRecord
  belongs_to :job

  before_save :calculate_multiplier

  def calculate_multiplier
    self.multiplier = salience * magnitude
  end
end
