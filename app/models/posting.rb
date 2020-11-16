class Posting < ApplicationRecord
  validates :title, presence: true, length: {maximum: 50}
  validates :contact_phone, length: {maximum: 50}
  
  belongs_to :user_profile
  has_many :favorites
end
