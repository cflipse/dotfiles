# see  https://guides.rubyonrails.org/rails_application_templates.html

def source_paths
  [__dir__]
end

copy_file "direnv", ".envrc"
run "direnv allow"
run "bundle  config --local path .direnv/ruby"

uncomment_lines "Gemfile", /gem ['"]redis['"]/

use_vite = ask "Use vite?"

gem "view_component"
gem "vite_rails" if use_vite

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
    # Configure generator defaults.
    config.generators do |g|
      g.helper false
      g.test_framework :rspec
      g.system_test :rspec
      g.orm :active_record, primary_key_type: :uuid
    end
  END
end

# install rspec
after_bundle do
  generate "rspec:install"

end

if use_vite
  after_bundle do
    run "bundle exec vite install"

    inject_into_file('vite.config.ts', after: %(from 'vite'\n)) do
      <<~CONFIG
      import RubyPlugin from 'vite-plugin-ruby'
      import FullReload from 'vite-plugin-full-reload'
      import StimulusHMR from 'vite-plugin-stimulus-hmr'
      CONFIG
    end

    inject_into_file('vite.config.ts', after: 'plugins: [') do
      <<-PLUGINS
        FullReload(['config/routes.rb', 'app/views/**/*']),
        StimulusHMR(),
      PLUGINS
    end

    run "npm add @rails/activestorage @rails/actioncable @hotwired/stimulus @hotwired/turbo-rails stimulus-vite-helpers vite-plugin-stimulus-hmr vite-plugin-full-reload typescript"

    run "npm install"
  end
end


# FIRST COMMIT
after_bundle do
  generate "rspec:install"

  run "bundle exec rubocop -A --no-server"

  git :init
  git add: "."
  git commit: "-m 'initial commit'"
end

# Add docker services
after_bundle do
  copy_file "docker-compose.yml", "docker-compose.yml"
  copy_file "env", ".env"
  inject_into_file "config/database.yml", %{\n  url: <%= ENV["DATABASE_URL"] %>}, after: "default: &default"
  inject_into_file ".gitignore", "\n!/.env", after: "/.env*", force: true

  git add: "."
  git commit: "-m 'configure docker for services'" end
