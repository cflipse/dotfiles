def source_paths
  [__dir__]
end

copy_file "direnv", ".envrc"
run "direnv allow"
run "bundle  config --local path .bundle/gems"

uncomment_lines "Gemfile", /gem [""]redis[""]/

gem_group :test do
  gem "rspec-rails"
  gem "capybara"
end

gem_group :development, :test do
  gem "dotenv-rails"
  gem "brakeman"
end

gem "rubocop", require: false
gem "rubocop-rspec", require: false
gem "rubocop-rails", require: false

gem "view_components"

gem "vite_rails"

# copy_file "dockerignore", ".dockerignore"
# copy_file "Dockerfile"

copy_file "rubocop.yml", ".rubocop.yml"

after_bundle do
  run "bundle exec vite install"
end

after_bundle do
  generate "rspec:install"

  run "rubocop -A"
end

after_bundle do
  git :init
  git add: "."
  git commit: "-m 'initial commit'"
end
