FactoryBot.define do
  factory :institution do
    sequence(:name) { |n| "Instituição #{n}" }
    sequence(:acronym) { |n| "I #{n}" }
    city
  end
end
