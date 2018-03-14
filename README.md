# JobScore

"JobScore" is a resume and cover letter optimization tool which allows users to add job descriptions against which they can compare their resume and cover letter. The most important keywords are gleaned from the job description via the Google Natural Language API, which are then compared against a resume or cover letter of the users choosing. Since cover letters are often the first impression provided about an applicant, JobScore also provides sentence level tone feedback via the Watson Tone Analyzer API to allow the users to modify the tone their cover letter portrays. Lastly, news, blogs, and discussions about the company are offered to allow the user to be current on happenings around the company they are applying to.

Users can either paste text, take a picture, or upload an image of their resume, cover letter, or job description to receive analysis. If a picture or image is taken, the Google Vision API is used to convert the image text to machine readable text.

[Try it out on Heroku](https://job-score.herokuapp.com/)

[![forthebadge](http://forthebadge.com/images/badges/made-with-ruby.svg)](#)

## Setup & Installation

Clone the JobScore Github repository into a directory of your choosing.

```
git clone hhttps://github.com/tylermarshal/job-score.git
```

Move into the JobScore directory & install the required gems.

```
cd job-score
```
```
bundle install
```

From here you will need to set up the databases:

```
rails db:create db:migrate
```

After that you are all set analyze your resumes and cover letters and **score that job!**

## Testing

To run the test suite, you can execute the following in your terminal:

```
bundle exec rspec
```

## Creator
[Tyler Madsen](https://github.com/tylermarshal)

