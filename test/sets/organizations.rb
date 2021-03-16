module Contexts
    module Organizations
        def create_organizations
            @cmu=FactoryBot.create(:organization)
            @nuq=FactoryBot.create(:organization, short_name:"nuq",active:false)
            @guq=FactoryBot.create(:organization, short_name:"guq")
        end

        def destroy_organizations
            @cmu.destroy
            @nuq.destroy
            @guq.destroy
        end
    end
end