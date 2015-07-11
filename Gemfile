source 'https://rubygems.org'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'
#gem 'bcp47', '~> 0.3.3'
gem 'iso-639'

# Component requirements
gem 'bcrypt'
gem 'haml'
gem 'activerecord', '>= 3.1', :require => 'active_record'
gem 'sqlite3'

# Test requirements
group :testing do
  gem 'minitest'
  gem 'minitest-capybara'
  gem 'rack-test'
  gem 'launchy'
end
gem 'pry', group: [:testing, :development]

# Padrino Stable Gem
gem 'padrino', '0.12.5'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.12.5'
# end
