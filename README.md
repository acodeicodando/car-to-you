# Car to You

This application was created to locate cars for users between dates to start and end.

## Tech information

Main framework to development is Ruby on Rails with SQLITE3 for development and test environments but PostgreSQL for Production|Staging environment
Codes for developers are in git repository **Car To You** https://github.com/acodeicodando/car-to-you/
Production|Staging environment are in git repository with instructions **Car To You Heroku** https://dashboard.heroku.com/apps/car-to-you/deploy/heroku-git

## Gems to take a look

- `rspec-rails` of course to test your code
- `simplecov` show you the code coverage
- `database_cleaner-active_record` and `database_cleaner-redis` to clean your database when steel coding with tests are running
- `redis`, `cable_ready` and `stimulus_reflex` to build server responses with actions dispatchs on frontend

## Development instructions

It's easy to start the development code or just run the application, run the instructions in your console
The database is SQLITE3 to run more faster

- ``bundle install``
- ``yarn``
- ``rails db:drop db:create db:migrate db:seed``
- ``rails s``

Finally access http://localhost:3000

## Tests

Just run
The database is SQLITE3 to run more faster

- ``rspec .``

or if you whant test your code in real-time run

- ``bundle exec guard``
# Car to You

This application was created to locate cars for users between dates to start and end.

## Tech information

Main framework to development is Ruby on Rails.
Codes for developers are in git repository **Car To You** https://github.com/acodeicodando/car-to-you/
Production|Staging environment are in git repository with instructions **Car To You Heroku** https://dashboard.heroku.com/apps/car-to-you/deploy/heroku-git

## Gems to take a look

- `rspec-rails` of course to test your code
- `simplecov` show you the code coverage
- `database_cleaner-active_record` and `database_cleaner-redis` to clean your database when steel coding with tests are running
- `redis`, `cable_ready` and `stimulus_reflex` to build server responses with actions dispatchs on frontend

## Development instructions

It's easy to start the development code or just run the application, run the instructions in your console

- ``bundle install``
- ``yarn``
- ``rails db:drop db:create db:migrate db:seed``
- ``rails s``

Finally access http://localhost:3000

When you start a new issue, this must come from master branch, the process is like this

- ``git checkout master``
- ``git fetch --all``
- ``git pull origin master``
- ``git checkout -b issues/name-of-issue``

And when you have your code with 95% coverage at least, you need test with ``development branch`` environment before push to staging|production heroku environment. Follow the git commands

- In your terminal inside the project folder run ``rspec .``
- Look for the coverage. If it's under 95% go to next step
- ``git commit -am 'short description about what I coded'``
- ``git push origin issues/name-of-issue``
- ``git checkout development``
- ``git pull origin development``, run again the tests to guarantee that everything is ok, if ok go to next step
- ``git push origin development``
- ``git checkout master``, now it's time to publish in staging|production Heroku environment
- ``git pull origin master``, run again the tests to guarantee that everything is ok, and finally
- ``git push origin master``, coded will send to git repository
- ``heroku run rake db:migrate``, this will run some change that happen in database
- ``git push heroku master``, access https://car-to-you.herokuapp.com/ and go rest now

## Tests

Just run

- ``rspec .``

or if you whant test your code in real-time run

- ``bundle exec guard``