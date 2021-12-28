class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"

  validates :name, presence: true
  validates :location, presence: true
  validates :date, presence: true  
end
