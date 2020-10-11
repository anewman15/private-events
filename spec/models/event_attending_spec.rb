require 'rails_helper'

RSpec.describe EventAttending, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:attended_event_id) }
    it { should validate_uniqueness_of(:attended_event_id) }
    it { should validate_presence_of(:event_attendee_id) }
    it { should validate_uniqueness_of(:event_attendee_id) }
  end

  describe 'associaitons' do 
    it { should belong_to(:attended_event) }
    it { should belong_to(:event_attendee) }
  end
end
