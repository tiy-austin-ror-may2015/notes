# Ruby and Rails Tips

## New Rails Project Setup

## Deploying to Heroku

## Rails-isms
  - Models are ruby classes that inherit from `ActiveRecord::Base`
  - Models are singular in rails `User`, `Student`, and `Todo`
  - Controllers are pluralized in rails `UsersController`, `StudentsController`, and `TodosController`
  - Database table names are plural in rails `users`, `students`, and `todos`
  - There is _(typically)_ one folder in views for each model you've created. It is the pluralized version of the model name and holds all the html/erb templates for that model's controller. For example: the `User` model will have an action index on the `UsersController` that will render the `users/index.html.erb` template.
## Ruby Gotchas

## Problem Solving

