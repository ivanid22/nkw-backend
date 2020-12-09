class AddPostingUserProfileReference < ActiveRecord::Migration[6.0]
  def change
    change_table :postings do |t|
      t.references :user_profile, foreign_key: :true
    end
  end
end
