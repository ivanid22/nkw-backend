class UpdateForeignKeyCascadePostings < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :favorites, :postings
    add_foreign_key :favorites, :postings, on_delete: :cascade
  end
end
