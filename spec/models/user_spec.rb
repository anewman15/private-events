require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }
    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name) }
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password) }
  end

  describe 'associations' do
    it { should have_many(:created_events) }
    it { should have_many(:event_attendings) }
    it { should have_many(:attended_events) }
  end
end
