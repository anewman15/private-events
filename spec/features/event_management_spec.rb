require 'rails_helper'

feature 'event management features', type: :feature do
  feature 'creating an event' do
    before(:each) do
      visit new_user_url
    end

    scenario 'invalid params' do
      fill_in 'event_event_name', with: 'An Event Name'
      click_on 'Create Event'
      expect(current_page).to eq(event_index_path)
      expect(page).to have_content("First name can't be blank")
    end

    scenario 'valid params' do
      fill_in 'event_event_name', with: 'An Event Name'
      fill_in 'event_event_location', with: 'Chandina'
      fill_in 'event_event_date_1i', with: 2021
      fill_in 'event_event_date_2i', with: 'February'
      fill_in 'event_event_date_3i', with: 12
      fill_in 'event_event_date_4i', with: 12
      fill_in 'event_event_date_5i', with: 21
      fill_in 'event-description', with: 'Some awesome event description'
      click_on 'Create Event'
      expect(current_page).to eq(events_path)
      expect(page).to have_content('An Event Name')
    end
  end
end
