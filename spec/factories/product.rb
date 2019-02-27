FactoryBot.define do
  factory :product do
    title { "Ruby" }
    description  { "Ruby on rails" }
    price { 10 }
    category { create(:category) }
    published {true}
  end
end