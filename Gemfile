source "https://rubygems.org"
ruby "2.7.2"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.2.4.5"
gem "pg", "~> 0.18"
gem "puma", "~> 4.3"
gem "active_model_serializers", "~> 0.10.0"
gem "figaro"
gem "faraday"
gem "faker"
gem "rack-cors", require: "rack/cors"
gem "delayed_job_active_record"
gem "daemons"

group :development, :test do
  gem "pry"
  gem "rspec-rails", "~> 3.5"
  gem "factory_bot_rails"
  gem "shoulda-matchers", "~> 3.1"
  gem "capybara"
  gem "launchy"
  gem 'rubocop-faker'
end

group :development do
  gem "listen", "~> 3.0.5"
end

group :test do
  gem "vcr"
  gem "webmock"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
