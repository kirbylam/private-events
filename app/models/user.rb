class User < ApplicationRecord
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  
  has_secure_password
   
  validates :username, uniqueness: true, presence: true, length: { minimum: 6, maximum: 12 }
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
end
