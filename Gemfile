source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'devise'
gem 'simple_token_authentication', '~> 1.0'
gem 'rack-cors'
gem 'rack-attack'
gem 'carrierwave'
gem 'carrierwave-base64'
gem 'has_scope'
gem 'bootsnap', '>= 1.1.0', require: false
gem "pundit"
gem 'aws-sdk', '~> 3'
gem 'dotenv-rails'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-byebug'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
