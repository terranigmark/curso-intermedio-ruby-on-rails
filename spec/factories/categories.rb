# spec/factories/categories.rb
FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Categoria #{n}" }
    sequence(:description) { |n| Faker::Lorem.sentence }
  end
end
