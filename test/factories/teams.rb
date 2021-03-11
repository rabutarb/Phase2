FactoryBot.define do
    factory :team do
        name {"CMU1"}
        association :organization
        division {"senior"}
        active {true}
    end
end