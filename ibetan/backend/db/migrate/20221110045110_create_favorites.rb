class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user
      t.references :article
      t.references :bookmark

      t.timestamps
    end
  end
end
