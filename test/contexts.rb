require './test/sets/organizations'
require './test/sets/teams'
module Contexts
    include Context::Organizations
    include Context::Teams
    include Context::Students
    include Context::Student_teams

    def create_organizations

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
