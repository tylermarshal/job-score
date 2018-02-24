require 'rails_helper'

describe 'a logged in user visits their dashboard' do
  it 'the user can paste their cover letter to be added to their saved cover letters' do
    user = create(:user)

    cover_letter_text = "As a customer-obsessed professional with a passion for the healthcare industry, I was thrilled to learn that Health First Medical Clinic needs a Customer Service Manager. Presently, I am a Senior Customer Service Representative with six years of experience. I am registered with the California State Board of Pharmacy and have a B.A. in Management from Golden Gate University in San Francisco.

I have built on my education with hands-on customer service experience at Kaiser Permanente. I started on the ground floor as a customer service rep in the telephone call center; after two years, my employer promoted me to Senior Customer Service rep, handling both phone and email inquiries. I am currently serving as interim Customer Service Manager while my supervisor is on maternity leave, managing a team of 20 customer service reps.

You need someone with at least a year of experience in reimbursement case management, but I offer much more. During my time at Kaiser, I have mastered reimbursement case management and monitoring customer service metrics across my team. I have spent the last five years developing a keen understanding of claim adjudication and drug reimbursement issues and medical terminology, as well.

I have a proven track record of efficiently handling customer calls and effectively handling customer e-mail inquiries. Under my interim management, specifically:

•
Customer service surveys indicate an 11% increase in customer satisfaction with our department in just two months
•
Employee absenteeism in my department dropped by 5%
I think that my skill set aligns perfectly with the needs of Health First Clinic. Thank you for reviewing my credentials. I look forward to learning more about the opportunity.
"

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path

    expect(page).to have_link("Paste a Cover Letter")

    fill_in "cover_letter[name]", with: "Cover Letter 1"
    fill_in "cover_letter[body]", with: cover_letter_text

    click_on "Add Cover Letter"

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to have_content("Cover Letter 1")

    cover_letter = CoverLetter.last

    expect(cover_letter.name).to eq ("Cover Letter 1")
    expect(cover_letter.body).to eq (cover_letter_text)
  end
end
