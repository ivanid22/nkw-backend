class CreatePostings < ActiveRecord::Migration[6.0]
  def change
    create_table :postings do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :price
      t.string :contact_email
      t.string :contact_phone
      t.timestamps
    end
  end
end
