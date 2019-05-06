FactoryBot.define do
  factory :researcher do
    name { 'Researcher' }
    title { 'Title' }
    academic_title { 'Academic-Title' }
    genre { 'Genero' }
    institution
    image { FileSpecHelper.image }
  end
end
