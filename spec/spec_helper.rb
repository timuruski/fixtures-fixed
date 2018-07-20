require "bundler/setup"

require "rspec"
require "sequel"

module Fixtures
  def require_fixture(name)
    # Actually use the fixture...
  end

  def self.define(name)
    yield
  end

  def self.load(pattern)
    pattern = File.expand_path(pattern, __dir__)
    Dir.glob(pattern).each do |path|
      require_relative(path)
    end
  end
end

module RSpec
end

# Setup Database
DB = Sequel.sqlite
DB.create_table :items do
  primary_key :id
  String :name, unique: true, null: false
  Float :price, null: false
end

RSpec.configure do |config|
  config.extend(Fixtures)
  config.before(:suite) do
    Fixtures.load("fixtures/*.rb")
  end
end
