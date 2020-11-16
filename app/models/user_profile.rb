class UserProfile < ApplicationRecord
  belongs_to :user, class_name: "User", foreign_key: "user_id"
  has_many :favorites
  has_many :postings
  has_many :favorited_postings, class_name: "Posting", through: :favorites, source: :posting
end
