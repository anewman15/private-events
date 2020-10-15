require 'rails_helper'

feature 'user authentication features', type: :feature do
  feature 'signing up a user' do
    scenario 'failing with invalid params' do
      visit "/users/sign_up"
      fill_in 'user_first_name', with: 'Abdullah'
      click_on 'Sign up'
      expect(current_path).to eq("/users")
      expect(page).to have_content("Last name can't be blank")
    end

    scenario 'successful with valid params' do
      create_user
      expect(current_path).to eq("/users/1")
      expect(page).to have_content('Welcome, Abdullah Numan')
    end
  end

  feature 'logging in a user' do
    before(:each) do
      create_user
      click_on 'Logout'
      visit "/users/sign_in"
    end
    scenario 'failing with invalid parameters' do
      fill_in 'user_email', with: 'anewman15@hotmail.com'
      click_on 'Log in'
      expect(current_path).to eq('/users/sign_in')
      expect(page).to have_content('Log In')
    end
    scenario 'successful with valid parameters' do
      fill_in 'user_email', with: 'anewman15@hotmail.com'
      fill_in 'user_password', with: '12345678'
      click_on 'Log in'
      expect(current_path).to eq("/users/1")
      expect(page).to have_content('Welcome, Abdullah Numan')
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
end
