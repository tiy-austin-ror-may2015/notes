# Rails TIY template

# Add heroku procfile
file('Procfile',  "web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}")

# Add ruby version to gemfile
ruby_version = ask("What is your ruby version? ")
insert_into_file "Gemfile", "ruby '#{ruby_version}'", :after => "source 'https://rubygems.org'\n"

# Set timezone
insert_into_file "config/application.rb", "config.time_zone = 'Central Time (US & Canada)'",
  :after => "  class Application < Rails::Application\n"

# Add pg and puma gem
gem 'pg'
gem 'puma'

gem_group :production do
  gem 'rails_12factor'
end

gem_group :development, :test do
  gem 'pry' if yes?("Do you want to use Pry? ")
  gem 'faker'
end

run "rm README.rdoc"
run "touch README.md"

if yes?("Do you want to use Bootstrap? ")
  gem 'bootstrap-sass'
  run 'rm app/assets/stylesheets/application.css'
  file("app/assets/stylesheets/application.css.scss","""@import 'bootstrap-sprockets';
@import 'bootstrap';
//You need to now manually import every other scss file.""")
  insert_into_file("app/assets/javascripts/application.js", "//= require bootstrap-sprockets\n",
                   after: "//= require jquery\n")
end
