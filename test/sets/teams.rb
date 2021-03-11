module Contexts
    module Teams
        def create_teams
            @teamc=FactoryBot.create(:team, organization:@cmu)

        end

        def destroy_teams
            @teamc.destroy
        end
    end
end