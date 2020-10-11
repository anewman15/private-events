class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true, length: { maximum: 40 }
  validates :last_name, presence: true, length: { maximum: 40 }
  validates :username, presence: true, length: { maximum: 40 }, uniqueness: true

  has_many :event_attendings, foreign_key: :event_attendee_id
  has_many :attended_events, through: :event_attendings
  has_many :created_events, foreign_key: :creator_id, class_name: "Event"
end
