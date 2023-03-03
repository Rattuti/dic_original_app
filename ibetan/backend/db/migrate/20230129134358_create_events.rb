class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user
      t.string :name
      t.datetime :start
      t.datetime :end
      t.boolean :timed, default: true
      t.text :description
      t.string :color#イベント項目の背景色用

      t.timestamps
    end
  end
end
