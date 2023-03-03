class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :gender
      t.string :age
      t.string :residence
      t.text :introduction
      t.string :hobby

      t.timestamps
    end
  end
end
