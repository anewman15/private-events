require 'rails_helper'

feature 'event management features', type: :feature do
  feature 'creating an event' do
    before(:each) do
      create_user
      visit '/events'
    end

    scenario 'fails with invalid params' do
      fill_in 'event_event_name', with: 'An Event Name'
      click_on 'Create Event'
      expect(current_path).to eq('/events')
      expect(page).to have_content("Event location can't be blank")
    end

    scenario 'is successful with valid params' do
      create_event
      expect(current_path).to eq('/events/1')
      expect(page).to have_content('An Event Name')
    end
  end

  def create_user
    visit '/users/sign_up'
    fill_in 'user_first_name', with: 'Abdullah'
    fill_in 'user_last_name', with: 'Numan'
    fill_in 'user_username', with: 'anewman15'
    fill_in 'user_email', with: 'anewman15@hotmail.com'
    fill_in 'user_password', with: '12345678'
    fill_in 'user_password_confirmation', with: '12345678'
    click_on 'Sign up'
  end

  def create_event
    fill_in 'event_event_name', with: 'An Event Name'
    fill_in 'event_event_location', with: 'Chandina'
    within '#event_event_date_1i' do
      find("option[value='2021']").click
    end
    within '#event_event_date_2i' do
      find("option[value='2']").click
    end
    within '#event_event_date_3i' do
      find("option[value='12']").click
    end
    within '#event_event_date_4i' do
      find("option[value='12']").click
    end
    within '#event_event_date_5i' do
      find("option[value='21']").click
    end
    fill_in 'event_description', with: 'Some awesome event description'
    click_on 'Create Event'
  end
end
