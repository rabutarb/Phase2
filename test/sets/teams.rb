module Contexts
    module Teams
        def create_teams
            @teamc=FactoryBot.create(:team, organization:@cmu)
            @teamn=FactoryBot.create(:team,name:"NUQ1", organization:@nuq,active:false)
            @teamg=FactoryBot.create(:team,name:"GUQ1", organization:@guq)

        end

        def destroy_teams
            @teamc.destroy
        end
    end
end