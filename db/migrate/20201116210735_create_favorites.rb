class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user_profile, foreign_key: :true
      t.references :posting, foreign_key: :true
      t.timestamps
    end
  end
end
