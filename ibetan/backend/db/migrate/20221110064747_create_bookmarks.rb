class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.references :user #, foreign_key: true, null: false
      t.references :article #, foreign_key: true, null: false
      t.references :favorite

      t.timestamps
    end
  end
end
