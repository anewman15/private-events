class EventAttending < ApplicationRecord
  validates :attended_event_id, presence: true, uniqueness: { case_sensitivity: false }
  validates :event_attendee_id, presence: true, uniqueness: { case_sensitivity: false }
  
  belongs_to :event_attendee, class_name: "User"
  belongs_to :attended_event, class_name: "Event"
end
