require 'test_helper'
require 'simplecov'
SimpleCov.start 'rails'
class OrganizationTest < ActiveSupport::TestCase

    #matchers 

  #context
  context "this context" do
    setup do
      create_organizations
    end

    teardown do
      destroy_organizations
    end
  end
  #relationship testing
  should have_many(:students)
  should have_many(:teams)

 
end
