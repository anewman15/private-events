class Event < ApplicationRecord
  validates :event_name, presence: true
  validates :description, presence: true, length: { maximum: 2000 }
  validates :event_location, presence: true
  validates :event_date, presence: true

  belongs_to :creator, class_name: "User"
  has_many :event_attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendings, source: :event_attendee

  scope :upcoming_events, -> { where('event_date > ?', Time.now)}
  scope :past_events, -> { where('event_date <= ?', Time.now)}
end
