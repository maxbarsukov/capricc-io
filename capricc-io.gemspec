# frozen_string_literal: true

require_relative 'lib/capriccio/version'

Gem::Specification.new do |spec|
  spec.name = 'capricc-io'
  spec.version = CapriccIo::VERSION
  spec.authors = ['maxbarsukov']
  spec.email = ['maximbarsukov@bk.ru']

  spec.summary = ':white_large_square: Extremely minimalistic Io-like language'
  spec.description = 'Extremely minimalistic prototype-based homoiconic Io-like language'
  spec.homepage = 'https://rubygems.org/gems/capricc-io'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.5.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/maxbarsukov/capricc-io'
  spec.metadata['changelog_uri'] = 'https://github.com/maxbarsukov/capricc-io/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'bin'
  spec.executables << 'capio'
  spec.require_paths = ['lib']

  # Development dependencies
  spec.add_development_dependency 'codecov', '~> 0.6.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.21'
  spec.add_development_dependency 'rubocop-performance', '~> 1.13'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.7'
  spec.add_development_dependency 'simplecov', '~> 0.21.2'
end
