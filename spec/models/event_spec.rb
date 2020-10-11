require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:event_name) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description) }
    it { should validate_presence_of(:event_location) }
    it { should validate_presence_of(:event_date) }
  end
end
