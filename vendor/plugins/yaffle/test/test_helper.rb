# Configure Rails Environment
ENV["RAILS_ENV"] = "test"
ENV['RAILS_ROOT'] ||= File.dirname(__FILE__) + '/../../../..'


require_relative "../test/dummy/config/environment"
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __dir__)]
require "rails/test_help"
require File.expand_path(File.join(ENV['RAILS_ROOT'], 'config/environment.rb'))


# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

require "rails/test_unit/reporter"
Rails::TestUnitReporter.executable = 'bin/test'

def load_schema
  config = YAML::load(IO.read(File.dirname(__FILE__) + '/database.yml'))
  ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + "/debug.log")
 
  db_adapter = ENV['DB']
 
  # no db passed, try one of these fine config-free DBs before bombing.
  db_adapter ||=
    begin
      require 'rubygems'
      require 'sqlite'
      'sqlite'
    rescue MissingSourceFile
      begin
        require 'sqlite3'
        'sqlite3'
      rescue MissingSourceFile
      end
    end
 
  if db_adapter.nil?
    raise "No DB Adapter selected. Pass the DB= option to pick one, or install Sqlite or Sqlite3."
  end
 
  ActiveRecord::Base.establish_connection(config[db_adapter])
  load(File.dirname(__FILE__) + "/schema.rb")
  require File.dirname(__FILE__) + '/../init'
end

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("fixtures", __dir__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end


 
  ActiveRecord::Base.establish_connection(config[db_adapter])
  load(File.dirname(__FILE__) + "/schema.rb")
  require File.dirname(__FILE__) + '/../init'
