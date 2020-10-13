require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #new' do
    it 'redirects to root path' do
      get :new

      expect(response).to redirect_to(root_path)
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET #index' do
    it 'renders events index page' do
      get :index

      expect(response).to render_template('index')
      expect(response).to have_http_status(200)
    end
  end

  # describe 'GET #show' do
  #   it 'renders the event show page' do
  #     @user = FactoryBot.build(:user)
  #     sign_in @user
  #     @event = FactoryBot.create(:event)
  #     get :show, id: 1
  #     # expect(response).to render_template('show')
  #     expect(response).to have_http_status(200)
  #     # expect(flash[:alert]).to be_present
  #   end
  # end

  describe 'POST #create' do
    context 'if user is not signed in' do
      context 'and has invalid params' do
        it 'when only event name is present, redirects to user sign in page' do
          post :create, params: { event: { event_name: 'Some Event Name' } }
          expect(response).to redirect_to(new_user_session_path)
          expect(response).to have_http_status(302)
          expect(flash[:alert]).to be_present
        end
      end

      context 'and has valid params' do
        it 'redirects to user sign in page' do
          post :create, params: { event: { creator_id: 1, event_name: 'Some Event Name', description: 'Some Event Description', event_location: 'Some Event Location', event_date: Time.now } }
          expect(response).to redirect_to(new_user_session_path)
          expect(response).to have_http_status(302)
          expect(flash[:alert]).to be_present
        end
      end
    end

    context 'if user is signed in' do
      context 'and has valid parameters' do
        it 'redirects to event page' do
          post :create, params: { event: { creator_id: 1, event_name: 'Some Event Name', description: 'Some Event Description', event_location: 'Some Event Location', event_date: Time.now } }
          expect(response).to redirect_to(new_user_session_path)
          expect(response).to have_http_status(302)
        end
      end
    end
  end
end
