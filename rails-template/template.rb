def source_paths
  [__dir__]
end

copy_file "direnv", ".envrc"
run "direnv allow"
run "bundle  config --local path .bundle/gems"

uncomment_lines "Gemfile", /gem ['"]redis['"]/

gem "view_components"
gem "vite_rails"

gem_group :test do
  gem "rspec-rails"
  gem "capybara"
end

gem_group :development, :test do
  gem "dotenv-rails"
  gem "brakeman"

  gem "standard", require: false
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-rails", require: false
end

# copy_file "dockerignore", ".dockerignore"
# copy_file "Dockerfile"

copy_file "rubocop.yml", ".rubocop.yml"

# install stuff
after_bundle do
  run "bundle exec vite install"

  generate "rspec:install"
end

# FIRST COMMIT
after_bundle do
  run "rubocop -A"

  git :init
  git add: "."
  git commit: "-m 'initial commit'"
end
