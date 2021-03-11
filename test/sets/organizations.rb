module Contexts
    module Organizations
        def create_organizations
            @cmu=FactoryBot.create(:organization)
        end

        def destroy_organizations
            @cmu.destroy
        end
    end
end