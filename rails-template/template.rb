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

  gem "standard", ">= 1.0", require: false
  gem "rubocop", "~> 1.0", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
end

# copy_file "dockerignore", ".dockerignore"
# copy_file "Dockerfile"

copy_file "rubocop.yml", ".rubocop.yml"

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

  generate "rspec:install"
  generate "dockerfile"
end

# FIRST COMMIT
after_bundle do
  run "bundle exec rubocop -A"

  git :init
  git add: "."
  git commit: "-m 'initial commit'"
end
