# README

create a .env file, that should look like so:
DATABASE_URL_DEV="postgres://username:password@localhost/ruby_labs_development"


then, run:

bundle install
rails db:create
rails db:migrate
rails s
