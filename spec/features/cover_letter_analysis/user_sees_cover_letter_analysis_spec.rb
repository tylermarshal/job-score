require 'rails_helper'

describe 'a logged in user visits the cover letter analysis page' do
  it 'the user see their analysis' do
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

    job_text = "Database Administrator
SendGrid is a proven cloud-based customer communication platform that successfully delivers over 25 billion emails each month for Internet and mobile-based customers like Airbnb, Spotify, and Uber. We are looking for a talented and passionate individual to help manage our world-class SaaS email delivery infrastructure. You will be part of a team that ensures the reliability and performance of a large and diverse data storage stack. You will directly engage with development teams to provide data-relevant advice and feedback, and serve as an information conduit back to other Ops team members. Additionally, you will continually improve the velocity of our deployment pipeline through automation and monitoring of data storage systems.

Our global headquarters, Denver, is home to our second generation product -- Marketing Campaigns, and hub for our technical operations team. Additionally, we wield machine learning and big data to combat The Evil that comes in the form of phishers and spammers and we ensure that each aspect of our customers’ lifecycle is flawless so they have one less thing to worry about.

The home of our founders, our Orange location is primarily an engineering office where our core email infrastructure - the services, APIs, and customer portal that process billions of transactions per day - are built. 

What You’ll Do

Live by and champion our cultural values of Happy, Hungry, Honest, and Humble
Partner with other engineers to author tools that reliably manage data storage infrastructure. We're looking for someone to write clean, testable, reusable code.
Support our existing data storage systems while you improve them
Work with the team to troubleshoot/determine resolution for simple issues in Sendgrid’s data storage services
Use configuration management tools to automate SendGrid’s data storage infrastructure
Identify key system metrics and ensure adequate monitoring coverage for new and existing data storage services
About You

You have an advanced beginner understanding of MySQL
You have an advanced beginner understanding of Riak or similar NoSQL data store
You are an advanced beginner in 1 or more programming languages
You are an advanced beginner in a unix shell environment
You are able to demonstrate yourself as a quick learner of new things
You know how and when to escalate when you are stuck on a task"

    job = create(:job, description: job_text, user: user)
    cover_letter = create(:cover_letter, body: cover_letter_text, user: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit cover_letter_analysis_path

    expect(page).to have_content("Cover Letter Analysis")
    expect(page).to have_content("Overall Tone")
    expect(page).to have_content("Keywords")

    expect(page).to have_css(".charts")
    expect(page).to have_css(".form-style")

  end
end
