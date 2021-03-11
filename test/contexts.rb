require './test/sets/organizations'
require './test/sets/teams'
module contexts
    include Context::Organizations
    include Context::Teams

    def create_all
        create_organizations
        puts "Built organizations"
        create_teams
        puts "Built teams"
    end
end
