source ENV['GEM_SOURCE'] || "https://rubygems.org"

def location_for(place, fake_version = nil)
  if place =~ /^(git[:@][^#]*)#(.*)/
    [fake_version, { :git => $1, :branch => $2, :require => false }].compact
  elsif place =~ /^file:\/\/(.*)/
    ['>= 0', { :path => File.expand_path($1), :require => false }]
  else
    [place, { :require => false }]
  end
end

if ENV['PUPPET_VERSION']
  gem 'puppet', ENV['PUPPET_VERSION']
else
  gem 'puppet', '~> 4.0',   :require => false if RUBY_VERSION < '2.4.0'
  gem 'puppet', '~> 5.0',   :require => false if RUBY_VERSION >= '2.4.0'
end


group :test do
  gem 'semantic_puppet', '>= 1.0.0',                                :require => false
  gem 'puppetlabs_spec_helper', '~> 2.2.0',                         :require => false
  gem 'rspec-puppet', '~> 2.5',                                     :require => false
  gem 'rspec-puppet-facts',                                         :require => false
  gem 'rspec-puppet-utils',                                         :require => false
  gem 'metadata-json-lint',                                         :require => false
  gem 'puppet-blacksmith',                                          :require => false
  gem 'voxpupuli-release',                                          :require => false, :git => 'https://github.com/voxpupuli/voxpupuli-release-gem'
  gem 'puppet-strings', '~> 1.0',                                   :require => false
  gem 'redcarpet',                                                  :require => false
  gem 'rubocop', '~> 0.49.1',                                       :require => false if RUBY_VERSION >= '2.3.0'
  gem 'rubocop', '~> 0.33.0',                                       :require => false if RUBY_VERSION < '2.3.0'
  gem 'rubocop-rspec', '~> 1.15.0',                                 :require => false if RUBY_VERSION >= '2.3.0'
  gem 'rubocop-rspec', '~> 1.4.0',                                  :require => false if RUBY_VERSION < '2.3.0'
  gem 'rake', '< 11.0',                                             :require => false if RUBY_VERSION < '2.3.0'
  gem 'mocha', '>= 1.2.1',                                          :require => false
  gem 'simplecov', '>= 0.11.0',                                     :require => false
  gem 'simplecov-console',                                          :require => false

  gem 'github_changelog_generator', '~> 1.13.0',                    :require => false if RUBY_VERSION < '2.2.2'
  gem 'rack', '~> 1.0',                                             :require => false if RUBY_VERSION < '2.2.2'
  gem 'github_changelog_generator',                                 :require => false if RUBY_VERSION >= '2.2.2'
  gem 'parallel_tests',                                             :require => false

  gem 'puppet-lint-leading_zero-check',                             :require => false
  gem 'puppet-lint-trailing_comma-check',                           :require => false
  gem 'puppet-lint-version_comparison-check',                       :require => false
  gem 'puppet-lint-classes_and_types_beginning_with_digits-check',  :require => false
  gem 'puppet-lint-unquoted_string-check',                          :require => false
  gem 'puppet-lint-variable_contains_upcase',                       :require => false
end

group :development do
  gem 'travis',             :require => false
  gem 'travis-lint',        :require => false
end

group :system_tests do
  if beaker_version = ENV['BEAKER_VERSION']
    gem 'beaker', *location_for(beaker_version)
  end
  if beaker_rspec_version = ENV['BEAKER_RSPEC_VERSION']
    gem 'beaker-rspec', *location_for(beaker_rspec_version)
  else
    gem 'beaker-rspec',  :require => false
  end
  gem 'serverspec',                    :require => false
  gem 'beaker-puppet_install_helper',  :require => false
end
