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
    context 'with invalid params' do
      it 'when only event name is present, renders validation errors' do
        @user = build(:user)
        sign_in @user
        post :create, params: { event: { creator_id: @user.id, event_name: "Some Event Name" } }
        expect(response).to redirect_to(new_user_session_path)
        expect(response).to have_http_status(302)
        expect(flash[:alert]).to be_present
      end

      # it 'when only event description is present, renders index view with errors' do
      #   @user = FactoryBot.build(:user)
      #   sign_in @user
      #   post :create, params: { event: { description: "Some Event Description" } }
      #   get :index
      #   expect(response).to render_template('index')
      #   expect(response).to have_http_status(200)
      #   expect(flash[:alert]).to be_present
      # end

      # it 'when only evvent location is present, renders index view with errors' do
      #   @user = FactoryBot.build(:user)
      #   sign_in @user
      #   post :create, params: { event: { event_location: "Some Event Location" } }
      #   get :index
      #   expect(response).to render_template('index')
      #   expect(response).to have_http_status(200)
      #   expect(flash[:alert]).to be_present
      # end

      # it 'when only event date is present, renders index view with errors' do
      #   @user = FactoryBot.build(:user)
      #   sign_in @user
      #   post :create, params: { event: { event_date: "Some Event Date" } }
      #   get :index
      #   expect(response).to render_template('index')
      #   expect(response).to have_http_status(200)
      #   expect(flash[:alert]).to be_present
      # end
    end

    # context 'with valid params' do 
    #   it 'redirects to event show page' do
    #     @user = FactoryBot.build(:user)
    #     sign_in @user
    #     @event = FactoryBot.create(:event)
    #     # get :
    #     expect(response).to redirect_to(event_path)
    #   end
    # end
  end
end
