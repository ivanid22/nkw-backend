class Favorite < ApplicationRecord
  belongs_to :user_profile, class_name: "UserProfile", foreign_key: "user_profile_id"
  belongs_to :posting, class_name: "Posting", foreign_key: "posting_id"
end
