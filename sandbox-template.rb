# Gemfile
gem_group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
end

gem_group :test do
  gem 'capybara'
end

gem_group :production do
  gem 'pg'
  gem 'rails_12factor'
end

gem 'devise'
gem 'simple_form'
gem 'kaminari'
gem 'i18n_generators'

run_bundle # bundle install

generate 'rspec:install'
remove_dir 'test'

generate 'simple_form:install'

# App
generate(:scaffold, "user", "name:string", "email:string")
generate(:scaffold, "micropost", "content:text", "user_id:integer")

# DB
rake 'db:drop'
rake 'db:create'
rake 'db:migrate'

# Git
git :init
git add: '.'
git commit: %Q{ -m 'Initial commit'}

# .gitignore
file ".gitignore", <<-END  
# Ignore other unneeded files.
doc/
*.swp
*~
.project
.DS_Store
.idea
config/database.yml  
END  
