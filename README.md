# StackOverflow Clone App

A web application enabling users to ask questions and get their doubts resolved from other community members in real-time with the ability to search through the questions based on the tags they have attached.

## Technologies Used

- Backend: Rails6
- Database: SQLite

## Setup

1. Clone the repository `git clone https://github.com/aayush-05/StackOverflow-Clone.git`
2. Move into project folder `cd StackOverflow-Clone`
3. Install bundler `gem install bundler` and then install dependencies `bundle install`
4. Create database `rails db:create` and run migrations `rails db:migrate`
5. Finally run the application at `127.0.0.1:3000` using `rails server`

## Screenshots

- Homepage
  ![Homepage](/screenshots/home.PNG)
- Dashboard
  ![Dashboard](/screenshots/dashboard.PNG)
- Ask Question Form
  ![Ask Question Form](/screenshots/askQuestion.PNG)
  ![Ask Question Form](/screenshots/askQuestion2.PNG)
- Question Details
  ![Question Details](/screenshots/question.PNG)
- Tag Search
  ![Tag Search](/screenshots/tagSearch.PNG)
- Real Time Communication
  ![Real Time Communication](/screenshots/realTimeComment.gif)
