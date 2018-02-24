require 'rails_helper'

describe 'a logged in user visits their dashboard' do
  it 'the user can paste their cover letter to be added to their saved cover letters' do
    user = create(:user)

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

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path

    expect(page).to have_link("Paste a Job Description")

    fill_in "job[company_name]", with: "Company 1"
    fill_in "job[job_title]", with: "Job 1"
    fill_in "job[description]", with: job_text

    click_on "Add Job"

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to have_content("Job 1")

    job = Job.last

    expect(job.company_name).to eq ("Company 1")
    expect(job.job_title).to eq ("Job 1")
    expect(job.description).to eq (job_text)
  end
end
