class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :event_attendees, foreign_key: :attended_event_id
  has_many :attendees, through: :event_attendees

  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true

  scope :past, -> { where("date <= ?", Date.today) }
  scope :future, -> { where("date > ?", Date.today) }

  def self.past_events
    Event.past
  end

  def self.future_events
    Event.future
  end
end
