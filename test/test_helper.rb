ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'factory_bot'

searchable_models = Sunspot.searchable
searchable_models.each do |model|
  Sunspot.remove_all!(model)
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  class ActiveSupport::TestCase
    include FactoryBot::Syntax::Methods
  end
  def disable_solr
    $original_sunspot_session = Sunspot.session if $original_sunspot_session.nil?
    Sunspot.session = Sunspot::Rails::StubSessionProxy.new($original_sunspot_session)
  end

  def enable_solr
    Sunspot.session = $original_sunspot_session
  end
  # Add more helper methods to be used by all tests here...
end
