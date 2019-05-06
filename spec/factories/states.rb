FactoryBot.define do
  factory :state do
    sequence(:name) { |n| "Name #{n}" }
    sequence(:acronym) { |n| "Acronym #{n}" }
    region
  end
end
