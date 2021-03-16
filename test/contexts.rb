require './test/sets/organizations'
require './test/sets/teams'
module Contexts


    def create_organizations
        @cmu = FactoryBot.create(:organization)
        @guq = FactoryBot.create(:organization, name: "Georgetown",short_name:"guq")
        @wcq = FactoryBot.create(:organization, name: "Cornell",short_name:"wcq",active:false)
        @nuq = FactoryBot.create(:organization, name: "Northwestern",short_name:"nuq",active: false)

    end

    def destroy_organizations
        @cmu.destroy
        @guq.destroy
        @wcq.destroy
        @nuq.destroy
    end

    def create_teams
        @cmu1 = FactoryBot.create(:team,organization:@cmu)
        @cmu2 = FactoryBot.create(:team,name:"CMU2",division:"junior",active:false,organization: @cmu)
        @guq1 = FactoryBot.create(:team,name:"GUQ1",organization: @guq)
        @wcq1 = FactoryBot.create(:team,name:"WCQ1", active:false,organization: @wcq)
        @nuq1 = FactoryBot.create(:team,name:"NUQ1",active:false,organization: @nuq)

    
    end

    def destroy_teams
        @cmu1.destroy
        @cmu2.destroy
        @guq1.destroy
        @wcq1.destroy
        @nuq1.destroy

    end

    def create_students
        @rahaf = FactoryBot.create(:student)
        @joud = FactoryBot.create(:student,first_name:"Joud",grade:7)
        @khaled = FactoryBot.create(:student,first_name:"Khaled",grade:10)
        @mohammad = FactoryBot.create(:student,first_name:"Mohammad",grade:11)
    end

    def destroy_students
        @rahaf.destroy
        @joud.destroy
        @khaled.destroy
        @mohammad.destroy

    end

    def create_student_teams
        @team1 = FactoryBot.create(:student_teams, student:@rahaf,team:@cmu1)
        @team2 = FactoryBot.create(:student_teams, student:@joud,team:@cmu1)
        @team3 = FactoryBot.create(:student_teams, student:@khaled,team:@cmu1)
        @team4 = FactoryBot.create(:student_teams, student:@mohammad,team:@cmu1)
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
