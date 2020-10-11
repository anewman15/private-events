FactoryBot.define do
  factory :event do
    event_name { 'Code Rails and Do RSpec Tests' }
    description { 'Do some coding in Rails application and create all the tests uing RSpec, FactoryBot, Capybara, etc.' }
    event_location { 'Chandina, Comilla' }
    event_date { Time.now }
  end
end
