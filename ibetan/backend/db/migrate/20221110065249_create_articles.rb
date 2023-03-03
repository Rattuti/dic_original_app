class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.references :user
      
      t.string :title
      #t.datetime :published
      t.string :url
      #t.string :author

      t.timestamps
    end
  end
end
