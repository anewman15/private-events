require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #show/:id' do
    it 'renders the user show page' do
      get :show

      expect(response).to render_template('show')
    end
  end
end
