require 'rails_helper'

RSpec.describe ResumeEntity, type: :model do
  it "exists" do
    text = "As a customer-obsessed professional with a passion for the healthcare industry, I was thrilled to learn that Health First Medical Clinic needs a Customer Service Manager. Presently, I am a Senior Customer Service Representative with six years of experience. I am registered with the California State Board of Pharmacy and have a B.A. in Management from Golden Gate University in San Francisco."
    user = create(:user)
    resume = create(:resume, user: user, body: text)
    VCR.use_cassette("services/find_resume_entities") do

      entities = ResumeEntityService.new.generate(resume)
      entity = entities.first

      expect(entities.count).to eq(12)
      expect(entity.name).to eq("Customer Service Representative")
      expect(entity.salience).to eq(0.5650523900985718)
      expect(entity.sentiment.magnitude).to eq(0.0)
    end
  end
end
