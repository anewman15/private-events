require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show' do
    it 'renders the user show page' do
      @user = FactoryBot.create(:user)
      sign_in(@user)
      get :show, params: { id: @user.id }

      expect(response).to render_template('show')
    end
  end
end
