require 'rails_helper'

describe 'a logged in user visits their dashboard' do
  it 'the user can paste their resume to be added to their saved resumes' do
    user = create(:user)

    resume_text = "Lyle Corner 100 Broadway Lane New Parkland, CA, 91010 Cell: (555) 987-1234 lylecorner@example.com
Summary
Proactive Agile Developer who is constantly trying to find new ways to get software to meet the precise needs of clients. Adept at customizing software solutions, retooling existing software platforms and helping customers to understand their software needs. Specializes in industrial control software.
Highlights
Certified developer by several major software manufacturers
Very strong customer communication and presentation skills
Able to present complex information in ways that clients can understand
Willing to work at a client’s site until the job is done
Enjoys innovating control software solutions
Works very well as part of a development team
Work Experience
April 2010 to February 2015 Benson Controls – New Parkland, CA Agile Developer
Designated as one of four developers that were qualified to retool larger industrial control software platforms.
Often part of the initial customer introduction team that explained the entire process to clients.
Responsible for developing several innovative software development methods that the company still uses.
August 2005 to April 2010 Quality Software – New Parkland, CA Agile Developer
Usually part of the contact team that would interview clients to get the details on client needs when developing new control software.
Created several training programs for clients that helped them to better understand customized control software.
Worked closely with management to develop marketing techniques designed at bringing in more clients.
June 1998 to August 2005 The Control Guys – New Parkland, CA Agile Developer
Worked closely with larger customers to retool existing control software.
Developed several innovative control processes that are still being used.
Education
1998 Terrace College, New Parkland, CA Bachelor of Science, Software Engineering"

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_index_path

    expect(page).to have_content("Add a New Resume")

    fill_in "resume[name]", with: "Resume 1"
    fill_in "resume[body]", with: resume_text

    click_button("Add Resume", match: :first)

    expect(current_path).to eq(dashboard_index_path)

    expect(page).to have_content("Resume 1")

    resume = Resume.last

    expect(resume.name).to eq ("Resume 1")
  end
end
