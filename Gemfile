source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'rails-i18n', '~> 5.0.0'

gem 'puma', '~> 3.10'


gem 'sass-rails', '~> 5.0'
gem 'font-awesome-rails'
gem 'bootstrap', '~> 4.0.0.beta'
gem 'slim-rails'
gem 'uglifier', '>= 1.3.0'
gem 'email_validator'
gem 'simple_form'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'

gem 'turbolinks', '~> 5'

gem 'recaptcha', require: 'recaptcha/rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'

  gem 'rspec-rails', '~> 3.6'
  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :production do
  gem 'pg'
end

group :test do
  gem 'capybara'
  gem 'launchy'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
