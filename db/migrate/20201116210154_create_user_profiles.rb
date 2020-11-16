class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.string :name
      t.string :location
      t.references :user, foreign_key: :true
      t.timestamps
    end
  end
end
