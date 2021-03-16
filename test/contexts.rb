require './test/sets/organizations'
require './test/sets/teams'
module Contexts


    def create_organizations
        @cmu = FactoryBot.create(:organization)
    end

    def destroy_organizations
    
    end

    def create_teams
    
    end

    def destroy_teams

    end

    def create_students

    end

    def destroy_students

    end

    def create_student_teams
    
    end

    def destroy_student_teams

    end


    def create_all
        create_organizations
        puts "Built organizations"
        create_teams
        puts "Built teams"
        create_students
        puts "Built students"
        create_student_teams
        puts "Build student teams"
    end
end
