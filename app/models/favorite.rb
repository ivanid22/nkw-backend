class Favorite < ApplicationRecord
  belongs_to :user_profile, class_name: 'UserProfile', foreign_key: 'user_profile_id'
  belongs_to :posting, class_name: 'Posting', foreign_key: 'posting_id'

  def self.exists?(user_profile_id, posting_id)
    !where(user_profile_id: user_profile_id, posting_id: posting_id).empty?
  end

  def self.favorites_by(user_profile_id)
    where(user_profile_id: user_profile_id)
  end

  def self.favorites_for(posting_id)
    where(posting_id: posting_id)
  end
end
