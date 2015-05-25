source 'https://rubygems.org'

#Server
gem 'rails', '4.2.1'
gem 'thin'

#Database
gem 'sqlite3' #Development
#gem 'pg' #Test and Prod
#gem "mongoid", "~> 4.0.0" #Keep original tweets and followers
#gem 'redic' #Session Storage?

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'haml-rails'

gem "font-awesome-sass"
gem 'materialize-sass'

gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-vkontakte'

gem 'twitter'
gem 'vkontakte_api', '~> 1.4'
gem 'cancancan', '~> 1.10'

gem "figaro"

#gem "lol_dba"

gem 'exception_handler'

#debug
group :development, :test do
  gem 'rails-footnotes'
  gem 'quiet_assets'
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'foreman', require: false
  #gem 'pghero'
end

#testing
group :test, :development do
  gem 'rspec'
  gem 'listen', '~> 2.7'
  #gem 'certified', require: false  
  gem 'fabrication'
  #gem 'mocha'
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'brakeman'
end

