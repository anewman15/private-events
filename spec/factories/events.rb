FactoryBot.define do
  factory :event do
    creator_id { 1 }
    event_name { 'Code Rails and Do RSpec Tests' }
    description { 'Do some coding in Rails application and create all the tests using RSpec' }
    event_location { 'Chandina, Comilla' }
    event_date { Time.now }
  end
end
