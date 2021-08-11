# Message App

## Installation
Make sure you have Ruby and Rails installed on your system. You can check version by:
```
ruby -v
rails -v
```
Clone respected git repository
```
git clone https://github.com/jkmor31/messages_app.git
```
Install all dependencies
```
bundle install
```
Create a local database and migrate schema
```
rake db:create
rake db:migrate
```
Now the rails app is setup and you may run your application

Launch server with
```
rails s
```
Test a series of Rspec tests with:
```
bundle exec rspec
```
