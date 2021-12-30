class User < ApplicationRecord
  has_secure_password

  has_many :created_posts, foreign_key: :creator_id, class_name: 'Event'
  has_many :event_attendees, foreign_key: :attendee_id
  has_many :attended_events, through: :event_attendees

  validates :username, uniqueness: true, presence: true, length: { minimum: 6, maximum: 12 }
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
end
