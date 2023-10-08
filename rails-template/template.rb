# see  https://guides.rubyonrails.org/rails_application_templates.html

def source_paths
  [__dir__]
end

copy_file "direnv", ".envrc"
run "direnv allow"
run "bundle  config --local path .direnv/ruby"

uncomment_lines "Gemfile", /gem ['"]redis['"]/

gem "view_component"
# gem "vite_rails"

gem_group :test do
  gem "rspec-rails"
  gem "capybara"
end

gem_group :development, :test do
  gem "dotenv-rails"
  gem "brakeman"

  gem "standard"
  gem "rubocop", "~> 1.0", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
end

# copy_file "dockerignore", ".dockerignore"
# copy_file "Dockerfile"

copy_file "rubocop.yml", ".rubocop.yml"

application do
  <<-END
    # Configure generateor defaults.
    config.generators do |g|
      g.helper false
      g.test_framework :rspec
      g.system_test :rspec
      g.orm :active_record, primary_key_type: :uuid
    end
  END
end

# install stuff
after_bundle do
  # run "bundle exec vite install"
  # inject_into_file('vite.config.ts', "import FullReload from 'vite-plugin-full-reload'\n", after: %(from 'vite'\n))
  # inject_into_file('vite.config.ts', "import StimulusHMR from 'vite-plugin-stimulus-hmr'\n", after: %(from 'vite'\n))
  # inject_into_file('vite.config.ts', "import WindiCSS from 'vite-plugin-windicss'\n", after: %(from 'vite'\n))
  # inject_into_file('vite.config.ts', "\n    FullReload(['config/routes.rb', 'app/views/**/*']),", after: 'plugins: [')
  # inject_into_file('vite.config.ts', "\n    StimulusHMR(),", after: 'plugins: [')
  # inject_into_file('vite.config.ts', "\n    WindiCSS({
  #     root: __dirname,
  #     scan: {
  #       fileExtensions: ['erb', 'haml', 'html', 'vue', 'js', 'ts', 'jsx', 'tsx'],
  #       dirs: ['app/views', 'app/frontend'], // or app/javascript, or app/packs
  #     },
  #   }),", after: 'plugins: [')

  # run "npm add @rails/ujs @rails/activestorage stimulus stimulus-vite-helpers vite-plugin-stimulus-hmr vite-plugin-full-reload typescript vite-plugin-windicss windicss"

  # generate "rspec:install"
  # generate "dockerfile"
end

# FIRST COMMIT
after_bundle do
  run "bundle exec rubocop -A --no-server"

  git :init
  git add: "."
  git commit: "-m 'initial commit'"

  copy_file "docker-compose.yml", "docker-compose.yml"
  copy_file "env", ".env"
  inject_into_file "config/database.yml", %{\n  url: <%= ENV["DATABASE_URL"] %>}, after: "default: &default"
  inject_into_file ".gitignore", "\n!/.env", after: "/.env*", force: true

  git add: "."
  git commit: "-m 'configure docker for services'"
end
