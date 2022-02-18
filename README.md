# README
## Student Rooster
This is the _draft_ version of Student Rooster, a ruby on rails application to track students and the classes that they take. Users can sign up and create a "team" to track lessons, lesson rosters, and students.

## Local System Requirements
This is a Ruby on Rails driven website, so you will need Ruby and a few "gems 💎 " to get started.

### Requirements
- Ruby (2.7.2)
- Rails (~> 6.1.3)
- PostgreSQL

## Configure Application
Fork and/or clone down this repository.

For SSH:

```ssh
git clone git@github.com:Sun-Mountain/student-rooster.git
```

For HTTPS:

```
https://github.com/Sun-Mountain/student-rooster.git
```

To set up the application, run the following commands in the root of the repository.

1. `gem install bundler --no-document`
2. `bundle install`
3. `npm install`

## Run the Server

```Bash
rails db:create db:migrate db:seed
rails server
```

## Run the Tests

```Bash
rspec spec
```