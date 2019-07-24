RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  factory :random_employee, class: Employee do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    role { Faker::Job.title }
  end

 
end