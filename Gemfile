source 'https://rubygems.org'

## Rails
gem 'listen'
gem 'rails', '~> 5.1.0'
gem 'rails-i18n'

# Databases
group :development, :test do
  gem 'mysql2'
  gem 'pg'
  gem 'sqlite3'
end

# xlsx
gem 'axlsx', '2.1.0.pre'
gem 'axlsx_rails'
gem 'rubyzip', '~> 1.1.0'

# Essentials
gem 'active_model_serializers'
gem 'acts_as_list'
gem 'acts-as-taggable-on', '~> 4.0'
gem 'css_parser'
gem 'figaro'
gem 'foreman'
gem 'paper_trail'
gem 'puma'
gem 'rack-cors'
gem 'sanitize'
gem 'slim-rails', '3.1.1'

## Security
gem 'cancancan', git: 'https://github.com/CanCanCommunity/cancancan.git', branch: 'master'
gem 'devise'
gem 'rolify'
gem 'secure_headers', '~> 2.5.0'

## Assets
gem 'coffee-rails', '~> 4.2'
gem 'sass-rails', '~> 5.0.6'
gem 'uglifier', '>= 1.3.0'

gem 'autoprefixer-rails'
gem 'js-routes'
gem 'ng-rails-csrf'

source 'https://rails-assets.org/' do
  gem 'rails-assets-html5shiv'
  gem 'rails-assets-jquery'
  gem 'rails-assets-respond'

  gem 'rails-assets-angular', '~> 1.5.0'
  gem 'rails-assets-angular-animate'
  gem 'rails-assets-angular-aria'
  gem 'rails-assets-angular-cookies'
  gem 'rails-assets-angular-material'
  gem 'rails-assets-angular-messages'
  gem 'rails-assets-angular-resource'
  gem 'rails-assets-angular-route'
  gem 'rails-assets-angular-sanitize'

  gem 'rails-assets-angular-moment'
  gem 'rails-assets-moment'

  gem 'rails-assets-angular-translate'
  gem 'rails-assets-angular-translate-loader-partial'
  gem 'rails-assets-angular-translate-loader-static-files'
  gem 'rails-assets-angular-translate-storage-cookie'
  gem 'rails-assets-angular-translate-storage-local'

  gem 'rails-assets-angularjs-viewhead'
  gem 'rails-assets-fastclick'

  gem 'rails-assets-angular-file-model'
  gem 'rails-assets-angular-file-upload'
  gem 'rails-assets-angular-filter'

  gem 'rails-assets-angular-material-icons'
  gem 'rails-assets-angular-xeditable'
  gem 'rails-assets-md-data-table'
end

## Search Engine
gem 'progress_bar'
gem 'sunspot'
gem 'sunspot-queue'
gem 'sunspot_rails'
gem 'sunspot_solr', group: %i[development test]

## Remote Development
group :development do
  gem 'capistrano', '~> 3.6.0'
  gem 'capistrano-bundler', require: false
  gem 'capistrano-docker', git: 'https://github.com/netguru/capistrano-docker', require: false
  gem 'capistrano-file-permissions', require: false
  gem 'capistrano-nc', require: false
  gem 'capistrano-pending', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-safe-deploy-to', require: false
  gem 'capistrano-sidekiq', require: false
  gem 'capistrano-ssh-doctor', require: false
  gem 'capistrano3-puma', require: false
end
