require 'rails_helper'

feature 'user authentication features', type: :feature do
  scenario 'has a user sign up page' do
    visit new_user_url
    expect(page).to have_content('Sign Up')
  end

  feature 'signing up as an user' do
    before(:each) do
      visit new_user_url
    end
    
    scenario 'invalid params' do
      fill_in 'user_first_name', with: 'Abdullah'
      click_on 'Sign up'
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("First name can't be blank")
    end

    scenario 'with valid params' do
      fill_in 'user_first_name', with: 'Abdullah'
      fill_in 'user_last_name', with: 'Numan'
      fill_in 'user_username', with: 'anewman15'
      fill_in 'user_email', with: 'anewman15@hotmail.com'
      fill_in 'user_password', with: '12345678'
      fill_in 'user_password_confirmation', with: '12345678'
      click_on 'Sign up'
      expect(current_path).to eq("/users/#{User.find_by(user_username).id}")
      expect(page).to have_content("Welcome, Abdullah Numan")      
    end
  end
end